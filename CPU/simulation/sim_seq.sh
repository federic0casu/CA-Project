make 

echo "IMAGE: 64x64,     KERNEL: 3x3, THREADS: 1"
for rep in {1..100}
do 
    ./"create_input" input.txt 64 64 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 1
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

echo "IMAGE: 256x256,   KERNEL: 3x3, THREADS: 1"
for rep in {1..100}
do 
    ./"create_input" input.txt 256 256 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 1
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

echo "IMAGE: 512x512,   KERNEL: 3x3, THREADS: 1"
for rep in {1..100}
do 
    ./"create_input" input.txt 512 512 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 1
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

echo "IMAGE: 1024x1024, KERNEL: 3x3, THREADS: 1"
for rep in {1..100}
do 
    ./"create_input" input.txt 1024 1024 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 1
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

echo "IMAGE: 2048x2048, KERNEL: 3x3, THREADS: 1"
for rep in {1..100}
do 
    ./"create_input" input.txt 2048 2048 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 1
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

echo "IMAGE: 4096x4096, KERNEL: 3x3, THREADS: 1"
for rep in {1..100}
do 
    ./"create_input" input.txt 4096 4096 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep 1
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