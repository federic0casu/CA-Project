# How to do a performance analisys with perf


## 1 - Install `perf`

```console
$ sudo apt-get install linux-tools-common linux-tools-generic linux-tools-`uname -r`
```
Getting started with `perf` is straightforward (you should be able to see what follows):

```console
$ perf

 usage: perf [--version] [--help] [OPTIONS] COMMAND [ARGS]

 The most commonly used perf commands are:
   annotate        Read perf.data (created by perf record) and display annotated code
   archive         Create archive with object files with build-ids found in perf.data file
   bench           General framework for benchmark suites
   buildid-cache   Manage build-id cache.
   buildid-list    List the buildids in a perf.data file
   c2c             Shared Data C2C/HITM Analyzer.
   config          Get and set variables in a configuration file.
   daemon          Run record sessions on background
   data            Data file related processing
   diff            Read perf.data files and display the differential profile
   evlist          List the event names in a perf.data file
   ftrace          simple wrapper for kernel's ftrace functionality
   inject          Filter to augment the events stream with additional information
   iostat          Show I/O performance metrics
   kallsyms        Searches running kernel for symbols
   kmem            Tool to trace/measure kernel memory properties
   kvm             Tool to trace/measure kvm guest os
   list            List all symbolic event types
   lock            Analyze lock events
   mem             Profile memory accesses
   record          Run a command and record its profile into perf.data
   report          Read perf.data (created by perf record) and display the profile
   sched           Tool to trace/measure scheduler properties (latencies)
   script          Read perf.data (created by perf record) and display trace output
   stat            Run a command and gather performance counter statistics
   test            Runs sanity tests.
   timechart       Tool to visualize total system behavior during a workload
   top             System profiling tool.
   version         display the version of perf binary
   probe           Define new dynamic tracepoints
   trace           strace inspired tool

 See 'perf help COMMAND' for more information on a specific command.
```

## 2 - How to use `perf`

The `perf` tool supports a list of measurable events that you can view with `perf list` command. The tool and underlying kernel interface can measure events coming from different sources. For instance, some events are pure kernel counters, in this case, they are called software events. Examples include context-switches, minor-faults, page-faults and others.

Another source of events is the processor itself and its Performance Monitoring Unit (PMU). It provides a list of events to measure micro-architectural events such as the number of cycles, instructions retired, L1 cache misses and so on. Those events are called “PMU hardware events” or “hardware events” for short. They vary with each processor type and model.

To see the list of hardware events (if the list is empty you should run the command with root privileges):

```console
$ perf list hw

List of pre-defined events (to be used in -e):

  branch-instructions OR branches                    [Hardware event]
  branch-misses                                      [Hardware event]
  cache-misses                                       [Hardware event]
  cache-references                                   [Hardware event]
  cpu-cycles OR cycles                               [Hardware event]
  instructions                                       [Hardware event]
  stalled-cycles-backend OR idle-cycles-backend      [Hardware event]
  stalled-cycles-frontend OR idle-cycles-frontend    [Hardware event]
```

To see the list of software events:

```console
$ perf list hw

List of pre-defined events (to be used in -e):

  alignment-faults                                   [Software event]
  bpf-output                                         [Software event]
  cgroup-switches                                    [Software event]
  context-switches OR cs                             [Software event]
  cpu-clock                                          [Software event]
  cpu-migrations OR migrations                       [Software event]
  dummy                                              [Software event]
  emulation-faults                                   [Software event]
  major-faults                                       [Software event]
  minor-faults                                       [Software event]
  page-faults OR faults                              [Software event]
  task-clock                                         [Software event]

  duration_time                                      [Tool event]
  user_time                                          [Tool event]
  system_time                                        [Tool event]
```

Now we can start to do some analisys: `perf stat`

```console
$ perf stat -r 10 ls -la > /dev/null

 Performance counter stats for 'ls -la' (10 runs):

              1,52 msec task-clock                #    0,552 CPUs utilized            ( +- 10,03% )
                 0      context-switches          #    0,000 /sec                   
                 0      cpu-migrations            #    0,000 /sec                   
               115      page-faults               #   57,560 K/sec                    ( +-  0,22% )
         3.623.911      cycles                    #    1,814 GHz                      ( +-  1,71% )
           298.384      stalled-cycles-frontend   #    8,56% frontend cycles idle     ( +-  4,90% )
           428.097      stalled-cycles-backend    #   12,28% backend cycles idle      ( +-  4,63% )
         3.422.327      instructions              #    0,98  insn per cycle         
                                                  #    0,13  stalled cycles per insn  ( +-  0,07% )
           700.873      branches                  #  350,805 M/sec                    ( +-  0,06% )
     <not counted>      branch-misses                                                 (0,00%)

          0,002750 +- 0,000213 seconds time elapsed  ( +-  7,76% )
```

