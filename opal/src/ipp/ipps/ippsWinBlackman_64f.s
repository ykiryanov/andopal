        .text
        .align  4
        .globl  _ippsWinBlackman_64f


_ippsWinBlackman_64f:
        mov     r12, sp
        stmdb   sp!, {r3}
        stmdb   sp!, {r4 - r12, lr}
        sub     r11, r12, #4
        sub     sp, sp, #0x40
        ldr     r5, [r11, #4]
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r6, r2
        mov     r4, r3
        beq     LAKR5
        cmp     r8, #0
        beq     LAKR5
        cmp     r6, #3
        blt     LAKR2
        sub     r0, r6, #1
        str     r0, [r11, #-0x5C]
        bl      __floatsidf
        ldr     r10, [pc, #0x3B8]
        ldr     r7, [pc, #0x3B8]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r7
        bl      __divdf3
        bl      cos
        add     lr, r9, r6, lsl #3
        add     r12, r8, r6, lsl #3
        sub     lr, lr, #8
        cmp     r6, #3
        str     lr, [r11, #-0x68]
        str     r0, [r11, #-0x64]
        str     r1, [r11, #-0x60]
        sub     r10, r12, #8
        beq     LAKR6
        mov     r12, #0xFF, 12
        orr     r7, r12, #3, 4
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        mov     r1, r7
        bl      __adddf3
        sub     r3, r7, #1, 12
        str     r3, [r11, #-0x30]
        mov     r2, #0
        bl      __muldf3
        ldr     r3, [r11, #-0x30]
        str     r0, [r11, #-0x4C]
        str     r1, [r11, #-0x50]
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        bl      __muldf3
        ldr     r2, [r11, #-0x64]
        ldr     r3, [r11, #-0x60]
        str     r0, [r11, #-0x54]
        str     r1, [r11, #-0x58]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r7
        bl      __subdf3
        bl      sqrt
        ldr     r12, [r11, #-0x5C]
        mov     lr, #0
        cmp     r12, #0
        mov     r12, #1
        movlt   lr, r12
        add     lr, r6, lr
        sub     r2, lr, #1
        movs    r2, r2, asr #1
        str     r0, [r11, #-0x5C]
        sub     lr, r2, #1
        beq     LAKR4
        mov     r12, #0
        mov     r3, #0xFF, 12
        mov     r4, r12
        orr     r0, r3, #3, 4
        mov     r5, r4
        mov     r6, r0
        mov     r7, r6
        str     r5, [r11, #-0x3C]
        str     r7, [r11, #-0x40]
        ldr     r7, [r11, #-0x68]
        mov     r2, r5
        str     r2, [r11, #-0x30]
        str     r0, [r11, #-0x34]
        str     r12, [r11, #-0x38]
        str     lr, [r11, #-0x48]
        str     r1, [r11, #-0x44]
LAKR0:
        mov     r2, #0
        mov     r0, r4
        mov     r1, r6
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        str     r12, [r11, #-0x2C]
        sub     r3, r12, #1, 12
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [r11, #-0x4C]
        mov     r3, r1
        ldr     r1, [r11, #-0x50]
        bl      __subdf3
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r11, #-0x3C]
        mov     r4, r0
        ldr     r0, [r11, #-0x54]
        mov     r6, r1
        ldr     r1, [r11, #-0x58]
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r6
        mov     r0, r4
        bl      __subdf3
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r4, r0
        mov     r6, r1
        bl      __muldf3
        str     r1, [r8, #4]
        str     r0, [r8], #8
        ldr     r2, [r7]
        ldr     r3, [r7, #4]
        mov     r1, r6
        mov     r0, r4
        bl      __muldf3
        str     r1, [r10, #4]
        str     r0, [r10], #-8
        ldr     r1, [r11, #-0x34]
        ldr     r2, [r11, #-0x64]
        ldr     r3, [r11, #-0x60]
        mov     r0, r5
        bl      __muldf3
        ldr     r2, [r11, #-0x5C]
        ldr     r3, [r11, #-0x44]
        mov     r4, r0
        ldr     r0, [r11, #-0x30]
        mov     r6, r1
        ldr     r1, [r11, #-0x38]
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r6
        mov     r0, r4
        bl      __subdf3
        mov     r6, r1
        mov     r4, r0
        mov     r3, r6
        mov     r2, r4
        bl      __adddf3
        mov     r3, r6
        mov     r2, r4
        bl      __muldf3
        ldr     r3, [r11, #-0x2C]
        mov     r2, #0
        bl      __subdf3
        str     r1, [r11, #-0x40]
        ldr     r1, [r11, #-0x34]
        ldr     r2, [r11, #-0x5C]
        ldr     r3, [r11, #-0x44]
        str     r0, [r11, #-0x3C]
        mov     r0, r5
        bl      __muldf3
        str     r0, [r11, #-0x2C]
        mov     r5, r1
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x38]
        ldr     r2, [r11, #-0x64]
        ldr     r3, [r11, #-0x60]
        bl      __muldf3
        ldr     r2, [r11, #-0x2C]
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [r11, #-0x48]
        sub     r12, r12, #1
        cmn     r12, #1
        str     r12, [r11, #-0x48]
        add     r9, r9, #8
        sub     r7, r7, #8
        str     r0, [r11, #-0x30]
        str     r1, [r11, #-0x38]
        mov     r5, r4
        str     r6, [r11, #-0x34]
        bne     LAKR0
        str     r7, [r11, #-0x68]
        ldr     r7, [r11, #-0x40]
LAKR1:
        cmp     r8, r10
        beq     LAKR3
        mov     r0, r4
        mov     r1, r6
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r2, #0
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [r11, #-0x4C]
        mov     r3, r1
        ldr     r1, [r11, #-0x50]
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [r11, #-0x54]
        ldr     r1, [r11, #-0x58]
        ldr     r2, [r11, #-0x3C]
        mov     r3, r7
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r3, [r11, #-0x68]
        mov     r0, r4
        mov     r1, r5
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        str     r0, [r10]
        str     r1, [r10, #4]
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LAKR2:
        mvn     r0, #5
        ldmdb   r11, {r4 - r11, sp, pc}
LAKR3:
        ldr     r2, [r9]
        ldr     r9, [r9, #4]
        str     r2, [r8]
        str     r9, [r8, #4]
        mov     r0, #0
        ldmdb   r11, {r4 - r11, sp, pc}
LAKR4:
        mov     r4, #0
        str     r4, [r11, #-0x3C]
        mov     r6, r7
        b       LAKR1
LAKR5:
        mvn     r0, #7
        ldmdb   r11, {r4 - r11, sp, pc}
LAKR6:
        mov     r2, #0
        str     r2, [r8]
        str     r2, [r8, #4]
        ldr     r3, [r9, #8]
        ldr     r9, [r9, #0xC]
        mov     r0, #0
        str     r3, [r8, #8]
        str     r9, [r8, #0xC]
        str     r2, [r12, #-8]
        str     r2, [r12, #-4]
        ldmdb   r11, {r4 - r11, sp, pc}
        .long   0x54442d18
        .long   0x401921fb


