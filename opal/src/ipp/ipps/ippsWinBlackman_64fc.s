        .text
        .align  4
        .globl  _ippsWinBlackman_64fc


_ippsWinBlackman_64fc:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #0x3C
        ldr     r4, [r11, #4]
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r5, r2
        str     r3, [r11, #-0x64]
        beq     LAKP5
        cmp     r7, #0
        beq     LAKP5
        cmp     r5, #3
        blt     LAKP2
        sub     r0, r5, #1
        str     r0, [r11, #-0x58]
        bl      __floatsidf
        ldr     r9, [pc, #0x454]
        ldr     r6, [pc, #0x454]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r6
        bl      __divdf3
        bl      cos
        add     lr, r8, r5, lsl #4
        add     r12, r7, r5, lsl #4
        cmp     r5, #3
        sub     r9, lr, #0x10
        str     r0, [r11, #-0x60]
        str     r1, [r11, #-0x5C]
        sub     r10, r12, #0x10
        beq     LAKP6
        ldr     r2, [r11, #-0x64]
        mov     r12, #0xFF, 12
        orr     r6, r12, #3, 4
        mov     r3, r4
        mov     r0, #0
        mov     r1, r6
        bl      __adddf3
        sub     r3, r6, #1, 12
        str     r3, [r11, #-0x30]
        mov     r2, #0
        bl      __muldf3
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x64]
        ldr     r3, [r11, #-0x30]
        str     r1, [r11, #-0x50]
        mov     r1, r4
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [r11, #-0x60]
        ldr     r3, [r11, #-0x5C]
        str     r0, [r11, #-0x54]
        str     r1, [r11, #-0x64]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r6
        bl      __subdf3
        bl      sqrt
        ldr     r12, [r11, #-0x58]
        mov     lr, #0
        cmp     r12, #0
        mov     r12, #1
        movlt   lr, r12
        add     lr, r5, lr
        sub     r2, lr, #1
        movs    r2, r2, asr #1
        str     r0, [r11, #-0x58]
        sub     r0, r2, #1
        beq     LAKP4
        mov     lr, #0
        mov     r4, lr
        mov     r3, #0xFF, 12
        mov     r2, r4
        orr     r12, r3, #3, 4
        str     r2, [r11, #-0x40]
        mov     r5, r12
        mov     r6, r5
        mov     r3, r2
        str     r6, [r11, #-0x3C]
        str     r2, [r11, #-0x30]
        str     r12, [r11, #-0x34]
        str     lr, [r11, #-0x38]
        str     r0, [r11, #-0x48]
        str     r1, [r11, #-0x44]
        mov     r6, r3
LAKP0:
        mov     r0, r4
        mov     r1, r5
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        str     r12, [r11, #-0x2C]
        sub     r3, r12, #1, 12
        mov     r2, #0
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [r11, #-0x4C]
        mov     r3, r1
        ldr     r1, [r11, #-0x50]
        bl      __subdf3
        mov     r5, r1
        ldr     r2, [r11, #-0x40]
        ldr     r1, [r11, #-0x64]
        ldr     r3, [r11, #-0x3C]
        mov     r4, r0
        ldr     r0, [r11, #-0x54]
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r5
        mov     r0, r4
        bl      __subdf3
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        mov     r5, r1
        mov     r4, r0
        bl      __muldf3
        str     r1, [r7, #4]
        str     r0, [r7]
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r1, [r7, #0xC]
        str     r0, [r7, #8]
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r1, [r10, #4]
        str     r0, [r10]
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        ldr     r0, [r11, #-0x30]
        ldr     r2, [r11, #-0x60]
        ldr     r3, [r11, #-0x5C]
        ldr     r1, [r11, #-0x34]
        bl      __muldf3
        mov     r5, r1
        ldr     r1, [r11, #-0x38]
        ldr     r2, [r11, #-0x58]
        ldr     r3, [r11, #-0x44]
        mov     r4, r0
        mov     r0, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r3, [r11, #-0x2C]
        mov     r2, #0
        bl      __subdf3
        str     r0, [r11, #-0x40]
        str     r1, [r11, #-0x3C]
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x34]
        ldr     r2, [r11, #-0x58]
        ldr     r3, [r11, #-0x44]
        bl      __muldf3
        str     r1, [r11, #-0x30]
        ldr     r1, [r11, #-0x38]
        ldr     r2, [r11, #-0x60]
        ldr     r3, [r11, #-0x5C]
        str     r0, [r11, #-0x2C]
        mov     r0, r6
        bl      __muldf3
        ldr     r3, [r11, #-0x30]
        ldr     r2, [r11, #-0x2C]
        bl      __adddf3
        ldr     r12, [r11, #-0x48]
        sub     r12, r12, #1
        cmn     r12, #1
        str     r12, [r11, #-0x48]
        add     r8, r8, #0x10
        sub     r9, r9, #0x10
        add     r7, r7, #0x10
        sub     r10, r10, #0x10
        mov     r6, r0
        str     r1, [r11, #-0x38]
        str     r4, [r11, #-0x30]
        str     r5, [r11, #-0x34]
        bne     LAKP0
        ldr     r6, [r11, #-0x3C]
LAKP1:
        cmp     r7, r10
        beq     LAKP3
        mov     r0, r4
        mov     r1, r5
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r2, #0
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x50]
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [r11, #-0x54]
        ldr     r1, [r11, #-0x64]
        ldr     r2, [r11, #-0x40]
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r7]
        str     r1, [r7, #4]
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r7, #8]
        str     r1, [r7, #0xC]
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r10]
        str     r1, [r10, #4]
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LAKP2:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}
LAKP3:
        ldr     r2, [r8, #4]
        ldr     r3, [r8]
        str     r2, [r7, #4]
        str     r3, [r7]
        ldr     r2, [r8, #8]
        ldr     r8, [r8, #0xC]
        str     r2, [r7, #8]
        str     r8, [r7, #0xC]
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LAKP4:
        mov     r4, #0
        str     r4, [r11, #-0x40]
        mov     r5, r6
        b       LAKP1
LAKP5:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}
LAKP6:
        mov     r2, #0
        str     r2, [r7, #8]
        str     r2, [r7, #0xC]
        str     r2, [r7]
        str     r2, [r7, #4]
        ldr     r3, [r8, #0x14]
        ldr     lr, [r8, #0x10]
        mov     r0, #0
        str     r3, [r7, #0x14]
        str     lr, [r7, #0x10]
        ldr     r3, [r8, #0x18]
        ldr     r8, [r8, #0x1C]
        str     r3, [r7, #0x18]
        str     r8, [r7, #0x1C]
        str     r2, [r12, #-8]
        str     r2, [r12, #-4]
        str     r2, [r12, #-0x10]
        str     r2, [r12, #-0xC]
        ldmdb   r11, {r4 - r11, sp, pc}
        .long   0x54442d18
        .long   0x401921fb


