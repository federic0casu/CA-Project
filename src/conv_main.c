#include "utility.h"

void convolution(int*, int*, int*, int, int, int);

int main(int argc, char* argv[])
{ 
    if(argc != 4)
    {
        ERROR("Incorrect number of arguments. Correct usage: ./conv input_image.txt kernel.txt 1\n")
        exit(-1);
    }

    char* image_path       = argv[1];
    char* kernel_path      = argv[2];
    unsigned int iteration = atoi(argv[3]);

    #ifdef DEBUG_0
    printf("INPUT IMAGE: %s, INPUT KERNEL: %s, REP ith: %d\n", image_path, kernel_path, iteration);
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

    #ifdef DEBUG_1
    printf("IMAGE\n");
    print(image.raw_data, image.rows, image.columns);
    printf("KERNEL\n");
    print(kernel.raw_data, kernel.rows, kernel.columns);
    #endif

    struct data image_f;

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

    clock_t start, end;
    double execution_time;

    start = clock();
    convolution(image_f.raw_data, image.raw_data, kernel.raw_data, image.rows, image.columns, kernel_size);
    end = clock();

    execution_time = ((double)(end - start))/CLOCKS_PER_SEC;
    write_execution_time("exec_times.csv", iteration, execution_time);

    #ifdef DEBUG_1
    printf("FILTERED IMAGE\n");
    print(image_f.raw_data, image_f.rows, image_f.columns);
    #endif

    free(image.raw_data);
    free(kernel.raw_data);
    free(image_f.raw_data);

    exit(0);    
}
