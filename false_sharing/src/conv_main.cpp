#include "utility.hpp"

int main(int argc, char* argv[])
{ 
    if(argc != 5)
    {
        ERROR("Incorrect number of arguments. Correct usage: ./conv input_image.txt kernel.txt 1 1\n")
        exit(-1);
    }

    char* image_path     = argv[1];
    char* kernel_path    = argv[2];
    unsigned int rep     = atoi(argv[3]);
    
    unsigned int threads = atoi(argv[4]); 

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

    #ifndef VALIDATION
        #ifdef FALSE_SHARING
            struct data image_f;
        #else
            struct data_aligned image_f;
        #endif

        image_f.rows    = image.rows - kernel.rows + 1;
        image_f.columns = image.columns - kernel.columns + 1;

        #ifdef FALSE_SHARING
            image_f.raw_data = (int*) malloc(sizeof(int)*image_f.rows*image_f.columns);
        #else
            image_f.raw_data = (raw_data_aligned*) malloc(sizeof(raw_data_aligned)*image_f.rows*image_f.columns);
        #endif
    #else
        struct data output_FS;
        struct data_aligned output_NO_FS;

        output_FS.rows    = output_NO_FS.rows    = image.rows - kernel.rows + 1;
        output_FS.columns = output_NO_FS.columns = image.columns - kernel.columns + 1;

        output_FS.raw_data    = (int*) malloc(sizeof(int)*output_FS.rows*output_FS.columns);
        output_NO_FS.raw_data = (raw_data_aligned*) malloc(sizeof(raw_data_aligned)*output_NO_FS.rows*output_NO_FS.columns);
    #endif
    
    #ifndef VALIDATION
    if(!image_f.raw_data)
    #else
    if(!output_FS.raw_data || !output_NO_FS.raw_data)
    #endif
    {
        ERROR("Couldn't allocate memory.\n");
        free(image.raw_data);
        free(kernel.raw_data);
        exit(-1);
    }

    #ifndef VALIDATION
        #ifdef FALSE_SHARING
            memset((void*) image_f.raw_data, 0, (sizeof(int)*image_f.rows*image_f.columns));
        #else
            memset((void*) image_f.raw_data, 0, (sizeof(raw_data_aligned)*image_f.rows*image_f.columns));
        #endif
    #else
        memset((void*) output_FS.raw_data, 0, (sizeof(int)*output_FS.rows*output_FS.columns));
        memset((void*) output_NO_FS.raw_data, 0, (sizeof(raw_data_aligned)*output_NO_FS.rows*output_NO_FS.columns));
    #endif

    #ifndef VALIDATION
        clock_t start;
        clock_t end;
        start = clock();

        #ifdef FALSE_SHARING
            convolution_pthread_FS(image_f.raw_data, image.raw_data, kernel.raw_data, image.rows, image.columns, kernel_size, threads);
        #else
            convolution_pthread_NO_FS(image_f.raw_data, image.raw_data, kernel.raw_data, image.rows, image.columns, kernel_size, threads);
        #endif

        end = clock();
        double execution_time = ((double)(end - start))/CLOCKS_PER_SEC;
    #else
        // Used to validate "false sharing free" implementation.
        convolution_pthread_FS(output_FS.raw_data, image.raw_data, kernel.raw_data, image.rows, image.columns, kernel_size, threads);
        convolution_pthread_NO_FS(output_NO_FS.raw_data, image.raw_data, kernel.raw_data, image.rows, image.columns, kernel_size, threads);
        validate_FS(output_FS.raw_data, output_NO_FS.raw_data, output_FS.rows, output_FS.columns, rep);
    #endif

    #ifndef VALIDATION
        #ifdef FALSE_SHARING
            char* file_name = (char*) malloc(sizeof(char)*1024);
            sprintf(file_name, "csv/false_sharing/exec_times(%dx%d_%dx%d)(%d).csv", image.rows, image.rows, kernel.rows, kernel.columns, threads);
            write_execution_time(file_name, rep, execution_time);
            free(file_name);
        #else
            char* file_name = (char*) malloc(sizeof(char)*1024);
            sprintf(file_name, "csv/NO_false_sharing/exec_times(%dx%d_%dx%d)(%d).csv", image.rows, image.rows, kernel.rows, kernel.columns, threads);
            write_execution_time(file_name, rep, execution_time);
            free(file_name);
        #endif
    #endif

    free(image.raw_data);
    free(kernel.raw_data);

    #ifndef VALIDATION
        free(image_f.raw_data);
    #else
        free(output_FS.raw_data);
        free(output_NO_FS.raw_data);
    #endif

    exit(0);    
}
