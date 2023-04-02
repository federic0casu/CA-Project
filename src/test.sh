make
for rep in {1..1}
do 
    ./"create_input" input.txt 25 25 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep
done