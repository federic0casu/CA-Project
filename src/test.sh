make
for rep in {1..1}
do 
    ./"create_input" input.txt 4 4 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep
done