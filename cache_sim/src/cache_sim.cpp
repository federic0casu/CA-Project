#include "cache_sim.hpp"

cache_sim::cache_set::cache_set(const uint32_t associativity, const uint32_t seed)
{
    this->associativity = associativity;

    line = new std::pair<bool, uint64_t>[associativity];

    for(uint32_t i = 0; i < associativity; i++)
        line[i].first = false;

    srand(seed);
}

cache_sim::cache_set::~cache_set() 
{ 
    delete[] line; 
}

event cache_sim::cache_set::check_event(const uint64_t tag) const 
{
    for(uint32_t i = 0; i < associativity; i++)
    {
        if(line[i].first && line[i].second == tag)
            return CACHE_HIT;
    }

    for(uint32_t i = 0; i < associativity; i++)
    {
        // We are looking for an empty line.
        if(!line[i].first)
            return CACHE_MISS_LOAD;
    }

    return CACHE_MISS_REPLACE;
}

void cache_sim::cache_set::load_block(const uint64_t tag)
{
    for(uint32_t i = 0; i < associativity; i++)
    {
        // We are looking for an empty line.
        if(!line[i].first)
        {

            line[i].first = true;
            line[i].second = tag;
            return;
        }
    }

    // If there is not an empty line we need to replace a block.
    auto block_to_replace = (associativity == 1) ? 0 : (rand() % associativity);

    #ifdef DEBUG
    std::cout << "[DEBUG] cache_sim::cache_set::load_block(" << tag << ") - replacing way " << block_to_replace << "..." << std::endl;
    #endif

    line[block_to_replace].first = true;
    line[block_to_replace].second = tag;
}

cache_sim::cache_sim(const uint32_t cache_size, const uint32_t block_size, const uint32_t associativity, const uint32_t seed) 
{
    this->cache_size    = cache_size;
    this->block_size    = block_size;
    this->associativity = associativity;

    sets = cache_size / (block_size*associativity);

    /* Calculate values for traversal. Cache lines come in the following format: *
     * |****** TAG ******|**** SET ****|** OFFSET **|                            *
     */

    block_bits = (uint32_t) log2(block_size);
    set_offset = block_bits;
    tag_offset = ((uint32_t) log2(sets)) + set_offset;

    set_mask = sets - 1;

    for(uint32_t i = 0; i < sets; i++)
        entry_set.push_back(new cache_set(associativity, seed));

    memset(statistics, 0, sizeof(uint64_t[NUMBER_CACHE_EVENTS]));
}

cache_sim::~cache_sim()
{
    for(uint32_t i = 0; i < entry_set.size(); i++)    
        delete entry_set[i];

    char* file = (char*) malloc(sizeof(char)*1024);
    sprintf(file, "cache_%d_%d_%d.csv", cache_size, block_size, associativity);
    
    FILE* file_p = fopen(file, "a+");

    if(!file_p)
    {
        ERROR_("Couldn't open '%s'. ", file)
        ERROR("Unable to store the cache's perfomance.\n")
        return;
    }

    fprintf(file_p, "%d,%ld\n", CACHE_HIT, statistics[CACHE_HIT]);
    fprintf(file_p, "%d,%ld\n", CACHE_MISS_LOAD, statistics[CACHE_MISS_LOAD]);
    fprintf(file_p, "%d,%ld\n", CACHE_MISS_REPLACE, statistics[CACHE_MISS_REPLACE]);

    free(file);
    fclose(file_p);
}

inline uint32_t cache_sim::get_cache_size() const
{ 
    return cache_size; 
}

inline uint32_t cache_sim::get_cache_sets() const
{
    return sets;
}

inline uint32_t cache_sim::get_cache_set_bits() const
{
    return (uint32_t) log2(sets);
}

inline uint32_t cache_sim::get_cache_set_offset() const
{
    return set_offset;
}

inline uint32_t cache_sim::get_cache_tag_offset() const
{
    return tag_offset;
}

inline uint32_t cache_sim::get_cache_block_bits() const
{
    return block_bits;
}

inline uint32_t cache_sim::get_cache_block_size() const
{ 
    return block_size; 
}

inline uint32_t cache_sim::get_cache_associativity() const
{ 
    return associativity; 
}

inline uint32_t cache_sim::pow2(const uint32_t n)
{ 
    uint32_t res = 1;
    for(uint32_t i = 0; i < n; i++)
        res *= 2;
    return res; 
}

std::ostream& operator<<(std::ostream& out, cache_sim& object)
{
    out << "+------ CACHE ISTANCE ------+" << std::endl;
    out << "  SIZE: " << object.get_cache_size() << std::endl;
    out << "  LINE SIZE: " << object.get_cache_block_size() << std::endl;
    out << "  ASSOCIATIVITY: " << object.get_cache_associativity() << std::endl;
    out << "  NUMBER OF CACHE ENTRY: " << object.get_cache_sets() << std::endl;
    out << "  ADDRESS: " << std::endl;
    out << "\tOFFSET:["  << (object.get_cache_block_bits() - 1) << ":0]" << std::endl;
    out << "\tINDEX: ["  << (object.get_cache_set_bits() + object.get_cache_block_bits() - 1) << ":" << object.get_cache_block_bits() << "]" << std::endl;
    out << "\tTAG:   [63:" << (object.get_cache_set_bits() + object.get_cache_block_bits()) << "]" << std::endl;
    out << "+---------------------------+" << std::endl;
    return out;
}

uint32_t cache_sim::get_set(const uint64_t address) {
  auto shifted_address = address >> set_offset;
  return shifted_address & set_mask;
}

uint64_t cache_sim::get_tag(const uint64_t address) {
  return address >> tag_offset;
}

inline void cache_sim::record_event(event _event_)
{
    statistics[_event_]++;
}

event cache_sim::get_line(const uint64_t address)
{
    uint32_t set = get_set(address);
    uint64_t tag = get_tag(address);

    event _event_ = entry_set[set]->check_event(tag);

    #ifdef DEBUG
    std::cout << "[DEBUG] cache_sim::get_line(" << address << ") - (tag= " << tag << ", set: " << set << ") => EVENT: " << ((_event_ == CACHE_HIT) ? "CACHE HIT" : ((_event_ == CACHE_MISS_LOAD) ? "CACHE MISS AND LOAD" : "CACHE MISS AND REPLACE")) << std::endl;
    #endif

    record_event(_event_);

    if(_event_ != CACHE_HIT) entry_set[set]->load_block(tag);

    return _event_;
} 