What did we just do? We have recorded statistics about events (such as page-faults, stalled-cycles, branch-misses, ...) regarding `ls -la`. Ok, that's great. But if we are interested in some others events (cache-references, cache-misses, ...)? 

```console
$ perf stat -r 10 -e cache-references,cache-misses ls -la > /dev/null

 Performance counter stats for 'ls -la' (10 runs):

           291.222      cache-references                                              ( +-  0,84% )
            55.840      cache-misses              #   19,806 % of all cache refs      ( +-  2,42% )

          0,003197 +- 0,000249 seconds time elapsed  ( +-  7,80% )
```

Once again: ok, that's great, but we need to do perfomance analisys on our program! No problem folks:

```console
$ sudo perf stat -r 30 -e cache-references,cache-misses ./conv img.txt ker.txt 0 2

 Performance counter stats for './conv img.txt ker.txt 0 2' (30 runs):

        28.383.742      cache-references                                              ( +- 12,49% )
         1.768.478      cache-misses              #    5,554 % of all cache refs      ( +-  1,27% )

           2,37044 +- 0,00781 seconds time elapsed  ( +-  0,33% )
```

## How to improve perfomance with `perf`

The answer is perf record:

```console
$ sudo perf record -e cache-references,cache-misses -r 10 ./conv img.txt ker.txt 0 2
[ perf record: Woken up 2 times to write data ]
[ perf record: Captured and wrote 0,560 MB perf.data (11720 samples) ]
```

To see the statistics recorded by perf for us we need to run perf report:

```console
$ sudo perf report -v
```

Output:

```console
Available samples
10K cache-references
1K cache-misses
```

`perf report` allows us to choose which event (either hardware or software) we want to analyze. The events are those recorded by `perf record` during its execution. 

**cache references**:

```console
Samples: 10K of event 'cache-references', Event count (approx.): 36665484
Overhead  Command  Shared Object                                        Symbol
  23,02%  conv     /home/federico/Documents/CA-Project/simulation/conv  0x1c1f             B [.] convolute(void*)
  15,43%  conv     /proc/kcore                                          0xffffffff99586aa7 k [k] clear_page_rep
   7,22%  conv     /proc/kcore                                          0xffffffff995871ec k [k] copy_user_generic_string
   3,66%  conv     /usr/lib/x86_64-linux-gnu/libc.so.6                  0x62aae            D [.] _IO_file_seekoff@@GLIBC_2.2.5
   3,34%  conv     /usr/lib/x86_64-linux-gnu/libc.so.6                  0x477e1            D [.] __vfwscanf_internal
   2,81%  conv     /proc/kcore                                          0xffffffff990f0ec2 k [k] filemap_get_read_batch
   2,44%  conv     /usr/lib/x86_64-linux-gnu/libc.so.6                  0x671cb            D [.] _IO_remove_marker
   1,87%  conv     /usr/lib/x86_64-linux-gnu/libc.so.6                  0x63059            D [.] _IO_file_xsgetn_mmap
   1,82%  conv     /usr/lib/x86_64-linux-gnu/libc.so.6                  0x64140            D [.] _IO_file_open
   1,53%  conv     /proc/kcore                                          0xffffffff98f8812c k [k] exit_to_user_mode_prepare
   1,29%  conv     /proc/kcore                                          0xffffffff9913e343 k [k] do_anonymous_page
   1,09%  conv     /proc/kcore                                          0xffffffff991453d9 k [k] __handle_mm_fault
   1,05%  conv     /proc/kcore                                          0xffffffff9916b2ae k [k] rmqueue_pcplist.constprop.0
   1,00%  conv     /proc/kcore                                          0xffffffff9916d682 k [k] get_page_from_freelist
   0,93%  conv     /home/federico/Documents/CA-Project/simulation/conv  0x2941             B [.] read_file(char*, char*, int, int, int, int, int*, int*)
   0,84%  conv     /usr/lib/x86_64-linux-gnu/libc.so.6                  0x64017            D [.] _IO_file_close_it@@GLIBC_2.2.5
   0,79%  conv     /proc/kcore                                          0xffffffff98f7605f k [k] __rcu_read_lock
   0,76%  conv     /usr/lib/x86_64-linux-gnu/libc.so.6                  0x8e890            D [.] __GI___strcasecmp_l_sse2
   0,76%  conv     /proc/kcore                                          0xffffffff991cf4b6 k [k] __mod_lruvec_page_state
   0,69%  conv     /proc/kcore                                          0xffffffff99583f82 k [k] xas_load
   0,69%  conv     /proc/kcore                                          0xffffffff991ccec1 k [k] get_mem_cgroup_from_mm
```

