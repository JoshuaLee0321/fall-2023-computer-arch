

```c
// this code is hard to understand, so let me take you through the code
// assume we have 0x0001000000004400, that is, the output will be "3 * 4 + 3 = 15"
// we run the code step by step

uint16_t count_leading_zeros(uint64_t x)
{                       // input: 0x0001000000000000
    x |= (x >> 1);      // now  : 0x0001800000000000
    x |= (x >> 2);      // now  : 0x0001e00000000000
    x |= (x >> 4);      // now  : 0x0001fe0000000000
    x |= (x >> 8);      // now  : 0x0001fffe00000000
    x |= (x >> 16);     // now  : 0x0001fffffffe0000
    x |= (x >> 32);     // now  : 0x0001ffffffffffff
    /* basically, you can see from the perspective of leading zero, 
    *  this operation can change the bottom to zero very easilly */

    /* count ones (population count) 
    *  here comes the confsion part 
    *  currently : 0x0001ffffffffffff */
    x -= ((x >> 1) & 0x5555555555555555);                               // now: 0x0001aaaaaaaaaaaa
    x = ((x >> 2) & 0x3333333333333333) + (x & 0x3333333333333333);     // now: 0x0001444444444444
    x = ((x >> 4) + x) & 0x0f0f0f0f0f0f0f0f;                            // now: 0x0001080808080808
    x += (x >> 8);                                                      // now: 0x0001091010101010
    x += (x >> 16);                                                     // now: 0x0001091119202020
    x += (x >> 32);                                                     // now: 0x0001091119212931
    return (64 - (x & 0x7f));                                           // return: 64 - 0x31(49) = 15
}
```


# this project aims to solve 