make

#############################################################
#   1st SIMULATION: 32x32, 4x4                              #
#############################################################

echo "IMAGE: 32x32,     KERNEL: 4x4, THREADS: 2"
for rep in {1..1000}
do 
    ./"create_input" input.txt 32 32 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 2
done

echo "IMAGE: 32x32,     KERNEL: 4x4, THREADS: 4"
for rep in {1..1000}
do 
    ./"create_input" input.txt 32 32 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 4
done

echo "IMAGE: 32x32,     KERNEL: 4x4, THREADS: 8"
for rep in {1..1000}
do 
    ./"create_input" input.txt 32 32 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 8
done

echo "IMAGE: 32x32,     KERNEL: 4x4, THREADS: 12"
for rep in {1..1000}
do 
    ./"create_input" input.txt 32 32 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 12
done

echo "IMAGE: 32x32,     KERNEL: 4x4, THREADS: 16"
for rep in {1..1000}
do 
    ./"create_input" input.txt 32 32 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 16
done

echo "IMAGE: 32x32,     KERNEL: 4x4, THREADS: 24"
for rep in {1..1000}
do 
    ./"create_input" input.txt 32 32 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 24
done

echo "IMAGE: 32x32,     KERNEL: 4x4, THREADS: 32"
for rep in {1..1000}
do 
    ./"create_input" input.txt 32 32 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 32
done

#############################################################


#############################################################
#   2nd SIMULATION: 64x64, 4x4                              #
#############################################################

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 2"
for rep in {1..1000}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 2
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 4"
for rep in {1..1000}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 4
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 8"
for rep in {1..1000}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 8
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 12"
for rep in {1..1000}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 12
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 16"
for rep in {1..1000}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 16
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 24"
for rep in {1..1000}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 24
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 32"
for rep in {1..1000}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 32
done

#############################################################


#############################################################
#   3rd SIMULATION: 128x128, 4x4                            #
#############################################################

echo "IMAGE: 128x128,   KERNEL: 4x4, THREADS: 2"
for rep in {1..1000}
do 
    ./"create_input" input.txt 128 128 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 2
done

echo "IMAGE: 128x128,   KERNEL: 4x4, THREADS: 4"
for rep in {1..1000}
do 
    ./"create_input" input.txt 128 128 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 4
done

echo "IMAGE: 128x128,   KERNEL: 4x4, THREADS: 8"
for rep in {1..1000}
do 
    ./"create_input" input.txt 128 128 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 8
done

echo "IMAGE: 128x128,   KERNEL: 4x4, THREADS: 12"
for rep in {1..1000}
do 
    ./"create_input" input.txt 128 128 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 12
done

echo "IMAGE: 128x128,   KERNEL: 4x4, THREADS: 16"
for rep in {1..1000}
do 
    ./"create_input" input.txt 128 128 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 16
done

echo "IMAGE: 128x128,   KERNEL: 4x4, THREADS: 24"
for rep in {1..1000}
do 
    ./"create_input" input.txt 128 128 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 24
done

echo "IMAGE: 128x128,   KERNEL: 4x4, THREADS: 32"
for rep in {1..1000}
do 
    ./"create_input" input.txt 128 128 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 32
done

#############################################################


#############################################################
#   4th SIMULATION: 256x256, 4x4                            #
#############################################################

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 2"
for rep in {1..1000}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 2
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 4"
for rep in {1..1000}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 4
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 8"
for rep in {1..1000}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 8
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 12"
for rep in {1..1000}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 12
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 16"
for rep in {1..1000}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 16
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 24"
for rep in {1..1000}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 24
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 32"
for rep in {1..1000}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 32
done

#############################################################


#############################################################
#   5th SIMULATION: 512x512, 4x4                            #
#############################################################

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 2"
for rep in {1..1000}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 2
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 4"
for rep in {1..1000}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 4
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 8"
for rep in {1..1000}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 8
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 12"
for rep in {1..1000}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 12
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 16"
for rep in {1..1000}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 16
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 24"
for rep in {1..1000}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 24
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 32"
for rep in {1..1000}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 32
done

#############################################################


#############################################################
#   6th SIMULATION: 1024x1024, 4x4                          #
#############################################################

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 2"
for rep in {1..1000}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 2
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 4"
for rep in {1..1000}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 4
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 8"
for rep in {1..1000}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 8
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 12"
for rep in {1..1000}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 12
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 16"
for rep in {1..1000}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 16
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 24"
for rep in {1..1000}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 24
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 32"
for rep in {1..1000}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 32
done

#############################################################