**cache misses**:  

```console
Samples: 1K of event 'cache-misses', Event count (approx.): 2213404
Overhead  Command  Shared Object                                        Symbol
  19,21%  conv     /proc/kcore                                          0xffffffff99586aa7 k [k] clear_page_rep
   6,96%  conv     /proc/kcore                                          0xffffffff995871ec k [k] copy_user_generic_string
   5,10%  conv     /home/federico/Documents/CA-Project/simulation/conv  0x1c64             B [.] convolute(void*)
   3,24%  conv     /proc/kcore                                          0xffffffff99167d83 k [k] __free_one_page
   2,16%  conv     /proc/kcore                                          0xffffffff9916acaa k [k] rmqueue_bulk
   2,05%  conv     /proc/kcore                                          0xffffffff98e9f5ba k [k] native_read_msr
   1,74%  conv     /proc/kcore                                          0xffffffff9916f675 k [k] __folio_alloc
   1,73%  conv     /usr/lib/x86_64-linux-gnu/libc.so.6                  0x63071            D [.] _IO_file_xsgetn_mmap
   1,43%  conv     /proc/kcore                                          0xffffffff990f0ec2 k [k] filemap_get_read_batch
   1,29%  conv     /proc/kcore                                          0xffffffff98e9f7a6 k [k] native_write_msr
   1,25%  conv     /proc/kcore                                          0xffffffff991452d4 k [k] __handle_mm_fault
   1,23%  conv     /usr/lib/x86_64-linux-gnu/libc.so.6                  0x62ad2            D [.] _IO_file_seekoff@@GLIBC_2.2.5
   1,16%  conv     /proc/kcore                                          0xffffffff98f34ad7 k [k] __update_load_avg_se
   1,09%  conv     /proc/kcore                                          0xffffffff9916d6a7 k [k] get_page_from_freelist
   0,96%  conv     /proc/kcore                                          0xffffffff9916b2fd k [k] rmqueue_pcplist.constprop.0
   0,94%  conv     /usr/lib/x86_64-linux-gnu/libc.so.6                  0x671cb            D [.] _IO_remove_marker
   0,88%  conv     /proc/kcore                                          0xffffffff99d25057 k [k] _raw_spin_lock
   0,83%  conv     /proc/kcore                                          0xffffffff991aa045 k [k] kmem_cache_alloc
   0,78%  conv     /proc/kcore                                          0xffffffff9913f3fd k [k] zap_pte_range
   0,78%  conv     /proc/kcore                                          0xffffffff991431a5 k [k] handle_pte_fault
```

`perf report` ranks functions based on the number of collected samples of the event under analysis (the higher the number of samples the higher the function is ranked). It is possible to customize the sorting order and therefore to view the data differently. The column 'Overhead' indicates the percentage of the overall samples collected in the corresponding function. The second column reports the process from which the samples were collected. The third column shows the name of the ELF image where the samples came from. If a program is dynamically linked, then this may show the name of a shared library. The fourth column indicates the privilege level at which the sample was taken, i.e. when the program was running when it was interrupted:
- \[.\]: user lever
- \[k\]: kernel
- \[g\]: guest kernel level (virtualization)
- \[u\]: guest os user space
- \[H\]: hypervisor

The final column shows the symbol name.

