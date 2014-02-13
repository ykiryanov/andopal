        .text
        .align  4
        .globl  _ippsToneInitQ15_16s


_ippsToneInitQ15_16s:
        stmdb   sp!, {r4 - r6, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r0, r1
        mov     r4, r2
        mov     r5, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r0, #0
        mvnle   r0, #0x2D
        ldmleia sp!, {r4 - r6, pc}
        cmp     r4, #0
        blt     LAOA2
        mov     r12, #0xFF
        orr     r12, r12, #0x3F, 24
        cmp     r12, r4
        blt     LAOA2
        cmp     r5, #0
        blt     LAOA0
        mov     r12, #0x3E
        orr     r12, r12, #0xC9, 22
        cmp     r12, r5
        bge     LAOA1
LAOA0:
        mvn     r0, #0x2B
        ldmia   sp!, {r4 - r6, pc}
LAOA1:
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
        ldr     r2, [pc, #0x24]
        str     r1, [r6, #0x1C]
        mov     r1, #0
        str     r0, [r6, #0x18]
        mov     r0, #0
        str     r2, [r6]
        str     r1, [r6, #0x28]
        str     r1, [r6, #0x24]
        ldmia   sp!, {r4 - r6, pc}
LAOA2:
        mvn     r0, #0x2C
        ldmia   sp!, {r4 - r6, pc}
        .long   0x434d4148


