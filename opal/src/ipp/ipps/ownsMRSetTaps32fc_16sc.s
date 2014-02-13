        .text
        .align  4
        .globl  ownsMRSetTaps32fc_16sc


ownsMRSetTaps32fc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        mov     r7, r1
        ldr     r3, [r7, #0x14]
        ldr     r2, [r7, #8]
        ldr     r9, [r7, #0x24]
        ldr     r4, [r7, #0x4C]
        ldr     r6, [r7, #0xC]
        str     r3, [sp, #0x24]
        ldr     r3, [r7, #0x10]
        cmp     r2, #0
        str     r3, [sp, #8]
        ldr     r3, [r7, #0x34]
        ldr     r11, [r7, #0x18]
        ldr     r10, [r7, #0x48]
        str     r3, [sp, #0x40]
        ldr     r5, [r7, #0x30]
        ldr     r12, [r7, #0x54]
        add     r3, r4, r9, lsl #4
        str     r2, [sp, #0x20]
        str     r3, [sp, #0x3C]
        ble     LBWZ3
        cmp     r2, #5
        movlt   r3, #0
        blt     LBWZ1
        mov     r3, #0
        sub     r1, r2, #5
        sub     r8, r0, #4
        sub     lr, r12, #4
        str     r0, [sp]
LBWZ0:
        ldr     r0, [r8, #4]
        add     r3, r3, #4
        cmp     r3, r1
        str     r0, [lr, #4]
        ldr     r0, [r8, #8]
        str     r0, [lr, #8]
        ldr     r0, [r8, #0xC]
        str     r0, [lr, #0xC]
        ldr     r0, [r8, #0x10]
        str     r0, [lr, #0x10]
        ldr     r0, [r8, #0x14]
        str     r0, [lr, #0x14]
        ldr     r0, [r8, #0x18]
        str     r0, [lr, #0x18]
        ldr     r0, [r8, #0x1C]
        str     r0, [lr, #0x1C]
        ldr     r0, [r8, #0x20]!
        str     r0, [lr, #0x20]!
        ble     LBWZ0
        ldr     r0, [sp]
LBWZ1:
        mov     lr, r3, lsl #3
        sub     r8, lr, #4
        add     lr, r8, r0
        add     r12, r8, r12
LBWZ2:
        ldr     r8, [lr, #4]
        add     r3, r3, #1
        cmp     r3, r2
        str     r8, [r12, #4]
        ldr     r8, [lr, #8]!
        str     r8, [r12, #8]!
        blt     LBWZ2
        ldr     r2, [r7, #8]
LBWZ3:
        mul     r3, r6, r10
        ldr     r1, [r7]
        str     r3, [sp, #0x28]
        bl      ownsCvt32fcToQ15
        sub     r0, r0, #0xE
        str     r0, [r7, #0x28]
        mov     r8, r6, lsl #2
        mov     r2, r8
        mov     r1, r5
        mvn     r0, #0
        bl      _ippsSet_32s
        mov     r2, r9, lsl #3
        mov     r1, r4
        mvn     r0, #0
        bl      _ippsSet_32s
        ldr     lr, [sp, #0x3C]
        ldr     r1, [sp, #8]
        ldr     r2, [sp, #0x20]
        mov     r0, #0
        str     r7, [sp, #4]
LBWZ4:
        cmp     r2, #0
        ble     LBWZ37
        cmp     r2, #6
        add     r3, r9, r1
        blt     LBWZ36
        mul     r3, r0, r3
        mov     r12, #0
        sub     r7, r2, #6
        str     r6, [sp, #0x30]
        add     r3, lr, r3, lsl #2
LBWZ5:
        str     r12, [r3, +r12, lsl #2]
        add     r6, r12, #1
        str     r6, [r3, +r6, lsl #2]
        add     r6, r12, #2
        str     r6, [r3, +r6, lsl #2]
        add     r6, r12, #3
        add     r2, r12, #4
        str     r6, [r3, +r6, lsl #2]
        add     r12, r12, #5
        cmp     r12, r7
        str     r2, [r3, +r2, lsl #2]
        ble     LBWZ5
        ldr     r6, [sp, #0x30]
        ldr     r2, [sp, #0x20]
LBWZ6:
        str     r12, [r3, +r12, lsl #2]
        add     r12, r12, #1
        cmp     r12, r2
        blt     LBWZ6
        add     r0, r0, #1
        cmp     r0, #4
        blt     LBWZ4
        ldr     r7, [sp, #4]
        str     lr, [sp, #0x3C]
LBWZ7:
        ldr     r0, [sp, #0x20]
        mov     r1, r6
        sub     r0, r0, #1
        bl      __intel_imod
        ldr     r3, [sp, #0x24]
        add     r3, r0, r3
        cmp     r3, r6
        movlt   lr, #1
        subge   r3, r3, r6
        movge   lr, #0
        cmp     r6, #0
        movle   r12, #0
        ble     LBWZ16
        mov     r0, r11
        cmp     r3, r0
        bge     LBWZ35
        mov     r12, #0
        mov     r2, r12
        mov     r1, r2
LBWZ8:
        add     r3, r6, r3
        cmp     r3, r0
        add     lr, lr, #1
        blt     LBWZ8
LBWZ9:
        str     r7, [sp, #4]
        ldr     r7, [sp, #8]
        str     r8, [sp]
        str     r4, [sp, #0x38]
        str     r5, [sp, #0x2C]
        str     r9, [sp, #0x34]
LBWZ10:
        cmp     r2, #0
        moveq   r12, lr
        mul     r4, r10, r2
        str     r10, [sp, #0x10]
        str     r11, [sp, #0xC]
        str     r6, [sp, #0x30]
        ldr     r6, [sp, #0x3C]
        ldr     r11, [sp, #0x28]
        ldr     r7, [sp, #0x38]
        ldr     r10, [sp, #0x34]
        mov     r5, #0
        sub     r0, r3, r0
        mov     r9, r5
        mov     r8, r1
        str     r12, [sp, #0x1C]
        str     r2, [sp, #0x18]
        str     r3, [sp, #0x14]
LBWZ11:
        mla     r12, r11, r9, r4
        cmp     r0, r10
        mov     r3, r0
        bge     LBWZ14
        mov     r2, lr
        str     r1, [sp, #0x20]
        str     lr, [sp, #0x24]
        ldr     r1, [sp, #0x2C]
        ldr     lr, [sp, #0x30]
LBWZ12:
        add     r11, r3, r5
        ldr     r11, [r6, +r11, lsl #2]
        cmn     r11, #1
        ble     LBWZ13
        str     r11, [r7, +r12, lsl #2]
        ldr     r11, [r1, +r8, lsl #2]
        cmn     r11, #1
        streq   r2, [r1, +r8, lsl #2]
        add     r12, r12, #1
LBWZ13:
        add     r3, lr, r3
        cmp     r3, r10
        add     r2, r2, #1
        blt     LBWZ12
        ldr     r1, [sp, #0x20]
        ldr     lr, [sp, #0x24]
        ldr     r11, [sp, #0x28]
LBWZ14:
        add     r9, r9, #1
        cmp     r9, #4
        add     r5, r5, r10
        add     r8, r8, #1
        add     r1, r1, #1
        blt     LBWZ11
        ldr     r2, [sp, #0x18]
        ldr     r6, [sp, #0x30]
        ldr     r12, [sp, #0x1C]
        ldr     r3, [sp, #0x14]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        ldr     r7, [sp, #8]
        add     r2, r2, #1
        cmp     r2, r6
        bge     LBWZ15
        mov     r0, r2, lsl #2
        mla     r0, r7, r0, r11
        cmp     r3, r0
        bge     LBWZ10
        ldr     r8, [sp]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x2C]
        ldr     r9, [sp, #0x34]
        ldr     r7, [sp, #4]
        b       LBWZ8
LBWZ15:
        ldr     r8, [sp]
        ldr     r4, [sp, #0x38]
        ldr     r5, [sp, #0x2C]
        ldr     r7, [sp, #4]
LBWZ16:
        ldr     r0, [sp, #8]
        mla     r11, r0, r8, r11
        cmp     r3, r11
        bge     LBWZ18
LBWZ17:
        add     r3, r6, r3
        cmp     r3, r11
        add     lr, lr, #1
        blt     LBWZ17
LBWZ18:
        ldr     r0, [r5]
        cmp     r0, #0
        strlt   r12, [r5]
        movlt   r0, r12
        sub     lr, lr, r0
        cmp     r8, #0
        str     lr, [r5, +r6, lsl #4]
        ble     LBWZ21
        mov     r0, #0
        mov     r3, r5
LBWZ19:
        ldr     r12, [r3]
        cmp     r12, #0
        blt     LBWZ34
LBWZ20:
        add     r0, r0, #1
        cmp     r0, r8
        add     r3, r3, #4
        blt     LBWZ19
LBWZ21:
        cmp     r6, #0
        ble     LBWZ28
        mov     r12, #0
        mov     r3, r12
        sub     r2, r10, #5
LBWZ22:
        ldr     r9, [sp, #0x3C]
        ldr     r1, [sp, #0x28]
        mov     r0, #0
        str     r7, [sp, #4]
LBWZ23:
        cmp     r10, #0
        ble     LBWZ33
        cmp     r10, #5
        blt     LBWZ32
        mul     r5, r0, r1
        mul     r11, r10, r3
        mov     lr, r12, lsl #2
        add     lr, lr, #4
        mov     r7, #0
        add     r5, r4, r5, lsl #2
        add     lr, lr, r9
        mov     r8, r11
        str     r4, [sp, #0x38]
        str     r10, [sp, #0x10]
        str     r6, [sp, #0x30]
LBWZ24:
        ldr     r6, [r5, +r8, lsl #2]
        mov     r10, r8, lsl #2
        add     r4, r10, #4
        str     r6, [lr, #-4]
        ldr     r4, [r5, +r4]
        add     r6, r10, #8
        add     r10, r10, #0xC
        str     r4, [lr]
        ldr     r6, [r5, +r6]
        add     r8, r8, #4
        add     r7, r7, #4
        str     r6, [lr, #4]
        ldr     r10, [r5, +r10]
        cmp     r7, r2
        add     r12, r12, #4
        str     r10, [lr, #8]
        add     lr, lr, #0x10
        ble     LBWZ24
        ldr     r4, [sp, #0x38]
        ldr     r10, [sp, #0x10]
        ldr     r6, [sp, #0x30]
LBWZ25:
        add     lr, r9, r12, lsl #2
        add     r11, r7, r11
LBWZ26:
        ldr     r8, [r5, +r11, lsl #2]
        add     r7, r7, #1
        cmp     r7, r10
        str     r8, [lr], #4
        add     r11, r11, #1
        add     r12, r12, #1
        blt     LBWZ26
        add     r0, r0, #1
        cmp     r0, #4
        blt     LBWZ23
        ldr     r7, [sp, #4]
        str     r9, [sp, #0x3C]
LBWZ27:
        add     r3, r3, #1
        cmp     r3, r6
        blt     LBWZ22
LBWZ28:
        ldr     r0, [sp, #0x28]
        mov     r0, r0, lsl #2
        cmp     r0, #0
        ble     LBWZ31
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        mov     r12, #0
LBWZ29:
        ldr     r4, [r2]
        cmn     r4, #1
        strleh  r12, [r3, #2]
        strleh  r12, [r3]
        ble     LBWZ30
        ldr     lr, [r7]
        mov     r4, r4, lsl #2
        ldrsh   r4, [lr, +r4]
        strh    r4, [r3]
        ldr     lr, [r2]
        ldr     r4, [r7]
        add     lr, r4, lr, lsl #2
        ldrsh   lr, [lr, #2]
        strh    lr, [r3, #2]
LBWZ30:
        subs    r0, r0, #1
        add     r3, r3, #4
        add     r2, r2, #4
        bne     LBWZ29
LBWZ31:
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LBWZ32:
        mul     lr, r0, r1
        mul     r11, r10, r3
        mov     r7, #0
        add     r5, r4, lr, lsl #2
        b       LBWZ25
LBWZ33:
        add     r0, r0, #1
        cmp     r0, #4
        blt     LBWZ23
        ldr     r7, [sp, #4]
        str     r9, [sp, #0x3C]
        b       LBWZ27
LBWZ34:
        sub     r12, r5, #4
        ldr     r12, [r12, +r0, lsl #2]
        str     r12, [r3]
        b       LBWZ20
LBWZ35:
        mov     r12, #0
        mov     r2, r12
        mov     r1, r2
        b       LBWZ9
LBWZ36:
        mul     r3, r0, r3
        mov     r12, #0
        add     r3, lr, r3, lsl #2
        b       LBWZ6
LBWZ37:
        add     r0, r0, #1
        cmp     r0, #4
        blt     LBWZ4
        ldr     r7, [sp, #4]
        str     lr, [sp, #0x3C]
        b       LBWZ7


