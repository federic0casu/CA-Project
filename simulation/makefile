all:conv_main create_input

conv_main:./../src/conv_main.cpp
	g++ -Wall ./../src/conv_main.cpp ./../src/conv_seq.cpp ./../src/conv_omp.cpp ./../src/conv_pthread.cpp ./../src/convolute_opt.s ./../src/utility.cpp -g -fopenmp -lpthread -o conv

create_input:./../src/create_input.cpp
	g++ -Wall ./../src/create_input.cpp ./../src/utility.cpp -o create_input

clean: 
	rm *o conv create_input validate