By going up and down with arrow keys and then pressing Enter (or 'a'), we can select the function we want to analyze. Example: we want to understand why the function `convolute(void*)` is responsible for the 23,02% of the total cache references samples (so `convolute(void*)` is likely to be the **hottest function** of our program with respect to cache references:

```console
Samples: 10K of event 'cache-references', 4000 Hz, Event count (approx.): 36665484
convolute(void*)  /home/federico/Documents/CA-Project/simulation/conv [Percent: local period]
  0,03 │1be0:   add     %edx,%eax
  0,49 │1be2:   imul    -0x28(%rbp),%eax
  0,25 │1be6:   mov     -0x40(%rbp),%ecx
  8,32 │1be9:   mov     -0x38(%rbp),%edx
  0,76 │1bec:   add     %ecx,%edx
  0,11 │1bee:   add     %edx,%eax
  0,40 │1bf0:   cltq
  0,56 │1bf2:   lea     0x0(,%rax,4),%rdx
  1,70 │1bfa:   mov     -0x8(%rbp),%rax
  0,18 │1bfe:   add     %rdx,%rax
  1,27 │1c01:   mov     (%rax),%edx
 38,67 │1c03:   mov     -0x3c(%rbp),%eax
  0,04 │1c06:   imul    -0x24(%rbp),%eax
  0,08 │1c0a:   mov     %eax,%ecx
       │1c0c:   mov     -0x38(%rbp),%eax
       │1c0f:   add     %ecx,%eax
       │1c11:   cltq
  0,04 │1c13:   lea     0x0(,%rax,4),%rcx
       │1c1b:   mov     -0x10(%rbp),%rax
 10,79 │1c1f:   add     %rcx,%rax
  0,03 │1c22:   mov     (%rax),%eax
```

Each instruction have its relative percentage of samples reported (first column). 

We can find the **hottest instruction** by pressing 'H'. Also, we can cycle through the hottest instructions by pressing TAB. In `convolute(void*)` the hottest instructions are the following:

```assembly
38.67 |1c03:   mov     -0x3c(%rbp),%eax

18.56 |1c2a:   addl    $0x1,-0x38(%rbp)

10,79 |1c1f:   add     %rcx,%rax

 8,32 │1be9:   mov     -0x38(%rbp),%edx

 5,49 |1c27:   add      %eax,-48(%rbp)

 4,25 |1c24:   imul     %edx,%eax
```

it's time to inspect what 'convolute(void*)' is actually doing:

```console
$ objdump -d conv

...

0000000000001b41 <_Z9convolutePv>:
    1b41:	f3 0f 1e fa          	endbr64 
    1b45:	55                   	push   %rbp
    1b46:	48 89 e5             	mov    %rsp,%rbp
    1b49:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
    1b4d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    1b51:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1b55:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1b59:	48 8b 00             	mov    (%rax),%rax
    1b5c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1b60:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1b64:	48 8b 40 10          	mov    0x10(%rax),%rax
    1b68:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    1b6c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1b70:	48 8b 40 08          	mov    0x8(%rax),%rax
    1b74:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1b78:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1b7c:	8b 40 18             	mov    0x18(%rax),%eax
    1b7f:	89 45 cc             	mov    %eax,-0x34(%rbp)
    1b82:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1b86:	8b 40 1c             	mov    0x1c(%rax),%eax
    1b89:	89 45 d0             	mov    %eax,-0x30(%rbp)
    1b8c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1b90:	8b 40 20             	mov    0x20(%rax),%eax
    1b93:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    1b96:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1b9a:	8b 40 24             	mov    0x24(%rax),%eax
    1b9d:	89 45 d8             	mov    %eax,-0x28(%rbp)
    1ba0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1ba4:	8b 40 28             	mov    0x28(%rax),%eax
    1ba7:	89 45 dc             	mov    %eax,-0x24(%rbp)
    1baa:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%rbp)
    1bb1:	8b 45 cc             	mov    -0x34(%rbp),%eax
    1bb4:	89 45 bc             	mov    %eax,-0x44(%rbp)
    1bb7:	e9 c5 00 00 00       	jmp    1c81 <_Z9convolutePv+0x140>
    1bbc:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%rbp)
    1bc3:	e9 a9 00 00 00       	jmp    1c71 <_Z9convolutePv+0x130>
    1bc8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%rbp)
    1bcf:	eb 69                	jmp    1c3a <_Z9convolutePv+0xf9>
    1bd1:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%rbp)
    1bd8:	eb 54                	jmp    1c2e <_Z9convolutePv+0xed>
    1bda:	8b 55 bc             	mov    -0x44(%rbp),%edx
    1bdd:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    1be0:	01 d0                	add    %edx,%eax
    1be2:	0f af 45 d8          	imul   -0x28(%rbp),%eax
    1be6:	8b 4d c0             	mov    -0x40(%rbp),%ecx
    1be9:	8b 55 c8             	mov    -0x38(%rbp),%edx         # <-- 4th hottest instruction ( 8,32%)
    1bec:	01 ca                	add    %ecx,%edx
    1bee:	01 d0                	add    %edx,%eax
    1bf0:	48 98                	cltq   
    1bf2:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1bf9:	00 
    1bfa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1bfe:	48 01 d0             	add    %rdx,%rax
    1c01:	8b 10                	mov    (%rax),%edx
    1c03:	8b 45 c4             	mov    -0x3c(%rbp),%eax         # <-- 1st hottest instruction (38,67%)
    1c06:	0f af 45 dc          	imul   -0x24(%rbp),%eax
    1c0a:	89 c1                	mov    %eax,%ecx
    1c0c:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1c0f:	01 c8                	add    %ecx,%eax
    1c11:	48 98                	cltq   
    1c13:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
    1c1a:	00 
    1c1b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1c1f:	48 01 c8             	add    %rcx,%rax                # <-- 3rd hottest instruction (10,79%)
    1c22:	8b 00                	mov    (%rax),%eax
    1c24:	0f af c2             	imul   %edx,%eax                # <-- 6th hottest instruction ( 4,25%)
    1c27:	01 45 b8             	add    %eax,-0x48(%rbp)         # <-- 5th hottest instruction ( 5,49%)
    1c2a:	83 45 c8 01          	addl   $0x1,-0x38(%rbp)         # <-- 2nd hottest instruction (18,56%)
    1c2e:	8b 45 c8             	mov    -0x38(%rbp),%eax
    1c31:	3b 45 dc             	cmp    -0x24(%rbp),%eax
    1c34:	7c a4                	jl     1bda <_Z9convolutePv+0x99>
    1c36:	83 45 c4 01          	addl   $0x1,-0x3c(%rbp)
    1c3a:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    1c3d:	3b 45 dc             	cmp    -0x24(%rbp),%eax
    1c40:	7c 8f                	jl     1bd1 <_Z9convolutePv+0x90>
    1c42:	8b 45 bc             	mov    -0x44(%rbp),%eax
    1c45:	0f af 45 d4          	imul   -0x2c(%rbp),%eax
    1c49:	89 c2                	mov    %eax,%edx
    1c4b:	8b 45 c0             	mov    -0x40(%rbp),%eax
    1c4e:	01 d0                	add    %edx,%eax
    1c50:	48 98                	cltq   
    1c52:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1c59:	00 
    1c5a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1c5e:	48 01 c2             	add    %rax,%rdx
    1c61:	8b 45 b8             	mov    -0x48(%rbp),%eax
    1c64:	89 02                	mov    %eax,(%rdx)
    1c66:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%rbp)
    1c6d:	83 45 c0 01          	addl   $0x1,-0x40(%rbp)
    1c71:	8b 45 c0             	mov    -0x40(%rbp),%eax
    1c74:	3b 45 d4             	cmp    -0x2c(%rbp),%eax
    1c77:	0f 8c 4b ff ff ff    	jl     1bc8 <_Z9convolutePv+0x87>
    1c7d:	83 45 bc 01          	addl   $0x1,-0x44(%rbp)
    1c81:	8b 45 bc             	mov    -0x44(%rbp),%eax
    1c84:	3b 45 d0             	cmp    -0x30(%rbp),%eax
    1c87:	0f 8c 2f ff ff ff    	jl     1bbc <_Z9convolutePv+0x7b>
    1c8d:	90                   	nop
    1c8e:	90                   	nop
    1c8f:	5d                   	pop    %rbp
    1c90:	c3                   	ret

    ...

```
Actually, at first glance, it's impossible to figure out what this assembly code is doing. After an hour I was able to figure out the meaning of each instruction. The result is the following:

```assembly
#
# struct task {			// offset
#	int *output;		// 0
#   int *input;			// +8	
# 	int *kernel;		// +16
#   int start_row;		// +24
#	int end_row;		// +28
#	int output_columns;	// +32
#   int input_rows;		// +36
#	int kernel_size;	// +40
# };
#

_Z9convolutePv:
.LFB2422:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6

	movq	%rdi, -88(%rbp)
	movq	-88(%rbp), %rax	
	movq	%rax, -32(%rbp)		# struct task *__task = (struct task *)argument; 
                                	# -32(%rbp) = __task
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)		# auto output = __task->output;
                                	# -24(%rbp) = output
	movq	-32(%rbp), %rax		
	movq	16(%rax), %rax
	movq	%rax, -16(%rbp)		# auto kernel = __task->kernel;
                                	# -16(%rbp) = kernel
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)		# auto input = __task->input;
                                	# -8(%rbp) = input
	movq	-32(%rbp), %rax
	movl	24(%rax), %eax
	movl	%eax, -52(%rbp)		# auto start = __task->start_row;
                                	# -52(%rbp) = start
	movq	-32(%rbp), %rax
	movl	28(%rax), %eax
	movl	%eax, -48(%rbp)		# auto end = __task->end_row;
                                	# -48(%rbp) = end
	movq	-32(%rbp), %rax
	movl	32(%rax), %eax
	movl	%eax, -44(%rbp)		# auto out_size_y  = __task->output_columns;
                                	# -44(%rbp) = out_size_y
	movq	-32(%rbp), %rax
	movl	36(%rax), %eax
	movl	%eax, -40(%rbp)		# auto in_size_x   = __task->input_rows;
                                	# -40(%rbp) = in_size_x
	movq	-32(%rbp), %rax
	movl	40(%rax), %eax
	movl	%eax, -36(%rbp)		# auto kernel_size = __task->kernel_size;
                                	# -36(%rbp) = kernel_size
	movl	$0, -72(%rbp)		# int convolute = 0;

	movl	-52(%rbp), %eax		# %eax = start
	movl	%eax, -68(%rbp)		# auto x = start;
	jmp	.L5
.L12:
	movl	$0, -64(%rbp)		# auto y = 0;
	jmp	.L6
.L11:
	movl	$0, -60(%rbp)		# auto kx = 0;
	jmp	.L7
.L10:
	movl	$0, -56(%rbp)		# auto ky = 0;
	jmp	.L8
.L9:
	movl	-68(%rbp), %edx		# %edx = x
	movl	-60(%rbp), %eax		# %eax = kx
	addl	%edx, %eax		# %eax = x + kx
	imull	-40(%rbp), %eax		# %eax = (x + kx) * in_size_x
	movl	-64(%rbp), %ecx		# %ecx = y
	movl	-56(%rbp), %edx		# %edx = ky
	addl	%ecx, %edx		# %edx = y + ky
	addl	%edx, %eax		# %eax = (x + kx) * in_size_x + (y +ky)
	cltq
	leaq	0(,%rax,4), %rdx	# %rdx = %rax * 4	// We can "interpret" this instruction as
					#			// the following: ((x + kx) * in_size_x + (y + ky)) * sizeof(int)	

	movq	-8(%rbp), %rax		# %rax = &input[0]  	// Since input is a pointer, this instruction 
					#               	// is effectively loading the address of the 
					#               	// 1-st element of the input image.
	
	addq	%rdx, %rax		# %rax = &input[(x + kx) * in_size_x + (y + ky)]
	movl	(%rax), %edx		# %edx = input[(x + kx) * in_size_x + (y + ky)]
	
	movl	-60(%rbp), %eax		# %eax = kx
	imull	-36(%rbp), %eax		# %eax = kx * kernel_size
	movl	%eax, %ecx		# %ecx = kx * kernel_size
	movl	-56(%rbp), %eax		# %eax = ky
	addl	%ecx, %eax		# %eax = kx * kernel_size + ky
	cltq
	leaq	0(,%rax,4), %rcx	# rcx = %rax * 4	// Same as above: (kx * kernel_size + ky) * sizeof(int)
	movq	-16(%rbp), %rax		# %rax = &kernel[0]
	addq	%rcx, %rax		# %rax = &kernel[kx * kernel_size + ky]
	movl	(%rax), %eax		# %eax = kernel[kx * kernel_size + ky]
	imull	%edx, %eax		# %eax = input[(x + kx) * in_size_x + (y + ky)] * kernel[kx * kernel_size + ky]
	addl	%eax, -72(%rbp)		# convolute += (input[(x + kx) * in_size_x + (y + ky)] * kernel[kx * kernel_size + ky]);
	addl	$1, -56(%rbp)		# ky++
.L8:
	movl	-56(%rbp), %eax		# %eax = ky
	cmpl	-36(%rbp), %eax		# ky < kernel_size
	jl	.L9
	addl	$1, -60(%rbp)		# kx++
.L7:
	movl	-60(%rbp), %eax		# %eax = kx
	cmpl	-36(%rbp), %eax		# kx < kernel_size
	jl	.L10
	movl	-68(%rbp), %eax		# %eax = x
	imull	-44(%rbp), %eax		# %eax = x * out_size_y
	movl	%eax, %edx		# %edx = x * out_size_y
	movl	-64(%rbp), %eax		# %eax = y
	addl	%edx, %eax		# %eax = x * out_size_y + y
	cltq
	leaq	0(,%rax,4), %rdx	# %rdx = (x * out_size_y + y) * sizeof(int)
	movq	-24(%rbp), %rax		# %rax = &output[0]
	addq	%rax, %rdx		# %rdx = &output[0] + (x * out_size_y + y) * sizeof(int)
	movl	-72(%rbp), %eax		# %eax = convolute
	movl	%eax, (%rdx)		# output[x * out_size_y + y] = convolute;
	movl	$0, -72(%rbp)		# convolute = 0;
	addl	$1, -64(%rbp)		# y++
.L6:
	movl	-64(%rbp), %eax		# %eax = y
	cmpl	-44(%rbp), %eax		# y < out_size_y
	jl	.L11
	addl	$1, -68(%rbp)		# x++
.L5:
	movl	-68(%rbp), %eax		# %eax = x
	cmpl	-48(%rbp), %eax     	# x < end
	jl	.L12
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
```

### Optimizations:
__task will not be used before the inizialization of variables:
  - output, input, kernel
  - start, end
  - out_size_y, in_size_x, kernel_size

Also, we can use registers to hold variables (instead of allocating stack memory):
  - %ebx = convolute     
  - %r12 = x
  - %r13 = y
  - %r14 = kx
  - %r15 = ky

```assembly
# convolute_opt.s

.global _Z13convolute_optPv:

_Z13convolute_optPv:                # void* convolute_opt(void*)
.LFB2422:
        .cfi_startproc
        endbr64
        pushq	%rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        movq	%rsp, %rbp
        subq    $0x80, %rsp         # Stack must be aligned at 16 bytes
        .cfi_def_cfa_register 6
        movq	(%rdi), %rax
        movq	%rax, -24(%rbp)     # -24(%rbp) = &output[0]
        movq	16(%rdi), %rax
        movq	%rax, -16(%rbp)     # -16(%rbp) = &kernel[0]
        movq	8(%rdi), %rax
        movq	%rax, -8(%rbp)      # -8(%rbp) = &input[0]
        movl	24(%rdi), %eax
        movl	%eax, -52(%rbp)     # -52(%rbp) = start
        movl	28(%rdi), %eax
        movl	%eax, -48(%rbp)     # -48(%rbp) = end
        movl	32(%rdi), %eax
        movl	%eax, -44(%rbp)     # -44(%rbp) = out_size_y 
        movl	36(%rdi), %eax
        movl	%eax, -40(%rbp)     # -40(%rbp) = in_size_x    
        movl	40(%rdi), %eax
        movl	%eax, -36(%rbp)     # -36(%rbp) = kernel_size
        push    %rbx                # Saving %rbx (%rbx is a callee-saved register)
        push    %r12                # Saving %r12 (%r12 is a callee-saved register)
        push    %r13                # Saving %r13 (%r13 is a callee-saved register)
        push    %r14                # Saving %r14 (%r14 is a callee-saved register)
        push    %r15                # Saving %r15 (%r15 is a callee-saved register)
        xor 	%rbx, %rbx          # %rbx = convolute = 0
        movl	-52(%rbp), %eax	    # %eax = start
        cltq                        
	movq	%rax, %r12          # %r12 = x = start
	jmp	.L5
.L12:    
        xor     %r13, %r13          # %r13 = y = 0
        jmp .L6
.L11:
        xor     %r14, %r14          # %r14 = kx = 0
        jmp	.L7
.L10:
	xor     %r15, %r15          # %r15 = ky = 0
        jmp .L8
.L9:
        movq    %r12, %rcx          # %rcx = x 
	add     %r14, %rcx          # %rcx = x + kx
        movl    -40(%rbp), %eax     # %eax = in_size_x
        cltq
        imul	%rcx, %rax	    # %rax = (x + kx) * in_size_x
	movq	%r13, %rcx	    # %rcx = y
        movq	%r15, %rdx          # %rdx = ky
        addq	%rcx, %rdx	    # %rdx = y + ky
        addq	%rdx, %rax          # %rax = (x + kx) * in_size_x + (y + ky)
        leaq	0(,%rax,4), %rdx    # %rdx = %rax * 4
	movq	-8(%rbp), %rax	    # %rax = &input[0]
        addq	%rdx, %rax          # %rax = &input[(x + kx) * in_size_x + (y + ky)]
	movl	(%rax), %edx	    # %edx = input[(x + kx) * in_size_x + (y + ky)]
	movq	%r14, %rcx	    # %rcx = kx
        movl    -36(%rbp), %eax     # %eax = kernel_size
        cltq
	imul	%rcx, %rax          # %rax = kx * kernel_size
	movq	%rax, %rcx	    # %rcx = kx * kernel_size
	movq	%r15, %rax  	    # %rax = ky
	addq	%rcx, %rax	    # %rax = kx * kernel_size + ky
	leaq	0(,%rax,4), %rcx    # rcx = %rax * 4
	movq	-16(%rbp), %rax	    # %rax = &kernel[0]
	addq	%rcx, %rax	    # %rax = &kernel[kx * kernel_size + ky]
	movl	(%rax), %eax	    # %eax = kernel[kx * kernel_size + ky]
        imull	%edx, %eax          # %eax = input[(x + kx) * in_size_x + (y + ky)] * kernel[kx * kernel_size + ky]
	addl	%eax, %ebx          # %ebx += %eax (convolute += %eax)
	addq    $1, %r15            # ky++
.L8:
        movl    -36(%rbp), %eax
        cltq
	cmpq	%rax, %r15  	    # ky < kernel_size
	jl	.L9 
        addq	$1, %r14    	    # kx++
.L7:
        movl    -36(%rbp), %eax
        cltq
	cmpq	%rax, %r14	    # kx < kernel_size
        jl	.L10
        movq	%r12, %rax  	    # %rax = x
        movslq  -44(%rbp), %rcx     # %rcx out_size_y
	imulq	%rcx, %rax	    # %rax = x * out_size_y
        movq	%rax, %rdx	    # %rdx = x * out_size_y
	movq	%r13, %rax  	    # %rax = y
        addq	%rdx, %rax	    # %rax = x * out_size_y + y	
        leaq	0(,%rax,4), %rdx    # %rdx = %rax * 4
	movq	-24(%rbp), %rax	    # %rax = &output[0]
        addq	%rax, %rdx	    # %rdx = &output[x * out_size_y + y]
	movl	%ebx, (%rdx)	    # output[x * out_size_y + y] = convolute;
	xorl    %ebx, %ebx          # convolute = 0
	addq	$1, %r13    	    # y++
.L6:
        movl    -44(%rbp), %eax     # %eax = out_size_y
        cltq
	cmpq	%rax, %r13  	    # y < out_size_y
	jl      .L11
	addq	$1, %r12    	    # x++
.L5:
        movl    -48(%rbp), %eax     # %eax = end
        cltq
	cmpq	%rax, %r12          # x < end
	jl	.L12
        popq %r15
        popq %r14
        popq %r13
	popq %r12
	popq %rbx
        movq %rbp, %rsp 
	popq %rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
```

Let's compile and run the optimized code (I think that the code should perfom better than the previous one. We will see it...):

```console
$ g++ -o conv -lpthread -Wall conv_main.cpp conv_pthread.cpp utility.cpp convolute_opt.s 
$ sudo perf stat -r 30 -e cache-references,cache-misses ./conv image.txt kernel.txt 0 2

 Performance counter stats for './conv image.txt kernel.txt 0 2' (30 runs):

         6.776.719      cache-references                                              ( +-  1,27% )
           470.948      cache-misses              #    6,794 % of all cache refs      ( +-  2,12% )

           0,41677 +- 0,00182 seconds time elapsed  ( +-  0,44% )
```

In the first simulation we obtained 1.768.478 cache misses. Now we have just obtained 470.948 cache misses: not so bad.
