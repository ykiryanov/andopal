        .text
        .align  4
        .globl  _ippsFilterMedian_32s_I


_ippsFilterMedian_32s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        mov     r7, r0
        cmp     r7, #0
        mov     r8, r1
        mov     r6, r2
        beq     LBHQ85
        cmp     r8, #0
        ble     LBHQ84
        cmp     r6, #0
        ble     LBHQ84
        tst     r6, #1
        mov     r9, #0
        movne   r5, r9
        subeq   r6, r6, #1
        moveq   r5, #5
        cmp     r6, #1
        beq     LBHQ83
        cmp     r8, #2
        ble     LBHQ83
        cmp     r6, #3
        beq     LBHQ75
        cmp     r6, #5
        bne     LBHQ10
        ldr     lr, [r7]
        add     r6, sp, #0x28
        ldr     r4, [r7, #4]
        str     lr, [r6]
        ldr     r6, [r7, #8]
        add     r12, sp, #0x28
        sub     r8, r8, #3
        add     r3, sp, #0x28
        add     r2, sp, #0x28
        str     lr, [r12, #4]
        cmp     r8, #0
        str     r4, [r3, #8]
        str     r6, [r2, #0xC]
        mov     lr, #4
        add     r1, r7, #4
        add     r11, r7, #8
        addle   r4, sp, #0x38
        ble     LBHQ5
        add     r10, sp, #0x28
        add     r4, r10, #0x10
        add     r7, r7, #0xC
        mov     r6, r1
        str     r4, [sp]
        str     r11, [sp, #4]
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
LBHQ0:
        ldr     r4, [r7], #4
        add     r1, sp, #0x28
        add     r0, sp, #0x28
        str     r4, [r1, +lr, lsl #2]
        ldr     r0, [r0]
        ldr     r1, [r12, #4]
        cmp     r1, r0
        movlt   r5, #0
        movlt   r4, #1
        movge   r4, #0
        movge   r5, #1
        ldr     r0, [r3, #8]
        ldr     r1, [r2, #0xC]
        cmp     r1, r0
        movlt   r1, #2
        movlt   r10, #3
        movge   r10, #2
        movge   r1, #3
        add     r0, sp, #0x28
        ldr     r0, [r0, +r4, lsl #2]
        add     r11, sp, #0x28
        ldr     r11, [r11, +r10, lsl #2]
        cmp     r11, r0
        ble     LBHQ1
        add     r0, sp, #0x28
        ldr     r0, [r0, +r10, lsl #2]
        mov     r4, r10
LBHQ1:
        add     r10, sp, #0x28
        ldr     r10, [r10, +r5, lsl #2]
        add     r11, sp, #0x28
        ldr     r11, [r11, +r1, lsl #2]
        cmp     r11, r10
        bge     LBHQ2
        add     r10, sp, #0x28
        ldr     r10, [r10, +r1, lsl #2]
        mov     r5, r1
LBHQ2:
        cmp     r10, r0
        bge     LBHQ3
        mov     r0, r4
        add     r1, sp, #0x28
        ldr     r10, [r1, +r0, lsl #2]
        mov     r4, r5
LBHQ3:
        add     r0, sp, #0x28
        ldr     r0, [r0, #0x10]
        cmp     r0, r10
        bge     LBHQ4
        add     r1, sp, #0x28
        ldr     r1, [r1, +r4, lsl #2]
        cmp     r0, r1
        movge   r4, #4
        add     r0, sp, #0x28
        ldr     r10, [r0, +r4, lsl #2]
LBHQ4:
        add     lr, lr, #1
        str     r10, [r6], #4
        cmp     lr, #4
        movgt   lr, #0
        add     r9, r9, #1
        cmp     r9, r8
        blt     LBHQ0
        ldr     r4, [sp]
        ldr     r11, [sp, #4]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
LBHQ5:
        ldr     r11, [r11, +r9, lsl #2]
        add     r7, sp, #0x28
        add     r6, sp, #0x28
        str     r11, [r7, +lr, lsl #2]
        ldr     r12, [r12, #4]
        ldr     r6, [r6]
        mov     r9, r9, lsl #2
        mov     lr, #0
        cmp     r12, r6
        movlt   r12, #1
        movge   r12, lr
        movge   lr, #1
        ldr     r6, [r3, #8]
        ldr     r2, [r2, #0xC]
        mov     r3, #2
        cmp     r2, r6
        movlt   r6, #3
        movge   r6, r3
        movge   r3, #3
        add     r2, sp, #0x28
        add     r7, sp, #0x28
        ldr     r2, [r2, +r12, lsl #2]
        ldr     r7, [r7, +r6, lsl #2]
        cmp     r7, r2
        ble     LBHQ6
        add     r2, sp, #0x28
        ldr     r2, [r2, +r6, lsl #2]
        mov     r12, r6
LBHQ6:
        add     r6, sp, #0x28
        add     r7, sp, #0x28
        ldr     r6, [r6, +lr, lsl #2]
        ldr     r7, [r7, +r3, lsl #2]
        cmp     r7, r6
        bge     LBHQ7
        add     r6, sp, #0x28
        ldr     r6, [r6, +r3, lsl #2]
        mov     lr, r3
LBHQ7:
        cmp     r6, r2
        bge     LBHQ8
        mov     r3, r12
        add     r2, sp, #0x28
        ldr     r6, [r2, +r3, lsl #2]
        mov     r12, lr
LBHQ8:
        ldr     r4, [r4]
        cmp     r4, r6
        bge     LBHQ9
        add     r2, sp, #0x28
        ldr     r2, [r2, +r12, lsl #2]
        cmp     r4, r2
        movge   r12, #4
        add     r2, sp, #0x28
        ldr     r6, [r2, +r12, lsl #2]
LBHQ9:
        mov     r0, r5
        str     r6, [r1, +r9]
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHQ10:
        add     r3, r6, #7
        bic     r11, r3, #7
        mov     r10, r6, asr #1
        mov     r0, r11, lsl #1
        bl      _ippsMalloc_32s
        mov     r4, r0
        cmp     r4, #0
        beq     LBHQ86
        add     r11, r4, r11, lsl #2
        cmp     r10, #0
        sub     r8, r8, #1
        str     r11, [sp, #0x1C]
        ble     LBHQ14
        cmp     r10, #6
        blt     LBHQ12
        ldr     r3, [sp, #0x1C]
        sub     lr, r10, #6
        add     r12, r4, #4
        add     r3, r3, #4
LBHQ11:
        ldr     r11, [r7]
        add     r9, r9, #5
        cmp     r9, lr
        str     r11, [r12, #-4]
        str     r11, [r3, #-4]
        ldr     r11, [r7]
        str     r11, [r12]
        str     r11, [r3]
        ldr     r11, [r7]
        str     r11, [r12, #4]
        str     r11, [r3, #4]
        ldr     r11, [r7]
        str     r11, [r12, #8]
        str     r11, [r3, #8]
        ldr     r11, [r7]
        str     r11, [r12, #0xC]
        add     r12, r12, #0x14
        str     r11, [r3, #0xC]
        add     r3, r3, #0x14
        ble     LBHQ11
LBHQ12:
        ldr     r12, [sp, #0x1C]
        add     r3, r4, r9, lsl #2
        add     r12, r12, r9, lsl #2
LBHQ13:
        ldr     lr, [r7]
        add     r9, r9, #1
        cmp     r9, r10
        str     lr, [r3], #4
        str     lr, [r12], #4
        blt     LBHQ13
LBHQ14:
        cmp     r9, r6
        mov     r11, #0
        bge     LBHQ18
        sub     r3, r6, r9
        cmp     r3, #5
        blt     LBHQ16
        ldr     r3, [sp, #0x1C]
LBHQ15:
        cmp     r11, r8
        bgt     LBHQ71
        ldr     r12, [r7, +r11, lsl #2]
        add     r11, r11, #1
        cmp     r11, r8
        str     r12, [r4, +r9, lsl #2]
        str     r12, [r3, +r9, lsl #2]
        add     r9, r9, #1
        bgt     LBHQ71
        ldr     r12, [r7, +r11, lsl #2]
        add     r11, r11, #1
        cmp     r11, r8
        str     r12, [r4, +r9, lsl #2]
        str     r12, [r3, +r9, lsl #2]
        add     r9, r9, #1
        bgt     LBHQ71
        ldr     r12, [r7, +r11, lsl #2]
        add     r11, r11, #1
        cmp     r11, r8
        str     r12, [r4, +r9, lsl #2]
        str     r12, [r3, +r9, lsl #2]
        add     r9, r9, #1
        bgt     LBHQ71
        ldr     r12, [r7, +r11, lsl #2]
        add     r11, r11, #1
        str     r12, [r4, +r9, lsl #2]
        str     r12, [r3, +r9, lsl #2]
        add     r9, r9, #1
        sub     r12, r6, #5
        cmp     r9, r12
        ble     LBHQ15
LBHQ16:
        ldr     r12, [sp, #0x1C]
        add     r3, r4, r9, lsl #2
        add     lr, r7, r11, lsl #2
        add     r12, r12, r9, lsl #2
LBHQ17:
        cmp     r11, r8
        bgt     LBHQ71
        ldr     r0, [lr], #4
        add     r9, r9, #1
        str     r0, [r3], #4
        str     r0, [r12], #4
        cmp     r9, r6
        add     r11, r11, #1
        blt     LBHQ17
LBHQ18:
        mov     r1, r6
        mov     r0, r4
        bl      ownippsIpp32sSort
        cmp     r11, r8
        mov     r12, #1
        mov     r3, #0
        bgt     LBHQ30
        add     r2, r4, #4
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        sub     r1, r4, #4
        sub     r0, r6, #5
        add     r9, r7, r11, lsl #2
        add     lr, r7, #4
        str     r0, [sp, #0x24]
        str     r1, [sp, #4]
        str     r5, [sp, #0xC]
        str     r7, [sp]
LBHQ19:
        ldr     r5, [r2, +r3, lsl #2]
        ldr     r7, [r4]
        mov     r1, r3, lsl #2
        cmp     r7, r5
        moveq   r5, #0
        moveq   r7, r5
        beq     LBHQ21
        mov     r0, r4
        str     r6, [sp, #0x10]
        mov     r7, #0
        mov     r6, r5
LBHQ20:
        add     r0, r0, #4
        ldr     r5, [r0]
        add     r7, r7, #1
        cmp     r5, r6
        mov     r5, r7, lsl #2
        bne     LBHQ20
        ldr     r6, [sp, #0x10]
LBHQ21:
        ldr     r0, [r9], #4
        str     r0, [r2, +r1]
        ldr     r5, [r5, +r4]
        cmp     r0, r5
        blt     LBHQ23
        add     r7, r7, #1
        cmp     r7, r6
        movge   r5, r7, lsl #2
        bge     LBHQ28
        sub     r5, r6, r7
        cmp     r5, #5
        blt     LBHQ26
        str     r8, [sp, #0x14]
        str     r6, [sp, #0x10]
        ldr     r6, [sp, #0x24]
        ldr     r8, [sp, #4]
        str     r11, [sp, #8]
        str     r10, [sp, #0x18]
LBHQ22:
        ldr     r10, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r10, r0
        bge     LBHQ61
        str     r10, [r8, +r5]
        add     r10, r7, #1
        ldr     r0, [r2, +r1]
        ldr     r11, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r11, r0
        bge     LBHQ60
        str     r11, [r8, +r10, lsl #2]
        add     r10, r7, #2
        ldr     r0, [r2, +r1]
        ldr     r11, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r11, r0
        bge     LBHQ59
        str     r11, [r8, +r10, lsl #2]
        add     r10, r7, #3
        ldr     r0, [r2, +r1]
        ldr     r11, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r11, r0
        bge     LBHQ58
        add     r7, r7, #4
        cmp     r7, r6
        str     r11, [r8, +r10, lsl #2]
        ldrle   r0, [r2, +r1]
        ble     LBHQ22
        b       LBHQ25
LBHQ23:
        subs    r7, r7, #1
        movmi   r5, r7, lsl #2
        bmi     LBHQ65
        cmp     r7, #5
        blt     LBHQ63
        str     r6, [sp, #0x10]
        ldr     r6, [sp, #0x20]
        str     r8, [sp, #0x14]
        str     r10, [sp, #0x18]
LBHQ24:
        ldr     r8, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r8, r0
        ble     LBHQ70
        str     r8, [r6, +r5]
        sub     r7, r7, #1
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r8, r0
        ble     LBHQ69
        str     r8, [r6, +r7, lsl #2]
        sub     r7, r7, #1
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r8, r0
        ble     LBHQ68
        str     r8, [r6, +r7, lsl #2]
        sub     r8, r7, #1
        ldr     r0, [r2, +r1]
        ldr     r10, [r4, +r8, lsl #2]
        mov     r5, r8, lsl #2
        cmp     r10, r0
        ble     LBHQ67
        sub     r7, r8, #1
        cmp     r7, #5
        str     r10, [r6, +r8, lsl #2]
        ldrge   r0, [r2, +r1]
        bge     LBHQ24
        b       LBHQ62
LBHQ25:
        str     r6, [sp, #0x24]
        str     r8, [sp, #4]
        ldr     r11, [sp, #8]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r0, [r2, +r1]
LBHQ26:
        str     r8, [sp, #0x14]
        ldr     r8, [sp, #4]
        str     r10, [sp, #0x18]
LBHQ27:
        ldr     r10, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r10, r0
        bge     LBHQ57
        add     r7, r7, #1
        cmp     r7, r6
        str     r10, [r8, +r5]
        ldrlt   r0, [r2, +r1]
        blt     LBHQ27
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r0, [r2, +r1]
        mov     r5, r7, lsl #2
LBHQ28:
        ldr     r7, [sp, #4]
        str     r0, [r7, +r5]
LBHQ29:
        ldr     r5, [r4, +r10, lsl #2]
        add     r3, r3, #1
        cmp     r3, r6
        str     r5, [lr], #4
        movge   r3, #0
        add     r11, r11, #1
        cmp     r11, r8
        add     r12, r12, #1
        ble     LBHQ19
        ldr     r5, [sp, #0xC]
        ldr     r7, [sp]
LBHQ30:
        cmp     r12, r8
        bge     LBHQ42
        ldr     r2, [sp, #0x1C]
        sub     r0, r4, #4
        sub     r11, r6, #5
        add     r9, r4, #4
        add     lr, r7, r12, lsl #2
        str     r11, [sp, #8]
        str     r0, [sp, #4]
        str     r5, [sp, #0xC]
LBHQ31:
        ldr     r5, [r2, +r3, lsl #2]
        ldr     r11, [r4]
        mov     r1, r3, lsl #2
        cmp     r11, r5
        moveq   r5, #0
        moveq   r11, r5
        beq     LBHQ33
        mov     r0, r4
        str     r7, [sp]
        mov     r11, #0
        mov     r7, r5
LBHQ32:
        add     r0, r0, #4
        ldr     r5, [r0]
        add     r11, r11, #1
        cmp     r5, r7
        mov     r5, r11, lsl #2
        bne     LBHQ32
        ldr     r7, [sp]
LBHQ33:
        ldr     r0, [r7, +r8, lsl #2]
        str     r0, [r2, +r1]
        ldr     r5, [r5, +r4]
        cmp     r0, r5
        blt     LBHQ35
        add     r11, r11, #1
        cmp     r11, r6
        movge   r5, r11, lsl #2
        bge     LBHQ40
        sub     r5, r6, r11
        cmp     r5, #5
        blt     LBHQ38
        str     r6, [sp, #0x10]
        str     r7, [sp]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #4]
        str     r8, [sp, #0x14]
        str     r10, [sp, #0x18]
LBHQ34:
        ldr     r8, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r8, r0
        bge     LBHQ47
        str     r8, [r7, +r5]
        add     r10, r11, #1
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r8, r0
        bge     LBHQ46
        str     r8, [r7, +r10, lsl #2]
        add     r10, r11, #2
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r8, r0
        bge     LBHQ45
        str     r8, [r7, +r10, lsl #2]
        add     r10, r11, #3
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r8, r0
        bge     LBHQ44
        add     r11, r11, #4
        cmp     r11, r6
        str     r8, [r7, +r10, lsl #2]
        ldrle   r0, [r2, +r1]
        ble     LBHQ34
        b       LBHQ37
LBHQ35:
        sub     r11, r11, #1
        cmp     r11, #0
        movle   r5, r11, lsl #2
        ble     LBHQ51
        cmp     r11, #5
        blt     LBHQ49
        str     r6, [sp, #0x10]
        str     r7, [sp]
LBHQ36:
        ldr     r6, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r6, r0
        ble     LBHQ56
        str     r6, [r9, +r5]
        sub     r11, r11, #1
        ldr     r0, [r2, +r1]
        ldr     r6, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r6, r0
        ble     LBHQ55
        str     r6, [r9, +r11, lsl #2]
        sub     r11, r11, #1
        ldr     r0, [r2, +r1]
        ldr     r6, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r6, r0
        ble     LBHQ54
        str     r6, [r9, +r11, lsl #2]
        sub     r6, r11, #1
        ldr     r0, [r2, +r1]
        ldr     r7, [r4, +r6, lsl #2]
        mov     r5, r6, lsl #2
        cmp     r7, r0
        ble     LBHQ53
        sub     r11, r6, #1
        cmp     r11, #5
        str     r7, [r9, +r6, lsl #2]
        ldrge   r0, [r2, +r1]
        bge     LBHQ36
        b       LBHQ48
LBHQ37:
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp]
        ldr     r0, [r2, +r1]
LBHQ38:
        str     r10, [sp, #0x18]
        ldr     r10, [sp, #4]
        str     r7, [sp]
LBHQ39:
        ldr     r7, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r7, r0
        bge     LBHQ43
        add     r11, r11, #1
        cmp     r11, r6
        str     r7, [r10, +r5]
        ldrlt   r0, [r2, +r1]
        blt     LBHQ39
        ldr     r10, [sp, #0x18]
        ldr     r7, [sp]
        ldr     r0, [r2, +r1]
        mov     r5, r11, lsl #2
LBHQ40:
        ldr     r11, [sp, #4]
        str     r0, [r11, +r5]
LBHQ41:
        ldr     r5, [r4, +r10, lsl #2]
        add     r3, r3, #1
        cmp     r3, r6
        str     r5, [lr], #4
        movge   r3, #0
        add     r12, r12, #1
        cmp     r12, r8
        blt     LBHQ31
        ldr     r5, [sp, #0xC]
LBHQ42:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, r5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHQ43:
        ldr     r10, [sp, #0x18]
        ldr     r7, [sp]
        b       LBHQ40
LBHQ44:
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp]
        b       LBHQ40
LBHQ45:
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp]
        b       LBHQ40
LBHQ46:
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp]
        b       LBHQ40
LBHQ47:
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp]
        b       LBHQ40
LBHQ48:
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp]
        ldr     r0, [r2, +r1]
LBHQ49:
        str     r7, [sp]
LBHQ50:
        ldr     r7, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r7, r0
        ble     LBHQ52
        sub     r11, r11, #1
        cmp     r11, #0
        str     r7, [r9, +r5]
        ldrgt   r0, [r2, +r1]
        bgt     LBHQ50
        ldr     r7, [sp]
        ldr     r0, [r2, +r1]
        mov     r5, r11, lsl #2
LBHQ51:
        str     r0, [r9, +r5]
        b       LBHQ41
LBHQ52:
        ldr     r7, [sp]
        b       LBHQ51
LBHQ53:
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp]
        b       LBHQ51
LBHQ54:
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp]
        b       LBHQ51
LBHQ55:
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp]
        b       LBHQ51
LBHQ56:
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp]
        b       LBHQ51
LBHQ57:
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        b       LBHQ28
LBHQ58:
        str     r6, [sp, #0x24]
        str     r8, [sp, #4]
        ldr     r11, [sp, #8]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHQ28
LBHQ59:
        str     r6, [sp, #0x24]
        str     r8, [sp, #4]
        ldr     r11, [sp, #8]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHQ28
LBHQ60:
        str     r6, [sp, #0x24]
        str     r8, [sp, #4]
        ldr     r11, [sp, #8]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHQ28
LBHQ61:
        str     r6, [sp, #0x24]
        str     r8, [sp, #4]
        ldr     r11, [sp, #8]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHQ28
LBHQ62:
        str     r6, [sp, #0x20]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r0, [r2, +r1]
LBHQ63:
        str     r6, [sp, #0x10]
        ldr     r6, [sp, #0x20]
        str     r10, [sp, #0x18]
LBHQ64:
        ldr     r10, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r10, r0
        ble     LBHQ66
        subs    r7, r7, #1
        str     r10, [r6, +r5]
        ldrpl   r0, [r2, +r1]
        bpl     LBHQ64
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r0, [r2, +r1]
        mov     r5, r7, lsl #2
LBHQ65:
        ldr     r7, [sp, #0x20]
        str     r0, [r7, +r5]
        b       LBHQ29
LBHQ66:
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHQ65
LBHQ67:
        str     r6, [sp, #0x20]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHQ65
LBHQ68:
        str     r6, [sp, #0x20]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHQ65
LBHQ69:
        str     r6, [sp, #0x20]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHQ65
LBHQ70:
        str     r6, [sp, #0x20]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHQ65
LBHQ71:
        cmp     r9, r6
        bge     LBHQ18
        sub     r3, r6, r9
        cmp     r3, #6
        movlt   r12, r8, lsl #2
        blt     LBHQ73
        ldr     r1, [sp, #0x1C]
        mov     r3, r9, lsl #2
        add     r3, r3, #4
        add     lr, r3, r4
        mov     r12, r8, lsl #2
        sub     r0, r6, #6
        add     r3, r3, r1
LBHQ72:
        ldr     r1, [r7, +r8, lsl #2]
        add     r9, r9, #5
        cmp     r9, r0
        str     r1, [lr, #-4]
        str     r1, [r3, #-4]
        ldr     r1, [r7, +r8, lsl #2]
        str     r1, [lr]
        str     r1, [r3]
        ldr     r1, [r7, +r8, lsl #2]
        str     r1, [lr, #4]
        str     r1, [r3, #4]
        ldr     r1, [r7, +r8, lsl #2]
        str     r1, [lr, #8]
        str     r1, [r3, #8]
        ldr     r1, [r7, +r8, lsl #2]
        str     r1, [lr, #0xC]
        add     lr, lr, #0x14
        str     r1, [r3, #0xC]
        add     r3, r3, #0x14
        ble     LBHQ72
LBHQ73:
        ldr     lr, [sp, #0x1C]
        add     r3, r4, r9, lsl #2
        add     lr, lr, r9, lsl #2
LBHQ74:
        ldr     r0, [r12, +r7]
        add     r9, r9, #1
        cmp     r9, r6
        str     r0, [r3], #4
        str     r0, [lr], #4
        blt     LBHQ74
        b       LBHQ18
LBHQ75:
        ldr     r12, [r7]
        ldr     r3, [r7, #4]
        sub     r8, r8, #2
        add     lr, sp, #0x3C
        add     r2, sp, #0x3C
        cmp     r8, #3
        str     r12, [lr]
        str     r3, [r2, #4]
        add     r10, r7, #4
        blt     LBHQ80
        add     r11, sp, #0x3C
        mov     r6, #3
        add     r4, r7, #8
        add     lr, r7, #0xC
        add     r1, r7, #0x10
        str     r5, [sp, #0xC]
        str     r7, [sp]
LBHQ76:
        ldr     r0, [r4, +r9, lsl #2]
        cmp     r3, r12
        add     r12, sp, #0x3C
        mov     r5, r9, lsl #2
        str     r0, [r12, #8]
        movlt   r9, #0
        movlt   r12, #1
        movge   r12, #0
        movge   r9, #1
        add     r7, sp, #0x3C
        ldr     r9, [r7, +r9, lsl #2]
        cmp     r0, r9
        bge     LBHQ77
        add     r7, sp, #0x3C
        ldr     r7, [r7, +r12, lsl #2]
        cmp     r0, r7
        movgt   r12, #2
        add     r7, sp, #0x3C
        ldr     r9, [r7, +r12, lsl #2]
LBHQ77:
        str     r9, [r10, +r5]
        ldr     r12, [lr, +r5]
        add     r7, sp, #0x3C
        cmp     r3, r12
        str     r12, [r7]
        movlt   r9, #0
        movlt   r3, #1
        movge   r3, #0
        movge   r9, #1
        add     r7, sp, #0x3C
        ldr     r9, [r7, +r9, lsl #2]
        cmp     r0, r9
        bge     LBHQ78
        add     r7, sp, #0x3C
        ldr     r7, [r7, +r3, lsl #2]
        cmp     r0, r7
        movgt   r3, #2
        add     r7, sp, #0x3C
        ldr     r9, [r7, +r3, lsl #2]
LBHQ78:
        str     r9, [r4, +r5]
        ldr     r3, [r1, +r5]
        cmp     r3, r12
        str     r3, [r2, #4]
        movlt   r11, #0
        movlt   r7, #1
        movge   r7, #0
        movge   r11, #1
        add     r9, sp, #0x3C
        ldr     r11, [r9, +r11, lsl #2]
        cmp     r0, r11
        bge     LBHQ79
        add     r9, sp, #0x3C
        ldr     r9, [r9, +r7, lsl #2]
        cmp     r0, r9
        movgt   r7, #2
        add     r0, sp, #0x3C
        ldr     r11, [r0, +r7, lsl #2]
LBHQ79:
        mov     r9, r6
        add     r6, r6, #3
        cmp     r8, r6
        str     r11, [lr, +r5]
        bge     LBHQ76
        ldr     r5, [sp, #0xC]
        ldr     r7, [sp]
LBHQ80:
        cmp     r9, r8
        add     r9, r9, #1
        bge     LBHQ83
        ldr     r1, [r10, +r9, lsl #2]
        cmp     r3, r12
        add     r2, sp, #0x3C
        mov     r12, #0
        str     r1, [r2, #8]
        movlt   r4, r12
        movlt   r2, #1
        movge   r2, r12
        movge   r4, #1
        add     lr, sp, #0x3C
        ldr     r4, [lr, +r4, lsl #2]
        cmp     r1, r4
        bge     LBHQ81
        add     lr, sp, #0x3C
        ldr     lr, [lr, +r2, lsl #2]
        cmp     r1, lr
        movgt   r2, #2
        add     lr, sp, #0x3C
        ldr     r4, [lr, +r2, lsl #2]
LBHQ81:
        cmp     r9, r8
        str     r4, [r7, +r9, lsl #2]
        bge     LBHQ83
        add     r7, r7, #8
        ldr     r2, [r7, +r9, lsl #2]
        add     lr, sp, #0x3C
        cmp     r3, r2
        str     r2, [lr]
        movlt   r2, #1
        movge   r2, r12
        movge   r12, #1
        add     r3, sp, #0x3C
        ldr     r12, [r3, +r12, lsl #2]
        cmp     r1, r12
        bge     LBHQ82
        add     r3, sp, #0x3C
        ldr     r3, [r3, +r2, lsl #2]
        cmp     r1, r3
        movgt   r2, #2
        add     r1, sp, #0x3C
        ldr     r12, [r1, +r2, lsl #2]
LBHQ82:
        str     r12, [r10, +r9, lsl #2]
LBHQ83:
        mov     r0, r5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHQ84:
        mvn     r0, #5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHQ85:
        mvn     r0, #7
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHQ86:
        mvn     r0, #8
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}


