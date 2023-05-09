make

#############################################################
#   1st SIMULATION: 64x64, 3x3                              #
#############################################################

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 2"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 2
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 3"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 3
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 4"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 4
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 5"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 5
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 6"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 6
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 7"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 7
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 8"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 8
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 9"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 9
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 10"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 10
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 11"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 11
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 12"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 12
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 13"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 13
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 14"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 14
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 15"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 15
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 16"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 16
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

#############################################################


#############################################################
#   2nd SIMULATION: 256x256, 3x3                            #
#############################################################

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 2"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 2
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 3"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 3
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 4"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 4
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 5"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 5
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 6"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 6
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 7"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 7
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 8"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 8
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 9"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 9
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 10"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 10
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 11"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 11
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 12"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 12
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 13"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 13
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 14"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 14
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 15"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 15
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 16"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 16
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

#############################################################


#############################################################
#   3rd SIMULATION: 512x512, 3x3                            #
#############################################################

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 2"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 2
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 3"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 3
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 4"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 4
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 5"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 5
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 6"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 6
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 7"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 7
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 8"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 8
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 9"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 9
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 10"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 10
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 11"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 11
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 12"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 12
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 13"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 13
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 14"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 14
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 15"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 15
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 16"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 16
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done


#############################################################


#############################################################
#   4th SIMULATION: 1024x1024, 3x3                          #
#############################################################

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 2"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 2
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 3"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 3
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 4"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 4
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 5"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 5
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 6"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 6
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 7"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 7
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 8"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 8
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 9"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 9
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 10"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 10
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 11"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 11
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 12"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 12
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 13"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 13
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 14"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 14
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 15"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 15
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 16"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 16
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

#############################################################


#############################################################
#   5th SIMULATION: 2048x2048, 3x3                          #
#############################################################

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 2"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 2
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 3"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 3
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 4"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 4
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 5"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 5
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 6"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 6
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 7"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 7
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 8"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 8
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 9"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 9
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 10"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 10
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 11"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 11
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 12"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 12
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 13"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 13
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 14"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 14
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 15"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 15
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 16"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 16
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

#############################################################


#############################################################
#   6th SIMULATION: 4096x4096, 3x3                          #
#############################################################

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 2"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 2
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 3"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 3
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 4"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 4
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 5"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 5
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 6"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 6
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 7"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 7
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 8"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 8
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 9"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 9
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 10"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 10
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 11"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 11
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 12"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 12
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 13"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 13
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 14"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 14
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 15"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 15
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 16"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 16
    if test $rep -eq 25; 
    then
        printf '\t[##'
    fi
    if test $rep -eq 50; 
    then
        printf '###'
    fi
    if test $rep -eq 75; 
    then
        printf '##'
    fi
    if test $rep -eq 99; 
    then
        printf '###] -> 100\n'
    fi
done

#############################################################