        .text
        .align  4
        .globl  __aeabi_llsl
        .globl  __ashldi3


__aeabi_llsl:
__ashldi3:
        cmp     r3, #1
        cmpcc   r2, #0x40
        movcs   r1, #0
        movcs   r0, #0
        bxcs    lr
        subs    r3, r2, #0x20
        movcs   r1, r0, lsl r3
        movcs   r0, #0
        bxcs    lr
        rsb     r3, r3, #0
        mov     r1, r1, lsl r2
        orr     r1, r1, r0, lsr r3
        mov     r0, r0, lsl r2
        bx      lr


