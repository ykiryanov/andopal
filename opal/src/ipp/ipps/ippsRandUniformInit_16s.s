        .text
        .align  4
        .globl  _ippsRandUniformInit_16s


_ippsRandUniformInit_16s:
        stmdb   sp!, {r4 - r7, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r7, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        strh    r1, [r6, #8]
        sub     r0, r2, r1
        add     r5, r1, r2
        mov     r1, #0x24
        strh    r2, [r6, #0xA]
        str     r1, [r6]
        str     r7, [r6, #4]
        bl      __floatsidf
        mov     r2, #0xFE, 12
        orr     r4, r2, #3, 4
        sub     r3, r4, #0x1F, 12
        mov     r2, #7
        bl      __muldf3
        str     r0, [r6, #0x18]
        str     r1, [r6, #0x1C]
        mov     r0, r5
        bl      __floatsidf
        mov     r3, r4
        mov     r2, #0
        bl      __muldf3
        ldr     r12, [pc, #0x3C]
        ldr     r2, [pc, #0x3C]
        ldr     r4, [pc, #0x3C]
        mul     lr, r7, r12
        str     r7, [r6, #0x24]
        str     r4, [r6, #0x20]
        str     r0, [r6, #0x10]
        add     lr, lr, r2
        mul     r12, lr, r12
        str     r1, [r6, #0x14]
        mvn     r1, #0
        add     r2, r12, r2
        mov     r0, #0
        str     lr, [r6, #0x28]
        str     r2, [r6, #0x2C]
        str     r1, [r6, #0x30]
        ldmia   sp!, {r4 - r7, pc}
        .long   0x00010dcd
        .long   0x3c6ef373
        .long   0x436cbae9


