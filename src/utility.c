#include "utility.h"

void print(int** input, int rows, int columns)
{
    for(short i = 0; i < rows; i++)
    {
        for(short j = 0; j < columns; j++)
            printf("%d\t", input[i][j]);

        printf("\n");
    }
}

int get_dimensions(char* image_path, char* kernel_path, int* image_rows, int* image_columns, int* kernel_rows, int* kernel_columns)
{
    FILE* __image = fopen(image_path, "r");
    if(!__image)
    {
        ERROR_("Couldn't open file '%s'. Verify if the image file is located in the same directory as conv.c\n", image_path);
        return -1;
    }

    FILE* __kernel = fopen(kernel_path, "r");
    if(!__kernel)
    {
        ERROR_("Couldn't open file '%s'. Verify if the kernel file is located in the same directory as conv.c\n", kernel_path);
        fclose(__image);
        return -1;
    }

    fscanf(__image, "%d", image_rows);
    fscanf(__image, "%d", image_columns); 

    fclose(__image);

    fscanf(__kernel, "%d", kernel_rows);
    fscanf(__kernel, "%d", kernel_columns); 

    fclose(__kernel);

    return 0;
}

int read_file(char* image_path, char* kernel_path, int image_rows, int image_columns, int kernel_rows, int kernel_columns, int** image, int** kernel)
{
    FILE* __image = fopen(image_path, "r");
    if(!__image)
    {
        ERROR_("Couldn't open file '%s'. Verify if the image file is located in the same directory as conv.c\n", image_path);
        return -1;
    }

    FILE* __kernel = fopen(kernel_path, "r");
    if(!__kernel)
    {
        ERROR_("Couldn't open file '%s'. Verify if the kernel file is located in the same directory as conv.c\n", kernel_path);
        fclose(__image);
        return -1;
    }

    #ifdef DEBUG
    printf("START OF IMAGE LOADING...\n");
    #endif

    int* image_vector = (int*)malloc(sizeof(int)*image_rows*image_columns);

    if(!image_vector)
    {
        ERROR("Couldn't allocate enough memory.\n");
        fclose(__image);
        fclose(__kernel);
        return -1;
    }

    int i = 0;

    while(!feof(__image))
    {
        if(i < 2) 
        {
            fscanf(__image, "%d", &image_vector[i]);
            i++;
            continue;
        }

        fscanf(__image, "%d", &image_vector[i-2]);

        i++;
        if((i-2) == image_rows*image_columns) break;
    }

    if(i < image_rows*image_columns)
    {
        ERROR_("Couldn't read file '%s'. Verify if the format of image file is correct.\n", image_path);
        free(image_vector);
        fclose(__image);
        fclose(__kernel);
        return -1;
    }

    fclose(__image);
    array_to_matrix(image_vector, image, image_rows, image_columns);
    free(image_vector);

    #ifdef DEBUG
    printf("END OF IMAGE LOADING\n");
    printf("START OF KERNEL LOADING...\n");
    #endif

    int* kernel_vector = (int*)malloc(sizeof(int)*kernel_rows*kernel_columns);
    i = 0;

    while(!feof(__kernel))
    {
        if(i < 2) 
        {
            fscanf(__kernel, "%d", &kernel_vector[i]);
            i++;
            continue;
        }

        fscanf(__kernel, "%d", &kernel_vector[i-2]);

        i++;
        if((i-2) == kernel_rows*kernel_columns) break;
    }

    if(i < kernel_rows*kernel_columns)
    {
        ERROR_("Couldn't read file '%s'. Verify if the format of image file is correct.\n", kernel_path);
        free(kernel_vector);
        fclose(__kernel);
        return -1;
    }

    fclose(__kernel);
    array_to_matrix(kernel_vector, kernel, kernel_rows, kernel_columns);
    free(kernel_vector);

    #ifdef DEBUG
    printf("END OF KERNEL LOADING\n");
    #endif

    return 0;
}

void array_to_matrix(int* input, int** output, int rows, int columns)
{
    for(short i = 0; i < rows; i++)
        for(short j = 0; j < columns; j++)
            output[i][j] = input[i*columns + j];
}

void free_array(int** input, int size)
{
    for(short i = 0; i < size; i++)
        free(input[i]);
}

int write_execution_time(char* file, int rep, double current_exec_time)
{
    FILE* file_p = fopen(file, "r+");

    if(!file_p)
    {
        ERROR_("Couldn't open '%s'. ", file)
        ERROR_("Unable to store the %d-th execution time.\n", (rep + 1))
        return -1;
    }

    double exec_time;
    double* prev_exec_times = (double*)malloc(sizeof(double)*(rep + 1));

    if(!prev_exec_times)
    {
        ERROR_("Couldn't allocate enough memory to store the %d-th execution time\n", (rep + 1))
        fclose(file_p);
        return -1;
    }

    int i = 0;
    while(fscanf(file_p, "%lf", &exec_time) != EOF) {
        prev_exec_times[i] = exec_time;
        i++;
    }

    prev_exec_times[i] = current_exec_time;

    fclose(file_p);
    remove(file);

    FILE* new_file = fopen(file, "w+");

    if(!new_file)
    {
        ERROR_("Couldn't open '%s'.. ", file)
        ERROR_("Unable to store the %d-th execution time..\n", (rep + 1))
        return -1;
    }

    for(i = 0; i < rep + 1; i++)
    {
        fprintf(new_file, "%lf\n", prev_exec_times[i]);
    }

    free(prev_exec_times);
    fclose(new_file);

    return 0;
}