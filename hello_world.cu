#include <stdio.h>

__global__ void helloFromGPU(void) {  // The qualifier __global__ tells the compiler
                                      // that the function will be called from the CPU and executed on the GPU.
  printf("Hello World from GPU from thread %d\n", threadIdx.x);
}

int main(void) {
  printf("Hello World from CPU!\n");

  // Triple angle brackets mark a call from the host thread to the code on the device side. A kernel is
  // executed by an array of threads and all threads run the same code. The parameters within the triple
  // angle brackets are the execution configuration, which specifies how many threads will execute the
  // kernel. In this example, you will run 10 GPU threads.
  helloFromGPU <<<1, 10>>>();
  cudaDeviceReset();   // The function cudaDeviceReset() will explicitly destroy and
                       // clean up all resources associated with the current device in the current process.
  return 0;
}
