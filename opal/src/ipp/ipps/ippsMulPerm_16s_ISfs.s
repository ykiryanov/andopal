        .text
        .align  4
        .globl  _ippsMulPerm_16s_ISfs


_ippsMulPerm_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        cmp     r0, #0
        beq     LBFB19
        cmp     r1, #0
        beq     LBFB19
        cmp     r2, #0
        ble     LBFB18
        ldrsh   lr, [r1]
        ldrsh   r12, [r0]
        cmp     r3, #0
        mvn     r4, #0xFF
        bic     r5, r4, #0x7F, 24
        mul     lr, r12, lr
        mov     r12, #0
        blt     LBFB17
        cmp     r3, #0
        movgt   lr, lr, asr r3
LBFB0:
        mvn     r4, r5
        cmp     lr, r4
        movlt   r4, lr
        sub     lr, r12, #2, 18
        cmp     r4, lr
        movgt   lr, r4
        tst     r2, #1
        strh    lr, [r1]
        beq     LBFB1
        sub     r4, r2, #1
        add     r2, r0, #2
        add     lr, r1, #2
        b       LBFB3
LBFB1:
        ldrsh   lr, [r0, #2]
        ldrsh   r4, [r1, #2]
        cmp     r3, #0
        mul     lr, lr, r4
        blt     LBFB16
        cmp     r3, #0
        movgt   lr, lr, asr r3
LBFB2:
        mvn     r4, r5
        cmp     lr, r4
        movlt   r4, lr
        sub     lr, r12, #2, 18
        cmp     r4, lr
        movgt   lr, r4
        strh    lr, [r1, #2]
        sub     r4, r2, #2
        add     r2, r0, #4
        add     lr, r1, #4
LBFB3:
        cmp     r3, #0
        mov     r0, r4, asr #1
        bne     LBFB7
        cmp     r0, #0
        ble     LBFB15
        mov     r1, lr
        mov     r3, r1
        mvn     r4, r5
        mov     r7, r12
        mov     r5, r3
        mov     r6, r2
        str     r0, [sp, #0xC]
LBFB4:
        ldrsh   r0, [r2, +r12]
        ldrsh   r11, [r5, #2]
        ldrsh   r8, [lr, +r12]
        ldrsh   r9, [r6, #2]
        mul     r10, r0, r11
        mul     r0, r0, r8
        mul     r11, r11, r9
        mul     r8, r9, r8
        cmp     r10, #1, 2
        sub     r0, r0, r11
        moveq   r8, #0
        cmp     r4, r0
        add     r10, r10, r8
        strlth  r4, [lr, +r12]
        blt     LBFB5
        mov     r8, #0
        cmn     r0, #2, 18
        sub     r8, r8, #2, 18
        movlt   r0, r8
        strh    r0, [lr, +r12]
LBFB5:
        cmp     r4, r10
        strlth  r4, [r3, #2]
        blt     LBFB6
        mov     r0, #0
        cmn     r10, #2, 18
        sub     r0, r0, #2, 18
        movlt   r10, r0
        strh    r10, [r1, #2]
LBFB6:
        ldr     r0, [sp, #0xC]
        add     r7, r7, #1
        add     r12, r12, #4
        cmp     r7, r0
        add     r1, r1, #4
        add     r3, r3, #4
        add     r5, r5, #4
        add     r6, r6, #4
        blt     LBFB4
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBFB7:
        cmp     r3, #0
        ble     LBFB11
        cmp     r0, #0
        ble     LBFB15
        mov     r7, lr
        mov     r8, r7
        mvn     r1, r5
        sub     r9, r3, #1
        mov     r6, r12
        mov     r4, r8
        mov     r5, r2
        str     r9, [sp, #8]
        str     r2, [sp, #4]
        str     r3, [sp]
LBFB8:
        ldr     r2, [sp, #4]
        ldrsh   r9, [lr, +r12]
        ldrsh   r10, [r5, #2]
        ldrsh   r3, [r2, +r12]
        ldrsh   r2, [r4, #2]
        mul     r11, r3, r9
        mul     r9, r10, r9
        mul     r3, r3, r2
        mul     r2, r2, r10
        sub     r9, r9, #1
        cmp     r3, #1, 2
        sub     r11, r11, r2
        ldr     r2, [sp]
        mov     r2, r11, asr r2
        moveq   r9, #0
        add     r9, r3, r9
        and     r3, r9, #1
        add     r3, r3, r9, asr #1
        ldr     r9, [sp, #8]
        cmp     r1, r2
        mov     r3, r3, asr r9
        strlth  r1, [lr, +r12]
        blt     LBFB9
        mov     r9, #0
        cmn     r2, #2, 18
        sub     r9, r9, #2, 18
        movlt   r2, r9
        strh    r2, [lr, +r12]
LBFB9:
        cmp     r1, r3
        strlth  r1, [r8, #2]
        blt     LBFB10
        mov     r2, #0
        cmn     r3, #2, 18
        sub     r2, r2, #2, 18
        movlt   r3, r2
        strh    r3, [r7, #2]
LBFB10:
        add     r6, r6, #1
        cmp     r6, r0
        add     r12, r12, #4
        add     r7, r7, #4
        add     r8, r8, #4
        add     r4, r4, #4
        add     r5, r5, #4
        blt     LBFB8
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBFB11:
        rsb     r1, r3, #0
        cmp     r1, #0x10
        movge   r9, r12
        sublt   r3, r12, #2, 18
        movlt   r9, r3, asr r1
        cmp     r0, #0
        mvn     r8, r5
        ble     LBFB15
        mov     r3, lr
        str     r12, [sp, #8]
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #8]
        mvn     r10, r5
        mov     r4, r3
        mov     r5, r4
        sub     r11, r12, #2, 18
        mov     r6, r5
        mov     r7, r2
        str     r11, [sp]
        str     r10, [sp, #0x14]
        str     r9, [sp, #0x10]
        str     r2, [sp, #4]
LBFB12:
        ldr     r2, [sp, #4]
        ldrsh   r11, [r6, #2]
        ldrsh   r9, [r7, #2]
        ldrsh   r10, [r2, +r12]
        ldrsh   r2, [lr, +r12]
        str     r9, [sp, #0x18]
        mul     r9, r10, r11
        mul     r10, r10, r2
        str     r10, [sp, #0x1C]
        ldr     r10, [sp, #0x18]
        cmp     r9, #1, 2
        mul     r11, r11, r10
        mul     r2, r10, r2
        ldr     r10, [sp, #0x1C]
        sub     r11, r10, r11
        moveq   r2, #0
        cmp     r11, r8, asr r1
        add     r2, r9, r2
        ldrgt   r9, [sp, #0x14]
        strgth  r9, [lr, +r12]
        bgt     LBFB13
        ldr     r9, [sp, #0x10]
        cmp     r11, r9
        movge   r11, r11, lsl r1
        strgeh  r11, [lr, +r12]
        ldrlt   r9, [sp]
        strlth  r9, [lr, +r12]
LBFB13:
        cmp     r2, r8, asr r1
        ldrgt   r2, [sp, #0x14]
        strgth  r2, [r5, #2]
        bgt     LBFB14
        ldr     r9, [sp, #0x10]
        cmp     r2, r9
        movge   r2, r2, lsl r1
        strgeh  r2, [r3, #2]
        ldrlt   r2, [sp]
        strlth  r2, [r4, #2]
LBFB14:
        ldr     r2, [sp, #0xC]
        add     r0, r0, #1
        add     r12, r12, #4
        cmp     r0, r2
        add     r3, r3, #4
        add     r4, r4, #4
        add     r5, r5, #4
        add     r6, r6, #4
        add     r7, r7, #4
        blt     LBFB12
LBFB15:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBFB16:
        mvn     r4, r5
        cmp     lr, r4
        movlt   r4, lr
        sub     lr, r12, #2, 18
        cmp     r4, lr
        movgt   lr, r4
        rsb     r4, r3, #0
        mov     lr, lr, lsl r4
        b       LBFB2
LBFB17:
        mvn     r4, r5
        cmp     lr, r4
        movlt   r4, lr
        sub     lr, r12, #2, 18
        cmp     r4, lr
        movgt   lr, r4
        rsb     r4, r3, #0
        mov     lr, lr, lsl r4
        b       LBFB0
LBFB18:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBFB19:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


