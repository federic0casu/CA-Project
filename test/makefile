all:conv_main create_input

conv_main:./../src/conv_main.cpp
	g++ -Wall ./../src/conv_main.cpp ./../src/conv_seq.cpp ./../src/conv_multithread.cpp ./../src/utility.cpp ./../cache_sim/src/cache_sim.cpp -fopenmp -o conv

create_input:./../src/create_input.cpp
	g++ -Wall ./../src/create_input.cpp ./../src/utility.cpp -o create_input

clean: 
	rm *o conv create_input validate