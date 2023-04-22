echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 1"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 1
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 1"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 1
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 1"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 1
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 1"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 1
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 1"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 1
done

echo "IMAGE: 4096x4096, KERNEL: 4x4, THREADS: 1"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 1
done