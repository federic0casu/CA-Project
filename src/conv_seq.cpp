/*
 * Sequential implementantion of convolution
 */ 

void convolution_seq(int* output, int* input, int* kernel, int input_rows, int input_columns, int kernel_size)
{
    // This holds the convolution results.
    int convolute;

	// Fill output matrix: rows and columns are i and j respectively.
	for (auto x = 0; x < (input_rows - kernel_size + 1); x++)
	{
		for (auto y = 0; y < (input_columns - kernel_size + 1); y++)
		{
			// Kernel rows and columns are kx and ky respectively.
			for (int kx = 0; kx < kernel_size; kx++)
			{
				for (int ky = 0; ky < kernel_size; ky++)
					// Convolute here.
					convolute += (input[(x + kx) * input_columns + (y + ky)] * kernel[kx * kernel_size + ky]);
			}
            // Add result to output matrix.
			output[x*(input_columns - kernel_size + 1) + y] = convolute;
			
            // Needed before we move on to the next index.
            convolute = 0;
		}
	}
}