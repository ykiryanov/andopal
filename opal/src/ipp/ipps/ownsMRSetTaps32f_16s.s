        .text
        .align  4
        .globl  ownsMRSetTaps32f_16s


ownsMRSetTaps32f_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        mov     r7, r1
        ldr     r3, [r7, #0x14]
        ldr     r11, [r7, #8]
        ldr     r4, [r7, #0xC]
        str     r3, [sp, #4]
        ldr     r3, [r7, #0x10]
        cmp     r11, #0
        str     r3, [sp]
        ldr     r3, [r7, #0x24]
        ldr     r9, [r7, #0x18]
        str     r3, [sp, #8]
        ldr     r3, [r7, #0x34]
        str     r3, [sp, #0x30]
        ldr     r6, [r7, #0x30]
        ldr     r5, [r7, #0x4C]
        ldr     r3, [r7, #0x54]
        ble     LBXA3
        cmp     r11, #6
        movlt   r10, #0
        blt     LBXA1
        mov     r10, #0
        sub     r8, r11, #6
        add     lr, r0, #4
        add     r12, r3, #4
LBXA0:
        ldr     r1, [lr, #-4]
        add     r10, r10, #5
        cmp     r10, r8
        str     r1, [r12, #-4]
        ldr     r1, [lr]
        str     r1, [r12]
        ldr     r1, [lr, #4]
        str     r1, [r12, #4]
        ldr     r1, [lr, #8]
        str     r1, [r12, #8]
        ldr     r1, [lr, #0xC]
        add     lr, lr, #0x14
        str     r1, [r12, #0xC]
        add     r12, r12, #0x14
        ble     LBXA0
LBXA1:
        add     r3, r3, r10, lsl #2
        add     r12, r0, r10, lsl #2
LBXA2:
        ldr     lr, [r12], #4
        add     r10, r10, #1
        cmp     r10, r11
        str     lr, [r3], #4
        blt     LBXA2
LBXA3:
        ldr     r1, [r7]
        mov     r2, r11
        bl      ownsCvt32fToQ15
        sub     r0, r0, #0xE
        str     r0, [r7, #0x28]
        add     r0, r11, r4
        sub     r0, r0, #1
        mov     r1, r4
        bl      __intel_idiv
        mul     r3, r4, r0
        str     r0, [sp, #0x14]
        mov     r1, r5
        mov     r8, r4, lsl #2
        str     r3, [sp, #0x10]
        add     r3, r0, #1
        bic     r3, r3, #1
        mul     r10, r4, r3
        sub     r3, r3, r0
        str     r3, [sp, #0x24]
        ldr     r3, [sp, #8]
        mvn     r0, #0
        cmp     r10, r3
        movgt   r3, r10
        str     r3, [sp, #0x3C]
        mov     r3, #0
        str     r3, [sp, #0x28]
        ldr     r3, [sp, #0x3C]
        mov     r2, r3, lsl #3
        bl      _ippsSet_32s
        ldr     r3, [sp, #0x3C]
        mov     r2, r8
        mov     r1, r6
        add     r3, r5, r3, lsl #4
        str     r3, [sp, #0x2C]
        mvn     r0, #0
        bl      _ippsSet_32s
        str     r7, [sp, #0x20]
        ldr     r12, [sp, #0x2C]
        ldr     r7, [sp, #0x28]
        ldr     r1, [sp, #8]
        ldr     r2, [sp]
LBXA4:
        cmp     r11, #0
        ble     LBXA39
        cmp     r11, #6
        add     r0, r1, r2
        blt     LBXA38
        mul     r0, r7, r0
        mov     r3, #0
        sub     lr, r11, #6
        str     r4, [sp, #0x1C]
        add     r0, r12, r0, lsl #2
        str     r11, [sp, #0x40]
LBXA5:
        str     r3, [r0, +r3, lsl #2]
        add     r4, r3, #1
        str     r4, [r0, +r4, lsl #2]
        add     r4, r3, #2
        str     r4, [r0, +r4, lsl #2]
        add     r4, r3, #3
        add     r11, r3, #4
        str     r4, [r0, +r4, lsl #2]
        add     r3, r3, #5
        cmp     r3, lr
        str     r11, [r0, +r11, lsl #2]
        ble     LBXA5
        ldr     r4, [sp, #0x1C]
        ldr     r11, [sp, #0x40]
LBXA6:
        str     r3, [r0, +r3, lsl #2]
        add     r3, r3, #1
        cmp     r3, r11
        blt     LBXA6
        add     r7, r7, #1
        cmp     r7, #4
        blt     LBXA4
        ldr     r7, [sp, #0x20]
        str     r12, [sp, #0x2C]
LBXA7:
        sub     r0, r11, #1
        mov     r1, r4
        bl      __intel_imod
        ldr     r3, [sp, #4]
        add     r3, r0, r3
        cmp     r3, r4
        movlt   lr, #1
        subge   r3, r3, r4
        movge   lr, #0
        cmp     r4, #0
        movle   r12, #0
        ble     LBXA16
        mov     r0, r9
        cmp     r3, r0
        bge     LBXA37
        mov     r12, #0
        mov     r1, r12
        mov     r11, r1
LBXA8:
        add     r3, r4, r3
        cmp     r3, r0
        add     lr, lr, #1
        blt     LBXA8
LBXA9:
        str     r6, [sp, #0x34]
        str     r7, [sp, #0x20]
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp]
        str     r8, [sp, #0x44]
        str     r10, [sp, #0xC]
        str     r5, [sp, #0x18]
LBXA10:
        cmp     r1, #0
        moveq   r12, lr
        mul     r2, r6, r1
        str     r9, [sp, #0x48]
        str     r4, [sp, #0x1C]
        ldr     r4, [sp, #0x2C]
        ldr     r9, [sp, #0x10]
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #8]
        mov     r5, #0
        sub     r0, r3, r0
        mov     r10, r5
        mov     r8, r11
        str     r12, [sp, #0x38]
        str     r1, [sp, #0x3C]
        str     r3, [sp, #0x40]
LBXA11:
        mla     r12, r9, r10, r2
        cmp     r0, r7
        mov     r3, r0
        bge     LBXA14
        mov     r1, lr
        str     lr, [sp, #0x28]
        ldr     lr, [sp, #0x34]
        ldr     r9, [sp, #0x1C]
        str     r11, [sp, #4]
LBXA12:
        add     r11, r3, r5
        ldr     r11, [r4, +r11, lsl #2]
        cmn     r11, #1
        ble     LBXA13
        str     r11, [r6, +r12, lsl #2]
        ldr     r11, [lr, +r8, lsl #2]
        cmn     r11, #1
        streq   r1, [lr, +r8, lsl #2]
        add     r12, r12, #1
LBXA13:
        add     r3, r9, r3
        cmp     r3, r7
        add     r1, r1, #1
        blt     LBXA12
        ldr     r11, [sp, #4]
        ldr     lr, [sp, #0x28]
        ldr     r9, [sp, #0x10]
LBXA14:
        add     r10, r10, #1
        cmp     r10, #4
        add     r5, r5, r7
        add     r8, r8, #1
        add     r11, r11, #1
        blt     LBXA11
        ldr     r1, [sp, #0x3C]
        ldr     r4, [sp, #0x1C]
        ldr     r12, [sp, #0x38]
        ldr     r3, [sp, #0x40]
        ldr     r6, [sp, #0x14]
        ldr     r9, [sp, #0x48]
        ldr     r7, [sp]
        add     r1, r1, #1
        cmp     r1, r4
        bge     LBXA15
        mov     r0, r1, lsl #2
        mla     r0, r7, r0, r9
        cmp     r3, r0
        bge     LBXA10
        ldr     r8, [sp, #0x44]
        ldr     r10, [sp, #0xC]
        ldr     r5, [sp, #0x18]
        ldr     r6, [sp, #0x34]
        ldr     r7, [sp, #0x20]
        b       LBXA8
LBXA15:
        ldr     r8, [sp, #0x44]
        ldr     r10, [sp, #0xC]
        ldr     r5, [sp, #0x18]
        ldr     r6, [sp, #0x34]
        ldr     r7, [sp, #0x20]
LBXA16:
        ldr     r0, [sp]
        mla     r9, r0, r8, r9
        cmp     r3, r9
        bge     LBXA18
LBXA17:
        add     r3, r4, r3
        cmp     r3, r9
        add     lr, lr, #1
        blt     LBXA17
LBXA18:
        ldr     r0, [r6]
        cmp     r0, #0
        strlt   r12, [r6]
        movlt   r0, r12
        sub     lr, lr, r0
        cmp     r8, #0
        str     lr, [r6, +r4, lsl #4]
        mov     r0, #0
        ble     LBXA21
        mov     r3, r0
        mov     r12, r6
LBXA19:
        ldr     lr, [r12]
        cmp     lr, #0
        blt     LBXA36
LBXA20:
        add     r3, r3, #1
        cmp     r3, r8
        add     r12, r12, #4
        blt     LBXA19
LBXA21:
        cmp     r4, #0
        ble     LBXA32
        mov     r2, r0
        ldr     r3, [sp, #0x24]
        ldr     r12, [sp, #0x14]
        ldr     r6, [sp, #0x24]
        sub     r3, r3, #6
        str     r3, [sp, #8]
        str     r10, [sp, #0xC]
        ldr     r3, [sp, #0x2C]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        sub     r12, r12, #5
        mvn     lr, #0
        str     lr, [sp]
        str     r12, [sp, #4]
        str     r7, [sp, #0x20]
LBXA22:
        mov     lr, #0
        mov     r12, #4
        str     r4, [sp, #0x1C]
LBXA23:
        cmp     r11, #0
        ble     LBXA27
        cmp     r11, #5
        movlt   r9, #0
        addlt   r8, r5, lr, lsl #2
        blt     LBXA25
        mov     r4, r2, lsl #2
        add     r8, r5, lr, lsl #2
        str     r5, [sp, #0x18]
        ldr     r5, [sp, #4]
        add     r4, r4, #4
        mov     r9, #0
        add     r4, r4, r3
        mov     r7, r0
LBXA24:
        ldr     r10, [r8, +r7, lsl #2]
        mov     r11, r7, lsl #2
        add     r1, r11, #4
        str     r10, [r4, #-4]
        ldr     r1, [r8, +r1]
        add     r10, r11, #8
        add     r11, r11, #0xC
        str     r1, [r4]
        ldr     r10, [r8, +r10]
        add     r7, r7, #4
        add     r9, r9, #4
        str     r10, [r4, #4]
        ldr     r11, [r8, +r11]
        cmp     r9, r5
        add     r2, r2, #4
        str     r11, [r4, #8]
        add     r4, r4, #0x10
        ble     LBXA24
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        ldr     r5, [sp, #0x18]
LBXA25:
        add     r7, r3, r2, lsl #2
        add     r4, r9, r0
LBXA26:
        ldr     r1, [r8, +r4, lsl #2]
        add     r9, r9, #1
        cmp     r9, r11
        str     r1, [r7], #4
        add     r4, r4, #1
        add     r2, r2, #1
        blt     LBXA26
LBXA27:
        cmp     r6, #0
        ble     LBXA31
        cmp     r6, #6
        movlt   r4, #0
        blt     LBXA29
        ldr     r8, [sp]
        ldr     r9, [sp, #8]
        mov     r4, r2, lsl #2
        add     r7, r4, #4
        mov     r4, #0
        add     r7, r7, r3
LBXA28:
        add     r4, r4, #5
        str     r8, [r7, #-4]
        str     r8, [r7]
        str     r8, [r7, #4]
        str     r8, [r7, #8]
        str     r8, [r7, #0xC]
        cmp     r4, r9
        add     r7, r7, #0x14
        add     r2, r2, #5
        ble     LBXA28
LBXA29:
        ldr     r7, [sp]
        add     r8, r3, r2, lsl #2
LBXA30:
        add     r4, r4, #1
        str     r7, [r8], #4
        cmp     r4, r6
        add     r2, r2, #1
        blt     LBXA30
LBXA31:
        subs    r12, r12, #1
        add     lr, lr, r10
        bne     LBXA23
        ldr     r4, [sp, #0x1C]
        add     r0, r0, r11
        subs    r4, r4, #1
        bne     LBXA22
        ldr     r10, [sp, #0xC]
        ldr     r7, [sp, #0x20]
        str     r3, [sp, #0x2C]
LBXA32:
        mov     r10, r10, lsl #2
        cmp     r10, #0
        ble     LBXA35
        ldr     r2, [sp, #0x2C]
        ldr     r0, [sp, #0x30]
LBXA33:
        ldr     r12, [r2], #4
        cmn     r12, #1
        movle   r12, #0
        ble     LBXA34
        ldr     r3, [r7]
        mov     r12, r12, lsl #1
        ldrsh   r12, [r3, +r12]
LBXA34:
        strh    r12, [r0], #2
        subs    r10, r10, #1
        bne     LBXA33
LBXA35:
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBXA36:
        sub     lr, r6, #4
        ldr     lr, [lr, +r3, lsl #2]
        str     lr, [r12]
        b       LBXA20
LBXA37:
        mov     r12, #0
        mov     r1, r12
        mov     r11, r1
        b       LBXA9
LBXA38:
        mul     r0, r7, r0
        mov     r3, #0
        add     r0, r12, r0, lsl #2
        b       LBXA6
LBXA39:
        add     r7, r7, #1
        cmp     r7, #4
        blt     LBXA4
        ldr     r7, [sp, #0x20]
        str     r12, [sp, #0x2C]
        b       LBXA7


