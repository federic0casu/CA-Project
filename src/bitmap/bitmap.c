#include <stdio.h>
#include <stdlib.h>
#include "utility.h"

int i_w, i_h, headers_size;
unsigned char Palette[1024]; // 4 byte x 256 colori

void bin8(int n, char bin[])
{
     for (short i = 0; i < 8 ; i++)
     {
         bin[7-i]=(n % 2) + '0';
         n = (n - (n % 2) ) / 2;
     }
}

void dump_bitmap(char* file, int iOffSet, int n_bit)
{
   unsigned char bitmap[64000L];
   unsigned char d;

   char dig[3];
   char bin[8];
   
   int row_lenght, num_byte;
   int n = 0, b = 0, res;

    // Dimensione riga: multiplo di 4 byte
   row_lenght = ((i_w*n_bit) + (32 - (i_w*n_bit)%32))/8;
	FILE *file_p = fopen(file,"rb");
   if(!file_p)
   {
      ERROR_("File '%s' not found.\n", file)
      return;
   }

   fseek(file_p, iOffSet, 0);

   PRINT("BITMAP DATA")

   num_byte = n_bit/8;
   if(num_byte < 1) num_byte = 1;

   res = fread(bitmap, sizeof(unsigned char), row_lenght, file_p);
   while(res == row_lenght)
   {
      for(n = 0; n < row_lenght; n++)
      {
         if(n_bit == 24 || n_bit == 8)
         {
            if(b == 0) printf("[");
            
            printf("%02X", bitmap[n]);
                
            if(b == (num_byte-1)) printf("]");
                
            b = (b + 1) % num_byte;
         }
         else if(n_bit == 4)
         {
            sprintf(dig, "%02X", bitmap[n]);
            printf("[%c] [%c] ", dig[0], dig[1]);
         }
         else if(n_bit == 1)
         {
            res = (int)bitmap[n];
            bin8(res, bin);
            printf("[%s]", bin);
         }
      }
      printf("\n");
      res = fread(bitmap, sizeof(unsigned char), row_lenght, file_p);
   }
   while (!feof(file_p));
   printf("------------------------------------------------\n");
   fclose(file_p);
}

void info_BMP(char* file, int* n_bit)
{
   size_t res; 
   int iOffSet;
   FILE *file_p;

   printf("################################################\n");
   printf("# File: %s\n", file);
   printf("############################### vers. 2.0 ######\n");

   file_p = fopen(file,"rb");

   int   int_var;
   short short_var;
   float float_var;
   char  char_arr[2];


   PRINT("BITMAP FILE HEADER (14 bytes)")

   fseek(file_p, 0, 0);
   res = fread(char_arr, 2, 1, file_p);
   FERROR(file_p, file)
   printf(" - bfType    (+0)              : %c%c\n", char_arr[0], char_arr[1]);
   
   fseek(file_p, 2, 0);
   fread(&int_var, 1, sizeof(int), file_p);
   FERROR(file_p, file)
   printf(" - bfSize    (+2)              : %d\n", int_var);
   
   fseek(file_p, 10, 0);
   fread(&int_var, 1, sizeof(int), file_p);
   FERROR(file_p, file)
   printf(" - bfOffBits (+10)             : %d\n", int_var);

   iOffSet = int_var;


   PRINT("BITMAP INFO HEADER (40 bytes)")
    
   fseek(file_p,14,0);
   res = fread(&int_var, sizeof(int), 1, file_p);
   FERROR(file_p, file)
   printf(" - Dimensione Header Immagine : %d\n", int_var);
   headers_size = int_var + 14;

   res = fread(&int_var, sizeof(int), 1, file_p);
   FERROR(file_p, file)
   printf(" - Larghezza                  : %d\n",int_var);
   i_w = int_var;

   res = fread(&int_var, sizeof(int), 1, file_p);
   FERROR(file_p, file)
   printf(" - Altezza                    : %d\n",int_var);
   i_h = int_var;

   fseek(file_p, 28, 0);
   res = fread(&short_var, sizeof(short), 1, file_p);
   FERROR(file_p, file)
   printf(" - nr. bit per colore         : %hd\n", short_var);
   *n_bit = short_var;

   res = fread(&int_var, sizeof(int), 1, file_p);
   if(int_var == 0) printf(" - tipo compressione          : Nessuna\n");
   else if(int_var == 1) printf(" - tipo compressione          : RLE 8 Bit\n");
   else if(int_var == 2) printf(" - tipo compressione          : RLE 4 Bit\n");
   else if(int_var == 3) printf(" - tipo compressione          : Bitfields\n");
   else printf(" - tipo compressione          : %d\n", int_var);

   fread(&int_var, 1, sizeof(int), file_p);
   FERROR(file_p, file)
   printf(" - bytes immagine senza header: %d\n", int_var);
   
   
   PRINT("PALETTE")
   
   if (headers_size == iOffSet) printf(" - Palette                     : Non presente\n");
   else
   {
      fseek(file_p, headers_size, 0);
      fread(Palette, sizeof(unsigned char), iOffSet - headers_size, file_p);

      for (int n = 0, j = 0; n < (iOffSet - headers_size)/4; n++)
      {
         printf("%02X^col. :%02lX",n, (long unsigned int)Palette[j++]);
         printf("%02lX", (long unsigned int)Palette[j++]);
         printf("%02lX | ", (long unsigned int)Palette[j++]);
         if(((n+1) % 4) == 0) printf("\n");
         j++;
      }
   }
   printf("\n");
   fclose(file_p);
   dump_bitmap(file, iOffSet, *n_bit);
}

int main(int argc, char *argv[])
{
   int iOffSet, n_bit = atoi(argv[1]);

   if(n_bit == 1)
      info_BMP("bmp7x7_01bit.bmp", &n_bit);
   else if(n_bit == 4)
      info_BMP("bmp7x7_04bit.bmp", &n_bit);
   else if(n_bit == 8)
      info_BMP("bmp7x7_08bit.bmp", &n_bit);
   else if(n_bit == 24)
      info_BMP("bmp7x7_24bit.bmp", &n_bit);
   else
      printf("Numeri ammessi: 1, 4, 8, 24\n");
   exit(0);
}