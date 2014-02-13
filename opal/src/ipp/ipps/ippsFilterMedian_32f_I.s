        .text
        .align  4
        .globl  _ippsFilterMedian_32f_I


_ippsFilterMedian_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        mov     r7, r0
        cmp     r7, #0
        mov     r8, r1
        mov     r6, r2
        beq     LBHS86
        cmp     r8, #0
        ble     LBHS85
        cmp     r6, #0
        ble     LBHS85
        tst     r6, #1
        mov     r10, #0
        movne   r4, r10
        subeq   r6, r6, #1
        moveq   r4, #5
        cmp     r6, #1
        beq     LBHS84
        cmp     r8, #2
        ble     LBHS84
        cmp     r6, #3
        beq     LBHS75
        cmp     r6, #5
        bne     LBHS10
        ldr     r3, [r7]
        add     r6, sp, #0x38
        ldr     r12, [r7, #4]
        str     r3, [r6]
        ldr     r6, [r7, #8]
        add     r5, sp, #0x38
        add     lr, sp, #0x38
        sub     r1, r8, #3
        str     r6, [r5, #0xC]
        add     r2, sp, #0x38
        str     r12, [lr, #8]
        cmp     r1, #0
        str     r3, [r2, #4]
        mov     r6, #4
        add     r5, r7, #4
        add     r12, r7, #8
        addle   r7, sp, #0x48
        ble     LBHS5
        add     lr, r7, #0xC
        add     r3, sp, #0x38
        add     r7, r3, #0x10
        mov     r8, r5
        str     r7, [sp, #8]
        str     lr, [sp]
        str     r12, [sp, #0xC]
        str     r5, [sp, #0x10]
        str     r1, [sp, #4]
        str     r4, [sp, #0x14]
LBHS0:
        ldr     r3, [sp]
        add     r1, sp, #0x38
        add     r0, sp, #0x38
        ldr     r2, [r3], #4
        str     r3, [sp]
        str     r2, [r1, +r6, lsl #2]
        ldr     r1, [r0]
        add     r0, sp, #0x38
        ldr     r0, [r0, #4]
        bl      __gesf2
        cmp     r0, #0
        movlt   r7, #0
        movlt   r5, #1
        movge   r5, #0
        movge   r7, #1
        add     r0, sp, #0x38
        ldr     r0, [r0, #0xC]
        add     r1, sp, #0x38
        ldr     r1, [r1, #8]
        bl      __gesf2
        cmp     r0, #0
        movlt   r9, #2
        movlt   r11, #3
        movge   r11, #2
        movge   r9, #3
        add     r0, sp, #0x38
        add     r1, sp, #0x38
        ldr     r0, [r0, +r11, lsl #2]
        ldr     r4, [r1, +r5, lsl #2]
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        ble     LBHS1
        add     r0, sp, #0x38
        ldr     r4, [r0, +r11, lsl #2]
        mov     r5, r11
LBHS1:
        add     r0, sp, #0x38
        add     r2, sp, #0x38
        ldr     r0, [r0, +r9, lsl #2]
        ldr     r11, [r2, +r7, lsl #2]
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS2
        add     r0, sp, #0x38
        ldr     r11, [r0, +r9, lsl #2]
        mov     r7, r9
LBHS2:
        mov     r0, r11
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS3
        mov     r0, r5
        add     r1, sp, #0x38
        ldr     r11, [r1, +r0, lsl #2]
        mov     r5, r7
LBHS3:
        add     r2, sp, #0x38
        ldr     r4, [r2, #0x10]
        mov     r1, r11
        mov     r0, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS4
        add     r1, sp, #0x38
        ldr     r1, [r1, +r5, lsl #2]
        mov     r0, r4
        bl      __gesf2
        cmp     r0, #0
        movge   r5, #4
        add     r0, sp, #0x38
        ldr     r11, [r0, +r5, lsl #2]
LBHS4:
        add     r6, r6, #1
        str     r11, [r8], #4
        cmp     r6, #4
        movgt   r6, #0
        ldr     r0, [sp, #4]
        add     r10, r10, #1
        cmp     r10, r0
        blt     LBHS0
        ldr     r7, [sp, #8]
        ldr     r12, [sp, #0xC]
        ldr     r5, [sp, #0x10]
        ldr     r4, [sp, #0x14]
        add     r2, sp, #0x38
LBHS5:
        ldr     r12, [r12, +r10, lsl #2]
        add     r3, sp, #0x38
        add     r1, sp, #0x38
        str     r12, [r3, +r6, lsl #2]
        ldr     r0, [r2, #4]
        mov     r10, r10, lsl #2
        str     r10, [sp, #0x28]
        ldr     r1, [r1]
        mov     r9, #0
        bl      __gesf2
        cmp     r0, #0
        movlt   r10, #1
        movge   r10, r9
        movge   r9, #1
        add     r1, sp, #0x38
        ldr     r0, [r1, #0xC]
        add     r1, sp, #0x38
        ldr     r1, [r1, #8]
        mov     r8, #2
        bl      __gesf2
        cmp     r0, #0
        movlt   r11, #3
        movge   r11, r8
        movge   r8, #3
        add     r1, sp, #0x38
        add     r2, sp, #0x38
        ldr     r0, [r2, +r11, lsl #2]
        ldr     r6, [r1, +r10, lsl #2]
        mov     r1, r6
        bl      __gtsf2
        cmp     r0, #0
        ble     LBHS6
        add     r1, sp, #0x38
        ldr     r6, [r1, +r11, lsl #2]
        mov     r10, r11
LBHS6:
        add     r3, sp, #0x38
        ldr     r0, [r3, +r8, lsl #2]
        add     r2, sp, #0x38
        ldr     r11, [r2, +r9, lsl #2]
        mov     r1, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS7
        add     r2, sp, #0x38
        ldr     r11, [r2, +r8, lsl #2]
        mov     r9, r8
LBHS7:
        mov     r0, r11
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS8
        mov     r2, r10
        add     r1, sp, #0x38
        ldr     r11, [r1, +r2, lsl #2]
        mov     r10, r9
LBHS8:
        ldr     r7, [r7]
        mov     r1, r11
        mov     r0, r7
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS9
        add     r1, sp, #0x38
        ldr     r1, [r1, +r10, lsl #2]
        mov     r0, r7
        bl      __gesf2
        cmp     r0, #0
        movge   r10, #4
        add     r1, sp, #0x38
        ldr     r11, [r1, +r10, lsl #2]
LBHS9:
        ldr     r2, [sp, #0x28]
        mov     r0, r4
        str     r11, [r5, +r2]
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LBHS10:
        add     r3, r6, #7
        bic     r9, r3, #7
        mov     r3, r6, asr #1
        mov     r0, r9, lsl #1
        str     r3, [sp, #0x2C]
        bl      _ippsMalloc_32f
        mov     r5, r0
        cmp     r5, #0
        beq     LBHS87
        ldr     r3, [sp, #0x2C]
        sub     r8, r8, #1
        add     r9, r5, r9, lsl #2
        cmp     r3, #0
        ble     LBHS14
        ldr     r3, [sp, #0x2C]
        cmp     r3, #6
        blt     LBHS12
        ldr     r3, [sp, #0x2C]
        add     lr, r5, #4
        add     r12, r9, #4
        sub     r3, r3, #6
LBHS11:
        ldr     r11, [r7]
        add     r10, r10, #5
        cmp     r10, r3
        str     r11, [lr, #-4]
        str     r11, [r12, #-4]
        ldr     r11, [r7]
        str     r11, [lr]
        str     r11, [r12]
        ldr     r11, [r7]
        str     r11, [lr, #4]
        str     r11, [r12, #4]
        ldr     r11, [r7]
        str     r11, [lr, #8]
        str     r11, [r12, #8]
        ldr     r11, [r7]
        str     r11, [lr, #0xC]
        add     lr, lr, #0x14
        str     r11, [r12, #0xC]
        add     r12, r12, #0x14
        ble     LBHS11
LBHS12:
        ldr     lr, [sp, #0x2C]
        add     r12, r5, r10, lsl #2
        add     r3, r9, r10, lsl #2
LBHS13:
        ldr     r11, [r7]
        add     r10, r10, #1
        cmp     r10, lr
        str     r11, [r12], #4
        str     r11, [r3], #4
        blt     LBHS13
LBHS14:
        cmp     r10, r6
        mov     r11, #0
        bge     LBHS18
        sub     r3, r6, r10
        cmp     r3, #5
        blt     LBHS16
LBHS15:
        cmp     r11, r8
        bgt     LBHS71
        ldr     r3, [r7, +r11, lsl #2]
        add     r11, r11, #1
        cmp     r11, r8
        str     r3, [r5, +r10, lsl #2]
        str     r3, [r9, +r10, lsl #2]
        add     r10, r10, #1
        bgt     LBHS71
        ldr     r3, [r7, +r11, lsl #2]
        add     r11, r11, #1
        cmp     r11, r8
        str     r3, [r5, +r10, lsl #2]
        str     r3, [r9, +r10, lsl #2]
        add     r10, r10, #1
        bgt     LBHS71
        ldr     r3, [r7, +r11, lsl #2]
        add     r11, r11, #1
        cmp     r11, r8
        str     r3, [r5, +r10, lsl #2]
        str     r3, [r9, +r10, lsl #2]
        add     r10, r10, #1
        bgt     LBHS71
        ldr     r3, [r7, +r11, lsl #2]
        add     r11, r11, #1
        str     r3, [r5, +r10, lsl #2]
        str     r3, [r9, +r10, lsl #2]
        add     r10, r10, #1
        sub     r3, r6, #5
        cmp     r10, r3
        ble     LBHS15
LBHS16:
        add     lr, r5, r10, lsl #2
        add     r12, r9, r10, lsl #2
        add     r3, r7, r11, lsl #2
LBHS17:
        cmp     r11, r8
        bgt     LBHS71
        ldr     r0, [r3], #4
        add     r10, r10, #1
        str     r0, [lr], #4
        str     r0, [r12], #4
        cmp     r10, r6
        add     r11, r11, #1
        blt     LBHS17
LBHS18:
        mov     r1, r6
        mov     r0, r5
        bl      ownippsIpp32fSort
        cmp     r11, r8
        mov     r3, #1
        mov     r10, #0
        bgt     LBHS30
        add     r12, r7, r11, lsl #2
        add     r2, r7, #4
        add     r0, r5, #4
        sub     r1, r5, #4
        sub     lr, r6, #5
        str     r7, [sp, #0x24]
        str     r2, [sp, #4]
        str     r12, [sp]
        str     lr, [sp, #0x34]
        str     r1, [sp, #0x30]
        str     r3, [sp, #0x1C]
        str     r11, [sp, #0x10]
        str     r8, [sp, #0x20]
        str     r4, [sp, #0x14]
        mov     r7, r0
LBHS19:
        ldr     r0, [r5]
        ldr     r4, [r9, +r10, lsl #2]
        mov     r8, r10, lsl #2
        mov     r1, r4
        bl      __nesf2
        cmp     r0, #0
        moveq   r3, #0
        moveq   r11, r3
        beq     LBHS21
        mov     r0, r5
        str     r6, [sp, #8]
        mov     r11, #0
        mov     r6, r0
LBHS20:
        add     r6, r6, #4
        ldr     r0, [r6]
        mov     r1, r4
        add     r11, r11, #1
        bl      __nesf2
        cmp     r0, #0
        mov     r3, r11, lsl #2
        bne     LBHS20
        ldr     r6, [sp, #8]
LBHS21:
        ldr     r12, [sp]
        ldr     r4, [r12], #4
        str     r12, [sp]
        str     r4, [r9, +r8]
        ldr     r1, [r3, +r5]
        mov     r0, r4
        bl      __gesf2
        cmp     r0, #0
        blt     LBHS23
        add     r11, r11, #1
        cmp     r11, r6
        movge   r11, r11, lsl #2
        bge     LBHS28
        sub     r3, r6, r11
        cmp     r3, #5
        blt     LBHS26
        str     r7, [sp, #0x18]
        ldr     r7, [sp, #0x30]
        str     r10, [sp, #0xC]
        str     r6, [sp, #8]
LBHS22:
        ldr     r10, [r5, +r11, lsl #2]
        mov     r1, r4
        mov     r6, r11, lsl #2
        mov     r0, r10
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS61
        str     r10, [r7, +r6]
        add     r10, r11, #1
        ldr     r0, [r5, +r10, lsl #2]
        mov     r6, r10, lsl #2
        str     r0, [sp, #0x28]
        ldr     r4, [r9, +r8]
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS60
        ldr     r1, [sp, #0x28]
        str     r1, [r7, +r10, lsl #2]
        add     r10, r11, #2
        ldr     r0, [r5, +r10, lsl #2]
        mov     r6, r10, lsl #2
        str     r0, [sp, #0x28]
        ldr     r4, [r9, +r8]
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS59
        ldr     r1, [sp, #0x28]
        add     r2, r11, #3
        str     r1, [r7, +r10, lsl #2]
        str     r2, [sp, #0x28]
        ldr     r10, [r5, +r2, lsl #2]
        ldr     r4, [r9, +r8]
        mov     r6, r2, lsl #2
        mov     r0, r10
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS58
        ldr     r1, [sp, #0x34]
        add     r11, r11, #4
        cmp     r11, r1
        ldr     r1, [sp, #0x28]
        str     r10, [r7, +r1, lsl #2]
        ldrle   r4, [r9, +r8]
        ble     LBHS22
        b       LBHS25
LBHS23:
        subs    r11, r11, #1
        movmi   r11, r11, lsl #2
        bmi     LBHS65
        cmp     r11, #5
        blt     LBHS63
        str     r10, [sp, #0xC]
        str     r6, [sp, #8]
LBHS24:
        ldr     r10, [r5, +r11, lsl #2]
        mov     r1, r4
        mov     r6, r11, lsl #2
        mov     r0, r10
        bl      __gtsf2
        cmp     r0, #0
        ble     LBHS70
        str     r10, [r7, +r6]
        sub     r11, r11, #1
        ldr     r10, [r5, +r11, lsl #2]
        ldr     r4, [r9, +r8]
        mov     r6, r11, lsl #2
        mov     r0, r10
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        ble     LBHS69
        str     r10, [r7, +r11, lsl #2]
        sub     r11, r11, #1
        ldr     r10, [r5, +r11, lsl #2]
        ldr     r4, [r9, +r8]
        mov     r6, r11, lsl #2
        mov     r0, r10
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        ble     LBHS68
        str     r10, [r7, +r11, lsl #2]
        sub     r10, r11, #1
        ldr     r0, [r5, +r10, lsl #2]
        mov     r6, r10, lsl #2
        str     r0, [sp, #0x28]
        ldr     r4, [r9, +r8]
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        ble     LBHS67
        ldr     r1, [sp, #0x28]
        sub     r11, r10, #1
        cmp     r11, #5
        str     r1, [r7, +r10, lsl #2]
        ldrge   r4, [r9, +r8]
        bge     LBHS24
        b       LBHS62
LBHS25:
        ldr     r7, [sp, #0x18]
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r4, [r9, +r8]
LBHS26:
        str     r7, [sp, #0x18]
        str     r10, [sp, #0xC]
LBHS27:
        ldr     r10, [r5, +r11, lsl #2]
        mov     r1, r4
        mov     r7, r11, lsl #2
        mov     r0, r10
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS57
        ldr     r3, [sp, #0x30]
        add     r11, r11, #1
        cmp     r11, r6
        str     r10, [r3, +r7]
        ldrlt   r4, [r9, +r8]
        blt     LBHS27
        ldr     r7, [sp, #0x18]
        ldr     r10, [sp, #0xC]
        ldr     r4, [r9, +r8]
        mov     r11, r11, lsl #2
LBHS28:
        ldr     r3, [sp, #0x30]
        str     r4, [r3, +r11]
LBHS29:
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #4]
        add     r10, r10, #1
        ldr     r3, [r5, +r3, lsl #2]
        cmp     r10, r6
        str     r3, [r12], #4
        str     r12, [sp, #4]
        movge   r10, #0
        ldr     r3, [sp, #0x10]
        ldr     r12, [sp, #0x20]
        add     r3, r3, #1
        str     r3, [sp, #0x10]
        cmp     r3, r12
        ldr     r3, [sp, #0x1C]
        add     r3, r3, #1
        str     r3, [sp, #0x1C]
        ble     LBHS19
        ldr     r3, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
        ldr     r4, [sp, #0x14]
        ldr     r7, [sp, #0x24]
LBHS30:
        cmp     r3, r8
        bge     LBHS42
        sub     lr, r5, #4
        sub     r12, r6, #5
        add     r0, r7, r3, lsl #2
        add     r11, r5, #4
        str     r0, [sp, #0x18]
        str     r12, [sp, #4]
        str     lr, [sp]
        str     r3, [sp, #0x1C]
        str     r8, [sp, #0x20]
        str     r4, [sp, #0x14]
        str     r7, [sp, #0x24]
LBHS31:
        ldr     r0, [r5]
        ldr     r4, [r9, +r10, lsl #2]
        mov     r7, r10, lsl #2
        mov     r1, r4
        bl      __nesf2
        cmp     r0, #0
        moveq   r3, #0
        moveq   r8, r3
        beq     LBHS33
        mov     r0, r5
        str     r6, [sp, #8]
        mov     r8, #0
        mov     r6, r0
LBHS32:
        add     r6, r6, #4
        ldr     r0, [r6]
        mov     r1, r4
        add     r8, r8, #1
        bl      __nesf2
        cmp     r0, #0
        mov     r3, r8, lsl #2
        bne     LBHS32
        ldr     r6, [sp, #8]
LBHS33:
        ldr     r12, [sp, #0x24]
        ldr     lr, [sp, #0x20]
        ldr     r4, [r12, +lr, lsl #2]
        str     r4, [r9, +r7]
        ldr     r1, [r3, +r5]
        mov     r0, r4
        bl      __gesf2
        cmp     r0, #0
        blt     LBHS35
        add     r8, r8, #1
        cmp     r8, r6
        movge   r8, r8, lsl #2
        bge     LBHS40
        sub     r3, r6, r8
        cmp     r3, #5
        blt     LBHS38
        str     r10, [sp, #0xC]
        ldr     r10, [sp]
        str     r11, [sp, #0x10]
        str     r6, [sp, #8]
LBHS34:
        ldr     r11, [r5, +r8, lsl #2]
        mov     r1, r4
        mov     r6, r8, lsl #2
        mov     r0, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS47
        str     r11, [r10, +r6]
        add     r11, r8, #1
        ldr     r0, [r5, +r11, lsl #2]
        mov     r6, r11, lsl #2
        str     r0, [sp, #0x28]
        ldr     r4, [r9, +r7]
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS46
        ldr     r1, [sp, #0x28]
        str     r1, [r10, +r11, lsl #2]
        add     r11, r8, #2
        ldr     r0, [r5, +r11, lsl #2]
        mov     r6, r11, lsl #2
        str     r0, [sp, #0x28]
        ldr     r4, [r9, +r7]
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS45
        ldr     r1, [sp, #0x28]
        str     r1, [r10, +r11, lsl #2]
        add     r11, r8, #3
        ldr     r0, [r5, +r11, lsl #2]
        mov     r6, r11, lsl #2
        str     r0, [sp, #0x28]
        ldr     r4, [r9, +r7]
        mov     r1, r4
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS44
        ldr     r1, [sp, #4]
        add     r8, r8, #4
        cmp     r8, r1
        ldr     r1, [sp, #0x28]
        str     r1, [r10, +r11, lsl #2]
        ldrle   r4, [r9, +r7]
        ble     LBHS34
        b       LBHS37
LBHS35:
        sub     r8, r8, #1
        cmp     r8, #0
        movle   r8, r8, lsl #2
        ble     LBHS51
        cmp     r8, #5
        blt     LBHS49
        str     r10, [sp, #0xC]
        str     r6, [sp, #8]
LBHS36:
        ldr     r10, [r5, +r8, lsl #2]
        mov     r1, r4
        mov     r6, r8, lsl #2
        mov     r0, r10
        bl      __gtsf2
        cmp     r0, #0
        ble     LBHS56
        str     r10, [r11, +r6]
        sub     r10, r8, #1
        ldr     r8, [r5, +r10, lsl #2]
        ldr     r4, [r9, +r7]
        mov     r6, r10, lsl #2
        mov     r0, r8
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        ble     LBHS55
        str     r8, [r11, +r10, lsl #2]
        sub     r10, r10, #1
        ldr     r8, [r5, +r10, lsl #2]
        ldr     r4, [r9, +r7]
        mov     r6, r10, lsl #2
        mov     r0, r8
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        ble     LBHS54
        str     r8, [r11, +r10, lsl #2]
        sub     r10, r10, #1
        ldr     r0, [r5, +r10, lsl #2]
        mov     r6, r10, lsl #2
        str     r0, [sp, #0x28]
        ldr     r4, [r9, +r7]
        mov     r1, r4
        bl      __gtsf2
        cmp     r0, #0
        ble     LBHS53
        ldr     r1, [sp, #0x28]
        sub     r8, r10, #1
        cmp     r8, #5
        str     r1, [r11, +r10, lsl #2]
        ldrge   r4, [r9, +r7]
        bge     LBHS36
        b       LBHS48
LBHS37:
        ldr     r11, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r4, [r9, +r7]
LBHS38:
        str     r11, [sp, #0x10]
        str     r10, [sp, #0xC]
LBHS39:
        ldr     r11, [r5, +r8, lsl #2]
        mov     r1, r4
        mov     r10, r8, lsl #2
        mov     r0, r11
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS43
        ldr     r3, [sp]
        add     r8, r8, #1
        cmp     r8, r6
        str     r11, [r3, +r10]
        ldrlt   r4, [r9, +r7]
        blt     LBHS39
        ldr     r11, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r4, [r9, +r7]
        mov     r8, r8, lsl #2
LBHS40:
        ldr     r3, [sp]
        str     r4, [r3, +r8]
LBHS41:
        ldr     r3, [sp, #0x2C]
        ldr     r12, [sp, #0x18]
        add     r10, r10, #1
        ldr     r3, [r5, +r3, lsl #2]
        cmp     r10, r6
        str     r3, [r12], #4
        str     r12, [sp, #0x18]
        movge   r10, #0
        ldr     r3, [sp, #0x1C]
        ldr     r12, [sp, #0x20]
        add     r3, r3, #1
        str     r3, [sp, #0x1C]
        cmp     r3, r12
        blt     LBHS31
        ldr     r4, [sp, #0x14]
LBHS42:
        mov     r0, r5
        bl      _ippsFree
        mov     r0, r4
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LBHS43:
        mov     r8, r10
        ldr     r11, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        b       LBHS40
LBHS44:
        mov     r8, r6
        ldr     r11, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS40
LBHS45:
        mov     r8, r6
        ldr     r11, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS40
LBHS46:
        mov     r8, r6
        ldr     r11, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS40
LBHS47:
        mov     r8, r6
        ldr     r11, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS40
LBHS48:
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r4, [r9, +r7]
LBHS49:
        str     r10, [sp, #0xC]
        str     r6, [sp, #8]
LBHS50:
        ldr     r10, [r5, +r8, lsl #2]
        mov     r1, r4
        mov     r6, r8, lsl #2
        mov     r0, r10
        bl      __gtsf2
        cmp     r0, #0
        ble     LBHS52
        sub     r8, r8, #1
        cmp     r8, #0
        str     r10, [r11, +r6]
        ldrgt   r4, [r9, +r7]
        bgt     LBHS50
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r4, [r9, +r7]
        mov     r8, r8, lsl #2
LBHS51:
        str     r4, [r11, +r8]
        b       LBHS41
LBHS52:
        mov     r8, r6
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS51
LBHS53:
        mov     r8, r6
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS51
LBHS54:
        mov     r8, r6
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS51
LBHS55:
        mov     r8, r6
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS51
LBHS56:
        mov     r8, r6
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS51
LBHS57:
        mov     r11, r7
        ldr     r7, [sp, #0x18]
        ldr     r10, [sp, #0xC]
        b       LBHS28
LBHS58:
        mov     r11, r6
        ldr     r7, [sp, #0x18]
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS28
LBHS59:
        mov     r11, r6
        ldr     r7, [sp, #0x18]
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS28
LBHS60:
        mov     r11, r6
        ldr     r7, [sp, #0x18]
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS28
LBHS61:
        mov     r11, r6
        ldr     r7, [sp, #0x18]
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS28
LBHS62:
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r4, [r9, +r8]
LBHS63:
        str     r10, [sp, #0xC]
        str     r6, [sp, #8]
LBHS64:
        ldr     r10, [r5, +r11, lsl #2]
        mov     r1, r4
        mov     r6, r11, lsl #2
        mov     r0, r10
        bl      __gtsf2
        cmp     r0, #0
        ble     LBHS66
        subs    r11, r11, #1
        str     r10, [r7, +r6]
        ldrpl   r4, [r9, +r8]
        bpl     LBHS64
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r4, [r9, +r8]
        mov     r11, r11, lsl #2
LBHS65:
        str     r4, [r7, +r11]
        b       LBHS29
LBHS66:
        mov     r11, r6
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS65
LBHS67:
        mov     r11, r6
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS65
LBHS68:
        mov     r11, r6
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS65
LBHS69:
        mov     r11, r6
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS65
LBHS70:
        mov     r11, r6
        ldr     r10, [sp, #0xC]
        ldr     r6, [sp, #8]
        b       LBHS65
LBHS71:
        cmp     r10, r6
        bge     LBHS18
        sub     r3, r6, r10
        cmp     r3, #6
        movlt   r0, r8, lsl #2
        blt     LBHS73
        mov     r3, r10, lsl #2
        add     r3, r3, #4
        add     r12, r3, r5
        mov     r0, r8, lsl #2
        sub     lr, r6, #6
        add     r3, r3, r9
LBHS72:
        ldr     r1, [r7, +r8, lsl #2]
        add     r10, r10, #5
        cmp     r10, lr
        str     r1, [r12, #-4]
        str     r1, [r3, #-4]
        ldr     r1, [r7, +r8, lsl #2]
        str     r1, [r12]
        str     r1, [r3]
        ldr     r1, [r7, +r8, lsl #2]
        str     r1, [r12, #4]
        str     r1, [r3, #4]
        ldr     r1, [r7, +r8, lsl #2]
        str     r1, [r12, #8]
        str     r1, [r3, #8]
        ldr     r1, [r7, +r8, lsl #2]
        str     r1, [r12, #0xC]
        add     r12, r12, #0x14
        str     r1, [r3, #0xC]
        add     r3, r3, #0x14
        ble     LBHS72
LBHS73:
        add     r12, r5, r10, lsl #2
        add     r3, r9, r10, lsl #2
LBHS74:
        ldr     lr, [r0, +r7]
        add     r10, r10, #1
        cmp     r10, r6
        str     lr, [r12], #4
        str     lr, [r3], #4
        blt     LBHS74
        b       LBHS18
LBHS75:
        ldr     r6, [r7]
        ldr     r5, [r7, #4]
        sub     r8, r8, #2
        add     r3, sp, #0x4C
        add     r2, sp, #0x4C
        cmp     r8, #3
        str     r6, [r3]
        str     r5, [r2, #4]
        add     r9, r7, #4
        blt     LBHS80
        mov     r12, #3
        add     r0, r7, #8
        add     lr, r7, #0x10
        str     r8, [sp, #0x30]
        add     r3, sp, #0x4C
        add     r11, r7, #0xC
        str     lr, [sp, #0x34]
        str     r12, [sp, #0x28]
        str     r9, [sp, #0x2C]
        str     r4, [sp, #0x14]
        str     r7, [sp, #0x24]
        mov     r8, r0
LBHS76:
        mov     r1, r6
        ldr     r4, [r8, +r10, lsl #2]
        add     r2, sp, #0x4C
        mov     r0, r5
        str     r4, [r2, #8]
        bl      __gesf2
        cmp     r0, #0
        mov     r9, r10, lsl #2
        movlt   r2, #0
        movlt   r7, #1
        movge   r7, #0
        movge   r2, #1
        add     r1, sp, #0x4C
        ldr     r6, [r1, +r2, lsl #2]
        mov     r0, r4
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS77
        add     r1, sp, #0x4C
        ldr     r1, [r1, +r7, lsl #2]
        mov     r0, r4
        bl      __lesf2
        cmp     r0, #0
        movgt   r7, #2
        add     r1, sp, #0x4C
        ldr     r6, [r1, +r7, lsl #2]
LBHS77:
        ldr     r2, [sp, #0x2C]
        mov     r0, r5
        str     r6, [r2, +r9]
        ldr     r6, [r11, +r9]
        add     r2, sp, #0x4C
        str     r6, [r2]
        mov     r1, r6
        bl      __gesf2
        cmp     r0, #0
        movlt   r3, #0
        movlt   r5, #1
        movge   r5, #0
        movge   r3, #1
        add     r2, sp, #0x4C
        ldr     r7, [r2, +r3, lsl #2]
        mov     r0, r4
        mov     r1, r7
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS78
        add     r2, sp, #0x4C
        ldr     r1, [r2, +r5, lsl #2]
        mov     r0, r4
        bl      __lesf2
        cmp     r0, #0
        movgt   r5, #2
        add     r2, sp, #0x4C
        ldr     r7, [r2, +r5, lsl #2]
LBHS78:
        str     r7, [r8, +r9]
        ldr     r2, [sp, #0x34]
        mov     r1, r6
        ldr     r5, [r2, +r9]
        add     r2, sp, #0x4C
        str     r5, [r2, #4]
        mov     r0, r5
        bl      __gesf2
        cmp     r0, #0
        movlt   r3, #0
        movlt   r10, #1
        movge   r10, #0
        movge   r3, #1
        add     r2, sp, #0x4C
        ldr     r7, [r2, +r3, lsl #2]
        mov     r0, r4
        mov     r1, r7
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS79
        add     r2, sp, #0x4C
        ldr     r1, [r2, +r10, lsl #2]
        mov     r0, r4
        bl      __lesf2
        cmp     r0, #0
        movgt   r10, #2
        add     r2, sp, #0x4C
        ldr     r7, [r2, +r10, lsl #2]
LBHS79:
        ldr     r10, [sp, #0x28]
        ldr     r3, [sp, #0x30]
        add     r2, r10, #3
        str     r2, [sp, #0x28]
        cmp     r3, r2
        str     r7, [r11, +r9]
        bge     LBHS76
        ldr     r9, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
        ldr     r4, [sp, #0x14]
        ldr     r7, [sp, #0x24]
LBHS80:
        cmp     r10, r8
        add     r11, r10, #1
        bge     LBHS84
        ldr     r10, [r9, +r11, lsl #2]
        add     r2, sp, #0x4C
        mov     r0, r5
        str     r10, [r2, #8]
        mov     r1, r6
        bl      __gesf2
        cmp     r0, #0
        mov     r6, #0
        strge   r6, [sp, #0x20]
        movge   r1, #1
        bge     LBHS81
        mov     r1, r6
        mov     r2, #1
        str     r2, [sp, #0x20]
LBHS81:
        add     r2, sp, #0x4C
        ldr     r1, [r2, +r1, lsl #2]
        mov     r0, r10
        str     r1, [sp, #0x28]
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS82
        ldr     r2, [sp, #0x20]
        add     r1, sp, #0x4C
        mov     r0, r10
        ldr     r1, [r1, +r2, lsl #2]
        bl      __lesf2
        cmp     r0, #0
        movgt   r1, #2
        strgt   r1, [sp, #0x20]
        ldr     r2, [sp, #0x20]
        add     r1, sp, #0x4C
        ldr     r2, [r1, +r2, lsl #2]
        str     r2, [sp, #0x28]
LBHS82:
        ldr     r1, [sp, #0x28]
        cmp     r11, r8
        str     r1, [r7, +r11, lsl #2]
        bge     LBHS84
        add     r7, r7, #8
        ldr     r1, [r7, +r11, lsl #2]
        add     r2, sp, #0x4C
        mov     r0, r5
        str     r1, [r2]
        bl      __gesf2
        cmp     r0, #0
        movlt   r5, #1
        movge   r5, r6
        movge   r6, #1
        add     r1, sp, #0x4C
        ldr     r6, [r1, +r6, lsl #2]
        mov     r0, r10
        mov     r1, r6
        bl      __ltsf2
        cmp     r0, #0
        bge     LBHS83
        add     r1, sp, #0x4C
        ldr     r1, [r1, +r5, lsl #2]
        mov     r0, r10
        bl      __lesf2
        cmp     r0, #0
        movgt   r5, #2
        add     r1, sp, #0x4C
        ldr     r6, [r1, +r5, lsl #2]
LBHS83:
        str     r6, [r9, +r11, lsl #2]
LBHS84:
        mov     r0, r4
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LBHS85:
        mvn     r0, #5
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LBHS86:
        mvn     r0, #7
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LBHS87:
        mvn     r0, #8
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}


