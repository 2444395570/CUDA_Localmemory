# CUDA_Localmemory
CUDA本地内存和寄存器堆
# 高速缓冲存储器
在崭新的GPU上，每个流多处理器都含有自己独立的L1缓存，以及GPU有L2缓存。L2缓存是被所有的GPU中的流多处理器都共有的。所有的全局内存访问和本地内存访问
都使用这些缓存，因为L1缓存在流多处理器内部独有，接近线程执行所需要的硬件单位，所有它的速度非常快。一般来说，L1缓存和共享内存用同样的存储硬件，一共是
64KB。所有的全局内存访问通过L2缓存进行。纹理内存和常量内存也分别有它们独立的缓存。
