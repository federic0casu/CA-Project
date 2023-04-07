make

echo "IMAGE: 32x32, KERNEL: 4x4, THREADS: 2"
for rep in {1..100}
do 
    ./"create_input" input.txt 32 32 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 2
done

echo "IMAGE: 32x32, KERNEL: 4x4, THREADS: 4"
for rep in {1..100}
do 
    ./"create_input" input.txt 32 32 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 4
done

echo "IMAGE: 32x32, KERNEL: 4x4, THREADS: 8"
for rep in {1..100}
do 
    ./"create_input" input.txt 32 32 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 8
done

echo "IMAGE: 32x32, KERNEL: 4x4, THREADS: 16"
for rep in {1..100}
do 
    ./"create_input" input.txt 32 32 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 16
done

echo "IMAGE: 32x32, KERNEL: 4x4, THREADS: 32"
for rep in {1..100}
do 
    ./"create_input" input.txt 32 32 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 32
done