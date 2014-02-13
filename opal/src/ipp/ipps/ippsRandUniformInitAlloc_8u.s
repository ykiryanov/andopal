        .text
        .align  4
        .globl  _ippsRandUniformInitAlloc_8u


_ippsRandUniformInitAlloc_8u:
        stmdb   sp!, {r4 - r8, lr}
        mov     r8, r0
        cmp     r8, #0
        mov     r4, r1
        mov     r5, r2
        mov     r6, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        mov     r0, #0x38
        bl      _ippsMalloc_8u
        mov     r7, r0
        cmp     r7, #0
        mvneq   r0, #8
        ldmeqia sp!, {r4 - r8, pc}
        sub     r0, r5, r4
        mov     r12, #0x23
        str     r12, [r7]
        strb    r5, [r7, #9]
        strb    r4, [r7, #8]
        str     r6, [r7, #4]
        bl      __floatsidf
        mov     r2, #0xFE, 12
        add     r5, r4, r5
        orr     r4, r2, #3, 4
        sub     r3, r4, #0x1F, 12
        mov     r2, #7
        bl      __muldf3
        str     r0, [r7, #0x18]
        str     r1, [r7, #0x1C]
        mov     r0, r5
        bl      __floatsidf
        mov     r3, r4
        mov     r2, #0
        bl      __muldf3
        ldr     r12, [pc, #0x40]
        ldr     r2, [pc, #0x40]
        ldr     r4, [pc, #0x40]
        mul     lr, r6, r12
        str     r6, [r7, #0x24]
        str     r4, [r7, #0x20]
        str     r0, [r7, #0x10]
        add     lr, lr, r2
        mul     r12, lr, r12
        str     r1, [r7, #0x14]
        mvn     r1, #0
        add     r2, r12, r2
        str     lr, [r7, #0x28]
        str     r2, [r7, #0x2C]
        str     r1, [r7, #0x30]
        mov     r0, #0
        str     r7, [r8]
        ldmia   sp!, {r4 - r8, pc}
        .long   0x00010dcd
        .long   0x3c6ef373
        .long   0x436cbae9


