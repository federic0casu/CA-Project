all:conv_main create_input

conv_main:conv_seq_main.c
	gcc -Wall conv_seq_main.c conv_seq.c utility.c -o conv

create_input:create_input.c
	gcc -Wall create_input.c utility.c -o create_input

clean: 
	rm *o conv create_input