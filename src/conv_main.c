#include "utility.h"

int main(int argc, char* argv[])
{ 
    if(argc != 4)
    {
        ERROR("Incorrect number of arguments. Correct usage: ./conv input_image.txt kernel.txt 1\n")
        exit(-1);
    }

    char* image_path  = argv[1];
    char* kernel_path = argv[2];
    unsigned int rep  = atoi(argv[3]);

    #ifdef DEBUG_0
    printf("INPUT IMAGE: %s, INPUT KERNEL: %s, REP ith: %d\n", image_path, kernel_path, rep);
    #endif 

    struct data image;
    struct data kernel;

    if(get_dimensions(image_path, kernel_path, &image.rows, &image.columns, &kernel.rows, &kernel.columns) == -1) exit(-1);

    int kernel_size = kernel.rows;

    image.raw_data  = (int*) malloc(sizeof(int)*image.rows*image.columns);
    if(!image.raw_data)
    {
        ERROR("Couldn't allocate memory.\n");
        exit(-1);
    }

    #ifdef DEBUG_0
    printf("&image.raw_data = %X\n", (unsigned int) image.raw_data);
    #endif

    kernel.raw_data = (int*) malloc(sizeof(int)*kernel.rows*kernel.columns);
    if(!kernel.raw_data)
    {
        ERROR("Couldn't allocate memory.\n");
        free(image.raw_data);
        exit(-1);
    }

    #ifdef DEBUG_0
    printf("&kernel.raw_data = %X\n", (unsigned int) kernel.raw_data);
    #endif

    if(read_file(image_path, kernel_path, image.rows, image.columns, kernel.rows, kernel.columns, image.raw_data, kernel.raw_data) == -1) 
    {
        free(image.raw_data);
        free(kernel.raw_data);
        exit(-1);
    }

    #ifdef TEST
    struct data output_seq;
    struct data output_thread;
    #else
    struct data image_f;
    #endif

    #ifdef TEST
    output_seq.rows    = output_thread.rows    = image.rows - kernel.rows + 1;
    output_seq.columns = output_thread.columns = image.columns - kernel.columns + 1;

    output_seq.raw_data    = (int*) malloc(sizeof(int)*output_seq.rows*output_seq.columns);
    output_thread.raw_data = (int*) malloc(sizeof(int)*output_thread.rows*output_thread.columns);
    #else
    image_f.rows    = image.rows - kernel.rows + 1;
    image_f.columns = image.columns - kernel.columns + 1;

    image_f.raw_data = (int*) malloc(sizeof(int)*image_f.rows*image_f.columns);
    #endif

    #ifdef TEST
    if(!output_seq.raw_data || !output_thread.raw_data)
    #else
    if(!image_f.raw_data)
    #endif
    {
        ERROR("Couldn't allocate memory.\n");
        free(image.raw_data);
        free(kernel.raw_data);
        exit(-1);
    }

    #ifdef SIMULATION
    clock_t start, end;
    double execution_time = 0.0;
    start = clock();
    #endif

    #if defined(SEQ) && defined(SIMULATION)
    convolution_seq(image_f.raw_data, image.raw_data, kernel.raw_data, image.rows, image.columns, kernel_size);
    #elif defined(THREAD) &&  defined(SIMULATION)
    convolution_thread(image_f.raw_data, image.raw_data, kernel.raw_data, image.rows, image.columns, kernel_size);
    #else // Used to validate multithread convolution
    convolution_seq(output_seq.raw_data, image.raw_data, kernel.raw_data, image.rows, image.columns, kernel_size);
    convolution_thread(output_thread.raw_data, image.raw_data, kernel.raw_data, image.rows, image.columns, kernel_size);
    validate(output_seq.raw_data, output_thread.raw_data, output_seq.rows, output_seq.columns, rep);
    #endif

    #ifdef SIMULATION
    end = clock();
    execution_time = ((double)(end - start))/CLOCKS_PER_SEC;
    #endif

    #if defined(SEQ) && defined(SIMULATION)
    write_execution_time("exec_times_seq.csv", rep, execution_time);
    #elif defined(THREAD) &&  defined(SIMULATION)
    write_execution_time("exec_times_multithread.csv", rep, execution_time);
    #endif

    free(image.raw_data);
    free(kernel.raw_data);

    #ifdef TEST
    free(output_seq.raw_data);
    free(output_thread.raw_data);
    #else
    free(image_f.raw_data);
    #endif

    exit(0);    
}
