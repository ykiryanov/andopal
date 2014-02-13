        .text
        .align  4
        .globl  _ippsMulPack_16s_Sfs


_ippsMulPack_16s_Sfs:
        stmdb   sp!, {r1, r4 - r11, lr}
        ldr     r12, [sp, #0x28]
        cmp     r0, #0
        beq     LBFG18
        cmp     r1, #0
        beq     LBFG18
        cmp     r2, #0
        beq     LBFG18
        cmp     r3, #0
        ble     LBFG17
        ldrsh   lr, [r1]
        ldrsh   r4, [r0]
        cmp     r12, #0
        mvn     r5, #0xFF
        bic     r6, r5, #0x7F, 24
        mul     lr, r4, lr
        mov     r4, #0
        blt     LBFG16
        cmp     r12, #0
        movgt   lr, lr, asr r12
LBFG0:
        mvn     r5, r6
        cmp     lr, r5
        movlt   r5, lr
        sub     lr, r4, #2, 18
        cmp     r5, lr
        movgt   lr, r5
        tst     r3, #1
        strh    lr, [r2]
        subne   r3, r3, #1
        bne     LBFG2
        sub     r5, r1, #2
        mov     lr, r3, lsl #1
        ldrsh   r5, [r5, +lr]
        sub     r7, r0, #2
        ldrsh   r7, [r7, +lr]
        cmp     r12, #0
        mul     r5, r7, r5
        blt     LBFG15
        cmp     r12, #0
        movgt   r5, r5, asr r12
LBFG1:
        mvn     r7, r6
        cmp     r5, r7
        movlt   r7, r5
        sub     r5, r4, #2, 18
        cmp     r7, r5
        movgt   r5, r7
        sub     r7, r2, #2
        strh    r5, [r7, +lr]
        sub     r3, r3, #2
LBFG2:
        mov     lr, r3, asr #1
        add     r3, r0, #2
        add     r0, r1, #2
        cmp     r12, #0
        add     r1, r2, #2
        bne     LBFG6
        cmp     lr, #0
        ble     LBFG14
        mvn     r6, r6
        mov     r2, r4
LBFG3:
        ldrsh   r5, [r3]
        ldrsh   r9, [r0, #2]
        ldrsh   r8, [r0]
        ldrsh   r7, [r3, #2]
        mul     r12, r5, r9
        mul     r5, r5, r8
        mul     r9, r9, r7
        mul     r8, r7, r8
        cmp     r12, #1, 2
        sub     r5, r5, r9
        moveq   r8, r4
        cmp     r6, r5
        add     r8, r12, r8
        strlth  r6, [r1]
        blt     LBFG4
        cmn     r5, #2, 18
        sub     r12, r4, #2, 18
        movlt   r5, r12
        strh    r5, [r1]
LBFG4:
        cmp     r6, r8
        strlth  r6, [r1, #2]
        blt     LBFG5
        cmn     r8, #2, 18
        sub     r12, r4, #2, 18
        movlt   r8, r12
        strh    r8, [r1, #2]
LBFG5:
        add     r2, r2, #1
        cmp     r2, lr
        add     r1, r1, #4
        add     r0, r0, #4
        add     r3, r3, #4
        blt     LBFG3
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBFG6:
        cmp     r12, #0
        ble     LBFG10
        cmp     lr, #0
        ble     LBFG14
        mvn     r2, r6
        mov     r10, r4
        sub     r9, r12, #1
LBFG7:
        ldrsh   r6, [r3]
        ldrsh   r7, [r0]
        ldrsh   r5, [r0, #2]
        ldrsh   r8, [r3, #2]
        mul     r11, r6, r7
        mul     r6, r6, r5
        mul     r5, r5, r8
        mul     r7, r8, r7
        cmp     r6, #1, 2
        sub     r11, r11, r5
        mov     r5, r11, asr r12
        sub     r7, r7, #1
        moveq   r7, r4
        add     r7, r6, r7
        and     r6, r7, #1
        add     r7, r6, r7, asr #1
        cmp     r2, r5
        mov     r6, r7, asr r9
        strlth  r2, [r1]
        blt     LBFG8
        mov     r7, #0
        cmn     r5, #2, 18
        sub     r7, r7, #2, 18
        movlt   r5, r7
        strh    r5, [r1]
LBFG8:
        cmp     r2, r6
        strlth  r2, [r1, #2]
        blt     LBFG9
        mov     r5, #0
        cmn     r6, #2, 18
        sub     r5, r5, #2, 18
        movlt   r6, r5
        strh    r6, [r1, #2]
LBFG9:
        add     r10, r10, #1
        cmp     r10, lr
        add     r1, r1, #4
        add     r0, r0, #4
        add     r3, r3, #4
        blt     LBFG7
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBFG10:
        rsb     r12, r12, #0
        cmp     r12, #0x10
        movge   r2, r4
        sublt   r2, r4, #2, 18
        movlt   r2, r2, asr r12
        cmp     lr, #0
        mvn     r5, r6
        ble     LBFG14
        sub     r7, r4, #2, 18
        mvn     r6, r6
        str     r7, [sp]
LBFG11:
        ldrsh   r7, [r3]
        ldrsh   r11, [r0, #2]
        ldrsh   r8, [r0]
        ldrsh   r9, [r3, #2]
        mul     r10, r7, r11
        mul     r7, r7, r8
        mul     r11, r11, r9
        mul     r8, r9, r8
        cmp     r10, #1, 2
        sub     r7, r7, r11
        moveq   r8, #0
        cmp     r7, r5, asr r12
        add     r8, r10, r8
        strgth  r6, [r1]
        bgt     LBFG12
        cmp     r7, r2
        movge   r7, r7, lsl r12
        strgeh  r7, [r1]
        ldrlt   r7, [sp]
        strlth  r7, [r1]
LBFG12:
        cmp     r8, r5, asr r12
        strgth  r6, [r1, #2]
        bgt     LBFG13
        cmp     r8, r2
        movge   r8, r8, lsl r12
        strgeh  r8, [r1, #2]
        ldrlt   r7, [sp]
        strlth  r7, [r1, #2]
LBFG13:
        add     r4, r4, #1
        cmp     r4, lr
        add     r1, r1, #4
        add     r0, r0, #4
        add     r3, r3, #4
        blt     LBFG11
LBFG14:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBFG15:
        mvn     r7, r6
        cmp     r5, r7
        movlt   r7, r5
        sub     r5, r4, #2, 18
        cmp     r7, r5
        movgt   r5, r7
        rsb     r7, r12, #0
        mov     r5, r5, lsl r7
        b       LBFG1
LBFG16:
        mvn     r5, r6
        cmp     lr, r5
        movlt   r5, lr
        sub     lr, r4, #2, 18
        cmp     r5, lr
        movgt   lr, r5
        rsb     r5, r12, #0
        mov     lr, lr, lsl r5
        b       LBFG0
LBFG17:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LBFG18:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


