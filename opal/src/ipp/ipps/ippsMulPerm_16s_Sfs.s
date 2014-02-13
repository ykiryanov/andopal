        .text
        .align  4
        .globl  _ippsMulPerm_16s_Sfs


_ippsMulPerm_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r12, [sp, #0x44]
        cmp     r0, #0
        beq     LBFA21
        cmp     r1, #0
        beq     LBFA21
        cmp     r2, #0
        beq     LBFA21
        cmp     r3, #0
        ble     LBFA20
        ldrsh   lr, [r1]
        ldrsh   r4, [r0]
        cmp     r12, #0
        mvn     r5, #0xFF
        bic     r6, r5, #0x7F, 24
        mul     lr, r4, lr
        mov     r4, #0
        blt     LBFA19
        cmp     r12, #0
        movgt   lr, lr, asr r12
LBFA0:
        mvn     r5, r6
        cmp     lr, r5
        movlt   r5, lr
        sub     lr, r4, #2, 18
        cmp     r5, lr
        movgt   lr, r5
        tst     r3, #1
        strh    lr, [r2]
        beq     LBFA1
        sub     r5, r3, #1
        add     lr, r0, #2
        add     r3, r1, #2
        add     r2, r2, #2
        b       LBFA3
LBFA1:
        ldrsh   lr, [r1, #2]
        ldrsh   r5, [r0, #2]
        cmp     r12, #0
        mul     lr, r5, lr
        blt     LBFA18
        cmp     r12, #0
        movgt   lr, lr, asr r12
LBFA2:
        mvn     r5, r6
        cmp     lr, r5
        movlt   r5, lr
        sub     lr, r4, #2, 18
        cmp     r5, lr
        movgt   lr, r5
        strh    lr, [r2, #2]
        sub     r5, r3, #2
        add     lr, r0, #4
        add     r3, r1, #4
        add     r2, r2, #4
LBFA3:
        cmp     r12, #0
        mov     r0, r5, asr #1
        bne     LBFA7
        cmp     r0, #0
        ble     LBFA17
        mov     r12, r2
        mvn     r1, r6
        mov     r8, r4
        mov     r5, r12
        mov     r6, r3
        mov     r7, lr
        str     r2, [sp, #8]
        str     r3, [sp, #0xC]
LBFA4:
        ldrsh   r3, [lr, +r4]
        ldrsh   r9, [r6, #2]
        ldr     r2, [sp, #0xC]
        ldrsh   r10, [r7, #2]
        mul     r11, r3, r9
        ldrsh   r2, [r2, +r4]
        mul     r9, r9, r10
        cmp     r11, #1, 2
        mul     r3, r3, r2
        mul     r2, r10, r2
        sub     r3, r3, r9
        moveq   r2, #0
        cmp     r1, r3
        add     r11, r11, r2
        ldrlt   r2, [sp, #8]
        strlth  r1, [r2, +r4]
        blt     LBFA5
        mov     r2, #0
        cmn     r3, #2, 18
        sub     r2, r2, #2, 18
        movlt   r3, r2
        ldr     r2, [sp, #8]
        strh    r3, [r2, +r4]
LBFA5:
        cmp     r1, r11
        strlth  r1, [r5, #2]
        blt     LBFA6
        mov     r2, #0
        cmn     r11, #2, 18
        sub     r2, r2, #2, 18
        movlt   r11, r2
        strh    r11, [r12, #2]
LBFA6:
        add     r8, r8, #1
        cmp     r8, r0
        add     r4, r4, #4
        add     r12, r12, #4
        add     r5, r5, #4
        add     r6, r6, #4
        add     r7, r7, #4
        blt     LBFA4
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBFA7:
        cmp     r12, #0
        ble     LBFA11
        cmp     r0, #0
        ble     LBFA17
        mov     r5, r2
        mvn     r1, r6
        mov     r10, r4
        sub     r9, r12, #1
        mov     r6, r5
        mov     r7, r3
        mov     r8, lr
        str     r0, [sp, #0x10]
        str     r2, [sp, #8]
        str     r3, [sp, #0xC]
        str     r12, [sp, #4]
LBFA8:
        ldr     r0, [sp, #0xC]
        ldrsh   r2, [lr, +r4]
        ldrsh   r11, [r7, #2]
        ldrsh   r0, [r0, +r4]
        ldrsh   r3, [r8, #2]
        mul     r12, r2, r0
        mul     r2, r2, r11
        mul     r11, r11, r3
        mul     r0, r3, r0
        ldr     r3, [sp, #4]
        cmp     r2, #1, 2
        sub     r12, r12, r11
        mov     r3, r12, asr r3
        sub     r0, r0, #1
        moveq   r0, #0
        add     r0, r2, r0
        and     r2, r0, #1
        add     r0, r2, r0, asr #1
        cmp     r1, r3
        mov     r0, r0, asr r9
        ldrlt   r2, [sp, #8]
        strlth  r1, [r2, +r4]
        blt     LBFA9
        mov     r2, #0
        cmn     r3, #2, 18
        sub     r2, r2, #2, 18
        movlt   r3, r2
        ldr     r2, [sp, #8]
        strh    r3, [r2, +r4]
LBFA9:
        cmp     r1, r0
        strlth  r1, [r6, #2]
        blt     LBFA10
        mov     r2, #0
        cmn     r0, #2, 18
        sub     r2, r2, #2, 18
        movlt   r0, r2
        strh    r0, [r5, #2]
LBFA10:
        ldr     r0, [sp, #0x10]
        add     r10, r10, #1
        add     r4, r4, #4
        cmp     r10, r0
        add     r5, r5, #4
        add     r6, r6, #4
        add     r7, r7, #4
        add     r8, r8, #4
        blt     LBFA8
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBFA11:
        rsb     r12, r12, #0
        cmp     r12, #0x10
        movge   r10, r4
        sublt   r1, r4, #2, 18
        movlt   r10, r1, asr r12
        cmp     r0, #0
        mvn     r9, r6
        ble     LBFA17
        mov     r5, r2
        mov     r1, r5
        mvn     r6, r6
        str     r6, [sp, #4]
        str     r1, [sp]
        mov     r6, r3
        str     r3, [sp, #0xC]
        ldr     r3, [sp]
        sub     r11, r4, #2, 18
        mov     r8, r4
        mov     r7, lr
        str     r11, [sp, #0x14]
        str     r10, [sp, #0x18]
        str     r0, [sp, #0x10]
        str     r2, [sp, #8]
        str     lr, [sp, #0x1C]
LBFA12:
        ldr     r0, [sp, #0x1C]
        ldrsh   lr, [r6, #2]
        ldr     r2, [sp, #0xC]
        ldrsh   r0, [r0, +r4]
        ldrsh   r10, [r7, #2]
        ldrsh   r2, [r2, +r4]
        mul     r11, r0, lr
        mul     lr, lr, r10
        mul     r0, r0, r2
        mul     r2, r10, r2
        cmp     r11, #1, 2
        sub     r0, r0, lr
        moveq   r2, #0
        cmp     r0, r9, asr r12
        add     r11, r11, r2
        ble     LBFA13
        ldr     r2, [sp, #8]
        ldr     r0, [sp, #4]
        strh    r0, [r2, +r4]
        b       LBFA15
LBFA13:
        ldr     r2, [sp, #0x18]
        cmp     r0, r2
        bge     LBFA14
        ldr     r0, [sp, #0x14]
        ldr     r2, [sp, #8]
        strh    r0, [r2, +r4]
        b       LBFA15
LBFA14:
        ldr     r2, [sp, #8]
        mov     r0, r0, lsl r12
        strh    r0, [r2, +r4]
LBFA15:
        cmp     r11, r9, asr r12
        ldrgt   r0, [sp, #4]
        strgth  r0, [r3, #2]
        bgt     LBFA16
        ldr     r0, [sp, #0x18]
        cmp     r11, r0
        movge   r11, r11, lsl r12
        strgeh  r11, [r5, #2]
        ldrlt   r0, [sp, #0x14]
        strlth  r0, [r1, #2]
LBFA16:
        ldr     r0, [sp, #0x10]
        add     r8, r8, #1
        add     r4, r4, #4
        cmp     r8, r0
        add     r5, r5, #4
        add     r1, r1, #4
        add     r3, r3, #4
        add     r6, r6, #4
        add     r7, r7, #4
        blt     LBFA12
LBFA17:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBFA18:
        mvn     r5, r6
        cmp     lr, r5
        movlt   r5, lr
        sub     lr, r4, #2, 18
        cmp     r5, lr
        movgt   lr, r5
        rsb     r5, r12, #0
        mov     lr, lr, lsl r5
        b       LBFA2
LBFA19:
        mvn     r5, r6
        cmp     lr, r5
        movlt   r5, lr
        sub     lr, r4, #2, 18
        cmp     r5, lr
        movgt   lr, r5
        rsb     r5, r12, #0
        mov     lr, lr, lsl r5
        b       LBFA0
LBFA20:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBFA21:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


