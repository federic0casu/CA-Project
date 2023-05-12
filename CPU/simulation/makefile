all:conv_main create_input

conv_main:./../src/conv_main.cpp
	g++ -Wall -g ./../src/conv_main.cpp ./../src/conv_seq.cpp ./../src/conv_pthread.cpp ./../src/utility.cpp -lpthread -o conv

create_input:./../src/create_input.cpp
	g++ -Wall ./../src/create_input.cpp ./../src/utility.cpp -o create_input -O3

clean: 
	rm *o conv create_input
