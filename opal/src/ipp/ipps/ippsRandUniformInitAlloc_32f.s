        .text
        .align  4
        .globl  _ippsRandUniformInitAlloc_32f


_ippsRandUniformInitAlloc_32f:
        stmdb   sp!, {r4 - r9, lr}
        mov     r9, r0
        cmp     r9, #0
        mov     r4, r1
        mov     r5, r2
        mov     r7, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        mov     r0, #0x38
        bl      _ippsMalloc_32f
        mov     r8, r0
        cmp     r8, #0
        mvneq   r0, #8
        ldmeqia sp!, {r4 - r9, pc}
        str     r4, [r8, #8]
        str     r5, [r8, #0xC]
        mov     r12, #0x25
        str     r12, [r8]
        mov     r0, r5
        mov     r1, r4
        bl      __subsf3
        bl      __extendsfdf2
        mov     r12, #0xFE, 12
        orr     r6, r12, #3, 4
        sub     r3, r6, #0x1F, 12
        mov     r2, #7
        bl      __muldf3
        str     r0, [r8, #0x18]
        str     r1, [r8, #0x1C]
        mov     r0, r4
        mov     r1, r5
        bl      __addsf3
        bl      __extendsfdf2
        mov     r3, r6
        mov     r2, #0
        bl      __muldf3
        ldr     r12, [pc, #0x44]
        ldr     r2, [pc, #0x44]
        ldr     r3, [pc, #0x44]
        mul     lr, r7, r12
        str     r7, [r8, #4]
        str     r7, [r8, #0x24]
        str     r3, [r8, #0x20]
        add     lr, lr, r2
        mul     r12, lr, r12
        str     r1, [r8, #0x14]
        str     r0, [r8, #0x10]
        add     r2, r12, r2
        mvn     r1, #0
        str     lr, [r8, #0x28]
        str     r2, [r8, #0x2C]
        str     r1, [r8, #0x30]
        mov     r0, #0
        str     r8, [r9]
        ldmia   sp!, {r4 - r9, pc}
        .long   0x00010dcd
        .long   0x3c6ef373
        .long   0x436cbae9


