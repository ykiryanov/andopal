        .text
        .align  4
        .globl  _ippsGoertzTwo_64fc


_ippsGoertzTwo_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        mov     r10, r0
        cmp     r10, #0
        mov     r9, r1
        mov     r11, r2
        mov     r6, r3
        beq     LBSP4
        cmp     r11, #0
        beq     LBSP4
        cmp     r6, #0
        beq     LBSP4
        cmp     r9, #0
        ble     LBSP5
        ldr     r5, [r6]
        ldr     r4, [r6, #4]
        mov     r2, #0
        mov     r0, r5
        mov     r3, #0
        mov     r1, r4
        bl      __ltdf2
        cmp     r0, #0
        blt     LBSP2
        mov     r0, r5
        mov     r12, #0xFF, 12
        orr     r8, r12, #3, 4
        mov     r1, r4
        mov     r2, #0
        mov     r3, r8
        bl      __gedf2
        cmp     r0, #0
        bge     LBSP2
        ldr     r7, [r6, #8]
        ldr     r6, [r6, #0xC]
        mov     r2, #0
        mov     r0, r7
        mov     r3, #0
        mov     r1, r6
        bl      __ltdf2
        cmp     r0, #0
        blt     LBSP2
        mov     r0, r7
        mov     r3, r8
        mov     r1, r6
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LBSP2
        ldr     r2, [pc, #0x454]
        ldr     r8, [pc, #0x454]
        mov     r1, r4
        mov     r0, r5
        mov     r3, r8
        bl      __muldf3
        mov     r4, r1
        mov     r5, r0
        bl      sin
        str     r1, [sp, #0x10]
        str     r0, [sp, #0xC]
        mov     r1, r4
        mov     r0, r5
        bl      cos
        ldr     r2, [pc, #0x41C]
        mov     r4, r1
        mov     r5, r0
        mov     r1, r6
        mov     r0, r7
        mov     r3, r8
        bl      __muldf3
        mov     r6, r1
        mov     r7, r0
        bl      sin
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x1C]
        mov     r1, r6
        mov     r0, r7
        bl      cos
        mov     r6, r0
        str     r6, [sp, #0x24]
        mov     r8, r1
        mov     r0, r5
        mov     r1, r4
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r0, [sp]
        str     r1, [sp, #4]
        mov     r0, r6
        mov     r1, r8
        mov     r2, r6
        mov     r3, r8
        bl      __adddf3
        cmp     r9, #0
        ble     LBSP3
        mov     r6, #0
        str     r6, [sp, #0x2C]
        str     r6, [sp, #0x64]
        mov     r7, r6
        str     r7, [sp, #0x5C]
        mov     r3, r7
        str     r3, [sp, #0x54]
        str     r3, [sp, #0x50]
        str     r3, [sp, #0x40]
        str     r3, [sp, #0x3C]
        str     r3, [sp, #0x60]
        str     r3, [sp, #0x68]
        str     r3, [sp, #0x4C]
        str     r3, [sp, #0x58]
        str     r3, [sp, #0x38]
        str     r3, [sp, #0x34]
        str     r3, [sp, #0x30]
        sub     r10, r10, #4
        str     r1, [sp, #0x44]
        str     r0, [sp, #0x48]
        str     r8, [sp, #0x28]
        str     r4, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     r11, [sp, #8]
LBSP0:
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        ldr     r2, [sp, #0x64]
        ldr     r4, [r10, #4]
        ldr     r5, [r10, #8]
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x50]
        bl      __subdf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r11, [r10, #0xC]
        ldr     r8, [r10, #0x10]!
        ldr     r2, [sp, #0x5C]
        str     r0, [sp, #0x6C]
        ldr     r0, [sp]
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #4]
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        bl      __subdf3
        mov     r2, r11
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x68]
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x48]
        str     r1, [sp, #0x78]
        ldr     r1, [sp, #0x44]
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x34]
        bl      __subdf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x80]
        ldr     r2, [sp, #0x4C]
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x44]
        ldr     r3, [sp, #0x58]
        bl      __muldf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x2C]
        bl      __subdf3
        mov     r2, r11
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x64]
        str     r6, [sp, #0x50]
        str     r2, [sp, #0x54]
        ldr     r2, [sp, #0x5C]
        ldr     r6, [sp, #0x70]
        str     r2, [sp, #0x40]
        ldr     r2, [sp, #0x60]
        str     r7, [sp, #0x3C]
        ldr     r7, [sp, #0x78]
        str     r2, [sp, #0x38]
        ldr     r2, [sp, #0x68]
        str     r2, [sp, #0x34]
        ldr     r2, [sp, #0x4C]
        subs    r9, r9, #1
        str     r2, [sp, #0x30]
        ldr     r2, [sp, #0x58]
        str     r2, [sp, #0x2C]
        ldr     r2, [sp, #0x6C]
        str     r0, [sp, #0x4C]
        str     r2, [sp, #0x64]
        ldr     r2, [sp, #0x74]
        str     r1, [sp, #0x58]
        str     r2, [sp, #0x5C]
        ldr     r2, [sp, #0x7C]
        str     r2, [sp, #0x60]
        ldr     r2, [sp, #0x80]
        str     r2, [sp, #0x68]
        bne     LBSP0
        ldr     r8, [sp, #0x28]
        ldr     r4, [sp, #0x18]
        ldr     r5, [sp, #0x14]
        ldr     r11, [sp, #8]
LBSP1:
        mov     r0, r5
        mov     r1, r4
        ldr     r2, [sp, #0x64]
        mov     r3, r6
        bl      __muldf3
        ldr     r10, [sp, #0x10]
        str     r0, [sp, #0x80]
        ldr     r9, [sp, #0x5C]
        ldr     r0, [sp, #0xC]
        str     r1, [sp, #0x7C]
        mov     r1, r10
        mov     r3, r7
        mov     r2, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x80]
        ldr     r1, [sp, #0x7C]
        bl      __subdf3
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x50]
        bl      __subdf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r2, [sp, #0x64]
        ldr     r0, [sp, #0xC]
        mov     r1, r10
        mov     r3, r6
        bl      __muldf3
        mov     r6, r0
        mov     r10, r1
        mov     r1, r4
        mov     r3, r7
        mov     r2, r9
        mov     r0, r5
        bl      __muldf3
        mov     r3, r10
        mov     r2, r6
        bl      __adddf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        bl      __subdf3
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        ldr     r6, [sp, #0x60]
        ldr     r5, [sp, #0x68]
        ldr     r0, [sp, #0x24]
        mov     r2, r6
        mov     r1, r8
        mov     r3, r5
        bl      __muldf3
        ldr     r4, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r9, [sp, #0x4C]
        ldr     r10, [sp, #0x58]
        str     r0, [sp, #0x80]
        str     r1, [sp, #0x7C]
        mov     r0, r4
        mov     r1, r7
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x80]
        mov     r3, r1
        ldr     r1, [sp, #0x7C]
        bl      __subdf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x34]
        bl      __subdf3
        str     r0, [r11, #0x10]
        str     r1, [r11, #0x14]
        mov     r0, r4
        mov     r3, r5
        mov     r1, r7
        mov     r2, r6
        bl      __muldf3
        mov     r4, r0
        ldr     r0, [sp, #0x24]
        mov     r5, r1
        mov     r1, r8
        mov     r2, r9
        mov     r3, r10
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x2C]
        bl      __subdf3
        mov     r2, r0
        mov     r0, #0
        str     r2, [r11, #0x18]
        str     r1, [r11, #0x1C]
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBSP2:
        mvn     r0, #0x1A
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBSP3:
        mov     r6, #0
        str     r6, [sp, #0x2C]
        str     r6, [sp, #0x64]
        mov     r7, r6
        str     r7, [sp, #0x5C]
        mov     r3, r7
        str     r3, [sp, #0x54]
        str     r3, [sp, #0x50]
        str     r3, [sp, #0x40]
        str     r3, [sp, #0x3C]
        str     r3, [sp, #0x60]
        str     r3, [sp, #0x68]
        str     r3, [sp, #0x4C]
        str     r3, [sp, #0x58]
        str     r3, [sp, #0x38]
        str     r3, [sp, #0x34]
        str     r3, [sp, #0x30]
        b       LBSP1
LBSP4:
        mvn     r0, #7
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LBSP5:
        mvn     r0, #5
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


