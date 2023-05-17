```console
$ perf stat -r 30 -e cycles,instructions,stalled-cycles-frontend,stalled-cycles-backend,branches,branch-misses,
L1-dcache-loads,L1-dcache-load-misses,L1-icache-loads,L1-icache-load-misses,l2_cache_accesses_from_dc_misses,
l2_cache_hits_from_dc_misses,l2_cache_misses_from_dc_misses,l2_cache_accesses_from_ic_misses,l2_cache_hits_from_ic_misses,
l2_cache_misses_from_ic_miss ./conv input.txt kernel.txt 0 2 > /dev/null

 Performance counter stats for './conv input.txt kernel.txt 0 2' (30 runs):

     5.622.989.368      cycles                                                         ( +-  0,30% )  (32,43%)
    16.029.031.830      instructions              #    2,84  insn per cycle         
                                                  #    0,12  stalled cycles per insn   ( +-  0,27% )  (31,90%)
        17.777.012      stalled-cycles-frontend   #    0,31% frontend cycles idle      ( +-  7,55% )  (31,44%)
     1.980.078.810      stalled-cycles-backend    #   35,06% backend cycles idle       ( +-  0,70% )  (31,20%)
     2.742.328.767      branches                                                       ( +-  0,29% )  (30,94%)
         8.063.586      branch-misses             #    0,30% of all branches           ( +-  1,57% )  (30,70%)
     6.624.081.289      L1-dcache-loads                                                ( +-  0,46% )  (32,17%)
        10.989.587      L1-dcache-load-misses     #    0,16% of all L1-dcache accesses ( +-  1,46% )  (32,00%)
     1.558.343.360      L1-icache-loads                                                ( +-  0,41% )  (31,86%)
         4.208.767      L1-icache-load-misses     #    0,27% of all L1-icache accesses ( +-  0,71% )  (31,72%)
        11.997.496      l2_cache_accesses_from_dc_misses                               ( +-  1,18% )  (31,56%)
         9.998.354      l2_cache_hits_from_dc_misses                                   ( +-  1,22% )  (31,51%)
           804.840      l2_cache_misses_from_dc_misses                                 ( +-  3,21% )  (31,86%)
         9.706.744      l2_cache_accesses_from_ic_misses                               ( +-  1,00% )  (32,16%)
         8.980.898      l2_cache_hits_from_ic_misses                                   ( +-  0,96% )  (32,22%)
           665.200      l2_cache_misses_from_ic_miss                                   ( +-  1,81% )  (32,30%)

           1,44461 +- 0,00652 seconds time elapsed  ( +-  0,45% )

```
