/*
 * Multithread implementantion of convolution
 */
#include "utility.hpp"
#include <omp.h>

void convolution_thread(int* output, int* input, int* kernel, int input_rows, int input_columns, int kernel_size, int n_thread) {

    auto out_size_x = input_rows - kernel_size + 1;
    auto out_size_y = input_columns - kernel_size + 1;

    #pragma omp parallel for num_threads(n_thread) shared(input,kernel) schedule(static)
    for (auto x = 0; x < out_size_x; x++){
        for (auto y = 0; y < out_size_y; y++)
        {
            int convolute = 0;
            
            // Kernel rows and columns are kx and ky respectively.
            for (auto kx = 0; kx < kernel_size; kx++) 
            {   
                #pragma omp simd
                for (auto ky = 0; ky < kernel_size; ky++)
                    /* Computing output element */
                    convolute += input[(x + kx) * input_rows + y + ky] * kernel[kx * kernel_size + ky];
            }
            // Add result to output matrix.
            output[x * out_size_y + y] = convolute;
        }
    }
}
