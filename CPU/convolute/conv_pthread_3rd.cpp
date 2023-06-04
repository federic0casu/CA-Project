/*
 * Multithread implementation of convolution (pthread.h version)
 */

#include "utility.hpp"
#include <pthread.h>

struct task {
    int *output, *input, *kernel;
    int start_row, end_row;
    int output_columns;
    int input_rows;
    int kernel_size;
};

void convolute(void *argument)
{
    struct task *__task = (struct task *)argument;

    auto output = __task->output;
    auto input  = __task->input;
    auto kernel = __task->kernel;
    auto start  = __task->start_row;
    auto end    = __task->end_row;

    auto out_size_y  = __task->output_columns;
    auto in_size_x   = __task->input_rows;
    auto kernel_size = __task->kernel_size;

    int convolute = 0;

    // Fill output matrix: rows and columns are i and j respectively.
    for (auto x = start; x < end; x++)
    {
        for (auto y = 0; y < out_size_y; y++)
        {
            // Kernel rows and columns are kx and ky respectively.
            for (auto kx = 0; kx < kernel_size; kx++)
            {
                for (auto ky = 0; ky < kernel_size; ky++)
                    // Convolute here.
                    convolute += (input[(x + kx) * in_size_x + (y + ky)] * kernel[kx * kernel_size + ky]);
            }
            output[x * out_size_y + y] = convolute;

            convolute = 0;
        }
    }
}

extern void convolute_opt_3x3(void *argument);

void convolute_opt_5x5(void *argument)
{
    struct task *__task = (struct task *)argument;

    auto output = __task->output;
    auto input  = __task->input;
    auto kernel = __task->kernel;
    auto start  = __task->start_row;
    auto end    = __task->end_row;

    auto out_size_y  = __task->output_columns;
    auto in_size_x   = __task->input_rows;
    auto kernel_size = __task->kernel_size;

    // This holds the convolution results.
    int convolute = 0;

    // Fill output matrix: rows and columns are i and j respectively.
    for (auto x = start; x < end; x++)
    {
        for (auto y = 0; y < out_size_y; y++)
        {
            // Kernel rows and columns are kx and ky respectively.
            for (auto kx = 0; kx < kernel_size; kx++)
            {
                convolute += (input[(x + kx) * in_size_x + (y + 0)] * kernel[kx * kernel_size + 0]);
                convolute += (input[(x + kx) * in_size_x + (y + 1)] * kernel[kx * kernel_size + 1]);
                convolute += (input[(x + kx) * in_size_x + (y + 2)] * kernel[kx * kernel_size + 2]);
                convolute += (input[(x + kx) * in_size_x + (y + 3)] * kernel[kx * kernel_size + 3]);
                convolute += (input[(x + kx) * in_size_x + (y + 4)] * kernel[kx * kernel_size + 4]);
            }
            // Add result to output matrix.
            output[x * out_size_y + y] = convolute;

            // Needed before we move on to the next index.
            convolute = 0;
        }
    }
}

void convolute_opt_7x7(void *argument)
{
    struct task *__task = (struct task *)argument;

    auto output = __task->output;
    auto input  = __task->input;
    auto kernel = __task->kernel;
    auto start  = __task->start_row;
    auto end    = __task->end_row;

    auto out_size_y  = __task->output_columns;
    auto in_size_x   = __task->input_rows;
    auto kernel_size = __task->kernel_size;

    // This holds the convolution results.
    int convolute = 0;

    // Fill output matrix: rows and columns are i and j respectively.
    for (auto x = start; x < end; x++)
    {
        for (auto y = 0; y < out_size_y; y++)
        {
            // Kernel rows and columns are kx and ky respectively.
            for (auto kx = 0; kx < kernel_size; kx++)
            {
                convolute += (input[(x + kx) * in_size_x + (y + 0)] * kernel[kx * kernel_size + 0]);
                convolute += (input[(x + kx) * in_size_x + (y + 1)] * kernel[kx * kernel_size + 1]);
                convolute += (input[(x + kx) * in_size_x + (y + 2)] * kernel[kx * kernel_size + 2]);
                convolute += (input[(x + kx) * in_size_x + (y + 3)] * kernel[kx * kernel_size + 3]);
                convolute += (input[(x + kx) * in_size_x + (y + 4)] * kernel[kx * kernel_size + 4]);
                convolute += (input[(x + kx) * in_size_x + (y + 5)] * kernel[kx * kernel_size + 5]);
                convolute += (input[(x + kx) * in_size_x + (y + 6)] * kernel[kx * kernel_size + 6]);
            }
            // Add result to output matrix.
            output[x * out_size_y + y] = convolute;

            // Needed before we move on to the next index.
            convolute = 0;
        }
    }
}

void convolution_pthread(int *output, int *input, int *kernel, int input_rows, int input_columns, int kernel_size, int n_thread)
{
    auto out_size_x = input_rows - kernel_size + 1;
    auto out_size_y = input_columns - kernel_size + 1;

    pthread_t thread_id[n_thread];
    struct task thread_task[n_thread];

    void (*convolute_ptr)(void *) = ((kernel_size == 3) ? &convolute_opt_3x3 : 
                                    ((kernel_size == 5) ? &convolute_opt_5x5 : 
                                    ((kernel_size == 7) ? &convolute_opt_7x7 : &convolute)));

    auto task_size = (int)ceil(((float)out_size_x) / ((float)n_thread));

    for (auto i = 0; i < n_thread; i++)
    {
        thread_task[i].output         = output;
        thread_task[i].kernel         = kernel;
        thread_task[i].input          = input;
        thread_task[i].start_row      = i * task_size;
        thread_task[i].end_row        = (out_size_x > (i + 1) * task_size) ? ((i + 1) * task_size) : out_size_x;
        thread_task[i].output_columns = out_size_y;
        thread_task[i].input_rows     = input_rows;
        thread_task[i].kernel_size    = kernel_size;

        if (pthread_create(&thread_id[i], NULL, (void *(*)(void *))convolute_ptr, (void *)&thread_task[i]))
            exit(-1);
    }

    for (auto i = 0; i < n_thread; i++)
        pthread_join(thread_id[i], NULL);      
}
