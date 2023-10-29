#include <stdio.h>
#include <stdint.h>

uint16_t count_leading_zeros(int x)
{
    x |= (x >> 1);
    x |= (x >> 2);
    x |= (x >> 4);
    x |= (x >> 8);
    x |= (x >> 16);
    
    
    /* count ones (population count) */
    x -= ((x >> 1) & 0x55555555);
    printf("0x%08x\n", x);
    x = ((x >> 2) & 0x33333333) + (x & 0x33333333);
    printf("0x%08x\n", x);
    x = ((x >> 4) + x) & 0x0f0f0f0f;
    printf("0x%08x\n", x);
    x += (x >> 8);
    printf("0x%08x\n", x);
    x += (x >> 16);
    printf("0x%08x\n", x);
    
    return (32 - (x & 0x7f));
}

int main()
{
    uint64_t x = 500;
    uint16_t y =  count_leading_zeros(x);
    printf("%hd\n",y);
    return 0;
}