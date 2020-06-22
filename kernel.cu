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
�����ڴ�ͼĴ����Ѷ�ÿ���̶߳���Ψһ�ġ��Ĵ�����ÿ���߳̿��õ����洢�������ں���ʹ�õı����ڼĴ������з�
���µ�ʱ�򣬽���ʹ�ñ����ڴ�洢���ǣ���мĴ��������
ʹ�ñ����ڴ������������һ���ǼĴ���������һ����ĳЩ����������ܷ��ڼĴ����У������һ���ֲ�������±����
����������ʱ�򡣻����Ͽ��Խ������ڴ濴��ÿ���̵߳�Ψһ��ȫ���ڴ沿�֡���ȼĴ����ѣ������ڴ�Ҫ���ܶࡣ��Ȼ
�����ڴ�ͨ��L1�����L2��������˻��壬���ǼĴ���������ܻ�Ӱ����ĳ�������ܡ�

*/