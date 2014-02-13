        .text
        .align  4
        .globl  _ippsFilterMedian_16s_I


_ippsFilterMedian_16s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        mov     r7, r0
        cmp     r7, #0
        mov     r8, r1
        mov     r6, r2
        beq     LBHU85
        cmp     r8, #0
        ble     LBHU84
        cmp     r6, #0
        ble     LBHU84
        tst     r6, #1
        mov     r10, #0
        movne   r5, r10
        subeq   r6, r6, #1
        moveq   r5, #5
        cmp     r6, #1
        beq     LBHU83
        cmp     r8, #2
        ble     LBHU83
        cmp     r6, #3
        beq     LBHU75
        cmp     r6, #5
        bne     LBHU10
        ldrsh   lr, [r7]
        add     r6, sp, #0x28
        ldrsh   r4, [r7, #2]
        str     lr, [r6]
        ldrsh   r6, [r7, #4]
        add     r12, sp, #0x28
        sub     r8, r8, #3
        add     r3, sp, #0x28
        add     r2, sp, #0x28
        str     lr, [r12, #4]
        cmp     r8, #0
        str     r4, [r3, #8]
        str     r6, [r2, #0xC]
        mov     lr, #4
        add     r1, r7, #2
        add     r9, r7, #4
        addle   r4, sp, #0x38
        ble     LBHU5
        add     r11, sp, #0x28
        add     r4, r11, #0x10
        add     r7, r7, #6
        mov     r6, r1
        str     r4, [sp]
        str     r9, [sp, #4]
        str     r1, [sp, #8]
        str     r5, [sp, #0xC]
LBHU0:
        ldrsh   r4, [r7], #2
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
        movlt   r9, #3
        movge   r9, #2
        movge   r1, #3
        add     r0, sp, #0x28
        ldr     r0, [r0, +r4, lsl #2]
        add     r11, sp, #0x28
        ldr     r11, [r11, +r9, lsl #2]
        cmp     r11, r0
        ble     LBHU1
        add     r0, sp, #0x28
        ldr     r0, [r0, +r9, lsl #2]
        mov     r4, r9
LBHU1:
        add     r9, sp, #0x28
        ldr     r9, [r9, +r5, lsl #2]
        add     r11, sp, #0x28
        ldr     r11, [r11, +r1, lsl #2]
        cmp     r11, r9
        bge     LBHU2
        add     r9, sp, #0x28
        ldr     r9, [r9, +r1, lsl #2]
        mov     r5, r1
LBHU2:
        cmp     r9, r0
        bge     LBHU3
        mov     r0, r4
        add     r1, sp, #0x28
        ldr     r9, [r1, +r0, lsl #2]
        mov     r4, r5
LBHU3:
        add     r0, sp, #0x28
        ldr     r0, [r0, #0x10]
        cmp     r0, r9
        bge     LBHU4
        add     r1, sp, #0x28
        ldr     r1, [r1, +r4, lsl #2]
        cmp     r0, r1
        movge   r4, #4
        add     r0, sp, #0x28
        ldr     r9, [r0, +r4, lsl #2]
LBHU4:
        add     lr, lr, #1
        strh    r9, [r6], #2
        cmp     lr, #4
        movgt   lr, #0
        add     r10, r10, #1
        cmp     r10, r8
        blt     LBHU0
        ldr     r4, [sp]
        ldr     r9, [sp, #4]
        ldr     r1, [sp, #8]
        ldr     r5, [sp, #0xC]
LBHU5:
        mov     r10, r10, lsl #1
        ldrsh   r9, [r9, +r10]
        add     r7, sp, #0x28
        add     r6, sp, #0x28
        str     r9, [r7, +lr, lsl #2]
        ldr     r12, [r12, #4]
        ldr     r6, [r6]
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
        ble     LBHU6
        add     r2, sp, #0x28
        ldr     r2, [r2, +r6, lsl #2]
        mov     r12, r6
LBHU6:
        add     r6, sp, #0x28
        add     r7, sp, #0x28
        ldr     r6, [r6, +lr, lsl #2]
        ldr     r7, [r7, +r3, lsl #2]
        cmp     r7, r6
        bge     LBHU7
        add     r6, sp, #0x28
        ldr     r6, [r6, +r3, lsl #2]
        mov     lr, r3
LBHU7:
        cmp     r6, r2
        bge     LBHU8
        mov     r3, r12
        add     r2, sp, #0x28
        ldr     r6, [r2, +r3, lsl #2]
        mov     r12, lr
LBHU8:
        ldr     r4, [r4]
        cmp     r4, r6
        bge     LBHU9
        add     r2, sp, #0x28
        ldr     r2, [r2, +r12, lsl #2]
        cmp     r4, r2
        movge   r12, #4
        add     r2, sp, #0x28
        ldr     r6, [r2, +r12, lsl #2]
LBHU9:
        mov     r0, r5
        strh    r6, [r1, +r10]
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHU10:
        add     r3, r6, #7
        bic     r9, r3, #7
        mov     r11, r6, asr #1
        mov     r0, r9, lsl #1
        bl      _ippsMalloc_32s
        mov     r4, r0
        cmp     r4, #0
        beq     LBHU86
        add     r9, r4, r9, lsl #2
        cmp     r11, #0
        sub     r8, r8, #1
        str     r9, [sp, #0x20]
        ble     LBHU14
        cmp     r11, #6
        blt     LBHU12
        ldr     r3, [sp, #0x20]
        sub     lr, r11, #6
        add     r12, r4, #4
        add     r3, r3, #4
LBHU11:
        ldrsh   r9, [r7]
        add     r10, r10, #5
        cmp     r10, lr
        str     r9, [r12, #-4]
        str     r9, [r3, #-4]
        ldrsh   r9, [r7]
        str     r9, [r12]
        str     r9, [r3]
        ldrsh   r9, [r7]
        str     r9, [r12, #4]
        str     r9, [r3, #4]
        ldrsh   r9, [r7]
        str     r9, [r12, #8]
        str     r9, [r3, #8]
        ldrsh   r9, [r7]
        str     r9, [r12, #0xC]
        add     r12, r12, #0x14
        str     r9, [r3, #0xC]
        add     r3, r3, #0x14
        ble     LBHU11
LBHU12:
        ldr     r12, [sp, #0x20]
        add     r3, r4, r10, lsl #2
        add     r12, r12, r10, lsl #2
LBHU13:
        ldrsh   lr, [r7]
        add     r10, r10, #1
        cmp     r10, r11
        str     lr, [r3], #4
        str     lr, [r12], #4
        blt     LBHU13
LBHU14:
        cmp     r10, r6
        mov     r9, #0
        bge     LBHU18
        sub     r3, r6, r10
        cmp     r3, #5
        blt     LBHU16
        ldr     r3, [sp, #0x20]
LBHU15:
        cmp     r9, r8
        bgt     LBHU71
        mov     r12, r9, lsl #1
        ldrsh   r12, [r7, +r12]
        add     r9, r9, #1
        cmp     r9, r8
        str     r12, [r4, +r10, lsl #2]
        str     r12, [r3, +r10, lsl #2]
        add     r10, r10, #1
        bgt     LBHU71
        mov     r12, r9, lsl #1
        ldrsh   r12, [r7, +r12]
        add     r9, r9, #1
        cmp     r9, r8
        str     r12, [r4, +r10, lsl #2]
        str     r12, [r3, +r10, lsl #2]
        add     r10, r10, #1
        bgt     LBHU71
        mov     r12, r9, lsl #1
        ldrsh   r12, [r7, +r12]
        add     r9, r9, #1
        cmp     r9, r8
        str     r12, [r4, +r10, lsl #2]
        str     r12, [r3, +r10, lsl #2]
        add     r10, r10, #1
        bgt     LBHU71
        mov     r12, r9, lsl #1
        ldrsh   r12, [r7, +r12]
        add     r9, r9, #1
        str     r12, [r4, +r10, lsl #2]
        str     r12, [r3, +r10, lsl #2]
        add     r10, r10, #1
        sub     r12, r6, #5
        cmp     r10, r12
        ble     LBHU15
LBHU16:
        ldr     r12, [sp, #0x20]
        add     r3, r4, r10, lsl #2
        add     lr, r7, r9, lsl #1
        add     r12, r12, r10, lsl #2
LBHU17:
        cmp     r9, r8
        bgt     LBHU71
        ldrsh   r0, [lr], #2
        add     r10, r10, #1
        str     r0, [r3], #4
        str     r0, [r12], #4
        cmp     r10, r6
        add     r9, r9, #1
        blt     LBHU17
LBHU18:
        mov     r1, r6
        mov     r0, r4
        bl      ownippsIpp32sSort
        cmp     r9, r8
        mov     r12, #1
        mov     r3, #0
        bgt     LBHU30
        add     r2, r4, #4
        str     r2, [sp]
        ldr     r2, [sp, #0x20]
        sub     r1, r4, #4
        sub     r0, r6, #5
        add     r10, r7, r9, lsl #1
        add     lr, r7, #2
        str     r0, [sp, #0x24]
        str     r1, [sp, #4]
        str     r5, [sp, #0xC]
        str     r7, [sp, #0x10]
LBHU19:
        ldr     r5, [r2, +r3, lsl #2]
        ldr     r7, [r4]
        mov     r1, r3, lsl #2
        cmp     r7, r5
        moveq   r5, #0
        moveq   r7, r5
        beq     LBHU21
        mov     r0, r4
        str     r6, [sp, #0x18]
        mov     r7, #0
        mov     r6, r5
LBHU20:
        add     r0, r0, #4
        ldr     r5, [r0]
        add     r7, r7, #1
        cmp     r5, r6
        mov     r5, r7, lsl #2
        bne     LBHU20
        ldr     r6, [sp, #0x18]
LBHU21:
        ldrsh   r0, [r10], #2
        str     r0, [r2, +r1]
        ldr     r5, [r5, +r4]
        cmp     r0, r5
        blt     LBHU23
        add     r7, r7, #1
        cmp     r7, r6
        movge   r5, r7, lsl #2
        bge     LBHU28
        sub     r5, r6, r7
        cmp     r5, #5
        blt     LBHU26
        str     r8, [sp, #0x1C]
        str     r6, [sp, #0x18]
        ldr     r6, [sp, #0x24]
        ldr     r8, [sp, #4]
        str     r9, [sp, #8]
        str     r11, [sp, #0x14]
LBHU22:
        ldr     r9, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r9, r0
        bge     LBHU61
        str     r9, [r8, +r5]
        add     r9, r7, #1
        ldr     r0, [r2, +r1]
        ldr     r11, [r4, +r9, lsl #2]
        mov     r5, r9, lsl #2
        cmp     r11, r0
        bge     LBHU60
        str     r11, [r8, +r9, lsl #2]
        add     r9, r7, #2
        ldr     r0, [r2, +r1]
        ldr     r11, [r4, +r9, lsl #2]
        mov     r5, r9, lsl #2
        cmp     r11, r0
        bge     LBHU59
        str     r11, [r8, +r9, lsl #2]
        add     r9, r7, #3
        ldr     r0, [r2, +r1]
        ldr     r11, [r4, +r9, lsl #2]
        mov     r5, r9, lsl #2
        cmp     r11, r0
        bge     LBHU58
        add     r7, r7, #4
        cmp     r7, r6
        str     r11, [r8, +r9, lsl #2]
        ldrle   r0, [r2, +r1]
        ble     LBHU22
        b       LBHU25
LBHU23:
        subs    r7, r7, #1
        movmi   r5, r7, lsl #2
        bmi     LBHU65
        cmp     r7, #5
        blt     LBHU63
        str     r6, [sp, #0x18]
        ldr     r6, [sp]
        str     r8, [sp, #0x1C]
        str     r11, [sp, #0x14]
LBHU24:
        ldr     r8, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r8, r0
        ble     LBHU70
        str     r8, [r6, +r5]
        sub     r7, r7, #1
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r8, r0
        ble     LBHU69
        str     r8, [r6, +r7, lsl #2]
        sub     r7, r7, #1
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r8, r0
        ble     LBHU68
        str     r8, [r6, +r7, lsl #2]
        sub     r8, r7, #1
        ldr     r0, [r2, +r1]
        ldr     r11, [r4, +r8, lsl #2]
        mov     r5, r8, lsl #2
        cmp     r11, r0
        ble     LBHU67
        sub     r7, r8, #1
        cmp     r7, #5
        str     r11, [r6, +r8, lsl #2]
        ldrge   r0, [r2, +r1]
        bge     LBHU24
        b       LBHU62
LBHU25:
        str     r6, [sp, #0x24]
        str     r8, [sp, #4]
        ldr     r9, [sp, #8]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r0, [r2, +r1]
LBHU26:
        str     r8, [sp, #0x1C]
        ldr     r8, [sp, #4]
        str     r11, [sp, #0x14]
LBHU27:
        ldr     r11, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r11, r0
        bge     LBHU57
        add     r7, r7, #1
        cmp     r7, r6
        str     r11, [r8, +r5]
        ldrlt   r0, [r2, +r1]
        blt     LBHU27
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r0, [r2, +r1]
        mov     r5, r7, lsl #2
LBHU28:
        ldr     r7, [sp, #4]
        str     r0, [r7, +r5]
LBHU29:
        ldr     r5, [r4, +r11, lsl #2]
        add     r3, r3, #1
        cmp     r3, r6
        strh    r5, [lr], #2
        movge   r3, #0
        add     r9, r9, #1
        cmp     r9, r8
        add     r12, r12, #1
        ble     LBHU19
        ldr     r5, [sp, #0xC]
        ldr     r7, [sp, #0x10]
LBHU30:
        cmp     r12, r8
        bge     LBHU42
        ldr     r2, [sp, #0x20]
        add     r1, r4, #4
        sub     r0, r4, #4
        sub     r10, r6, #5
        mov     r9, r8, lsl #1
        add     lr, r7, r12, lsl #1
        str     r10, [sp, #8]
        str     r0, [sp]
        str     r1, [sp, #4]
        str     r5, [sp, #0xC]
LBHU31:
        ldr     r5, [r2, +r3, lsl #2]
        ldr     r10, [r4]
        mov     r1, r3, lsl #2
        cmp     r10, r5
        moveq   r5, #0
        moveq   r10, r5
        beq     LBHU33
        mov     r0, r4
        str     r7, [sp, #0x10]
        mov     r10, #0
        mov     r7, r5
LBHU32:
        add     r0, r0, #4
        ldr     r5, [r0]
        add     r10, r10, #1
        cmp     r5, r7
        mov     r5, r10, lsl #2
        bne     LBHU32
        ldr     r7, [sp, #0x10]
LBHU33:
        ldrsh   r0, [r7, +r9]
        str     r0, [r2, +r1]
        ldr     r5, [r5, +r4]
        cmp     r0, r5
        blt     LBHU35
        add     r10, r10, #1
        cmp     r10, r6
        movge   r5, r10, lsl #2
        bge     LBHU40
        sub     r5, r6, r10
        cmp     r5, #5
        blt     LBHU38
        str     r6, [sp, #0x18]
        str     r7, [sp, #0x10]
        ldr     r6, [sp, #8]
        ldr     r7, [sp]
        str     r8, [sp, #0x1C]
        str     r11, [sp, #0x14]
LBHU34:
        ldr     r8, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r8, r0
        bge     LBHU47
        str     r8, [r7, +r5]
        add     r11, r10, #1
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r8, r0
        bge     LBHU46
        str     r8, [r7, +r11, lsl #2]
        add     r11, r10, #2
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r8, r0
        bge     LBHU45
        str     r8, [r7, +r11, lsl #2]
        add     r11, r10, #3
        ldr     r0, [r2, +r1]
        ldr     r8, [r4, +r11, lsl #2]
        mov     r5, r11, lsl #2
        cmp     r8, r0
        bge     LBHU44
        add     r10, r10, #4
        cmp     r10, r6
        str     r8, [r7, +r11, lsl #2]
        ldrle   r0, [r2, +r1]
        ble     LBHU34
        b       LBHU37
LBHU35:
        sub     r10, r10, #1
        cmp     r10, #0
        movle   r5, r10, lsl #2
        ble     LBHU51
        cmp     r10, #5
        blt     LBHU49
        str     r6, [sp, #0x18]
        ldr     r6, [sp, #4]
        str     r11, [sp, #0x14]
        str     r7, [sp, #0x10]
LBHU36:
        ldr     r7, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r7, r0
        ble     LBHU56
        str     r7, [r6, +r5]
        sub     r10, r10, #1
        ldr     r0, [r2, +r1]
        ldr     r7, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r7, r0
        ble     LBHU55
        str     r7, [r6, +r10, lsl #2]
        sub     r10, r10, #1
        ldr     r0, [r2, +r1]
        ldr     r7, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r7, r0
        ble     LBHU54
        str     r7, [r6, +r10, lsl #2]
        sub     r7, r10, #1
        ldr     r0, [r2, +r1]
        ldr     r11, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r11, r0
        ble     LBHU53
        sub     r10, r7, #1
        cmp     r10, #5
        str     r11, [r6, +r7, lsl #2]
        ldrge   r0, [r2, +r1]
        bge     LBHU36
        b       LBHU48
LBHU37:
        str     r6, [sp, #8]
        str     r7, [sp]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        ldr     r0, [r2, +r1]
LBHU38:
        str     r11, [sp, #0x14]
        ldr     r11, [sp]
        str     r7, [sp, #0x10]
LBHU39:
        ldr     r7, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r7, r0
        bge     LBHU43
        add     r10, r10, #1
        cmp     r10, r6
        str     r7, [r11, +r5]
        ldrlt   r0, [r2, +r1]
        blt     LBHU39
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        ldr     r0, [r2, +r1]
        mov     r5, r10, lsl #2
LBHU40:
        ldr     r10, [sp]
        str     r0, [r10, +r5]
LBHU41:
        ldr     r5, [r4, +r11, lsl #2]
        add     r3, r3, #1
        cmp     r3, r6
        strh    r5, [lr], #2
        movge   r3, #0
        add     r12, r12, #1
        cmp     r12, r8
        blt     LBHU31
        ldr     r5, [sp, #0xC]
LBHU42:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, r5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHU43:
        ldr     r11, [sp, #0x14]
        ldr     r7, [sp, #0x10]
        b       LBHU40
LBHU44:
        str     r6, [sp, #8]
        str     r7, [sp]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        b       LBHU40
LBHU45:
        str     r6, [sp, #8]
        str     r7, [sp]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        b       LBHU40
LBHU46:
        str     r6, [sp, #8]
        str     r7, [sp]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        b       LBHU40
LBHU47:
        str     r6, [sp, #8]
        str     r7, [sp]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        b       LBHU40
LBHU48:
        str     r6, [sp, #4]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        ldr     r0, [r2, +r1]
LBHU49:
        str     r7, [sp, #0x10]
        ldr     r7, [sp, #4]
        str     r6, [sp, #0x18]
LBHU50:
        ldr     r6, [r4, +r10, lsl #2]
        mov     r5, r10, lsl #2
        cmp     r6, r0
        ble     LBHU52
        sub     r10, r10, #1
        cmp     r10, #0
        str     r6, [r7, +r5]
        ldrgt   r0, [r2, +r1]
        bgt     LBHU50
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        ldr     r0, [r2, +r1]
        mov     r5, r10, lsl #2
LBHU51:
        ldr     r10, [sp, #4]
        str     r0, [r10, +r5]
        b       LBHU41
LBHU52:
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        b       LBHU51
LBHU53:
        str     r6, [sp, #4]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        b       LBHU51
LBHU54:
        str     r6, [sp, #4]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        b       LBHU51
LBHU55:
        str     r6, [sp, #4]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        b       LBHU51
LBHU56:
        str     r6, [sp, #4]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        b       LBHU51
LBHU57:
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        b       LBHU28
LBHU58:
        str     r6, [sp, #0x24]
        str     r8, [sp, #4]
        ldr     r9, [sp, #8]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        b       LBHU28
LBHU59:
        str     r6, [sp, #0x24]
        str     r8, [sp, #4]
        ldr     r9, [sp, #8]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        b       LBHU28
LBHU60:
        str     r6, [sp, #0x24]
        str     r8, [sp, #4]
        ldr     r9, [sp, #8]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        b       LBHU28
LBHU61:
        str     r6, [sp, #0x24]
        str     r8, [sp, #4]
        ldr     r9, [sp, #8]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        b       LBHU28
LBHU62:
        str     r6, [sp]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r0, [r2, +r1]
LBHU63:
        str     r6, [sp, #0x18]
        ldr     r6, [sp]
        str     r11, [sp, #0x14]
LBHU64:
        ldr     r11, [r4, +r7, lsl #2]
        mov     r5, r7, lsl #2
        cmp     r11, r0
        ble     LBHU66
        subs    r7, r7, #1
        str     r11, [r6, +r5]
        ldrpl   r0, [r2, +r1]
        bpl     LBHU64
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        ldr     r0, [r2, +r1]
        mov     r5, r7, lsl #2
LBHU65:
        ldr     r7, [sp]
        str     r0, [r7, +r5]
        b       LBHU29
LBHU66:
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        b       LBHU65
LBHU67:
        str     r6, [sp]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        b       LBHU65
LBHU68:
        str     r6, [sp]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        b       LBHU65
LBHU69:
        str     r6, [sp]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        b       LBHU65
LBHU70:
        str     r6, [sp]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        b       LBHU65
LBHU71:
        cmp     r10, r6
        bge     LBHU18
        sub     r3, r6, r10
        cmp     r3, #6
        movlt   r12, r8, lsl #1
        blt     LBHU73
        ldr     r1, [sp, #0x20]
        mov     r3, r10, lsl #2
        add     r3, r3, #4
        add     lr, r3, r4
        mov     r12, r8, lsl #1
        sub     r0, r6, #6
        add     r3, r3, r1
LBHU72:
        ldrsh   r1, [r7, +r12]
        add     r10, r10, #5
        cmp     r10, r0
        str     r1, [lr, #-4]
        str     r1, [r3, #-4]
        ldrsh   r1, [r7, +r12]
        str     r1, [lr]
        str     r1, [r3]
        ldrsh   r1, [r7, +r12]
        str     r1, [lr, #4]
        str     r1, [r3, #4]
        ldrsh   r1, [r7, +r12]
        str     r1, [lr, #8]
        str     r1, [r3, #8]
        ldrsh   r1, [r7, +r12]
        str     r1, [lr, #0xC]
        add     lr, lr, #0x14
        str     r1, [r3, #0xC]
        add     r3, r3, #0x14
        ble     LBHU72
LBHU73:
        ldr     lr, [sp, #0x20]
        add     r3, r4, r10, lsl #2
        add     lr, lr, r10, lsl #2
LBHU74:
        ldrsh   r0, [r12, +r7]
        add     r10, r10, #1
        cmp     r10, r6
        str     r0, [r3], #4
        str     r0, [lr], #4
        blt     LBHU74
        b       LBHU18
LBHU75:
        ldrsh   r12, [r7]
        ldrsh   r3, [r7, #2]
        sub     r8, r8, #2
        add     lr, sp, #0x3C
        add     r2, sp, #0x3C
        cmp     r8, #3
        str     r12, [lr]
        str     r3, [r2, #4]
        add     r9, r7, #2
        blt     LBHU80
        add     r11, sp, #0x3C
        mov     r6, #3
        add     r4, r7, #4
        add     lr, r7, #6
        add     r1, r7, #8
        str     r5, [sp, #0xC]
        str     r7, [sp, #0x10]
LBHU76:
        mov     r0, r10, lsl #1
        ldrsh   r5, [r4, +r0]
        cmp     r3, r12
        add     r12, sp, #0x3C
        str     r5, [r12, #8]
        movlt   r10, #0
        movlt   r12, #1
        movge   r12, #0
        movge   r10, #1
        add     r7, sp, #0x3C
        ldr     r10, [r7, +r10, lsl #2]
        cmp     r5, r10
        bge     LBHU77
        add     r7, sp, #0x3C
        ldr     r7, [r7, +r12, lsl #2]
        cmp     r5, r7
        movgt   r12, #2
        add     r7, sp, #0x3C
        ldr     r10, [r7, +r12, lsl #2]
LBHU77:
        strh    r10, [r9, +r0]
        ldrsh   r12, [lr, +r0]
        add     r7, sp, #0x3C
        cmp     r3, r12
        str     r12, [r7]
        movlt   r10, #0
        movlt   r3, #1
        movge   r3, #0
        movge   r10, #1
        add     r7, sp, #0x3C
        ldr     r10, [r7, +r10, lsl #2]
        cmp     r5, r10
        bge     LBHU78
        add     r7, sp, #0x3C
        ldr     r7, [r7, +r3, lsl #2]
        cmp     r5, r7
        movgt   r3, #2
        add     r7, sp, #0x3C
        ldr     r10, [r7, +r3, lsl #2]
LBHU78:
        strh    r10, [r4, +r0]
        ldrsh   r3, [r1, +r0]
        cmp     r3, r12
        str     r3, [r2, #4]
        movlt   r11, #0
        movlt   r7, #1
        movge   r7, #0
        movge   r11, #1
        add     r10, sp, #0x3C
        ldr     r11, [r10, +r11, lsl #2]
        cmp     r5, r11
        bge     LBHU79
        add     r10, sp, #0x3C
        ldr     r10, [r10, +r7, lsl #2]
        cmp     r5, r10
        movgt   r7, #2
        add     r5, sp, #0x3C
        ldr     r11, [r5, +r7, lsl #2]
LBHU79:
        mov     r10, r6
        add     r6, r6, #3
        cmp     r8, r6
        strh    r11, [lr, +r0]
        bge     LBHU76
        ldr     r5, [sp, #0xC]
        ldr     r7, [sp, #0x10]
LBHU80:
        cmp     r10, r8
        add     r10, r10, #1
        bge     LBHU83
        mov     r2, r10, lsl #1
        ldrsh   r1, [r9, +r2]
        add     r4, sp, #0x3C
        cmp     r3, r12
        mov     lr, #0
        str     r1, [r4, #8]
        movlt   r12, #1
        movge   r12, lr
        movge   lr, #1
        add     r4, sp, #0x3C
        ldr     lr, [r4, +lr, lsl #2]
        cmp     r1, lr
        bge     LBHU81
        add     lr, sp, #0x3C
        ldr     lr, [lr, +r12, lsl #2]
        cmp     r1, lr
        movgt   r12, #2
        add     lr, sp, #0x3C
        ldr     lr, [lr, +r12, lsl #2]
LBHU81:
        cmp     r10, r8
        strh    lr, [r7, +r2]
        bge     LBHU83
        add     r7, r7, #4
        ldrsh   lr, [r7, +r2]
        add     r4, sp, #0x3C
        mov     r12, #0
        cmp     r3, lr
        str     lr, [r4]
        movlt   r3, #1
        movge   r3, r12
        movge   r12, #1
        add     lr, sp, #0x3C
        ldr     r12, [lr, +r12, lsl #2]
        cmp     r1, r12
        bge     LBHU82
        add     r12, sp, #0x3C
        ldr     r12, [r12, +r3, lsl #2]
        cmp     r1, r12
        movgt   r3, #2
        add     r1, sp, #0x3C
        ldr     r12, [r1, +r3, lsl #2]
LBHU82:
        strh    r12, [r9, +r2]
LBHU83:
        mov     r0, r5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHU84:
        mvn     r0, #5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHU85:
        mvn     r0, #7
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBHU86:
        mvn     r0, #8
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}


