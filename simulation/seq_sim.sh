make

echo "IMAGE: 32x32,     KERNEL: 4x4, THREADS: 1"
for rep in {1..1000}
do 
    ./"create_input" input.txt 32 32 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 1
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 1"
for rep in {1..1000}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 1
done

echo "IMAGE: 128x128,   KERNEL: 4x4, THREADS: 1"
for rep in {1..1000}
do 
    ./"create_input" input.txt 128 128 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 1
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 1"
for rep in {1..1000}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 1
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 1"
for rep in {1..1000}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 1
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 1"
for rep in {1..1000}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 1
done