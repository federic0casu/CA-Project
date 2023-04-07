#include <math.h>
#include <vector>
#include <cstring>
#include <stdint.h>
#include <stdlib.h>
#include <iostream>

#define RED "\033[0;31m"
#define GREEN "\033[32m"
#define COLOR_RESET "\e[0m"

#define ERROR(e)        \
    printf(RED);        \
    printf("[ERROR] "); \
    printf(e);          \
    printf(COLOR_RESET);

#define ERROR_(e, d)    \
    printf(RED);        \
    printf("[ERROR] "); \
    printf(e, d);       \
    printf(COLOR_RESET);

#define NUMBER_CACHE_EVENTS 3

// #define DEBUG

enum event {
    CACHE_HIT,
    CACHE_MISS_LOAD,
    CACHE_MISS_REPLACE
};

class cache_sim {

    class cache_set {
        uint32_t associativity;
        std::pair<bool, uint64_t>* line;
    public:
        cache_set(const uint32_t, const uint32_t);
        ~cache_set();

        event check_event(const uint64_t) const;

        void load_block(const uint64_t);
    };

    uint32_t cache_size;
    uint32_t block_size;
    uint32_t associativity;
    uint32_t sets;
    uint32_t block_bits;
    uint32_t set_offset;
    uint32_t tag_offset;
    uint32_t set_mask;

    uint64_t statistics[NUMBER_CACHE_EVENTS];
    std::vector<cache_set*> entry_set;
    
    uint32_t pow2(const uint32_t);
    void record_event(const event);

public:
    cache_sim(const uint32_t, const uint32_t, const uint32_t = 1, const uint32_t = 0);
    ~cache_sim();
    friend std::ostream& operator <<(std::ostream&, cache_sim&);
    
    event get_line(const uint64_t);

    uint32_t get_cache_size() const;
    uint32_t get_cache_sets() const;
    uint32_t get_cache_set_bits() const;
    uint32_t get_cache_set_offset() const;
    uint32_t get_cache_tag_offset() const;
    uint32_t get_cache_block_size() const;
    uint32_t get_cache_block_bits() const;
    uint32_t get_cache_associativity() const;
    uint32_t get_set(const uint64_t);
    uint64_t get_tag(const uint64_t);
};