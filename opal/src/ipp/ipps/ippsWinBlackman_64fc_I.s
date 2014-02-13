        .text
        .align  4
        .globl  _ippsWinBlackman_64fc_I


_ippsWinBlackman_64fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r5, r2
        mov     r6, r3
        beq     LAKO5
        cmp     r4, #3
        blt     LAKO3
        sub     r0, r4, #1
        str     r0, [sp, #4]
        bl      __floatsidf
        ldr     r9, [pc, #0x40C]
        ldr     r8, [pc, #0x40C]
        mov     r3, r1
        mov     r2, r0
        mov     r0, r9
        mov     r1, r8
        bl      __divdf3
        bl      cos
        add     r12, r7, r4, lsl #4
        cmp     r4, #3
        mov     r10, r0
        str     r1, [sp]
        sub     r8, r12, #0x10
        mov     r11, #0
        beq     LAKO4
        mov     r12, #0xFF, 12
        orr     r9, r12, #3, 4
        mov     r2, r5
        mov     r3, r6
        mov     r0, #0
        mov     r1, r9
        bl      __adddf3
        sub     r3, r9, #1, 12
        str     r3, [sp, #0x28]
        mov     r2, #0
        bl      __muldf3
        ldr     r3, [sp, #0x28]
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        mov     r0, r5
        mov     r1, r6
        mov     r2, #0
        bl      __muldf3
        ldr     r3, [sp]
        str     r1, [sp, #8]
        str     r0, [sp, #0xC]
        mov     r1, r3
        mov     r0, r10
        mov     r2, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r9
        bl      __subdf3
        bl      sqrt
        ldr     r12, [sp, #4]
        str     r0, [sp, #4]
        cmp     r12, #0
        mov     r12, r11
        mov     lr, #1
        movlt   r12, lr
        add     r12, r4, r12
        sub     r12, r12, #1
        movs    lr, r12, asr #1
        sub     r12, lr, #1
        moveq   r5, r11
        moveq   r4, r9
        beq     LAKO1
        mov     r3, #0xFF, 12
        mov     r0, #0
        orr     r2, r3, #3, 4
        mov     r5, r0
        mov     r11, r5
        mov     r4, r2
        mov     r9, r4
        mov     r3, r11
        str     r9, [sp, #0x24]
        str     r11, [sp, #0x20]
        str     r10, [sp, #0x1C]
        mov     r6, r3
        str     r12, [sp, #0x18]
        str     r1, [sp, #0x28]
        mov     r9, r0
        mov     r11, r2
        mov     r10, r3
LAKO0:
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        str     r12, [sp, #0x2C]
        sub     r3, r12, #1, 12
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [r7]
        ldr     r3, [r7, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        ldr     r2, [r7, #8]
        ldr     r3, [r7, #0xC]
        str     r0, [r7]
        str     r1, [r7, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r7, #8]
        str     r1, [r7, #0xC]
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        str     r0, [r8]
        str     r1, [r8, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r8, #8]
        str     r1, [r8, #0xC]
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp]
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x28]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r6
        mov     r1, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        mov     r5, r0
        mov     r4, r1
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r3, [sp, #0x2C]
        mov     r2, #0
        bl      __subdf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x28]
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x24]
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r6
        mov     r1, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r12, [sp, #0x18]
        add     r7, r7, #0x10
        sub     r8, r8, #0x10
        sub     r12, r12, #1
        cmn     r12, #1
        str     r12, [sp, #0x18]
        mov     r6, r0
        mov     r9, r1
        mov     r10, r5
        mov     r11, r4
        bne     LAKO0
        ldr     r9, [sp, #0x24]
        ldr     r11, [sp, #0x20]
LAKO1:
        cmp     r7, r8
        beq     LAKO2
        mov     r0, r5
        mov     r1, r4
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r2, #0
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        mov     r2, r11
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [r7]
        ldr     r3, [r7, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        ldr     r2, [r7, #8]
        ldr     r3, [r7, #0xC]
        str     r0, [r7]
        str     r1, [r7, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r7, #8]
        str     r1, [r7, #0xC]
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        str     r0, [r8]
        str     r1, [r8, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r8, #8]
        str     r1, [r8, #0xC]
LAKO2:
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAKO3:
        mvn     r0, #5
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAKO4:
        str     r11, [r7, #8]
        str     r11, [r7, #0xC]
        str     r11, [r7]
        str     r11, [r7, #4]
        mov     r0, #0
        str     r11, [r12, #-8]
        str     r11, [r12, #-4]
        str     r11, [r12, #-0x10]
        str     r11, [r12, #-0xC]
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAKO5:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


