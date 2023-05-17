```console
$ perf stat -r 30 -e cycles,instructions,stalled-cycles-frontend,stalled-cycles-backend,branches,branch-misses,
L1-dcache-loads,L1-dcache-load-misses,L1-icache-loads,L1-icache-load-misses,l2_cache_accesses_from_dc_misses,
l2_cache_hits_from_dc_misses,l2_cache_misses_from_dc_misses,l2_cache_accesses_from_ic_misses,l2_cache_hits_from_ic_misses,
l2_cache_misses_from_ic_miss ./conv input.txt kernel.txt 0 2 > /dev/null

 Performance counter stats for './conv input.txt kernel.txt 0 2' (30 runs):

     7.565.836.564      cycles                                                         ( +-  0,38% )  (31,01%)
    20.491.019.396      instructions              #    2,79  insn per cycle         
                                                  #    0,15  stalled cycles per insn   ( +-  0,30% )  (31,10%)
        62.142.972      stalled-cycles-frontend   #    0,85% frontend cycles idle      ( +-  1,90% )  (31,17%)
     2.935.964.032      stalled-cycles-backend    #   40,04% backend cycles idle       ( +-  0,37% )  (31,91%)
     2.903.200.940      branches                                                       ( +-  0,33% )  (32,00%)
         8.079.019      branch-misses             #    0,28% of all branches           ( +-  1,22% )  (31,83%)
     8.945.274.626      L1-dcache-loads                                                ( +-  0,28% )  (32,24%)
        10.447.257      L1-dcache-load-misses     #    0,11% of all L1-dcache accesses ( +-  5,29% )  (32,13%)
     1.591.582.041      L1-icache-loads                                                ( +-  0,39% )  (32,17%)
         5.225.798      L1-icache-load-misses     #    0,32% of all L1-icache accesses ( +-  1,24% )  (32,05%)
        10.680.095      l2_cache_accesses_from_dc_misses                               ( +-  5,25% )  (31,92%)
         8.253.408      l2_cache_hits_from_dc_misses                                   ( +-  6,87% )  (31,78%)
           810.845      l2_cache_misses_from_dc_misses                                 ( +-  2,53% )  (31,67%)
        11.815.769      l2_cache_accesses_from_ic_misses                               ( +-  1,37% )  (31,35%)
        11.229.018      l2_cache_hits_from_ic_misses                                   ( +-  1,24% )  (30,92%)
           708.262      l2_cache_misses_from_ic_miss                                   ( +-  4,01% )  (30,90%)

           1,68290 +- 0,00745 seconds time elapsed  ( +-  0,44% )

```