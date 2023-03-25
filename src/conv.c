/*
 * CPU implementantion of convolution
 */ 
void convolution(int** output, int** input, int** kernel, int input_rows, int input_columns, int kernel_size)
{
    // This holds the convolution results for an index.
    int convolute = 0;
    
    // Used for input matrix index.
    short x, y;

	// Fill output matrix: rows and columns are i and j respectively.
	for (short i = 0; i < (input_rows - kernel_size + 1); i++)
	{
		for (short j = 0; j < (input_columns - kernel_size + 1); j++)
		{
			x = i;
			y = j;

			// Kernel rows and columns are k and l respectively.
			for (short k = 0; k < kernel_size; k++)
			{
				for (short l = 0; l < kernel_size; l++)
				{
					// Convolute here.
					convolute += kernel[k][l] * input[x][y];
					
                    // Move right.
                    y++;
				}
                // Move down.
				x++; 

                // Restart column position
				y = j;
			}
            // Add result to output matrix.
			output[i][j] = convolute;
			
            // Needed before we move on to the next index.
            convolute = 0;
		}
	}
}