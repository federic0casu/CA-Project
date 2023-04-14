#include "utility.hpp"

void print(int *input, int rows, int columns)
{
    for(short i = 0; i < rows; i++)
    {
        for(short j = 0; j < columns; j++)
            printf("%d ", input[i*columns + j]);

        printf("\n");
    }
}

int set_dimensions(char *image_path, char *kernel_path, char *image_rows, char *image_columns, char *kernel_rows, char *kernel_columns)
{
    FILE* __image = fopen(image_path, "w+");
    if(!__image)
    {
        ERROR_("Couldn't open file '%s'. Verify if the file is located in the same directory as conv.c\n", image_path);
        return -1;
    }

    FILE* __kernel = fopen(kernel_path, "w+");
    if(!__kernel)
    {
        ERROR_("Couldn't open file '%s'. Verify if the file is located in the same directory as conv.c\n", kernel_path);
        fclose(__image);
        return -1;
    } 

    if(fprintf(__image, "%d\n", atoi(image_rows)) != static_cast<int>(strlen(image_rows) + 1) || fprintf(__image, "%d\n", atoi(image_columns)) != static_cast<int>(strlen(image_columns) + 1))
    {
        ERROR_("Couldn't write to file '%s'\n", image_path);
        fclose(__image);
        fclose(__kernel);
        return -1;
    } 

    fclose(__image);

    if(fprintf(__kernel, "%d\n", atoi(kernel_rows)) != static_cast<int>(strlen(kernel_rows) + 1) || fprintf(__kernel, "%d\n", atoi(kernel_columns)) != static_cast<int>(strlen(kernel_columns) + 1))
    {
        ERROR_("Couldn't write to file '%s'\n", kernel_path);
        fclose(__kernel);
        return -1;
    } 

    fclose(__kernel);

    return 0;
}

int get_dimensions(char *image_path, char *kernel_path, int *image_rows, int *image_columns, int *kernel_rows, int *kernel_columns)
{
    FILE* __image = fopen(image_path, "r");
    if(!__image)
    {
        ERROR_("Couldn't open file '%s'. Verify if the file is located in the same directory as conv.c\n", image_path);
        return -1;
    }

    FILE* __kernel = fopen(kernel_path, "r");
    if(!__kernel)
    {
        ERROR_("Couldn't open file '%s'. Verify if the file is located in the same directory as conv.c\n", kernel_path);
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

int read_file(char *image_path, char *kernel_path, int image_rows, int image_columns, int kernel_rows, int kernel_columns, int *image, int *kernel)
{
    FILE* __image = fopen(image_path, "r");
    if(!__image)
    {
        ERROR_("Couldn't open file '%s'. Verify if the file is located in the same directory as conv.c\n", image_path);
        return -1;
    }

    FILE* __kernel = fopen(kernel_path, "r");
    if(!__kernel)
    {
        ERROR_("Couldn't open file '%s'. Verify if the file is located in the same directory as conv.c\n", kernel_path);
        fclose(__image);
        return -1;
    }

    int i = 0;
    while(!feof(__image))
    {
        if(i < 2) 
        {
            fscanf(__image, "%d", &image[i]);
            i++;
            continue;
        }

        fscanf(__image, "%d", &image[i-2]);

        i++;
        if((i-2) == image_rows*image_columns) break;
    }

    if(i < image_rows*image_columns)
    {
        ERROR_("Couldn't read file '%s'. Verify if the format of image file is correct.\n", image_path);
        fclose(__image);
        fclose(__kernel);
        return -1;
    }

    fclose(__image);

    i = 0;
    while(!feof(__kernel))
    {
        if(i < 2) 
        {
            fscanf(__kernel, "%d", &kernel[i]);
            i++;
            continue;
        }

        fscanf(__kernel, "%d", &kernel[i-2]);

        i++;
        if((i-2) == kernel_rows*kernel_columns) break;
    }

    if(i < kernel_rows*kernel_columns)
    {
        ERROR_("Couldn't read file '%s'. Verify if the format of image file is correct.\n", kernel_path);
        fclose(__kernel);
        return -1;
    }

    fclose(__kernel);

    return 0;
}

int write_file(char *file, int *raw_data, int size)
{
    FILE* file_p = fopen(file, "a+");

    if(!file_p)
    {
        ERROR_("Couldn't open '%s'.\n", file)
        return -1;
    }

    for(int i = 0; i < size; i++)
        fprintf(file_p, "%d\n", raw_data[i]);

    fclose(file_p);

    return 0;
}

int write_execution_time(char *file, int rep, double current_exec_time)
{
    FILE* file_p = fopen(file, "a+");

    if(!file_p)
    {
        ERROR_("Couldn't open '%s'. ", file)
        ERROR_("Unable to store the %d-th execution time.\n", (rep + 1))
        return -1;
    }

    fprintf(file_p, "%d,%lf\n", rep, current_exec_time);

    fclose(file_p);

    return 0;
}

void validate(int *out_seq, int *out_thread, int rows, int columns, int rep) 
{
    for(int i = 0; i < rows*columns; i++) 
        if(out_seq[i] != out_thread[i])
        {
            ERROR_("Test %d-th not passed\n", rep)
        }

    SUCCESS(rep);
}

void validate_FS(int *out_FS, raw_data_aligned *out_NO_FS, int rows, int columns, int rep) 
{
    for(int i = 0; i < rows*columns; i++) 
        if(out_FS[i] != out_NO_FS[i].element)
        {
            ERROR_("Test %d-th not passed\n", rep)
        }

    SUCCESS(rep);
}