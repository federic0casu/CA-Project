make
for rep in {1..20}
do 
    ./"create_input" input.txt 16 16 kernel.txt 4 4 $rep
    ./"conv" input.txt kernel.txt $rep
done
