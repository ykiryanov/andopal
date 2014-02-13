        .text
        .align  4
        .globl  _ippsToneInitAllocQ15_16s


_ippsToneInitAllocQ15_16s:
        stmdb   sp!, {r4 - r9, lr}
        mov     r7, r0
        cmp     r7, #0
        mov     r8, r1
        mov     r4, r2
        mov     r5, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        cmp     r8, #0
        mvnle   r0, #0x2D
        ldmleia sp!, {r4 - r9, pc}
        cmp     r4, #0
        blt     LAOB2
        mov     r12, #0xFF
        orr     r12, r12, #0x3F, 24
        cmp     r12, r4
        blt     LAOB2
        cmp     r5, #0
        blt     LAOB0
        mov     r12, #0x3E
        orr     r12, r12, #0xC9, 22
        cmp     r12, r5
        bge     LAOB1
LAOB0:
        mvn     r0, #0x2B
        ldmia   sp!, {r4 - r9, pc}
LAOB1:
        mov     r0, #0x30
        bl      _ippsMalloc_16s
        mov     r6, r0
        cmp     r6, #0
        mvneq   r0, #8
        ldmeqia sp!, {r4 - r9, pc}
        mov     r0, r8
        ldr     r12, [pc, #0x6C]
        mov     r9, #0
        str     r12, [r6]
        bl      __floatsidf
        str     r0, [r6, #8]
        str     r1, [r6, #0xC]
        mov     r0, r4
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        str     r0, [r6, #0x10]
        str     r1, [r6, #0x14]
        mov     r0, r5
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        str     r1, [r6, #0x1C]
        str     r0, [r6, #0x18]
        mov     r1, #1
        str     r9, [r6, #0x20]
        str     r9, [r6, #0x28]
        str     r1, [r6, #0x24]
        mov     r0, #0
        str     r6, [r7]
        ldmia   sp!, {r4 - r9, pc}
LAOB2:
        mvn     r0, #0x2C
        ldmia   sp!, {r4 - r9, pc}
        .long   0x434d4148


