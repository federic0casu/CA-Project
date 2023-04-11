make

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 2"
 
./"create_input" input.txt 1024 1024 kernel.txt 4 4 0
valgrind --tool=massif ./"conv" input.txt kernel.txt 0 2
