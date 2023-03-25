#include "utility.h"
#include "conv.h"

int main(int argc, char* argv[])
{ 
    if(argc != 3)
    {
        ERROR("Incorrect number of arguments. Correct usage: ./conv input_image.txt kernel.txt\n")
        exit(-1);
    }

    char* image_path  = argv[1];
    char* kernel_path = argv[2];

    #ifdef DEBUG
    printf("INPUT IMAGE: %s, INPUT KERNEL: %s\n", image_path, kernel_path);
    #endif 

    int image_rows, image_columns, kernel_rows, kernel_columns; 

    if(get_dimensions(image_path, kernel_path, &image_rows, &image_columns, &kernel_rows, &kernel_columns) == -1) exit(-1);

    int kernel_size = kernel_rows;

    int* image[image_rows];
    int* kernel[kernel_rows];

    for(short i = 0; i < image_rows; i++)
    {
        image[i] = (int*)malloc(sizeof(int)*image_columns);
        if(!image[i])
        {
            ERROR("Couldn't allocate memory.\n");
            free_array(image, i);
            exit(-1);
        }
    }

    for(short i = 0; i < kernel_rows; i++)
    {
        kernel[i] = (int*)malloc(sizeof(int)*kernel_columns);
        if(!kernel[i])
        {
            ERROR("Couldn't allocate memory.\n");
            free_array(image, image_rows);
            free_array(kernel, i);
            exit(-1);
        }
    }

    if(read_file(image_path, kernel_path, image_rows, image_columns, kernel_rows, kernel_columns, image, kernel) == -1) 
    {
        free_array(image, image_rows);
        free_array(kernel, kernel_rows);
        exit(-1);
    }

    #ifdef DEBUG
    printf("IMAGE\n");
    print(image, image_rows, image_columns);
    printf("KERNEL\n");
    print(kernel, kernel_rows, kernel_columns);
    #endif

    int image_f_rows    = image_rows - kernel_rows + 1;
    int image_f_columns = image_columns - kernel_columns + 1;

    int* image_f[image_f_rows];

    for(short i = 0; i < image_f_rows; i++)
    {
        image_f[i] = (int*)malloc(sizeof(int)*image_f_columns);
        if(!image_f[i])
        {
            ERROR("Couldn't allocate memory.\n");
            free_array(image, image_rows);
            free_array(kernel, kernel_rows);
            free_array(image_f, i);
            exit(-1);
        }
    }

    clock_t start, end;
    double execution_time;

    for(short i = 0; i < 256; i++)
    {
        start = clock();
        convolution(image_f, image, kernel, image_rows, image_columns, kernel_size);
        end = clock();
        execution_time = ((double)(end - start))/CLOCKS_PER_SEC;
        write_execution_time("exec_times.txt", i, execution_time);

        if(i%16 == 0) printf("%dth execution time: %f\n", i, execution_time);
    }

    #ifdef DEBUG
    printf("FILTERED IMAGE\n");
    print(image_f, image_f_rows, image_f_columns);
    #endif

    free_array(image, image_rows);
    free_array(kernel, kernel_rows);
    free_array(image_f, image_f_rows);

    return 0;    
}