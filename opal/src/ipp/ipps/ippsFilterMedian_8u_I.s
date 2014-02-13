        .text
        .align  4
        .globl  _ippsFilterMedian_8u_I


_ippsFilterMedian_8u_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        mov     r7, r0
        cmp     r7, #0
        mov     r8, r1
        mov     r6, r2
        beq     LBHM85
        cmp     r8, #0
        ble     LBHM84
        cmp     r6, #0
        ble     LBHM84
        tst     r6, #1
        mov     r9, #0
        movne   r5, r9
        subeq   r6, r6, #1
        moveq   r5, #5
        cmp     r6, #1
        beq     LBHM83
        cmp     r8, #2
        ble     LBHM83
        cmp     r6, #3
        beq     LBHM75
        cmp     r6, #5
        bne     LBHM10
        ldrb    lr, [r7]
        add     r6, sp, #0x28
        ldrb    r4, [r7, #1]
        str     lr, [r6]
        ldrb    r6, [r7, #2]
        add     r3, sp, #0x28
        sub     r8, r8, #3
        add     r12, sp, #0x28
        add     r2, sp, #0x28
        str     r4, [r3, #8]
        cmp     r8, #0
        str     lr, [r12, #4]
        str     r6, [r2, #0xC]
        mov     r4, #4
        addle   r6, sp, #0x38
        ble     LBHM5
        add     lr, sp, #0x28
        add     r6, lr, #0x10
        mov     r1, r7
        str     r6, [sp]
        str     r5, [sp, #4]
        str     r7, [sp, #8]
LBHM0:
        ldrb    r5, [r1, #3]
        add     r0, sp, #0x28
        str     r5, [r0, +r4, lsl #2]
        add     r5, sp, #0x28
        ldr     r0, [r12, #4]
        ldr     r5, [r5]
        cmp     r0, r5
        movlt   r6, #0
        movlt   r5, #1
        movge   r5, #0
        movge   r6, #1
        ldr     r0, [r3, #8]
        ldr     r7, [r2, #0xC]
        cmp     r7, r0
        movlt   r7, #2
        movlt   r11, #3
        movge   r11, #2
        movge   r7, #3
        add     r0, sp, #0x28
        add     r10, sp, #0x28
        ldr     r0, [r0, +r5, lsl #2]
        ldr     r10, [r10, +r11, lsl #2]
        cmp     r10, r0
        ble     LBHM1
        add     r0, sp, #0x28
        ldr     r0, [r0, +r11, lsl #2]
        mov     r5, r11
LBHM1:
        add     r11, sp, #0x28
        add     r10, sp, #0x28
        ldr     r11, [r11, +r6, lsl #2]
        ldr     r10, [r10, +r7, lsl #2]
        cmp     r10, r11
        bge     LBHM2
        add     r10, sp, #0x28
        ldr     r11, [r10, +r7, lsl #2]
        mov     r6, r7
LBHM2:
        cmp     r11, r0
        bge     LBHM3
        mov     r0, r5
        add     r7, sp, #0x28
        ldr     r11, [r7, +r0, lsl #2]
        mov     r5, r6
LBHM3:
        ldr     r0, [lr, #0x10]
        cmp     r0, r11
        bge     LBHM4
        add     r6, sp, #0x28
        ldr     r6, [r6, +r5, lsl #2]
        cmp     r0, r6
        movge   r5, #4
        add     r0, sp, #0x28
        ldr     r11, [r0, +r5, lsl #2]
LBHM4:
        add     r4, r4, #1
        cmp     r4, #4
        strb    r11, [r1, #1]
        movgt   r4, #0
        add     r9, r9, #1
        cmp     r9, r8
        add     r1, r1, #1
        blt     LBHM0
        ldr     r6, [sp]
        ldr     r5, [sp, #4]
        ldr     r7, [sp, #8]
LBHM5:
        add     r1, r9, r7
        ldrb    lr, [r1, #2]
        add     r8, sp, #0x28
        add     r1, sp, #0x28
        str     lr, [r8, +r4, lsl #2]
        ldr     lr, [r12, #4]
        ldr     r1, [r1]
        mov     r12, #0
        cmp     lr, r1
        movlt   r1, #1
        movge   r1, r12
        movge   r12, #1
        ldr     lr, [r3, #8]
        ldr     r2, [r2, #0xC]
        mov     r3, #2
        cmp     r2, lr
        movlt   lr, #3
        movge   lr, r3
        movge   r3, #3
        add     r2, sp, #0x28
        add     r4, sp, #0x28
        ldr     r2, [r2, +r1, lsl #2]
        ldr     r4, [r4, +lr, lsl #2]
        cmp     r4, r2
        ble     LBHM6
        add     r2, sp, #0x28
        ldr     r2, [r2, +lr, lsl #2]
        mov     r1, lr
LBHM6:
        add     lr, sp, #0x28
        add     r4, sp, #0x28
        ldr     lr, [lr, +r12, lsl #2]
        ldr     r4, [r4, +r3, lsl #2]
        cmp     r4, lr
        bge     LBHM7
        add     lr, sp, #0x28
        ldr     lr, [lr, +r3, lsl #2]
        mov     r12, r3
LBHM7:
        cmp     lr, r2
        bge     LBHM8
        mov     r3, r1
        add     r2, sp, #0x28
        ldr     lr, [r2, +r3, lsl #2]
        mov     r1, r12
LBHM8:
        ldr     r6, [r6]
        cmp     r6, lr
        bge     LBHM9
        add     r2, sp, #0x28
        ldr     r2, [r2, +r1, lsl #2]
        cmp     r6, r2
        movge   r1, #4
        add     r2, sp, #0x28
        ldr     lr, [r2, +r1, lsl #2]
LBHM9:
        add     r7, r9, r7
        mov     r0, r5
        strb    lr, [r7, #1]
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHM10:
        add     r3, r6, #7
        bic     r11, r3, #7
        mov     r10, r6, asr #1
        mov     r0, r11, lsl #1
        bl      _ippsMalloc_32s
        mov     r4, r0
        cmp     r4, #0
        beq     LBHM86
        add     r11, r4, r11, lsl #2
        cmp     r10, #0
        sub     r8, r8, #1
        str     r11, [sp, #0x1C]
        ble     LBHM14
        cmp     r10, #6
        blt     LBHM12
        ldr     r3, [sp, #0x1C]
        sub     lr, r10, #6
        add     r12, r4, #4
        add     r3, r3, #4
LBHM11:
        ldrb    r11, [r7]
        add     r9, r9, #5
        cmp     r9, lr
        str     r11, [r12, #-4]
        str     r11, [r3, #-4]
        ldrb    r11, [r7]
        str     r11, [r12]
        str     r11, [r3]
        ldrb    r11, [r7]
        str     r11, [r12, #4]
        str     r11, [r3, #4]
        ldrb    r11, [r7]
        str     r11, [r12, #8]
        str     r11, [r3, #8]
        ldrb    r11, [r7]
        str     r11, [r12, #0xC]
        add     r12, r12, #0x14
        str     r11, [r3, #0xC]
        add     r3, r3, #0x14
        ble     LBHM11
LBHM12:
        ldr     r12, [sp, #0x1C]
        add     r3, r4, r9, lsl #2
        add     r12, r12, r9, lsl #2
LBHM13:
        ldrb    lr, [r7]
        add     r9, r9, #1
        cmp     r9, r10
        str     lr, [r3], #4
        str     lr, [r12], #4
        blt     LBHM13
LBHM14:
        cmp     r9, r6
        mov     r11, #0
        bge     LBHM18
        sub     r3, r6, r9
        cmp     r3, #5
        blt     LBHM16
        ldr     r3, [sp, #0x1C]
LBHM15:
        cmp     r11, r8
        bgt     LBHM71
        ldrb    r12, [r11, +r7]
        add     r11, r11, #1
        cmp     r11, r8
        str     r12, [r4, +r9, lsl #2]
        str     r12, [r3, +r9, lsl #2]
        add     r9, r9, #1
        bgt     LBHM71
        ldrb    r12, [r11, +r7]
        add     r11, r11, #1
        cmp     r11, r8
        str     r12, [r4, +r9, lsl #2]
        str     r12, [r3, +r9, lsl #2]
        add     r9, r9, #1
        bgt     LBHM71
        ldrb    r12, [r11, +r7]
        add     r11, r11, #1
        cmp     r11, r8
        str     r12, [r4, +r9, lsl #2]
        str     r12, [r3, +r9, lsl #2]
        add     r9, r9, #1
        bgt     LBHM71
        ldrb    r12, [r11, +r7]
        add     r11, r11, #1
        str     r12, [r4, +r9, lsl #2]
        str     r12, [r3, +r9, lsl #2]
        add     r9, r9, #1
        sub     r12, r6, #5
        cmp     r9, r12
        ble     LBHM15
LBHM16:
        ldr     r12, [sp, #0x1C]
        add     r3, r4, r9, lsl #2
        add     lr, r11, r7
        add     r12, r12, r9, lsl #2
LBHM17:
        cmp     r11, r8
        bgt     LBHM71
        ldrb    r0, [lr], #1
        add     r9, r9, #1
        str     r0, [r3], #4
        str     r0, [r12], #4
        cmp     r9, r6
        add     r11, r11, #1
        blt     LBHM17
LBHM18:
        mov     r1, r6
        mov     r0, r4
        bl      ownippsIpp32sSort
        cmp     r11, r8
        mov     r12, #1
        mov     r3, #0
        bgt     LBHM30
        add     r2, r4, #4
        str     r2, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        sub     r1, r4, #4
        sub     r0, r6, #5
        add     r9, r11, r7
        add     lr, r7, #1
        str     r0, [sp, #0x24]
        str     r1, [sp]
        str     r5, [sp, #4]
        str     r7, [sp, #8]
LBHM19:
        ldr     r5, [r2, +r3, lsl #2]
        ldr     r7, [r4]
        mov     r1, r3, lsl #2
        cmp     r7, r5
        moveq   r5, #0
        moveq   r7, r5
        beq     LBHM21
        mov     r0, r4
        str     r6, [sp, #0x10]
        mov     r7, #0
        mov     r6, r5
LBHM20:
        add     r0, r0, #4
        ldr     r5, [r0]
        add     r7, r7, #1
        cmp     r5, r6
        mov     r5, r7, lsl #2
        bne     LBHM20
        ldr     r6, [sp, #0x10]
LBHM21:
        ldrb    r0, [r9], #1
        str     r0, [r2, +r1]
        ldr     r5, [r5, +r4]
        cmp     r0, r5
        blt     LBHM23
        add     r7, r7, #1
        cmp     r7, r6
        movge   r5, r7, lsl #2
        bge     LBHM28
        sub     r5, r6, r7
        cmp     r5, #5
        blt     LBHM26
        str     r8, [sp, #0x14]
        str     r6, [sp, #0x10]
        ldr     r6, [sp, #0x24]
        ldr     r8, [sp]
        str     r11, [sp, #0xC]
        str     r10, [sp, #0x18]
LBHM22:
        ldr     r10, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r10, r0
        bge     LBHM61
        str     r10, [r8, +r5]
        add     r10, r7, #1
        ldr     r0, [r2, +r1]
        ldr     r11, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r11, r0
        bge     LBHM60
        str     r11, [r8, +r10, lsl #2]
        add     r10, r7, #2
        ldr     r0, [r2, +r1]
        ldr     r11, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r11, r0
        bge     LBHM59
        str     r11, [r8, +r10, lsl #2]
        add     r10, r7, #3
        ldr     r0, [r2, +r1]
        ldr     r11, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r11, r0
        bge     LBHM58
        add     r7, r7, #4
        cmp     r7, r6
        str     r11, [r8, +r10, lsl #2]
        ldrle   r0, [r2, +r1]
        ble     LBHM22
        b       LBHM25
LBHM23:
        subs    r7, r7, #1
        movmi   r5, r7, lsl #2
        bmi     LBHM65
        cmp     r7, #5
        blt     LBHM63
        str     r6, [sp, #0x10]
        ldr     r6, [sp, #0x20]
        str     r8, [sp, #0x14]
        str     r10, [sp, #0x18]
LBHM24:
        ldr     r8, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r8, r0
        ble     LBHM70
        str     r8, [r6, +r5]
        sub     r7, r7, #1
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r8, r0
        ble     LBHM69
        str     r8, [r6, +r7, lsl #2]
        sub     r7, r7, #1
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r8, r0
        ble     LBHM68
        str     r8, [r6, +r7, lsl #2]
        sub     r8, r7, #1
        ldr     r0, [r2, +r1]
        ldr     r10, [r4, +r8, lsl #2]
        mov     r5, r8, lsl #2
        cmp     r10, r0
        ble     LBHM67
        sub     r7, r8, #1
        cmp     r7, #5
        str     r10, [r6, +r8, lsl #2]
        ldrge   r0, [r2, +r1]
        bge     LBHM24
        b       LBHM62
LBHM25:
        str     r6, [sp, #0x24]
        str     r8, [sp]
        ldr     r11, [sp, #0xC]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r0, [r2, +r1]
LBHM26:
        str     r8, [sp, #0x14]
        ldr     r8, [sp]
        str     r10, [sp, #0x18]
LBHM27:
        ldr     r10, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r10, r0
        bge     LBHM57
        add     r7, r7, #1
        cmp     r7, r6
        str     r10, [r8, +r5]
        ldrlt   r0, [r2, +r1]
        blt     LBHM27
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r0, [r2, +r1]
        mov     r5, r7, lsl #2
LBHM28:
        ldr     r7, [sp]
        str     r0, [r7, +r5]
LBHM29:
        ldr     r5, [r4, +r10, lsl #2]
        add     r3, r3, #1
        cmp     r3, r6
        strb    r5, [lr], #1
        movge   r3, #0
        add     r11, r11, #1
        cmp     r11, r8
        add     r12, r12, #1
        ble     LBHM19
        ldr     r5, [sp, #4]
        ldr     r7, [sp, #8]
LBHM30:
        cmp     r12, r8
        bge     LBHM42
        ldr     r2, [sp, #0x1C]
        sub     r0, r4, #4
        sub     r11, r6, #5
        add     r9, r4, #4
        add     lr, r12, r7
        str     r11, [sp]
        str     r0, [sp, #0xC]
        str     r5, [sp, #4]
LBHM31:
        ldr     r5, [r2, +r3, lsl #2]
        ldr     r11, [r4]
        mov     r1, r3, lsl #2
        cmp     r11, r5
        moveq   r5, #0
        moveq   r11, r5
        beq     LBHM33
        mov     r0, r4
        str     r7, [sp, #8]
        mov     r11, #0
        mov     r7, r5
LBHM32:
        add     r0, r0, #4
        ldr     r5, [r0]
        add     r11, r11, #1
        cmp     r5, r7
        mov     r5, r11, lsl #2
        bne     LBHM32
        ldr     r7, [sp, #8]
LBHM33:
        ldrb    r0, [r7, +r8]
        str     r0, [r2, +r1]
        ldr     r5, [r5, +r4]
        cmp     r0, r5
        blt     LBHM35
        add     r11, r11, #1
        cmp     r11, r6
        movge   r5, r11, lsl #2
        bge     LBHM40
        sub     r5, r6, r11
        cmp     r5, #5
        blt     LBHM38
        str     r6, [sp, #0x10]
        str     r7, [sp, #8]
        ldr     r6, [sp]
        ldr     r7, [sp, #0xC]
        str     r8, [sp, #0x14]
        str     r10, [sp, #0x18]
LBHM34:
        ldr     r8, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r8, r0
        bge     LBHM47
        str     r8, [r7, +r5]
        add     r10, r11, #1
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r8, r0
        bge     LBHM46
        str     r8, [r7, +r10, lsl #2]
        add     r10, r11, #2
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r8, r0
        bge     LBHM45
        str     r8, [r7, +r10, lsl #2]
        add     r10, r11, #3
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r8, r0
        bge     LBHM44
        add     r11, r11, #4
        cmp     r11, r6
        str     r8, [r7, +r10, lsl #2]
        ldrle   r0, [r2, +r1]
        ble     LBHM34
        b       LBHM37
LBHM35:
        sub     r11, r11, #1
        cmp     r11, #0
        movle   r5, r11, lsl #2
        ble     LBHM51
        cmp     r11, #5
        blt     LBHM49
        str     r6, [sp, #0x10]
        str     r7, [sp, #8]
LBHM36:
        ldr     r6, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r6, r0
        ble     LBHM56
        str     r6, [r9, +r5]
        sub     r11, r11, #1
        ldr     r0, [r2, +r1]
        ldr     r6, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r6, r0
        ble     LBHM55
        str     r6, [r9, +r11, lsl #2]
        sub     r11, r11, #1
        ldr     r0, [r2, +r1]
        ldr     r6, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r6, r0
        ble     LBHM54
        str     r6, [r9, +r11, lsl #2]
        sub     r6, r11, #1
        ldr     r0, [r2, +r1]
        ldr     r7, [r4, +r6, lsl #2]
        mov     r5, r6, lsl #2
        cmp     r7, r0
        ble     LBHM53
        sub     r11, r6, #1
        cmp     r11, #5
        str     r7, [r9, +r6, lsl #2]
        ldrge   r0, [r2, +r1]
        bge     LBHM36
        b       LBHM48
LBHM37:
        str     r6, [sp]
        str     r7, [sp, #0xC]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #8]
        ldr     r0, [r2, +r1]
LBHM38:
        str     r10, [sp, #0x18]
        ldr     r10, [sp, #0xC]
        str     r7, [sp, #8]
LBHM39:
        ldr     r7, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r7, r0
        bge     LBHM43
        add     r11, r11, #1
        cmp     r11, r6
        str     r7, [r10, +r5]
        ldrlt   r0, [r2, +r1]
        blt     LBHM39
        ldr     r10, [sp, #0x18]
        ldr     r7, [sp, #8]
        ldr     r0, [r2, +r1]
        mov     r5, r11, lsl #2
LBHM40:
        ldr     r11, [sp, #0xC]
        str     r0, [r11, +r5]
LBHM41:
        ldr     r5, [r4, +r10, lsl #2]
        add     r3, r3, #1
        cmp     r3, r6
        strb    r5, [lr], #1
        movge   r3, #0
        add     r12, r12, #1
        cmp     r12, r8
        blt     LBHM31
        ldr     r5, [sp, #4]
LBHM42:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, r5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHM43:
        ldr     r10, [sp, #0x18]
        ldr     r7, [sp, #8]
        b       LBHM40
LBHM44:
        str     r6, [sp]
        str     r7, [sp, #0xC]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #8]
        b       LBHM40
LBHM45:
        str     r6, [sp]
        str     r7, [sp, #0xC]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #8]
        b       LBHM40
LBHM46:
        str     r6, [sp]
        str     r7, [sp, #0xC]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #8]
        b       LBHM40
LBHM47:
        str     r6, [sp]
        str     r7, [sp, #0xC]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #8]
        b       LBHM40
LBHM48:
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #8]
        ldr     r0, [r2, +r1]
LBHM49:
        str     r7, [sp, #8]
LBHM50:
        ldr     r7, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r7, r0
        ble     LBHM52
        sub     r11, r11, #1
        cmp     r11, #0
        str     r7, [r9, +r5]
        ldrgt   r0, [r2, +r1]
        bgt     LBHM50
        ldr     r7, [sp, #8]
        ldr     r0, [r2, +r1]
        mov     r5, r11, lsl #2
LBHM51:
        str     r0, [r9, +r5]
        b       LBHM41
LBHM52:
        ldr     r7, [sp, #8]
        b       LBHM51
LBHM53:
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #8]
        b       LBHM51
LBHM54:
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #8]
        b       LBHM51
LBHM55:
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #8]
        b       LBHM51
LBHM56:
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #8]
        b       LBHM51
LBHM57:
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        b       LBHM28
LBHM58:
        str     r6, [sp, #0x24]
        str     r8, [sp]
        ldr     r11, [sp, #0xC]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHM28
LBHM59:
        str     r6, [sp, #0x24]
        str     r8, [sp]
        ldr     r11, [sp, #0xC]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHM28
LBHM60:
        str     r6, [sp, #0x24]
        str     r8, [sp]
        ldr     r11, [sp, #0xC]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHM28
LBHM61:
        str     r6, [sp, #0x24]
        str     r8, [sp]
        ldr     r11, [sp, #0xC]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHM28
LBHM62:
        str     r6, [sp, #0x20]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r0, [r2, +r1]
LBHM63:
        str     r6, [sp, #0x10]
        ldr     r6, [sp, #0x20]
        str     r10, [sp, #0x18]
LBHM64:
        ldr     r10, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r10, r0
        ble     LBHM66
        subs    r7, r7, #1
        str     r10, [r6, +r5]
        ldrpl   r0, [r2, +r1]
        bpl     LBHM64
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        ldr     r0, [r2, +r1]
        mov     r5, r7, lsl #2
LBHM65:
        ldr     r7, [sp, #0x20]
        str     r0, [r7, +r5]
        b       LBHM29
LBHM66:
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHM65
LBHM67:
        str     r6, [sp, #0x20]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHM65
LBHM68:
        str     r6, [sp, #0x20]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHM65
LBHM69:
        str     r6, [sp, #0x20]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHM65
LBHM70:
        str     r6, [sp, #0x20]
        ldr     r8, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r6, [sp, #0x10]
        b       LBHM65
LBHM71:
        cmp     r9, r6
        bge     LBHM18
        sub     r3, r6, r9
        cmp     r3, #6
        blt     LBHM73
        ldr     r0, [sp, #0x1C]
        mov     r3, r9, lsl #2
        add     r3, r3, #4
        add     r12, r3, r4
        sub     lr, r6, #6
        add     r3, r3, r0
LBHM72:
        ldrb    r0, [r7, +r8]
        add     r9, r9, #5
        cmp     r9, lr
        str     r0, [r12, #-4]
        str     r0, [r3, #-4]
        ldrb    r0, [r7, +r8]
        str     r0, [r12]
        str     r0, [r3]
        ldrb    r0, [r7, +r8]
        str     r0, [r12, #4]
        str     r0, [r3, #4]
        ldrb    r0, [r7, +r8]
        str     r0, [r12, #8]
        str     r0, [r3, #8]
        ldrb    r0, [r7, +r8]
        str     r0, [r12, #0xC]
        add     r12, r12, #0x14
        str     r0, [r3, #0xC]
        add     r3, r3, #0x14
        ble     LBHM72
LBHM73:
        ldr     r12, [sp, #0x1C]
        add     r3, r4, r9, lsl #2
        add     r12, r12, r9, lsl #2
LBHM74:
        ldrb    lr, [r7, +r8]
        add     r9, r9, #1
        cmp     r9, r6
        str     lr, [r3], #4
        str     lr, [r12], #4
        blt     LBHM74
        b       LBHM18
LBHM75:
        ldrb    r3, [r7]
        ldrb    r2, [r7, #1]
        sub     r8, r8, #2
        add     lr, sp, #0x3C
        add     r12, sp, #0x3C
        cmp     r8, #3
        str     r3, [lr]
        str     r2, [r12, #4]
        movlt   r1, r9
        blt     LBHM80
        add     lr, sp, #0x3C
        mov     r1, r9
        mov     r4, #3
        str     r5, [sp, #4]
LBHM76:
        add     r6, r1, r7
        ldrb    r5, [r6, #2]
        cmp     r2, r3
        str     r5, [lr, #8]
        movlt   r11, r9
        movlt   r3, #1
        movge   r3, r9
        movge   r11, #1
        add     r10, sp, #0x3C
        ldr     r10, [r10, +r11, lsl #2]
        cmp     r5, r10
        bge     LBHM77
        add     r10, sp, #0x3C
        ldr     r10, [r10, +r3, lsl #2]
        cmp     r5, r10
        movgt   r3, #2
        add     r10, sp, #0x3C
        ldr     r10, [r10, +r3, lsl #2]
LBHM77:
        ldrb    r3, [r6, #3]
        add     r0, sp, #0x3C
        add     r11, r1, r7
        cmp     r2, r3
        strb    r10, [r11, #1]
        str     r3, [r0]
        movlt   r11, #0
        movlt   r2, #1
        movge   r2, #0
        movge   r11, #1
        add     r10, sp, #0x3C
        ldr     r11, [r10, +r11, lsl #2]
        cmp     r5, r11
        bge     LBHM78
        add     r10, sp, #0x3C
        ldr     r10, [r10, +r2, lsl #2]
        cmp     r5, r10
        movgt   r2, #2
        add     r10, sp, #0x3C
        ldr     r11, [r10, +r2, lsl #2]
LBHM78:
        add     r1, r1, r7
        ldrb    r2, [r1, #4]
        strb    r11, [r6, #2]
        cmp     r2, r3
        str     r2, [r12, #4]
        movlt   r11, #0
        movlt   r1, #1
        movge   r1, #0
        movge   r11, #1
        add     r10, sp, #0x3C
        ldr     r11, [r10, +r11, lsl #2]
        cmp     r5, r11
        bge     LBHM79
        add     r10, sp, #0x3C
        ldr     r10, [r10, +r1, lsl #2]
        cmp     r5, r10
        movgt   r1, #2
        add     r5, sp, #0x3C
        ldr     r11, [r5, +r1, lsl #2]
LBHM79:
        mov     r1, r4
        add     r4, r4, #3
        cmp     r8, r4
        strb    r11, [r6, #3]
        bge     LBHM76
        ldr     r5, [sp, #4]
LBHM80:
        cmp     r1, r8
        add     r1, r1, #1
        bge     LBHM83
        add     r12, r1, r7
        ldrb    lr, [r12, #1]
        add     r6, sp, #0x3C
        cmp     r2, r3
        mov     r4, #0
        str     lr, [r6, #8]
        movlt   r9, r4
        movlt   r3, #1
        movge   r3, r4
        movge   r9, #1
        add     r6, sp, #0x3C
        ldr     r9, [r6, +r9, lsl #2]
        cmp     lr, r9
        bge     LBHM81
        add     r6, sp, #0x3C
        ldr     r6, [r6, +r3, lsl #2]
        cmp     lr, r6
        movgt   r3, #2
        add     r6, sp, #0x3C
        ldr     r9, [r6, +r3, lsl #2]
LBHM81:
        cmp     r1, r8
        strb    r9, [r7, +r1]
        bge     LBHM83
        add     r7, r1, r7
        ldrb    r1, [r7, #2]
        add     r3, sp, #0x3C
        cmp     r2, r1
        str     r1, [r3]
        movlt   r1, #1
        movge   r1, r4
        movge   r4, #1
        add     r2, sp, #0x3C
        ldr     r4, [r2, +r4, lsl #2]
        cmp     lr, r4
        bge     LBHM82
        add     r2, sp, #0x3C
        ldr     r2, [r2, +r1, lsl #2]
        cmp     lr, r2
        movgt   r1, #2
        add     r2, sp, #0x3C
        ldr     r4, [r2, +r1, lsl #2]
LBHM82:
        strb    r4, [r12, #1]
LBHM83:
        mov     r0, r5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHM84:
        mvn     r0, #5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHM85:
        mvn     r0, #7
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHM86:
        mvn     r0, #8
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}


