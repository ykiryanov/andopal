        .text
        .align  4
        .globl  _ippsWinBlackman_64f_I


_ippsWinBlackman_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        mov     r10, r0
        cmp     r10, #0
        mov     r4, r1
        mov     r5, r2
        mov     r8, r3
        beq     LAKQ5
        cmp     r4, #3
        blt     LAKQ3
        sub     r0, r4, #1
        str     r0, [sp, #4]
        bl      __floatsidf
        ldr     r7, [pc, #0x38C]
        ldr     r6, [pc, #0x38C]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r6
        bl      __divdf3
        bl      cos
        add     r12, r10, r4, lsl #3
        cmp     r4, #3
        mov     r7, r0
        str     r1, [sp]
        sub     r11, r12, #8
        mov     r9, #0
        beq     LAKQ4
        mov     r12, #0xFF, 12
        orr     r6, r12, #3, 4
        mov     r2, r5
        mov     r3, r8
        mov     r0, #0
        mov     r1, r6
        bl      __adddf3
        sub     r3, r6, #1, 12
        str     r3, [sp, #0x28]
        mov     r2, #0
        bl      __muldf3
        ldr     r3, [sp, #0x28]
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        mov     r0, r5
        mov     r1, r8
        mov     r2, #0
        bl      __muldf3
        ldr     r3, [sp]
        str     r1, [sp, #8]
        str     r0, [sp, #0xC]
        mov     r1, r3
        mov     r0, r7
        mov     r2, r7
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r6
        bl      __subdf3
        bl      sqrt
        ldr     r12, [sp, #4]
        str     r0, [sp, #4]
        cmp     r12, #0
        mov     r12, r9
        mov     lr, #1
        movlt   r12, lr
        add     r12, r4, r12
        sub     r12, r12, #1
        movs    lr, r12, asr #1
        sub     r12, lr, #1
        moveq   r5, r9
        moveq   r4, r6
        beq     LAKQ1
        mov     r3, #0xFF, 12
        mov     r0, #0
        orr     r2, r3, #3, 4
        mov     r5, r0
        mov     r9, r5
        mov     r4, r2
        mov     r6, r4
        mov     r3, r9
        str     r6, [sp, #0x24]
        str     r9, [sp, #0x20]
        str     r7, [sp, #0x1C]
        mov     r8, r3
        str     r12, [sp, #0x18]
        str     r1, [sp, #0x28]
        mov     r6, r0
        mov     r9, r2
        mov     r7, r3
LAKQ0:
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        str     r12, [sp, #0x2C]
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x14]
        mov     r3, r1
        ldr     r1, [sp, #0x10]
        bl      __subdf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        mov     r4, r0
        ldr     r0, [sp, #0xC]
        mov     r5, r1
        ldr     r1, [sp, #8]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [r10]
        ldr     r3, [r10, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r10]
        str     r1, [r10, #4]
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp]
        mov     r0, r7
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0x28]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r8
        mov     r1, r6
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
        mov     r0, r7
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp]
        mov     r7, r0
        mov     r9, r1
        mov     r0, r8
        mov     r1, r6
        bl      __muldf3
        mov     r2, r7
        mov     r3, r9
        bl      __adddf3
        ldr     r12, [sp, #0x18]
        add     r10, r10, #8
        sub     r11, r11, #8
        sub     r12, r12, #1
        cmn     r12, #1
        str     r12, [sp, #0x18]
        mov     r8, r0
        mov     r6, r1
        mov     r7, r5
        mov     r9, r4
        bne     LAKQ0
        ldr     r6, [sp, #0x24]
        ldr     r9, [sp, #0x20]
LAKQ1:
        cmp     r10, r11
        beq     LAKQ2
        mov     r0, r5
        mov     r1, r4
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r2, #0
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x14]
        mov     r3, r1
        ldr     r1, [sp, #0x10]
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #8]
        mov     r2, r9
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [r10]
        ldr     r3, [r10, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r10]
        str     r1, [r10, #4]
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r11]
        str     r1, [r11, #4]
LAKQ2:
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAKQ3:
        mvn     r0, #5
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAKQ4:
        str     r9, [r10]
        str     r9, [r10, #4]
        mov     r0, #0
        str     r9, [r12, #-8]
        str     r9, [r12, #-4]
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAKQ5:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


