        .text
        .align  4
        .globl  _ippsRandGaussInitAlloc_8u


_ippsRandGaussInitAlloc_8u:
        stmdb   sp!, {r4 - r7, lr}
        mov     r4, r0
        cmp     r4, #0
        mov     r6, r1
        mov     r7, r2
        mov     r5, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        mov     r0, #0x40
        bl      _ippsMalloc_8u
        cmp     r0, #0
        mvneq   r0, #8
        ldmeqia sp!, {r4 - r7, pc}
        ldr     r2, [pc, #0x70]
        str     r5, [r0, #4]
        str     r5, [r0, #0x10]
        mul     r5, r5, r2
        ldr     r3, [pc, #0x64]
        ldr     r1, [pc, #0x64]
        strb    r6, [r0, #8]
        add     r12, r5, r3
        mul     r2, r12, r2
        str     r1, [r0, #0xC]
        strb    r7, [r0, #9]
        mov     r1, #0
        str     r1, [r0, #0x28]
        add     r3, r2, r3
        mvn     r2, #0
        str     r12, [r0, #0x14]
        str     r2, [r0, #0x1C]
        mov     r12, #0x26
        mov     r2, #1
        str     r1, [r0, #0x2C]
        str     r12, [r0]
        str     r3, [r0, #0x18]
        str     r2, [r0, #0x20]
        str     r1, [r0, #0x30]
        str     r1, [r0, #0x34]
        str     r1, [r0, #0x38]
        str     r1, [r0, #0x3C]
        str     r0, [r4]
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
        .long   0x00010dcd
        .long   0x3c6ef373
        .long   0x436cbae9


