The hardest part for me was figuring out how to partition the image properly
with only one argument. I ended up making a simple struct that stored the
information I needed. However, it had a problem such that multiple threads would
keep modifying an important integer, so (1-1/nthreads) of the image would be all
black. I fixed that by making the partition number a static variable of the
thread function and let it be incremented by each thread, which solved the issue
