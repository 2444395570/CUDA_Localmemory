#include <iostream>
#include <cuda.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <memory>

#define N 5

__global__ void gpu_local_memory(int d_in) {
	int t_local;
	t_local = d_in * threadIdx.x;
	printf("Value of local variable in current thread is:%d\n", t_local);
}

int main(void) {
	printf("Use of local Memory on GPU:\n");
	gpu_local_memory << <1, N >> > (5);
	cudaDeviceSynchronize();
	return 0;
}

/*
本地内存和寄存器堆堆每个线程都是唯一的。寄存器是每个线程可用的最快存储器。当内核中使用的变量在寄存器堆中放
不下的时候，将会使用本地内存存储它们，这叫寄存器溢出。
使用本地内存有两种情况：一种是寄存器不够，一种是某些情况根本不能放在寄存器中，例如对一个局部数组的下标进行
不定索引的时候。基本上可以将本地内存看成每个线程的唯一的全局内存部分。相比寄存器堆，本地内存要慢很多。虽然
本地内存通过L1缓存和L2缓存进行了缓冲，但是寄存器溢出可能会影响你的程序的性能。

*/