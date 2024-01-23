#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/mman.h>


#define BUFFER_SIZE (1024ul * 1024ul * 500ul) // 500mb


size_t* n_bytes_written;


void use_memory()
{
    char* memory = (char*) malloc(BUFFER_SIZE);
    if (memory == NULL) exit(1);

    printf("Allocated %lu MiB\n", BUFFER_SIZE >> 20);

    for (size_t i = 0; i < BUFFER_SIZE; ++i)
    {
        memory[i] = 'i';
        ++(*n_bytes_written);
    }
}


int main()
{
    n_bytes_written = (size_t*) mmap(
        NULL, sizeof(size_t), PROT_READ | PROT_WRITE,
        MAP_SHARED | MAP_ANONYMOUS, -1, 0);

    if (fork() == 0) 
    {
        use_memory();
        exit(0);
    }

    wait(NULL);
    printf("Wrote %lu MiB\n", *n_bytes_written >> 20);
    exit(0);
}

