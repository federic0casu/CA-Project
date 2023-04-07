/*
 * Multithread implementantion of convolution
 */
#include "utility.hpp"
#include <omp.h>

#ifdef CACHE_TEST
#include "../cache_sim/src/cache_sim.hpp"
#endif

void convolution_thread(int *output, int *input, int *kernel, int input_rows, int input_columns, int kernel_size, int n_thread) {

    int out_size_x = input_rows - kernel_size + 1;
    int out_size_y = input_columns - kernel_size + 1;

    #ifdef CACHE_TEST
    cache_sim* cache = new cache_sim((uint32_t) 32768, (uint32_t) 64, (uint32_t) 8);
    #endif

    #pragma omp parallel for num_threads(n_thread) shared(input,kernel) schedule(static)
    for (int x = 0; x < out_size_x; x++){
        for (int y = 0; y < out_size_y; y++)
        {
            for (int kx = 0; kx < kernel_size; kx++) {   
                #pragma omp simd
                for (int ky = 0; ky < kernel_size; ky++) {
                    /* Computing output element */
                    output[x * out_size_y + y] += input[(x + kx) * input_rows + y + ky] * kernel[kx * kernel_size + ky];
                    #ifdef CACHE_TEST
                    cache->get_line(reinterpret_cast<uint64_t>(&input[(x + kx) * input_rows + y + ky]));
                    cache->get_line(reinterpret_cast<uint64_t>(&kernel[kx * kernel_size + ky]));
                    cache->get_line(reinterpret_cast<uint64_t>(&output[x * out_size_y + y]));
                    #endif
                }
            }
        }
    }

    #ifdef CACHE_TEST
    delete cache;
    #endif
}