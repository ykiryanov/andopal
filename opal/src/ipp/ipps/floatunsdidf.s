        .text
        .align  4
        .globl  __aeabi_ul2d
        .globl  __floatunsdidf


__aeabi_ul2d:
__floatunsdidf:
        cmp     r0, #0
        cmpeq   r1, #0
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
        rsb     r2, r2, #0x43, 28
        add     r2, r2, #0xD
        mov     r2, r2, lsl #20
        and     r3, r0, #2, 22
        orr     r3, r3, r0, lsl #21
        subs    r3, r3, #6, 2
        mov     r3, r0, lsr #11
        add     r2, r2, r1, lsr #11
        adcs    r0, r3, r1, lsl #21
        adc     r1, r2, #0
        bx      lr


