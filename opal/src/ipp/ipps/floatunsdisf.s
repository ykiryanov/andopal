        .text
        .align  4
        .globl  __aeabi_ul2f
        .globl  __floatunsdisf


__aeabi_ul2f:
__floatunsdisf:
        cmp     r1, #0
        cmpeq   r0, #0
        bxeq    lr
        clz     r2, r1
        clz     r3, r0
        cmp     r2, #0x20
        movcc   r1, r1, lsl r2
        rsbcc   r3, r2, #0x20
        orrcc   r1, r1, r0, lsr r3
        movcc   r0, r0, lsl r2
        movcs   r1, r0, lsl r3
        movcs   r0, #0
        addcs   r2, r3, #0x20
        rsb     r2, r2, #0xBD
        mov     r2, r2, lsl #23
        and     r3, r1, #1, 24
        orr     r3, r3, r1, lsl #24
        cmp     r0, #0
        orrne   r3, r3, #1
        subs    r3, r3, #6, 2
        adc     r0, r2, r1, lsr #8
        bx      lr


