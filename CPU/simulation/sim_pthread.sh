make

#############################################################
#   1st SIMULATION: 64x64, 3x3                              #
#############################################################

echo "IMAGE: 64x64,     KERNEL: 3x3"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 2
    ./"conv" input.txt kernel.txt $rep 3
    ./"conv" input.txt kernel.txt $rep 4
    ./"conv" input.txt kernel.txt $rep 5
    ./"conv" input.txt kernel.txt $rep 6
    ./"conv" input.txt kernel.txt $rep 7
    ./"conv" input.txt kernel.txt $rep 8
    ./"conv" input.txt kernel.txt $rep 9
    ./"conv" input.txt kernel.txt $rep 10
    ./"conv" input.txt kernel.txt $rep 11
    ./"conv" input.txt kernel.txt $rep 12
    ./"conv" input.txt kernel.txt $rep 13
    ./"conv" input.txt kernel.txt $rep 14
    ./"conv" input.txt kernel.txt $rep 15
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

echo "IMAGE: 256x256,   KERNEL: 3x3"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 2
    ./"conv" input.txt kernel.txt $rep 3
    ./"conv" input.txt kernel.txt $rep 4
    ./"conv" input.txt kernel.txt $rep 5
    ./"conv" input.txt kernel.txt $rep 6
    ./"conv" input.txt kernel.txt $rep 7
    ./"conv" input.txt kernel.txt $rep 8
    ./"conv" input.txt kernel.txt $rep 9
    ./"conv" input.txt kernel.txt $rep 10
    ./"conv" input.txt kernel.txt $rep 11
    ./"conv" input.txt kernel.txt $rep 12
    ./"conv" input.txt kernel.txt $rep 13
    ./"conv" input.txt kernel.txt $rep 14
    ./"conv" input.txt kernel.txt $rep 15
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

echo "IMAGE: 512x512,   KERNEL: 3x3"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 2
    ./"conv" input.txt kernel.txt $rep 3
    ./"conv" input.txt kernel.txt $rep 4
    ./"conv" input.txt kernel.txt $rep 5
    ./"conv" input.txt kernel.txt $rep 6
    ./"conv" input.txt kernel.txt $rep 7
    ./"conv" input.txt kernel.txt $rep 8
    ./"conv" input.txt kernel.txt $rep 9
    ./"conv" input.txt kernel.txt $rep 10
    ./"conv" input.txt kernel.txt $rep 11
    ./"conv" input.txt kernel.txt $rep 12
    ./"conv" input.txt kernel.txt $rep 13
    ./"conv" input.txt kernel.txt $rep 14
    ./"conv" input.txt kernel.txt $rep 15
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

echo "IMAGE: 1024x1024, KERNEL: 3x3"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 2
    ./"conv" input.txt kernel.txt $rep 3
    ./"conv" input.txt kernel.txt $rep 4
    ./"conv" input.txt kernel.txt $rep 5
    ./"conv" input.txt kernel.txt $rep 6
    ./"conv" input.txt kernel.txt $rep 7
    ./"conv" input.txt kernel.txt $rep 8
    ./"conv" input.txt kernel.txt $rep 9
    ./"conv" input.txt kernel.txt $rep 10
    ./"conv" input.txt kernel.txt $rep 11
    ./"conv" input.txt kernel.txt $rep 12
    ./"conv" input.txt kernel.txt $rep 13
    ./"conv" input.txt kernel.txt $rep 14
    ./"conv" input.txt kernel.txt $rep 15
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

echo "IMAGE: 2048x2048, KERNEL: 3x3"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 2
    ./"conv" input.txt kernel.txt $rep 3
    ./"conv" input.txt kernel.txt $rep 4
    ./"conv" input.txt kernel.txt $rep 5
    ./"conv" input.txt kernel.txt $rep 6
    ./"conv" input.txt kernel.txt $rep 7
    ./"conv" input.txt kernel.txt $rep 8
    ./"conv" input.txt kernel.txt $rep 9
    ./"conv" input.txt kernel.txt $rep 10
    ./"conv" input.txt kernel.txt $rep 11
    ./"conv" input.txt kernel.txt $rep 12
    ./"conv" input.txt kernel.txt $rep 13
    ./"conv" input.txt kernel.txt $rep 14
    ./"conv" input.txt kernel.txt $rep 15
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

echo "IMAGE: 4096x4096, KERNEL: 3x3"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 2
    ./"conv" input.txt kernel.txt $rep 3
    ./"conv" input.txt kernel.txt $rep 4
    ./"conv" input.txt kernel.txt $rep 5
    ./"conv" input.txt kernel.txt $rep 6
    ./"conv" input.txt kernel.txt $rep 7
    ./"conv" input.txt kernel.txt $rep 8
    ./"conv" input.txt kernel.txt $rep 9
    ./"conv" input.txt kernel.txt $rep 10
    ./"conv" input.txt kernel.txt $rep 11
    ./"conv" input.txt kernel.txt $rep 12
    ./"conv" input.txt kernel.txt $rep 13
    ./"conv" input.txt kernel.txt $rep 14
    ./"conv" input.txt kernel.txt $rep 15
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