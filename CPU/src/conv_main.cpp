#include "utility.hpp"

int main(int argc, char* argv[])
{ 
    if(argc != 5)
    {
        ERROR("Incorrect number of arguments. Correct usage: ./conv input_image.txt kernel.txt {#rep} {#threads} \n")
        exit(-1);
    }

    char* image_path     = argv[1];
    char* kernel_path    = argv[2];

#ifndef DEBUG
    unsigned int rep     = atoi(argv[3]);
#endif

    unsigned int threads = atoi(argv[4]);

    struct data image;
    struct data kernel;
    struct data image_f;

    if(get_dimensions(image_path, kernel_path, &image.rows, &image.columns, &kernel.rows, &kernel.columns) == -1) exit(-1);

    int kernel_size = kernel.rows;

    image.raw_data  = (int*) malloc(sizeof(int)*image.rows*image.columns);
    if(!image.raw_data)
    {
        ERROR("Couldn't allocate memory.\n");
        exit(-1);
    }

    kernel.raw_data = (int*) malloc(sizeof(int)*kernel.rows*kernel.columns);
    if(!kernel.raw_data)
    {
        ERROR("Couldn't allocate memory.\n");
        free(image.raw_data);
        exit(-1);
    }

    if(read_file(image_path, kernel_path, image.rows, image.columns, kernel.rows, kernel.columns, image.raw_data, kernel.raw_data) == -1) 
    {
        free(image.raw_data);
        free(kernel.raw_data);
        exit(-1);
    }

    image_f.rows    = image.rows - kernel.rows + 1;
    image_f.columns = image.columns - kernel.columns + 1;

    image_f.raw_data = (int*) malloc(sizeof(int)*image_f.rows*image_f.columns);

    if(!image_f.raw_data)
    {
        ERROR("Couldn't allocate memory.\n");
        free(image.raw_data);
        free(kernel.raw_data);
        exit(-1);
    }

    // Start measuring time of conv2D
    auto begin_conv2D = std::chrono::high_resolution_clock::now();

#if defined(SEQ) && defined(SIMULATION)
    convolution_seq(image_f.raw_data, image.raw_data, kernel.raw_data, image.rows, image.columns, kernel_size);
#elif defined(PTHREAD) && defined(SIMULATION)
    convolution_pthread(image_f.raw_data, image.raw_data, kernel.raw_data, image.rows, image.columns, kernel_size, threads);
#endif

    // Stop measuring time and calculate the execution time of conv2D
    auto end_conv2D = std::chrono::high_resolution_clock::now();
    auto execution_time = std::chrono::duration_cast<std::chrono::nanoseconds>(end_conv2D - begin_conv2D).count() * 1e-9;

    free(image.raw_data);
    free(kernel.raw_data);
    free(image_f.raw_data);

#ifdef DEBUG
    printf("Execution time: %f\n", execution_time);
#else
    char* file_name = (char*) malloc(sizeof(char)*1024);
    sprintf(file_name, "../csv/1st/exec_times(%dx%d_%dx%d)(%d).csv", image.rows, image.rows, kernel.rows, kernel.columns, threads);
    write_execution_time(file_name, rep, execution_time);
    free(file_name);
#endif

    exit(0);    
}
