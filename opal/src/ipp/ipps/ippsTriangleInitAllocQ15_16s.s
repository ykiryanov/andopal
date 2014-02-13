        .text
        .align  4
        .globl  _ippsTriangleInitAllocQ15_16s


_ippsTriangleInitAllocQ15_16s:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r7, [sp, #0x1C]
        mov     r9, r0
        cmp     r9, #0
        mov     r4, r1
        mov     r5, r2
        mov     r6, r3
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        cmp     r4, #0
        mvnle   r0, #0x2A
        ldmleia sp!, {r4 - r9, pc}
        cmp     r5, #0
        blt     LANP3
        mov     r12, #0xFF
        orr     r12, r12, #0x3F, 24
        cmp     r12, r5
        blt     LANP3
        cmp     r6, #0
        blt     LANP2
        ldr     lr, [pc, #0x124]
        cmp     r6, lr, lsl #1
        bgt     LANP2
        rsb     r12, lr, #0
        cmp     r12, r7
        bgt     LANP0
        cmp     lr, r7
        bge     LANP1
LANP0:
        mvn     r0, #0x27
        ldmia   sp!, {r4 - r9, pc}
LANP1:
        mov     r0, #0x88
        bl      _ippsMalloc_16s
        mov     r8, r0
        cmp     r8, #0
        mvneq   r0, #8
        ldmeqia sp!, {r4 - r9, pc}
        ldr     r12, [pc, #0xE8]
        mov     r0, r4
        str     r12, [r8]
        bl      __floatsidf
        str     r0, [r8, #8]
        str     r1, [r8, #0xC]
        mov     r0, r5
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        str     r0, [r8, #0x10]
        str     r1, [r8, #0x14]
        mov     r0, r6
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        str     r0, [r8, #0x18]
        str     r1, [r8, #0x1C]
        mov     r0, r7
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        str     r1, [r8, #0x24]
        mov     r1, #0
        str     r1, [r8, #0x28]
        str     r1, [r8, #0x2C]
        str     r1, [r8, #0x30]
        str     r1, [r8, #0x34]
        str     r1, [r8, #0x38]
        str     r1, [r8, #0x3C]
        str     r1, [r8, #0x40]
        str     r1, [r8, #0x44]
        str     r1, [r8, #0x48]
        str     r1, [r8, #0x4C]
        str     r1, [r8, #0x50]
        str     r1, [r8, #0x54]
        str     r1, [r8, #0x58]
        str     r1, [r8, #0x5C]
        str     r1, [r8, #0x60]
        str     r1, [r8, #0x64]
        str     r1, [r8, #0x68]
        str     r1, [r8, #0x6C]
        str     r1, [r8, #0x70]
        str     r1, [r8, #0x74]
        str     r1, [r8, #0x78]
        str     r1, [r8, #0x80]
        str     r0, [r8, #0x20]
        mov     r1, #1
        str     r1, [r8, #0x7C]
        mov     r0, #0
        str     r8, [r9]
        ldmia   sp!, {r4 - r9, pc}
LANP2:
        mvn     r0, #0x28
        ldmia   sp!, {r4 - r9, pc}
LANP3:
        mvn     r0, #0x29
        ldmia   sp!, {r4 - r9, pc}
        .long   0x0001921f
        .long   0x434d4149


