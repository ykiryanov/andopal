        .text
        .align  4
        .globl  _ippsTriangleInitQ15_16s


_ippsTriangleInitQ15_16s:
        stmdb   sp!, {r4 - r7, lr}
        ldr     r6, [sp, #0x14]
        mov     r7, r0
        cmp     r7, #0
        mov     r0, r1
        mov     r4, r2
        mov     r5, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r0, #0
        mvnle   r0, #0x2A
        ldmleia sp!, {r4 - r7, pc}
        cmp     r4, #0
        blt     LANO3
        mov     r12, #0xFF
        orr     r12, r12, #0x3F, 24
        cmp     r12, r4
        blt     LANO3
        cmp     r5, #0
        blt     LANO2
        ldr     lr, [pc, #0x100]
        cmp     r5, lr, lsl #1
        bgt     LANO2
        rsb     r12, lr, #0
        cmp     r12, r6
        bgt     LANO0
        cmp     lr, r6
        bge     LANO1
LANO0:
        mvn     r0, #0x27
        ldmia   sp!, {r4 - r7, pc}
LANO1:
        bl      __floatsidf
        str     r0, [r7, #8]
        str     r1, [r7, #0xC]
        mov     r0, r4
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        str     r0, [r7, #0x10]
        str     r1, [r7, #0x14]
        mov     r0, r5
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        str     r0, [r7, #0x18]
        str     r1, [r7, #0x1C]
        mov     r0, r6
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        ldr     r2, [pc, #0x84]
        str     r1, [r7, #0x24]
        mov     r1, #0
        str     r0, [r7, #0x20]
        mov     r0, #0
        str     r2, [r7]
        str     r1, [r7, #0x28]
        str     r1, [r7, #0x2C]
        str     r1, [r7, #0x30]
        str     r1, [r7, #0x34]
        str     r1, [r7, #0x38]
        str     r1, [r7, #0x3C]
        str     r1, [r7, #0x40]
        str     r1, [r7, #0x44]
        str     r1, [r7, #0x48]
        str     r1, [r7, #0x4C]
        str     r1, [r7, #0x50]
        str     r1, [r7, #0x54]
        str     r1, [r7, #0x58]
        str     r1, [r7, #0x5C]
        str     r1, [r7, #0x60]
        str     r1, [r7, #0x64]
        str     r1, [r7, #0x68]
        str     r1, [r7, #0x6C]
        str     r1, [r7, #0x70]
        str     r1, [r7, #0x74]
        str     r1, [r7, #0x78]
        str     r1, [r7, #0x80]
        str     r1, [r7, #0x7C]
        ldmia   sp!, {r4 - r7, pc}
LANO2:
        mvn     r0, #0x28
        ldmia   sp!, {r4 - r7, pc}
LANO3:
        mvn     r0, #0x29
        ldmia   sp!, {r4 - r7, pc}
        .long   0x0001921f
        .long   0x434d4149


