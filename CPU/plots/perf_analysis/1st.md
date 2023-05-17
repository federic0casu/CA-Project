```console
$ perf stat -r 30 -e cycles,instructions,stalled-cycles-frontend,stalled-cycles-backend,branches,branch-misses,
L1-dcache-loads,L1-dcache-load-misses,L1-icache-loads,L1-icache-load-misses,l2_cache_accesses_from_dc_misses,
l2_cache_hits_from_dc_misses,l2_cache_misses_from_dc_misses,l2_cache_accesses_from_ic_misses,l2_cache_hits_from_ic_misses,
l2_cache_misses_from_ic_miss ./conv input.txt kernel.txt 0 2 > /dev/null

 Performance counter stats for './conv input.txt kernel.txt 0 2' (30 runs):

     7.477.369.384      cycles                                                           ( +-  0,71% )  (31,27%)
    20.251.792.470      instructions              #    2,69  insn per cycle         
                                                  #    0,15  stalled cycles per insn     ( +-  0,15% )  (31,32%)
        65.703.979      stalled-cycles-frontend   #    0,87% frontend cycles idle        ( +-  3,69% )  (31,31%)
     2.997.194.703      stalled-cycles-backend    #   39,74% backend cycles idle         ( +-  0,41% )  (31,30%)
     3.044.509.847      branches                                                         ( +-  0,17% )  (31,24%)
         8.434.134      branch-misses             #    0,28% of all branches             ( +- 11,54% )  (31,28%)
     9.317.539.265      L1-dcache-loads                                                  ( +-  0,20% )  (31,43%)
        12.229.139      L1-dcache-load-misses     #    0,13% of all L1-dcache accesses   ( +-  1,07% )  (31,98%)
     1.582.482.536      L1-icache-loads                                                  ( +-  2,23% )  (32,14%)
         6.777.582      L1-icache-load-misses     #    0,41% of all L1-icache accesses   ( +-  1,15% )  (32,14%)
        12.566.661      l2_cache_accesses_from_dc_misses                                 ( +-  1,07% )  (31,98%)
         9.049.010      l2_cache_hits_from_dc_misses                                     ( +-  1,15% )  (31,67%)
         1.430.802      l2_cache_misses_from_dc_misses                                   ( +-  2,69% )  (31,35%)
        16.323.547      l2_cache_accesses_from_ic_misses                                 ( +-  1,35% )  (31,09%)
        14.840.462      l2_cache_hits_from_ic_misses                                     ( +-  1,20% )  (31,36%)
         1.252.067      l2_cache_misses_from_ic_miss                                     ( +-  4,26% )  (31,29%)

            2,5950 +- 0,0226 seconds time elapsed  ( +-  0,87% )

$ perf record -e cycles,instructions,stalled-cycles-frontend,stalled-cycles-backend,branches,branch-misses,
L1-dcache-loads,L1-dcache-load-misses,L1-icache-loads,L1-icache-load-misses,l2_cache_accesses_from_dc_misses,
l2_cache_hits_from_dc_misses,l2_cache_misses_from_dc_misses,l2_cache_accesses_from_ic_misses,l2_cache_hits_from_ic_misses,
l2_cache_misses_from_ic_miss ./conv input.txt kernel.txt 0 2 > /dev/null
$ perf report
```