#include <time.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>

#include <iostream>
#include <chrono>

#define RED         "\033[0;31m"
#define GREEN       "\033[32m"
#define COLOR_RESET "\e[0m"

#define ERROR(e)        \
    printf(RED);        \
    printf("[ERROR] "); \
    printf(e);          \
    printf(COLOR_RESET);

#define ERROR_(e, d)    \
    printf(RED);        \
    printf("[ERROR] "); \
    printf(e, d);       \
    printf(COLOR_RESET);

#define SUCCESS(i)                       \
    printf(GREEN);                       \
    printf("[TEST %d-th] SUCCESS\n", i); \
    printf(COLOR_RESET);

#define ITOA(i, s, l)               \
    l = snprintf(NULL, 0, "%d", i); \
    s = (char *)malloc(l + 1);      \
    snprintf(s, l + 1, "%d", i);

#define FERROR(f_p, f_n)                                       \
    if (ferror(f_p))                                           \
    {                                                          \
        ERROR_("Something goes wrong while reading '%s'", f_n) \
        fclose(f_p);                                           \
        return;                                                \
    }

//#define DEBUG
#define SIMULATION
//#define SEQ
#define PTHREAD

#define LOOP_UNROLLING

struct data
{
    int rows;
    int columns;
    int *raw_data;
};

void print(int *, int, int);
void validate(int *, int *, int, int, int); 

void convolution_seq(int *, int *, int *, int, int, int);
void convolution_thread(int *, int *, int *, int, int, int, int);
void convolution_pthread(int *, int *, int *, int, int, int, int);

int write_file(char *, int *, int);
int read_file(char *, char *, int, int, int, int, int *, int *);

int get_dimensions(char *, char *, int *, int *, int *, int *);
int set_dimensions(char *, char *, char *, char *, char *, char *);

int write_execution_time(char *, int, double);
