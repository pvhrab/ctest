/* This is C lang examination task
Write a fragment of the program in C, which performs
the operation of rewriting 100 successive bytes of
memory from one place of RAM to another part of it.
Assume that:
a) the beginnings of both data arrays are indicated (appropriate indicators)
b) you can use any auxiliary variables
c) the whole procedure should be performed in a single loop (not by means of subsequent single copy operations).
Then, code the same procedure in assembler (choice of architecture and processor type: any).
How would you rate the complexity of the task and the legibility of the code in both versions of the program?
*/

// can activate memmove please uncomment USE_MEMMOVE
// #define USE_MEMMOVE

#include <stdio.h>
#include <string.h>

int main(int argc, const char * argv[])
{
    // Create a place and arrays to store our results
    int i;
    char a[1000];
    char b[100];

    // upload test data to array a
    strcpy(a, "Testing write data to memory, from one block to another block. \
Memory copy only 100 bytes and can check byte by byte addresses in memory");

    #ifdef USE_MEMMOVE
    // move memory data from a to b array byte by byte
    memmove(b, a, sizeof(b));

    #else
    // Copy 100 bytes from a array to b with FOR loop
    for (i = 0; i < 100; i++){
        b[i] = a[i];
    }
    #endif

    // print string data only 100 bytes
    b[sizeof(b)] = 0;
    printf("%s\n", b);

    // block for debug and test results
    // print addresses of each array index
    do {
        printf("b[%u] = %p\n", i, (void *)(&b[i]));
        i++;
    } while(i < sizeof(b));

    // print total size of array b
    printf("sizeof(b) = %lu\n", sizeof(b));

    return 0;
}
