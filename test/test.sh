make
for rep in {1..20}
do 
    ./"create_input" input.txt 10 10 kernel.txt 3 3 $rep
    ./"conv" input.txt kernel.txt $rep
done