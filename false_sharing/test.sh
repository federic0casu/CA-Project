make

#############################################################
#   1st SIMULATION: 64x64, 4x4                              #
#############################################################

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 2"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 2
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 3"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 3
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 4"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 4
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 5"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 5
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 6"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 6
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 7"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 7
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 8"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 8
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 9"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 9
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 10"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 10
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 11"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 11
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 12"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 12
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 13"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 13
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 14"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 14
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 15"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 15
done

echo "IMAGE: 64x64,     KERNEL: 4x4, THREADS: 16"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 16
done

#############################################################


#############################################################
#   2nd SIMULATION: 256x256, 4x4                            #
#############################################################

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 2"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 2
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 3"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 3
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 4"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 4
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 5"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 5
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 6"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 6
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 7"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 7
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 8"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 8
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 9"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 9
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 10"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 10
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 11"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 11
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 12"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 12
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 13"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 13
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 14"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 14
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 15"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 15
done

echo "IMAGE: 256x256,   KERNEL: 4x4, THREADS: 16"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 16
done

#############################################################


#############################################################
#   3rd SIMULATION: 512x512, 4x4                            #
#############################################################

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 2"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 2
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 3"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 3
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 4"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 4
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 5"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 5
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 6"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 6
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 7"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 7
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 8"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 8
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 9"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 9
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 10"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 10
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 11"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 11
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 12"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 12
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 13"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 13
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 14"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 14
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 15"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 15
done

echo "IMAGE: 512x512,   KERNEL: 4x4, THREADS: 16"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 16
done


#############################################################


#############################################################
#   4th SIMULATION: 1024x1024, 4x4                          #
#############################################################

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 2"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 2
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 3"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 3
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 4"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 4
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 5"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 5
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 6"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 6
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 7"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 7
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 8"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 8
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 9"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 9
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 10"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 10
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 11"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 11
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 12"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 12
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 13"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 13
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 14"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 14
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 15"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 15
done

echo "IMAGE: 1024x1024, KERNEL: 4x4, THREADS: 16"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 16
done

#############################################################


#############################################################
#   5th SIMULATION: 2048x2048, 4x4                          #
#############################################################

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 2"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 2
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 3"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 3
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 4"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 4
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 5"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 5
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 6"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 6
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 7"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 7
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 8"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 8
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 9"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 9
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 10"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 10
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 11"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 11
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 12"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 12
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 13"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 13
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 14"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 14
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 15"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 15
done

echo "IMAGE: 2048x2048, KERNEL: 4x4, THREADS: 16"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep 16
done

#############################################################