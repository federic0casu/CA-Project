#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

#define RED "\033[0;31m"
#define COLOR_RESET "\e[0m"

#define ERROR(e)         printf(RED); printf(e); printf(COLOR_RESET);
#define ERROR_(e, d)     printf(RED); printf(e, d); printf(COLOR_RESET);
#define FERROR(f_p, f_n) if(ferror(f_p)) { ERROR_("Something goes wrong while reading '%s'", f_n) fclose(f_p); return; }
#define PRINT(m)         printf("+-------------------------------------------+\n"); printf("\t"); printf(m); printf("\n"); printf("+-------------------------------------------+\n");

#define DEBUG

void free_array(int**, int);
void print(int**, int, int);
void array_to_matrix(int*, int**, int, int);
int write_execution_time(char*, int, double);
int get_dimensions(char*, char*, int*, int*, int*, int*);
int read_file(char*, char*, int, int, int, int, int**, int**);