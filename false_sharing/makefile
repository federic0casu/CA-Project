all:conv_main create_input

conv_main:./src/conv_main.cpp
	g++ -Wall -Wextra ./src/conv_main.cpp ./src/conv_pthread_FS.cpp ./src/conv_pthread_NO_FS.cpp ./src/utility.cpp -lpthread -o conv

create_input:./src/create_input.cpp
	g++ -Wall -Wextra ./src/create_input.cpp ./src/utility.cpp -o create_input

clean: 
	rm *o conv create_input validate
