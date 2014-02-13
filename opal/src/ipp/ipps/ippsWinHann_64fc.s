        .text
        .align  4
        .globl  _ippsWinHann_64fc


_ippsWinHann_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r5, r2
        beq     LAKH4
        cmp     r8, #0
        beq     LAKH4
        cmp     r5, #3
        blt     LAKH2
        sub     r7, r5, #1
        mov     r0, r7
        bl      __floatsidf
        ldr     r6, [pc, #0x318]
        ldr     r4, [pc, #0x318]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r4
        bl      __divdf3
        bl      cos
        mov     r3, r1
        mov     r6, r0
        str     r3, [sp]
        mov     r2, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r12, #0xFF, 12
        orr     r4, r12, #3, 4
        mov     r0, #0
        mov     r1, r4
        bl      __subdf3
        bl      sqrt
        cmp     r7, #0
        mov     r2, #0
        mov     r3, r2
        mov     r12, #1
        movlt   r3, r12
        add     r3, r5, r3
        sub     r3, r3, #1
        movs    r12, r3, asr #1
        add     r3, r9, r5, lsl #4
        add     r5, r8, r5, lsl #4
        sub     r11, r3, #0x10
        sub     r10, r5, #0x10
        sub     r3, r12, #1
        moveq   r5, r2
        moveq   r7, r4
        beq     LAKH1
        mov     r5, r2
        mov     r7, r4
        mov     lr, r5
        str     r6, [sp, #0x10]
        mov     r12, lr
        mov     r6, r4
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x18]
        str     r3, [sp, #4]
        str     r1, [sp, #8]
        str     r0, [sp, #0xC]
        mov     r4, r2
LAKH0:
        mov     r2, #0
        mov     r0, r5
        mov     r1, r7
        mov     r3, #0xFF, 12
        orr     r3, r3, #3, 4
        sub     r5, r3, #1, 12
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r5, r0
        mov     r7, r1
        bl      __muldf3
        str     r1, [r8, #4]
        str     r0, [r8]
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        mov     r1, r7
        mov     r0, r5
        bl      __muldf3
        str     r0, [r8, #8]
        str     r1, [r8, #0xC]
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        mov     r1, r7
        mov     r0, r5
        bl      __muldf3
        str     r1, [r10, #4]
        str     r0, [r10]
        ldr     r2, [r11, #8]
        ldr     r3, [r11, #0xC]
        mov     r1, r7
        mov     r0, r5
        bl      __muldf3
        str     r1, [r10, #0xC]
        str     r0, [r10, #8]
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp]
        ldr     r0, [sp, #0x18]
        mov     r1, r6
        bl      __muldf3
        mov     r5, r0
        ldr     r0, [sp, #0x14]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        mov     r7, r1
        mov     r1, r4
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r7
        bl      __subdf3
        mov     r5, r0
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        mov     r7, r1
        mov     r1, r6
        bl      __muldf3
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp]
        mov     r6, r1
        mov     r1, r4
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        mov     r3, r6
        bl      __adddf3
        ldr     r3, [sp, #4]
        add     r9, r9, #0x10
        sub     r3, r3, #1
        cmn     r3, #1
        str     r3, [sp, #4]
        sub     r11, r11, #0x10
        add     r8, r8, #0x10
        sub     r10, r10, #0x10
        str     r0, [sp, #0x14]
        mov     r4, r1
        str     r5, [sp, #0x18]
        mov     r6, r7
        bne     LAKH0
LAKH1:
        cmp     r8, r10
        beq     LAKH3
        mov     r0, r5
        mov     r1, r7
        mov     r3, #0xFF, 12
        mov     r2, #0
        orr     r3, r3, #3, 4
        sub     r4, r3, #1, 12
        mov     r3, r4
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r4
        mov     r0, #0
        bl      __subdf3
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r8, #8]
        str     r1, [r8, #0xC]
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r10]
        str     r1, [r10, #4]
        ldr     r2, [r11, #8]
        ldr     r3, [r11, #0xC]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAKH2:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAKH3:
        ldr     r2, [r9, #4]
        ldr     r3, [r9]
        str     r2, [r8, #4]
        str     r3, [r8]
        ldr     r2, [r9, #8]
        ldr     r9, [r9, #0xC]
        str     r2, [r8, #8]
        str     r9, [r8, #0xC]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAKH4:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


