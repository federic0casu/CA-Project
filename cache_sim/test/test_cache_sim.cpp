#include <iostream>
#include <assert.h>
#include "../src/cache_sim.hpp"

int main()
{
    std::cout << "##########  CACHE SIM  ##########" << std::endl << std::endl;

    // TEST 1: 8-way cache of 32Kb (line size = 64 bytes). 
    std::cout << "TEST 1 - SIZE: " << 32768;
    std::cout << ", LINE SIZE: " << 64;
    std::cout << ", ASSOCIATIVITY: " << 8 << std::endl;
    std::cout << "Creating a new cache instance..." << std::endl;
    cache_sim* test_1 = new cache_sim((uint32_t) 32768, (uint32_t) 64, (uint32_t) 8);
    std::cout << *test_1;
    std::cout << "Testing..." << std::endl;
    for(auto j = 0; j < 10; j++)
    {
        /* Address:
         *  + offset: [5:0]     (since block size is 64 bytes)
         *  + index:  [11:6]    (since we have (cache_size/(block_size*associativity) = 64 sets))
         *  + tag:    [63:12]
         */
        auto sets  = test_1->get_cache_sets();
        auto block = test_1->get_cache_block_size();
        auto bound = sets * block;
        auto associativity = test_1->get_cache_associativity();

        std::cout << "  Range of addresses: [" << bound*j << ":" << bound*(j + 1) - 1<< "]" << std::endl;
         for(auto i = bound*j; i < bound*(j+1); i++)
        {
            auto tag = test_1->get_tag((uint64_t) i);
            assert(tag == ((uint32_t) j));

            auto set = test_1->get_set((uint64_t) i);
            assert((set + j*sets) == ((uint32_t) i/block));

            auto event = test_1->get_line(i);
            if((uint32_t) j < associativity) 
                assert(event == ((i % block == 0) ? CACHE_MISS_LOAD : CACHE_HIT));
            else 
                assert(event == ((i % block == 0) ? CACHE_MISS_REPLACE : CACHE_HIT));
        }
    }
    std::cout << "All tests passed!" << std::endl;
    std::cout << "Freeing cache instance..." << std::endl << std::endl;
    delete test_1;

    // TEST 2: direct-mapped cache of 32Kb (line size = 64 bytes). 
    std::cout << "TEST 2 - SIZE: " << 32768;
    std::cout << ", LINE SIZE: " << 64;
    std::cout << ", ASSOCIATIVITY: " << 1 << std::endl;
    std::cout << "Creating a new cache instance..." << std::endl;
    cache_sim* test_2 = new cache_sim((uint32_t) 32768, (uint32_t) 64);
    std::cout << *test_2;
    std::cout << "Testing..." << std::endl;
    for(auto j = 0; j < 10; j++)
    {
        /* Address:
         *  + offset: [5:0]     (since block size is 64 bytes)
         *  + index:  [13:6]    (since we have (cache_size/(block_size*associativity) = 512 entries))
         *  + tag:    [63:14]
         */
        auto sets  = test_2->get_cache_sets();
        auto block = test_2->get_cache_block_size();
        auto bound = sets * block;
        auto associativity = test_2->get_cache_associativity();
        
        std::cout << "  Range of addresses: [" << bound*j << ":" << bound*(j + 1) - 1<< "]" << std::endl;
         for(auto i = bound*j; i < bound*(j+1); i++)
        {
            auto tag = test_2->get_tag((uint64_t) i);
            assert(tag == ((uint32_t) j));

            auto set = test_2->get_set((uint64_t) i);
            assert((set + j*sets) == ((uint32_t) i/block));

            auto event = test_2->get_line(i);
            if((uint32_t) j < associativity) 
                assert(event == ((i % block == 0) ? CACHE_MISS_LOAD : CACHE_HIT));
            else
                assert(event == ((i % block == 0) ? CACHE_MISS_REPLACE : CACHE_HIT));
        }
    }
    std::cout << "All tests passed!" << std::endl;
    std::cout << "Freeing cache instance..." << std::endl << std::endl;
    delete test_2;

    // TEST 3: direct-mapped cache of 64Kb (line size = 64 bytes). 
    std::cout << "TEST 3 - SIZE: " << 65536;
    std::cout << ", LINE SIZE: " << 64;
    std::cout << ", ASSOCIATIVITY: " << 4 << std::endl;
    std::cout << "Creating a new cache instance..." << std::endl;
    cache_sim* test_3 = new cache_sim((uint32_t) 65536, (uint32_t) 64, (uint32_t) 4);
    std::cout << *test_3;
    std::cout << "Testing..." << std::endl;
    for(auto j = 0; j < 10; j++)
    {
        /* Address:
         *  + offset: [5:0]     (since block size is 64 bytes)
         *  + index:  [13:6]    (since we have (cache_size/(block_size*associativity) = 256 entries))
         *  + tag:    [63:14]
         */
        auto sets  = test_3->get_cache_sets();
        auto block = test_3->get_cache_block_size(); 
        auto bound = sets * block;
        auto associativity = test_3->get_cache_associativity();

        std::cout << "  Range of addresses: [" << bound*j << ":" << bound*(j + 1) - 1<< "]" << std::endl;
         for(auto i = bound*j; i < bound*(j+1); i++)
        {
            auto tag = test_3->get_tag((uint64_t) i);
            assert(tag == ((uint32_t) j));

            auto set = test_3->get_set((uint64_t) i);
            assert((set + j*sets) == ((uint32_t) i/block));

            auto event = test_3->get_line(i);
            if((uint32_t) j < associativity) 
                assert(event == ((i % block == 0) ? CACHE_MISS_LOAD : CACHE_HIT));
            else
                assert(event == ((i % block == 0) ? CACHE_MISS_REPLACE : CACHE_HIT));
        }
    }
    std::cout << "All tests passed!" << std::endl;
    std::cout << "Freeing cache instance..." << std::endl << std::endl;
    delete test_3;

    std::cout << "#############  END  #############" << std::endl << std::endl;
    
    return 0;
}
