        .text
        .align  4
        .globl  __aeabi_llsr
        .globl  __lshrdi3


__aeabi_llsr:
__lshrdi3:
        cmp     r3, #1
        cmpcc   r2, #0x40
        movcs   r1, #0
        movcs   r0, #0
        bxcs    lr
        subs    r3, r2, #0x20
        movcs   r0, r1, lsr r3
        movcs   r1, #0
        bxcs    lr
        rsb     r3, r3, #0
        mov     r0, r0, lsr r2
        orr     r0, r0, r1, lsl r3
        mov     r1, r1, lsr r2
        bx      lr


