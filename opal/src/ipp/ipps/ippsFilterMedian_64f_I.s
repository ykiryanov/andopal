        .text
        .align  4
        .globl  _ippsFilterMedian_64f_I


_ippsFilterMedian_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x88
        mov     r8, r0
        cmp     r8, #0
        mov     r9, r1
        mov     r6, r2
        beq     LBHO87
        cmp     r9, #0
        ble     LBHO86
        cmp     r6, #0
        ble     LBHO86
        tst     r6, #1
        mov     r7, #0
        movne   r5, r7
        subeq   r6, r6, #1
        moveq   r5, #5
        cmp     r6, #1
        beq     LBHO85
        cmp     r9, #2
        ble     LBHO85
        cmp     r6, #3
        beq     LBHO75
        cmp     r6, #5
        bne     LBHO10
        ldr     lr, [r8]
        ldr     r10, [r8, #4]
        add     r12, sp, #0x48
        ldr     r3, [r8, #0xC]
        str     lr, [r12]
        add     r2, sp, #0x48
        sub     r1, r9, #3
        ldr     r9, [r8, #8]
        str     r10, [r12, #4]
        str     lr, [r2, #8]
        ldr     r12, [r8, #0x10]
        ldr     lr, [r8, #0x14]
        add     r6, sp, #0x48
        str     r3, [r6, #0x14]
        add     r4, sp, #0x48
        str     r9, [r6, #0x10]
        str     r10, [r2, #0xC]
        str     r12, [r4, #0x18]
        str     lr, [r4, #0x1C]
        add     r3, r8, #8
        str     r3, [sp, #0x18]
        cmp     r1, #0
        mov     r9, #4
        add     r3, r8, #0x10
        addle   r1, sp, #0x68
        strle   r1, [sp, #0x10]
        ble     LBHO5
        ldr     lr, [sp, #0x18]
        add     r12, sp, #0x48
        add     r8, r8, #0x18
        add     r10, r12, #0x20
        str     r10, [sp, #0x10]
        str     r7, [sp, #8]
        str     lr, [sp, #4]
        str     r8, [sp]
        str     r3, [sp, #0x14]
        str     r1, [sp, #0xC]
        str     r5, [sp, #0x1C]
LBHO0:
        ldr     r1, [sp]
        add     r0, sp, #0x48
        add     r12, r0, r9, lsl #3
        ldr     r2, [r1]
        ldr     r3, [r1, #4]
        add     r1, sp, #0x48
        str     r2, [r0, +r9, lsl #3]
        str     r3, [r12, #4]
        ldr     r2, [r1]
        ldr     r3, [r1, #4]
        add     r12, sp, #0x48
        ldr     r0, [r12, #8]
        ldr     r1, [r12, #0xC]
        bl      __gedf2
        cmp     r0, #0
        movlt   r10, #0
        movlt   r8, #1
        movge   r8, #0
        movge   r10, #1
        add     r1, sp, #0x48
        ldr     r0, [r1, #0x18]
        add     r3, sp, #0x48
        ldr     r2, [r3, #0x10]
        ldr     r3, [r3, #0x14]
        ldr     r1, [r1, #0x1C]
        bl      __gedf2
        cmp     r0, #0
        movlt   r11, #2
        movlt   r4, #3
        movge   r4, #2
        movge   r11, #3
        add     r0, sp, #0x48
        add     r2, sp, #0x48
        add     r1, r0, r4, lsl #3
        ldr     r0, [r0, +r4, lsl #3]
        ldr     r1, [r1, #4]
        add     r3, r2, r8, lsl #3
        ldr     r6, [r2, +r8, lsl #3]
        ldr     r7, [r3, #4]
        mov     r2, r6
        mov     r3, r7
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHO1
        add     r1, sp, #0x48
        add     r0, r1, r4, lsl #3
        ldr     r6, [r1, +r4, lsl #3]
        ldr     r7, [r0, #4]
        mov     r8, r4
LBHO1:
        add     r0, sp, #0x48
        add     r12, sp, #0x48
        add     r1, r0, r11, lsl #3
        ldr     r0, [r0, +r11, lsl #3]
        ldr     r1, [r1, #4]
        add     lr, r12, r10, lsl #3
        ldr     r4, [r12, +r10, lsl #3]
        ldr     r5, [lr, #4]
        mov     r2, r4
        mov     r3, r5
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO2
        add     r0, sp, #0x48
        add     r1, r0, r11, lsl #3
        ldr     r4, [r0, +r11, lsl #3]
        ldr     r5, [r1, #4]
        mov     r10, r11
LBHO2:
        mov     r0, r4
        mov     r1, r5
        mov     r2, r6
        mov     r3, r7
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO3
        mov     r1, r8
        add     r3, sp, #0x48
        ldr     r4, [r3, +r1, lsl #3]
        add     r1, r3, r1, lsl #3
        ldr     r5, [r1, #4]
        mov     r8, r10
LBHO3:
        add     r12, sp, #0x48
        ldr     r6, [r12, #0x20]
        ldr     r7, [r12, #0x24]
        mov     r2, r4
        mov     r0, r6
        mov     r3, r5
        mov     r1, r7
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO4
        add     r2, sp, #0x48
        add     r3, r2, r8, lsl #3
        ldr     r2, [r2, +r8, lsl #3]
        ldr     r3, [r3, #4]
        mov     r0, r6
        mov     r1, r7
        bl      __gedf2
        cmp     r0, #0
        movge   r8, #4
        add     r0, sp, #0x48
        add     r1, r0, r8, lsl #3
        ldr     r5, [r1, #4]
        ldr     r4, [r0, +r8, lsl #3]
LBHO4:
        ldr     r12, [sp, #4]
        add     r9, r9, #1
        cmp     r9, #4
        str     r4, [r12]
        str     r5, [r12, #4]
        movgt   r9, #0
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        add     r0, r0, #1
        str     r0, [sp, #8]
        cmp     r0, r1
        ldr     r0, [sp, #4]
        add     r0, r0, #8
        str     r0, [sp, #4]
        ldr     r0, [sp]
        add     r0, r0, #8
        str     r0, [sp]
        blt     LBHO0
        ldr     r7, [sp, #8]
        ldr     r3, [sp, #0x14]
        ldr     r5, [sp, #0x1C]
        add     r4, sp, #0x48
        add     r6, sp, #0x48
        add     r2, sp, #0x48
LBHO5:
        ldr     r1, [r3, +r7, lsl #3]
        mov     r7, r7, lsl #3
        str     r7, [sp, #0x38]
        add     r12, sp, #0x48
        str     r1, [r12, +r9, lsl #3]
        add     r3, r7, r3
        ldr     r3, [r3, #4]
        add     r9, r12, r9, lsl #3
        add     r12, sp, #0x48
        str     r3, [r9, #4]
        ldr     r0, [r2, #8]
        ldr     r1, [r2, #0xC]
        ldr     r2, [r12]
        ldr     r3, [r12, #4]
        bl      __gedf2
        cmp     r0, #0
        mov     r8, #0
        movlt   r7, #1
        movge   r7, r8
        movge   r8, #1
        ldr     r0, [r4, #0x18]
        ldr     r1, [r4, #0x1C]
        ldr     r2, [r6, #0x10]
        ldr     r3, [r6, #0x14]
        bl      __gedf2
        cmp     r0, #0
        mov     r11, #2
        movlt   r4, #3
        movge   r4, r11
        movge   r11, #3
        add     r3, sp, #0x48
        ldr     r0, [r3, +r4, lsl #3]
        add     r1, r3, r4, lsl #3
        add     r2, sp, #0x48
        ldr     r1, [r1, #4]
        add     r3, r2, r7, lsl #3
        ldr     r9, [r2, +r7, lsl #3]
        ldr     r10, [r3, #4]
        mov     r2, r9
        mov     r3, r10
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHO6
        add     r2, sp, #0x48
        add     r1, r2, r4, lsl #3
        ldr     r9, [r2, +r4, lsl #3]
        ldr     r10, [r1, #4]
        mov     r7, r4
LBHO6:
        add     lr, sp, #0x48
        ldr     r0, [lr, +r11, lsl #3]
        add     r1, lr, r11, lsl #3
        add     r12, sp, #0x48
        ldr     r1, [r1, #4]
        add     lr, r12, r8, lsl #3
        ldr     r4, [r12, +r8, lsl #3]
        ldr     r6, [lr, #4]
        mov     r2, r4
        mov     r3, r6
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO7
        add     r12, sp, #0x48
        add     r1, r12, r11, lsl #3
        ldr     r4, [r12, +r11, lsl #3]
        ldr     r6, [r1, #4]
        mov     r8, r11
LBHO7:
        mov     r2, r9
        mov     r3, r10
        mov     r0, r4
        mov     r1, r6
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO8
        mov     r3, r7
        add     r1, sp, #0x48
        ldr     r4, [r1, +r3, lsl #3]
        add     r3, r1, r3, lsl #3
        ldr     r6, [r3, #4]
        mov     r7, r8
LBHO8:
        ldr     r12, [sp, #0x10]
        mov     r2, r4
        mov     r3, r6
        ldr     r8, [r12]
        ldr     r9, [r12, #4]
        mov     r0, r8
        mov     r1, r9
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO9
        add     r2, sp, #0x48
        add     r3, r2, r7, lsl #3
        ldr     r2, [r2, +r7, lsl #3]
        ldr     r3, [r3, #4]
        mov     r0, r8
        mov     r1, r9
        bl      __gedf2
        cmp     r0, #0
        movge   r7, #4
        add     r2, sp, #0x48
        add     r1, r2, r7, lsl #3
        ldr     r6, [r1, #4]
        ldr     r4, [r2, +r7, lsl #3]
LBHO9:
        ldr     lr, [sp, #0x18]
        ldr     r12, [sp, #0x38]
        mov     r0, r5
        str     r4, [lr, +r12]
        add     lr, r12, lr
        str     r6, [lr, #4]
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LBHO10:
        add     r3, r6, #7
        bic     r11, r3, #7
        mov     r3, r6, asr #1
        mov     r0, r11, lsl #1
        str     r3, [sp, #0x3C]
        bl      _ippsMalloc_64f
        mov     r4, r0
        cmp     r4, #0
        beq     LBHO88
        ldr     r3, [sp, #0x3C]
        sub     r10, r9, #1
        add     r9, r4, r11, lsl #3
        cmp     r3, #0
        ble     LBHO14
        ldr     r3, [sp, #0x3C]
        cmp     r3, #6
        blt     LBHO12
        ldr     r3, [sp, #0x3C]
        sub     lr, r9, #4
        sub     r12, r4, #4
        sub     r3, r3, #6
LBHO11:
        ldr     r11, [r8]
        ldr     r0, [r8, #4]
        add     r7, r7, #5
        str     r11, [r12, #4]
        cmp     r7, r3
        str     r0, [r12, #8]
        str     r11, [lr, #4]
        str     r0, [lr, #8]
        ldr     r11, [r8]
        ldr     r0, [r8, #4]
        str     r11, [r12, #0xC]
        str     r0, [r12, #0x10]
        str     r11, [lr, #0xC]
        str     r0, [lr, #0x10]
        ldr     r11, [r8]
        ldr     r0, [r8, #4]
        str     r11, [r12, #0x14]
        str     r0, [r12, #0x18]
        str     r11, [lr, #0x14]
        str     r0, [lr, #0x18]
        ldr     r11, [r8]
        ldr     r0, [r8, #4]
        str     r11, [r12, #0x1C]
        str     r0, [r12, #0x20]
        str     r11, [lr, #0x1C]
        str     r0, [lr, #0x20]
        ldr     r11, [r8]
        ldr     r0, [r8, #4]
        str     r11, [r12, #0x24]
        str     r0, [r12, #0x28]!
        str     r11, [lr, #0x24]
        str     r0, [lr, #0x28]!
        ble     LBHO11
LBHO12:
        mov     r3, r7, lsl #3
        ldr     lr, [sp, #0x3C]
        sub     r12, r3, #4
        add     r3, r12, r9
        add     r12, r12, r4
LBHO13:
        ldr     r0, [r8]
        ldr     r11, [r8, #4]
        add     r7, r7, #1
        str     r0, [r12, #4]
        cmp     r7, lr
        str     r11, [r12, #8]!
        str     r0, [r3, #4]
        str     r11, [r3, #8]!
        blt     LBHO13
LBHO14:
        cmp     r7, r6
        mov     r11, #0
        bge     LBHO18
        sub     r3, r6, r7
        cmp     r3, #5
        blt     LBHO16
LBHO15:
        cmp     r11, r10
        bgt     LBHO71
        ldr     r12, [r8, +r11, lsl #3]
        add     r3, r8, r11, lsl #3
        ldr     r3, [r3, #4]
        str     r12, [r4, +r7, lsl #3]
        add     lr, r4, r7, lsl #3
        str     r3, [lr, #4]
        str     r12, [r9, +r7, lsl #3]
        add     r11, r11, #1
        add     r12, r9, r7, lsl #3
        cmp     r11, r10
        str     r3, [r12, #4]
        add     r7, r7, #1
        bgt     LBHO71
        ldr     r12, [r8, +r11, lsl #3]
        add     r3, r8, r11, lsl #3
        ldr     r3, [r3, #4]
        str     r12, [r4, +r7, lsl #3]
        add     lr, r4, r7, lsl #3
        str     r3, [lr, #4]
        str     r12, [r9, +r7, lsl #3]
        add     r11, r11, #1
        add     r12, r9, r7, lsl #3
        cmp     r11, r10
        str     r3, [r12, #4]
        add     r7, r7, #1
        bgt     LBHO71
        ldr     r12, [r8, +r11, lsl #3]
        add     r3, r8, r11, lsl #3
        ldr     r3, [r3, #4]
        str     r12, [r4, +r7, lsl #3]
        add     lr, r4, r7, lsl #3
        str     r3, [lr, #4]
        str     r12, [r9, +r7, lsl #3]
        add     r11, r11, #1
        add     r12, r9, r7, lsl #3
        cmp     r11, r10
        str     r3, [r12, #4]
        add     r7, r7, #1
        bgt     LBHO71
        ldr     r12, [r8, +r11, lsl #3]
        add     r3, r8, r11, lsl #3
        ldr     r3, [r3, #4]
        str     r12, [r4, +r7, lsl #3]
        add     lr, r4, r7, lsl #3
        str     r3, [lr, #4]
        str     r12, [r9, +r7, lsl #3]
        add     r12, r9, r7, lsl #3
        str     r3, [r12, #4]
        add     r7, r7, #1
        sub     r3, r6, #5
        cmp     r7, r3
        add     r11, r11, #1
        ble     LBHO15
LBHO16:
        mov     r3, r7, lsl #3
        sub     lr, r3, #4
        mov     r3, r11, lsl #3
        sub     r3, r3, #4
        add     r12, lr, r9
        add     r3, r3, r8
        add     lr, lr, r4
LBHO17:
        cmp     r11, r10
        bgt     LBHO71
        ldr     r1, [r3, #4]
        ldr     r0, [r3, #8]!
        add     r7, r7, #1
        str     r1, [lr, #4]
        add     r11, r11, #1
        str     r0, [lr, #8]!
        str     r1, [r12, #4]
        str     r0, [r12, #8]!
        cmp     r7, r6
        blt     LBHO17
LBHO18:
        mov     r1, r6
        mov     r0, r4
        bl      ownippsIpp64fSort
        cmp     r11, r10
        mov     r3, #1
        mov     r7, #0
        bgt     LBHO30
        add     r0, r8, r11, lsl #3
        add     r2, r8, #8
        add     r1, r4, #8
        sub     lr, r4, #8
        sub     r12, r6, #5
        str     r8, [sp, #0x2C]
        str     r2, [sp, #0x44]
        str     r12, [sp, #0x40]
        str     lr, [sp, #4]
        str     r1, [sp, #8]
        str     r3, [sp]
        str     r11, [sp, #0xC]
        str     r10, [sp, #0x24]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x28]
        mov     r8, r0
LBHO19:
        ldr     r0, [r4]
        mov     r10, r7, lsl #3
        add     r1, r9, r10
        ldr     r5, [r1, #4]
        ldr     r1, [r4, #4]
        ldr     r6, [r9, +r7, lsl #3]
        mov     r3, r5
        mov     r2, r6
        bl      __nedf2
        cmp     r0, #0
        moveq   r0, #0
        moveq   r11, r0
        beq     LBHO21
        mov     r0, r4
        str     r7, [sp, #0x10]
        mov     r11, #0
        str     r9, [sp, #0x20]
        mov     r7, r0
LBHO20:
        add     r11, r11, #1
        add     r7, r7, #8
        ldr     r0, [r7]
        mov     r9, r11, lsl #3
        add     r1, r4, r9
        ldr     r1, [r1, #4]
        mov     r2, r6
        mov     r3, r5
        bl      __nedf2
        cmp     r0, #0
        bne     LBHO20
        mov     r0, r9
        ldr     r7, [sp, #0x10]
        ldr     r9, [sp, #0x20]
LBHO21:
        ldr     r5, [r8]
        ldr     r6, [r8, #4]
        add     lr, r9, r10
        str     r5, [r9, +r10]
        add     r12, r4, r0
        str     r6, [lr, #4]
        ldr     r2, [r0, +r4]
        ldr     r3, [r12, #4]
        mov     r0, r5
        mov     r1, r6
        bl      __gedf2
        cmp     r0, #0
        blt     LBHO23
        ldr     r12, [sp, #0x28]
        add     r11, r11, #1
        cmp     r11, r12
        movge   r11, r11, lsl #3
        bge     LBHO28
        ldr     r12, [sp, #0x28]
        sub     r12, r12, r11
        cmp     r12, #5
        blt     LBHO26
        str     r8, [sp, #0x14]
        ldr     r8, [sp, #4]
        str     r7, [sp, #0x10]
LBHO22:
        ldr     r0, [r4, +r11, lsl #3]
        mov     r7, r11, lsl #3
        add     r12, r4, r7
        str     r0, [sp, #0x38]
        ldr     r1, [r12, #4]
        mov     r2, r5
        str     r1, [sp, #0x34]
        mov     r3, r6
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO61
        ldr     r1, [sp, #0x38]
        str     r1, [r8, +r7]
        ldr     r1, [sp, #0x34]
        add     r7, r7, r8
        str     r1, [r7, #4]
        add     r1, r11, #1
        str     r1, [sp, #0x30]
        ldr     r0, [r4, +r1, lsl #3]
        mov     r7, r1, lsl #3
        add     r1, r9, r10
        str     r0, [sp, #0x38]
        ldr     r6, [r1, #4]
        ldr     r5, [r9, +r10]
        add     r12, r4, r7
        ldr     r1, [r12, #4]
        mov     r2, r5
        mov     r3, r6
        str     r1, [sp, #0x34]
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO60
        ldr     r1, [sp, #0x30]
        ldr     r2, [sp, #0x38]
        add     r7, r7, r8
        str     r2, [r8, +r1, lsl #3]
        ldr     r1, [sp, #0x34]
        str     r1, [r7, #4]
        add     r1, r11, #2
        str     r1, [sp, #0x30]
        ldr     r0, [r4, +r1, lsl #3]
        mov     r7, r1, lsl #3
        add     r1, r9, r10
        str     r0, [sp, #0x38]
        ldr     r6, [r1, #4]
        ldr     r5, [r9, +r10]
        add     r12, r4, r7
        ldr     r1, [r12, #4]
        mov     r2, r5
        mov     r3, r6
        str     r1, [sp, #0x34]
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO59
        ldr     r1, [sp, #0x30]
        ldr     r2, [sp, #0x38]
        add     r7, r7, r8
        str     r2, [r8, +r1, lsl #3]
        ldr     r1, [sp, #0x34]
        str     r1, [r7, #4]
        add     r1, r11, #3
        str     r1, [sp, #0x30]
        ldr     r0, [r4, +r1, lsl #3]
        mov     r7, r1, lsl #3
        add     r1, r9, r10
        str     r0, [sp, #0x38]
        ldr     r6, [r1, #4]
        ldr     r5, [r9, +r10]
        add     r12, r4, r7
        ldr     r1, [r12, #4]
        mov     r2, r5
        mov     r3, r6
        str     r1, [sp, #0x34]
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO58
        ldr     r1, [sp, #0x30]
        ldr     r2, [sp, #0x38]
        add     r11, r11, #4
        add     r7, r7, r8
        str     r2, [r8, +r1, lsl #3]
        ldr     r1, [sp, #0x40]
        cmp     r11, r1
        ldr     r1, [sp, #0x34]
        str     r1, [r7, #4]
        add     r1, r9, r10
        ldrle   r5, [r9, +r10]
        ldrle   r6, [r1, #4]
        ble     LBHO22
        b       LBHO25
LBHO23:
        subs    r11, r11, #1
        movmi   r11, r11, lsl #3
        bmi     LBHO65
        cmp     r11, #5
        blt     LBHO63
        str     r8, [sp, #0x14]
        ldr     r8, [sp, #8]
        str     r7, [sp, #0x10]
LBHO24:
        ldr     r0, [r4, +r11, lsl #3]
        mov     r7, r11, lsl #3
        add     r12, r4, r7
        str     r0, [sp, #0x38]
        ldr     r1, [r12, #4]
        mov     r2, r5
        str     r1, [sp, #0x34]
        mov     r3, r6
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHO70
        ldr     r1, [sp, #0x38]
        str     r1, [r8, +r7]
        ldr     r1, [sp, #0x34]
        add     r7, r7, r8
        str     r1, [r7, #4]
        sub     r1, r11, #1
        str     r1, [sp, #0x38]
        ldr     r11, [r4, +r1, lsl #3]
        ldr     r5, [r9, +r10]
        mov     r7, r1, lsl #3
        add     r1, r9, r10
        ldr     r6, [r1, #4]
        add     r12, r4, r7
        ldr     r1, [r12, #4]
        mov     r0, r11
        mov     r2, r5
        mov     r3, r6
        str     r1, [sp, #0x34]
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHO69
        ldr     r1, [sp, #0x38]
        add     r7, r7, r8
        str     r11, [r8, +r1, lsl #3]
        ldr     r2, [sp, #0x34]
        sub     r1, r1, #1
        str     r2, [r7, #4]
        str     r1, [sp, #0x38]
        ldr     r11, [r4, +r1, lsl #3]
        ldr     r5, [r9, +r10]
        mov     r7, r1, lsl #3
        add     r1, r9, r10
        ldr     r6, [r1, #4]
        add     r12, r4, r7
        ldr     r1, [r12, #4]
        mov     r0, r11
        mov     r2, r5
        mov     r3, r6
        str     r1, [sp, #0x34]
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHO68
        ldr     r1, [sp, #0x38]
        add     r7, r7, r8
        str     r11, [r8, +r1, lsl #3]
        ldr     r2, [sp, #0x34]
        sub     r1, r1, #1
        str     r2, [r7, #4]
        str     r1, [sp, #0x38]
        ldr     r11, [r4, +r1, lsl #3]
        ldr     r5, [r9, +r10]
        mov     r7, r1, lsl #3
        add     r1, r9, r10
        ldr     r6, [r1, #4]
        add     r12, r4, r7
        ldr     r1, [r12, #4]
        mov     r0, r11
        mov     r2, r5
        mov     r3, r6
        str     r1, [sp, #0x34]
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHO67
        ldr     r1, [sp, #0x38]
        add     r7, r7, r8
        str     r11, [r8, +r1, lsl #3]
        sub     r11, r1, #1
        ldr     r1, [sp, #0x34]
        cmp     r11, #5
        str     r1, [r7, #4]
        add     r1, r9, r10
        ldrge   r5, [r9, +r10]
        ldrge   r6, [r1, #4]
        bge     LBHO24
        b       LBHO62
LBHO25:
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r5, [r9, +r10]
        ldr     r6, [r1, #4]
LBHO26:
        str     r8, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     r4, [sp, #0x18]
LBHO27:
        ldr     r12, [sp, #0x18]
        mov     r7, r11, lsl #3
        mov     r2, r5
        ldr     r8, [r12, +r11, lsl #3]
        add     r12, r12, r7
        ldr     r4, [r12, #4]
        mov     r3, r6
        mov     r0, r8
        mov     r1, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO57
        ldr     r2, [sp, #4]
        add     r11, r11, #1
        add     r1, r9, r10
        str     r8, [r2, +r7]
        ldr     r0, [sp, #0x28]
        add     r2, r7, r2
        str     r4, [r2, #4]
        cmp     r11, r0
        ldrlt   r5, [r9, +r10]
        ldrlt   r6, [r1, #4]
        blt     LBHO27
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r4, [sp, #0x18]
        ldr     r5, [r9, +r10]
        ldr     r6, [r1, #4]
        mov     r11, r11, lsl #3
LBHO28:
        ldr     lr, [sp, #4]
        add     r12, r11, lr
        str     r5, [lr, +r11]
LBHO29:
        str     r6, [r12, #4]
        ldr     r1, [sp, #0x3C]
        ldr     r3, [sp, #0x28]
        add     r7, r7, #1
        add     r2, r4, r1, lsl #3
        ldr     r1, [r4, +r1, lsl #3]
        ldr     r2, [r2, #4]
        cmp     r7, r3
        ldr     r3, [sp, #0x44]
        str     r1, [r3]
        str     r2, [r3, #4]
        movge   r7, #0
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x24]
        add     r8, r8, #8
        add     r1, r1, #1
        str     r1, [sp, #0xC]
        cmp     r1, r2
        ldr     r1, [sp, #0x44]
        add     r1, r1, #8
        str     r1, [sp, #0x44]
        ldr     r1, [sp]
        add     r1, r1, #1
        str     r1, [sp]
        ble     LBHO19
        ldr     r3, [sp]
        ldr     r10, [sp, #0x24]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x28]
        ldr     r8, [sp, #0x2C]
LBHO30:
        cmp     r3, r10
        bge     LBHO42
        add     r0, r4, #8
        sub     lr, r4, #8
        sub     r12, r6, #5
        add     r11, r8, r3, lsl #3
        str     r12, [sp, #0xC]
        str     lr, [sp, #8]
        str     r0, [sp, #4]
        str     r3, [sp]
        str     r10, [sp, #0x24]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x28]
        str     r8, [sp, #0x2C]
LBHO31:
        ldr     r0, [r4]
        mov     r8, r7, lsl #3
        add     r1, r9, r8
        ldr     r5, [r1, #4]
        ldr     r1, [r4, #4]
        ldr     r6, [r9, +r7, lsl #3]
        mov     r3, r5
        mov     r2, r6
        bl      __nedf2
        cmp     r0, #0
        moveq   r0, #0
        moveq   r10, r0
        beq     LBHO33
        mov     r0, r4
        str     r7, [sp, #0x10]
        mov     r10, #0
        str     r9, [sp, #0x20]
        mov     r7, r0
LBHO32:
        add     r10, r10, #1
        add     r7, r7, #8
        ldr     r0, [r7]
        mov     r9, r10, lsl #3
        add     r1, r4, r9
        ldr     r1, [r1, #4]
        mov     r2, r6
        mov     r3, r5
        bl      __nedf2
        cmp     r0, #0
        bne     LBHO32
        mov     r0, r9
        ldr     r7, [sp, #0x10]
        ldr     r9, [sp, #0x20]
LBHO33:
        ldr     r3, [sp, #0x24]
        ldr     r1, [sp, #0x2C]
        add     lr, r9, r8
        add     r12, r4, r0
        ldr     r5, [r1, +r3, lsl #3]
        add     r3, r1, r3, lsl #3
        ldr     r6, [r3, #4]
        str     r5, [r9, +r8]
        str     r6, [lr, #4]
        ldr     r2, [r0, +r4]
        ldr     r3, [r12, #4]
        mov     r0, r5
        mov     r1, r6
        bl      __gedf2
        cmp     r0, #0
        blt     LBHO35
        ldr     r12, [sp, #0x28]
        add     r10, r10, #1
        cmp     r10, r12
        movge   r10, r10, lsl #3
        bge     LBHO40
        ldr     r12, [sp, #0x28]
        sub     r12, r12, r10
        cmp     r12, #5
        blt     LBHO38
        str     r11, [sp, #0x14]
        ldr     r11, [sp, #8]
        str     r7, [sp, #0x10]
LBHO34:
        ldr     r0, [r4, +r10, lsl #3]
        mov     r7, r10, lsl #3
        add     r12, r4, r7
        str     r0, [sp, #0x38]
        ldr     r1, [r12, #4]
        mov     r2, r5
        str     r1, [sp, #0x34]
        mov     r3, r6
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO47
        ldr     r1, [sp, #0x38]
        str     r1, [r11, +r7]
        ldr     r1, [sp, #0x34]
        add     r7, r7, r11
        str     r1, [r7, #4]
        add     r1, r10, #1
        str     r1, [sp, #0x34]
        ldr     r0, [r4, +r1, lsl #3]
        mov     r7, r1, lsl #3
        add     r1, r9, r8
        str     r0, [sp, #0x38]
        ldr     r6, [r1, #4]
        ldr     r5, [r9, +r8]
        add     r12, r4, r7
        ldr     r1, [r12, #4]
        mov     r2, r5
        mov     r3, r6
        str     r1, [sp, #0x30]
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO46
        ldr     r1, [sp, #0x38]
        ldr     r2, [sp, #0x34]
        add     r7, r7, r11
        str     r1, [r11, +r2, lsl #3]
        ldr     r1, [sp, #0x30]
        str     r1, [r7, #4]
        add     r1, r10, #2
        str     r1, [sp, #0x34]
        ldr     r0, [r4, +r1, lsl #3]
        mov     r7, r1, lsl #3
        add     r1, r9, r8
        str     r0, [sp, #0x38]
        ldr     r6, [r1, #4]
        ldr     r5, [r9, +r8]
        add     r12, r4, r7
        ldr     r1, [r12, #4]
        mov     r2, r5
        mov     r3, r6
        str     r1, [sp, #0x30]
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO45
        ldr     r1, [sp, #0x38]
        ldr     r2, [sp, #0x34]
        add     r7, r7, r11
        str     r1, [r11, +r2, lsl #3]
        ldr     r1, [sp, #0x30]
        str     r1, [r7, #4]
        add     r1, r10, #3
        str     r1, [sp, #0x34]
        ldr     r0, [r4, +r1, lsl #3]
        mov     r7, r1, lsl #3
        add     r1, r9, r8
        str     r0, [sp, #0x38]
        ldr     r6, [r1, #4]
        ldr     r5, [r9, +r8]
        add     r12, r4, r7
        ldr     r1, [r12, #4]
        mov     r2, r5
        mov     r3, r6
        str     r1, [sp, #0x30]
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO44
        ldr     r1, [sp, #0x38]
        ldr     r2, [sp, #0x34]
        add     r10, r10, #4
        add     r7, r7, r11
        str     r1, [r11, +r2, lsl #3]
        ldr     r1, [sp, #0xC]
        cmp     r10, r1
        ldr     r1, [sp, #0x30]
        str     r1, [r7, #4]
        add     r1, r9, r8
        ldrle   r5, [r9, +r8]
        ldrle   r6, [r1, #4]
        ble     LBHO34
        b       LBHO37
LBHO35:
        sub     r10, r10, #1
        cmp     r10, #0
        movle   r10, r10, lsl #3
        ble     LBHO51
        cmp     r10, #5
        blt     LBHO49
        str     r11, [sp, #0x14]
        ldr     r11, [sp, #4]
        str     r7, [sp, #0x10]
LBHO36:
        ldr     r0, [r4, +r10, lsl #3]
        mov     r7, r10, lsl #3
        add     r12, r4, r7
        str     r0, [sp, #0x30]
        ldr     r1, [r12, #4]
        mov     r2, r5
        str     r1, [sp, #0x34]
        mov     r3, r6
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHO56
        ldr     r1, [sp, #0x30]
        str     r1, [r11, +r7]
        ldr     r1, [sp, #0x34]
        add     r7, r7, r11
        str     r1, [r7, #4]
        sub     r1, r10, #1
        str     r1, [sp, #0x34]
        ldr     r10, [r4, +r1, lsl #3]
        ldr     r5, [r9, +r8]
        mov     r7, r1, lsl #3
        add     r1, r9, r8
        ldr     r6, [r1, #4]
        add     r12, r4, r7
        ldr     r1, [r12, #4]
        mov     r0, r10
        mov     r2, r5
        mov     r3, r6
        str     r1, [sp, #0x30]
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHO55
        ldr     r1, [sp, #0x34]
        add     r7, r7, r11
        str     r10, [r11, +r1, lsl #3]
        ldr     r2, [sp, #0x30]
        sub     r1, r1, #1
        str     r2, [r7, #4]
        str     r1, [sp, #0x34]
        ldr     r10, [r4, +r1, lsl #3]
        ldr     r5, [r9, +r8]
        mov     r7, r1, lsl #3
        add     r1, r9, r8
        ldr     r6, [r1, #4]
        add     r12, r4, r7
        ldr     r1, [r12, #4]
        mov     r0, r10
        mov     r2, r5
        mov     r3, r6
        str     r1, [sp, #0x30]
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHO54
        ldr     r1, [sp, #0x34]
        add     r7, r7, r11
        str     r10, [r11, +r1, lsl #3]
        ldr     r2, [sp, #0x30]
        sub     r1, r1, #1
        str     r2, [r7, #4]
        str     r1, [sp, #0x34]
        ldr     r10, [r4, +r1, lsl #3]
        ldr     r5, [r9, +r8]
        mov     r7, r1, lsl #3
        add     r1, r9, r8
        ldr     r6, [r1, #4]
        add     r12, r4, r7
        ldr     r1, [r12, #4]
        mov     r0, r10
        mov     r2, r5
        mov     r3, r6
        str     r1, [sp, #0x30]
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHO53
        ldr     r1, [sp, #0x34]
        add     r7, r7, r11
        str     r10, [r11, +r1, lsl #3]
        sub     r10, r1, #1
        ldr     r1, [sp, #0x30]
        cmp     r10, #5
        str     r1, [r7, #4]
        add     r1, r9, r8
        ldrge   r5, [r9, +r8]
        ldrge   r6, [r1, #4]
        bge     LBHO36
        b       LBHO48
LBHO37:
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r5, [r9, +r8]
        ldr     r6, [r1, #4]
LBHO38:
        str     r11, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     r4, [sp, #0x18]
LBHO39:
        ldr     r12, [sp, #0x18]
        mov     r7, r10, lsl #3
        mov     r2, r5
        ldr     r11, [r12, +r10, lsl #3]
        add     r12, r12, r7
        ldr     r4, [r12, #4]
        mov     r3, r6
        mov     r0, r11
        mov     r1, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO43
        ldr     r2, [sp, #8]
        add     r10, r10, #1
        add     r1, r9, r8
        str     r11, [r2, +r7]
        ldr     r0, [sp, #0x28]
        add     r2, r7, r2
        str     r4, [r2, #4]
        cmp     r10, r0
        ldrlt   r5, [r9, +r8]
        ldrlt   r6, [r1, #4]
        blt     LBHO39
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r4, [sp, #0x18]
        ldr     r5, [r9, +r8]
        ldr     r6, [r1, #4]
        mov     r10, r10, lsl #3
LBHO40:
        ldr     lr, [sp, #8]
        add     r12, r10, lr
        str     r5, [lr, +r10]
LBHO41:
        str     r6, [r12, #4]
        ldr     r1, [sp, #0x28]
        add     r7, r7, #1
        cmp     r7, r1
        ldr     r1, [sp, #0x3C]
        add     r2, r4, r1, lsl #3
        ldr     r2, [r2, #4]
        ldr     r1, [r4, +r1, lsl #3]
        str     r1, [r11]
        str     r2, [r11, #4]
        movge   r7, #0
        ldr     r1, [sp]
        ldr     r2, [sp, #0x24]
        add     r11, r11, #8
        add     r1, r1, #1
        str     r1, [sp]
        cmp     r1, r2
        blt     LBHO31
        ldr     r5, [sp, #0x1C]
LBHO42:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, r5
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LBHO43:
        mov     r10, r7
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r4, [sp, #0x18]
        b       LBHO40
LBHO44:
        mov     r10, r7
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO40
LBHO45:
        mov     r10, r7
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO40
LBHO46:
        mov     r10, r7
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO40
LBHO47:
        mov     r10, r7
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO40
LBHO48:
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r5, [r9, +r8]
        ldr     r6, [r1, #4]
LBHO49:
        str     r11, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     r4, [sp, #0x18]
LBHO50:
        ldr     r12, [sp, #0x18]
        mov     r7, r10, lsl #3
        mov     r2, r5
        ldr     r11, [r12, +r10, lsl #3]
        add     r12, r12, r7
        ldr     r4, [r12, #4]
        mov     r3, r6
        mov     r0, r11
        mov     r1, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHO52
        ldr     r2, [sp, #4]
        sub     r10, r10, #1
        cmp     r10, #0
        str     r11, [r2, +r7]
        add     r2, r7, r2
        str     r4, [r2, #4]
        add     r1, r9, r8
        ldrgt   r5, [r9, +r8]
        ldrgt   r6, [r1, #4]
        bgt     LBHO50
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r4, [sp, #0x18]
        ldr     r5, [r9, +r8]
        ldr     r6, [r1, #4]
        mov     r10, r10, lsl #3
LBHO51:
        ldr     lr, [sp, #4]
        add     r12, r10, lr
        str     r5, [lr, +r10]
        b       LBHO41
LBHO52:
        mov     r10, r7
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r4, [sp, #0x18]
        b       LBHO51
LBHO53:
        mov     r10, r7
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO51
LBHO54:
        mov     r10, r7
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO51
LBHO55:
        mov     r10, r7
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO51
LBHO56:
        mov     r10, r7
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO51
LBHO57:
        mov     r11, r7
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r4, [sp, #0x18]
        b       LBHO28
LBHO58:
        mov     r11, r7
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO28
LBHO59:
        mov     r11, r7
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO28
LBHO60:
        mov     r11, r7
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO28
LBHO61:
        mov     r11, r7
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO28
LBHO62:
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r5, [r9, +r10]
        ldr     r6, [r1, #4]
LBHO63:
        str     r8, [sp, #0x14]
        str     r7, [sp, #0x10]
        str     r4, [sp, #0x18]
LBHO64:
        ldr     r12, [sp, #0x18]
        mov     r7, r11, lsl #3
        mov     r2, r5
        ldr     r8, [r12, +r11, lsl #3]
        add     r12, r12, r7
        ldr     r4, [r12, #4]
        mov     r3, r6
        mov     r0, r8
        mov     r1, r4
        bl      __gtdf2
        cmp     r0, #0
        ble     LBHO66
        ldr     r2, [sp, #8]
        subs    r11, r11, #1
        add     r1, r9, r10
        str     r8, [r2, +r7]
        add     r2, r7, r2
        str     r4, [r2, #4]
        ldrpl   r5, [r9, +r10]
        ldrpl   r6, [r1, #4]
        bpl     LBHO64
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r4, [sp, #0x18]
        ldr     r5, [r9, +r10]
        ldr     r6, [r1, #4]
        mov     r11, r11, lsl #3
LBHO65:
        ldr     lr, [sp, #8]
        add     r12, r11, lr
        str     r5, [lr, +r11]
        b       LBHO29
LBHO66:
        mov     r11, r7
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r4, [sp, #0x18]
        b       LBHO65
LBHO67:
        mov     r11, r7
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO65
LBHO68:
        mov     r11, r7
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO65
LBHO69:
        mov     r11, r7
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO65
LBHO70:
        mov     r11, r7
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHO65
LBHO71:
        cmp     r7, r6
        bge     LBHO18
        sub     r3, r6, r7
        cmp     r3, #6
        movlt   r3, r10, lsl #3
        blt     LBHO73
        mov     r3, r7, lsl #3
        sub     r12, r3, #4
        add     lr, r12, r9
        mov     r3, r10, lsl #3
        sub     r0, r6, #6
        add     r12, r12, r4
        str     r6, [sp, #0x28]
LBHO72:
        add     r1, r8, r3
        ldr     r2, [r1, #4]
        ldr     r6, [r8, +r10, lsl #3]
        add     r7, r7, #5
        str     r2, [r12, #8]
        cmp     r7, r0
        str     r6, [r12, #4]
        str     r2, [lr, #8]
        str     r6, [lr, #4]
        ldr     r2, [r1, #4]
        ldr     r6, [r8, +r10, lsl #3]
        str     r2, [r12, #0x10]
        str     r6, [r12, #0xC]
        str     r2, [lr, #0x10]
        str     r6, [lr, #0xC]
        ldr     r2, [r1, #4]
        ldr     r6, [r8, +r10, lsl #3]
        str     r2, [r12, #0x18]
        str     r6, [r12, #0x14]
        str     r2, [lr, #0x18]
        str     r6, [lr, #0x14]
        ldr     r2, [r1, #4]
        ldr     r6, [r8, +r10, lsl #3]
        str     r2, [r12, #0x20]
        str     r6, [r12, #0x1C]
        str     r2, [lr, #0x20]
        str     r6, [lr, #0x1C]
        ldr     r1, [r1, #4]
        ldr     r2, [r8, +r10, lsl #3]
        str     r1, [r12, #0x28]
        str     r2, [r12, #0x24]
        str     r1, [lr, #0x28]
        str     r2, [lr, #0x24]
        add     lr, lr, #0x28
        add     r12, r12, #0x28
        ble     LBHO72
        ldr     r6, [sp, #0x28]
LBHO73:
        mov     r12, r7, lsl #3
        sub     lr, r12, #4
        add     r12, lr, r9
        add     lr, lr, r4
LBHO74:
        add     r0, r8, r3
        ldr     r0, [r0, #4]
        ldr     r1, [r3, +r8]
        add     r7, r7, #1
        str     r0, [lr, #8]
        cmp     r7, r6
        str     r1, [lr, #4]
        str     r0, [r12, #8]
        str     r1, [r12, #4]
        add     r12, r12, #8
        add     lr, lr, #8
        blt     LBHO74
        b       LBHO18
LBHO75:
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        ldr     r4, [r8, #8]
        ldr     r6, [r8, #0xC]
        add     lr, sp, #0x70
        add     r12, sp, #0x70
        sub     r9, r9, #2
        cmp     r9, #3
        str     r2, [lr]
        str     r3, [lr, #4]
        str     r4, [r12, #8]
        str     r6, [r12, #0xC]
        add     r10, r8, #8
        blt     LBHO82
        add     r0, r8, #0x10
        str     r0, [sp, #0x28]
        add     lr, r8, #0x18
        add     r1, r8, #0x20
        str     r8, [sp, #0x2C]
        mov     r0, r7
        mov     r11, #3
        str     r1, [sp, #0x44]
        str     lr, [sp, #0x38]
        str     r6, [sp, #0x24]
        str     r10, [sp, #0x40]
        str     r9, [sp, #0x3C]
        str     r5, [sp, #0x1C]
        mov     r8, r2
        mov     r7, r3
LBHO76:
        ldr     r1, [sp, #0x28]
        mov     r9, r0, lsl #3
        add     r12, sp, #0x70
        ldr     r6, [r1, +r0, lsl #3]
        add     r1, r9, r1
        ldr     r5, [r1, #4]
        mov     r0, r4
        str     r6, [r12, #0x10]
        ldr     r1, [sp, #0x24]
        str     r5, [r12, #0x14]
        mov     r2, r8
        mov     r3, r7
        bl      __gedf2
        cmp     r0, #0
        movlt   r12, #0
        movlt   r10, #1
        movge   r10, #0
        movge   r12, #1
        add     r2, sp, #0x70
        add     r3, r2, r12, lsl #3
        ldr     r8, [r2, +r12, lsl #3]
        ldr     r7, [r3, #4]
        mov     r0, r6
        mov     r1, r5
        mov     r2, r8
        mov     r3, r7
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO77
        add     r2, sp, #0x70
        add     r3, r2, r10, lsl #3
        ldr     r2, [r2, +r10, lsl #3]
        ldr     r3, [r3, #4]
        mov     r0, r6
        mov     r1, r5
        bl      __ledf2
        cmp     r0, #0
        movgt   r10, #2
        add     r2, sp, #0x70
        add     r3, r2, r10, lsl #3
        ldr     r7, [r3, #4]
        ldr     r8, [r2, +r10, lsl #3]
LBHO77:
        ldr     r12, [sp, #0x40]
        mov     r0, r4
        str     r8, [r12, +r9]
        add     r12, r9, r12
        str     r7, [r12, #4]
        ldr     r2, [sp, #0x38]
        ldr     r1, [sp, #0x24]
        add     r12, sp, #0x70
        add     r3, r9, r2
        ldr     r8, [r2, +r9]
        ldr     r7, [r3, #4]
        str     r8, [r12]
        str     r7, [r12, #4]
        mov     r2, r8
        mov     r3, r7
        bl      __gedf2
        cmp     r0, #0
        movlt   r4, #0
        movlt   r10, #1
        movge   r10, #0
        movge   r4, #1
        add     lr, sp, #0x70
        add     r12, lr, r4, lsl #3
        ldr     r3, [r12, #4]
        ldr     r4, [lr, +r4, lsl #3]
        mov     r0, r6
        str     r3, [sp, #0x34]
        mov     r1, r5
        mov     r2, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO78
        add     lr, sp, #0x70
        add     r12, lr, r10, lsl #3
        ldr     r2, [lr, +r10, lsl #3]
        ldr     r3, [r12, #4]
        mov     r0, r6
        mov     r1, r5
        bl      __ledf2
        cmp     r0, #0
        movgt   r10, #2
        add     r12, sp, #0x70
        add     lr, r12, r10, lsl #3
        ldr     lr, [lr, #4]
        str     lr, [sp, #0x34]
        ldr     r4, [r12, +r10, lsl #3]
LBHO78:
        ldr     r12, [sp, #0x28]
        mov     r2, r8
        mov     r3, r7
        str     r4, [r12, +r9]
        ldr     lr, [sp, #0x34]
        add     r12, r9, r12
        str     lr, [r12, #4]
        ldr     r12, [sp, #0x44]
        ldr     r4, [r12, +r9]
        add     r12, r9, r12
        ldr     r1, [r12, #4]
        add     r12, sp, #0x70
        mov     r0, r4
        str     r1, [sp, #0x24]
        str     r1, [r12, #0xC]
        str     r4, [r12, #8]
        bl      __gedf2
        cmp     r0, #0
        blt     LBHO79
        mov     r12, #0
        str     r12, [sp, #0x30]
        mov     lr, #1
        b       LBHO80
LBHO79:
        mov     r12, #1
        mov     lr, #0
        str     r12, [sp, #0x30]
LBHO80:
        add     r10, sp, #0x70
        add     r12, r10, lr, lsl #3
        ldr     r3, [r12, #4]
        ldr     r10, [r10, +lr, lsl #3]
        mov     r0, r6
        str     r3, [sp, #0x34]
        mov     r1, r5
        mov     r2, r10
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO81
        ldr     r10, [sp, #0x30]
        add     r12, sp, #0x70
        mov     r0, r6
        add     lr, r12, r10, lsl #3
        ldr     r2, [r12, +r10, lsl #3]
        ldr     r3, [lr, #4]
        mov     r1, r5
        bl      __ledf2
        cmp     r0, #0
        movgt   r1, #2
        strgt   r1, [sp, #0x30]
        ldr     r12, [sp, #0x30]
        add     r1, sp, #0x70
        add     lr, r1, r12, lsl #3
        ldr     lr, [lr, #4]
        str     lr, [sp, #0x34]
        ldr     r10, [r1, +r12, lsl #3]
LBHO81:
        mov     r0, r11
        ldr     r1, [sp, #0x38]
        add     r11, r11, #3
        str     r10, [r1, +r9]
        add     r9, r9, r1
        ldr     r1, [sp, #0x3C]
        cmp     r1, r11
        ldr     r1, [sp, #0x34]
        str     r1, [r9, #4]
        bge     LBHO76
        mov     r3, r7
        mov     r7, r0
        mov     r2, r8
        ldr     r6, [sp, #0x24]
        ldr     r10, [sp, #0x40]
        ldr     r9, [sp, #0x3C]
        ldr     r5, [sp, #0x1C]
        ldr     r8, [sp, #0x2C]
LBHO82:
        cmp     r7, r9
        add     r11, r7, #1
        bge     LBHO85
        ldr     r7, [r10, +r11, lsl #3]
        add     lr, r10, r11, lsl #3
        ldr     lr, [lr, #4]
        add     r12, sp, #0x70
        str     lr, [sp, #0x28]
        str     lr, [r12, #0x14]
        str     r7, [r12, #0x10]
        mov     r0, r4
        mov     r1, r6
        bl      __gedf2
        cmp     r0, #0
        mov     r2, #0
        movlt   r3, #1
        strlt   r3, [sp, #0x34]
        strge   r2, [sp, #0x34]
        movge   r2, #1
        add     r3, sp, #0x70
        ldr     r1, [sp, #0x28]
        add     r12, r3, r2, lsl #3
        ldr     r2, [r3, +r2, lsl #3]
        mov     r0, r7
        str     r2, [sp, #0x30]
        ldr     r3, [r12, #4]
        str     r3, [sp, #0x38]
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO83
        ldr     r12, [sp, #0x34]
        add     r2, sp, #0x70
        ldr     r1, [sp, #0x28]
        add     r3, r2, r12, lsl #3
        ldr     r2, [r2, +r12, lsl #3]
        ldr     r3, [r3, #4]
        mov     r0, r7
        bl      __ledf2
        cmp     r0, #0
        movgt   r2, #2
        strgt   r2, [sp, #0x34]
        ldr     r3, [sp, #0x34]
        add     r2, sp, #0x70
        add     r12, r2, r3, lsl #3
        ldr     r12, [r12, #4]
        str     r12, [sp, #0x38]
        ldr     r3, [r2, +r3, lsl #3]
        str     r3, [sp, #0x30]
LBHO83:
        ldr     r2, [sp, #0x30]
        cmp     r11, r9
        add     r3, r8, r11, lsl #3
        str     r2, [r8, +r11, lsl #3]
        ldr     r2, [sp, #0x38]
        str     r2, [r3, #4]
        bge     LBHO85
        add     r8, r8, #0x10
        add     r3, r8, r11, lsl #3
        ldr     r2, [r8, +r11, lsl #3]
        ldr     r3, [r3, #4]
        add     r12, sp, #0x70
        str     r2, [r12]
        mov     r0, r4
        str     r3, [r12, #4]
        mov     r1, r6
        bl      __gedf2
        cmp     r0, #0
        mov     r3, #0
        movlt   r8, #1
        movge   r8, r3
        movge   r3, #1
        add     r2, sp, #0x70
        ldr     r1, [sp, #0x28]
        add     r12, r2, r3, lsl #3
        ldr     r6, [r2, +r3, lsl #3]
        ldr     r4, [r12, #4]
        mov     r0, r7
        mov     r2, r6
        mov     r3, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LBHO84
        add     r2, sp, #0x70
        ldr     r1, [sp, #0x28]
        add     r3, r2, r8, lsl #3
        ldr     r2, [r2, +r8, lsl #3]
        ldr     r3, [r3, #4]
        mov     r0, r7
        bl      __ledf2
        cmp     r0, #0
        movgt   r8, #2
        add     r1, sp, #0x70
        add     r2, r1, r8, lsl #3
        ldr     r4, [r2, #4]
        ldr     r6, [r1, +r8, lsl #3]
LBHO84:
        str     r6, [r10, +r11, lsl #3]
        add     r11, r10, r11, lsl #3
        str     r4, [r11, #4]
LBHO85:
        mov     r0, r5
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LBHO86:
        mvn     r0, #5
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LBHO87:
        mvn     r0, #7
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
LBHO88:
        mvn     r0, #8
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}


