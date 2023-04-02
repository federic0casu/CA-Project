/*
 * Multithread implementantion of convolution
 */
#include <omp.h>

void convolution_thread(int* output, int* input, int* kernel, int input_rows, int input_columns, int kernel_size)
{
    // This holds the convolution results for an index.
    int convolute = 0;
    
    // Used for input matrix index.
    int i, j, x, y, k, l;

    omp_set_num_threads(32);

    #pragma omp parallel shared(output, input, kernel, input_rows, input_columns, kernel_size) private(convolute, x, y, i, j, k, l) 
    {
        #pragma omp for nowait
        // Fill output matrix: rows and columns are i and j respectively.
        for (i = 0; i < (input_rows - kernel_size + 1); i++)
        {
            for (j = 0; j < (input_columns - kernel_size + 1); j++)
            {
                x = i;
                y = j;

                // Kernel rows and columns are k and l respectively.
                for (k = 0; k < kernel_size; k++)
                {
                    for (l = 0; l < kernel_size; l++)
                    {
                        // Convolute here.
                        convolute += kernel[k*kernel_size + l] * input[x*input_columns + y];
                        //printf("\tTHREAD[%d] -> Computing kernel[%d][%d]*input[%d][%d] = %d\n", omp_get_thread_num(), k, l, x, y, kernel[k*kernel_size + l]*input[x*input_columns + y]);

                        // Move right.
                        y++;
                    }
                    // Move down.
                    x++; 

                    // Restart column position
                    y = j;
                }
                // Add result to output matrix.
                output[i*(input_columns - kernel_size + 1) + j] = convolute;
                //printf("\tTHREAD[%d] -> output[%d][%d] = %d\n", omp_get_thread_num(), i, j, convolute);
                
                // Needed before we move on to the next index.
                convolute = 0;
            }
        }
    }
}