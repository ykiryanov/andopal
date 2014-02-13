        .text
        .align  4
        .globl  ownSplit_idx_noovf


ownSplit_idx_noovf:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        sub     sp, sp, #1, 22
        ldr     r12, [sp, #0x440]
        ldr     r6, [sp, #0x444]
        mov     r5, r2
        cmp     r5, #0
        mov     r4, r3
        add     r8, r0, r5, lsl #4
        ble     LDNX2
        cmp     r5, #6
        movlt   lr, #0
        movlt   r9, lr
        blt     LDNX1
        mov     lr, #0
        sub     r7, r5, #6
        mov     r9, lr
        str     r4, [sp, #0xC]
        str     r5, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LDNX0:
        mov     r9, r9, lsl #1
        ldrsh   r10, [r8, +r9]
        add     r5, lr, #1
        add     r4, sp, #0x87, 30
        strh    r10, [r4, +r9]
        mov     r5, r5, lsl #16
        add     r0, sp, #0x87, 30
        mov     r5, r5, asr #16
        add     r11, lr, #2
        mov     r5, r5, lsl #1
        ldrsh   r9, [r8, +r5]
        mov     r4, r11, lsl #16
        add     r1, sp, #0x87, 30
        strh    r9, [r0, +r5]
        mov     r4, r4, asr #16
        add     r10, lr, #3
        add     r11, lr, #4
        mov     r4, r4, lsl #1
        ldrsh   r0, [r8, +r4]
        mov     r10, r10, lsl #16
        add     r2, sp, #0x87, 30
        strh    r0, [r1, +r4]
        mov     r5, r10, asr #16
        mov     r11, r11, lsl #16
        mov     r5, r5, lsl #1
        ldrsh   r0, [r8, +r5]
        mov     r11, r11, asr #16
        add     r3, sp, #0x87, 30
        strh    r0, [r2, +r5]
        mov     r11, r11, lsl #1
        ldrsh   r0, [r8, +r11]
        add     lr, lr, #5
        strh    r0, [r3, +r11]
        mov     r0, lr, lsl #16
        mov     r9, r0, asr #16
        cmp     r9, r7
        ble     LDNX0
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDNX1:
        mov     r9, r9, lsl #1
        ldrsh   r7, [r8, +r9]
        add     r10, sp, #0x87, 30
        add     lr, lr, #1
        strh    r7, [r10, +r9]
        mov     r7, lr, lsl #16
        mov     r9, r7, asr #16
        cmp     r9, r5
        blt     LDNX1
LDNX2:
        cmp     r5, #0
        ble     LDNX8
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
        mvn     r9, #0
        mov     r8, #0
        mov     r7, r5
        str     r1, [sp, #4]
        str     r0, [sp]
LDNX3:
        add     r0, sp, #0x87, 30
        ldrsh   r0, [r0]
        cmp     r5, #1
        movle   r2, #0
        ble     LDNX7
        mov     r2, #0
        mov     r11, #1
        mov     r10, #2
LDNX4:
        add     r1, sp, #0x87, 30
        ldrsh   r1, [r1, +r10]
        sub     r3, r1, r0
        cmp     lr, r3
        blt     LDNX5
        cmn     r3, #2, 18
        movge   r3, r3, lsl #16
        movge   r3, r3, asr #16
        movlt   r3, #0
        sublt   r3, r3, #2, 18
        b       LDNX6
LDNX5:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
LDNX6:
        cmp     r3, #0
        movgt   r0, r1
        movgt   r2, r11
        add     r11, r11, #1
        cmp     r11, r5
        add     r10, r10, #2
        blt     LDNX4
LDNX7:
        add     r1, sp, #0x1C
        strh    r2, [r1, +r8]
        mov     r2, r2, lsl #16
        add     r0, sp, #0x87, 30
        mov     r2, r2, asr #15
        subs    r7, r7, #1
        add     r8, r8, #2
        strh    r9, [r0, +r2]
        bne     LDNX3
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDNX8:
        cmp     r5, #0
        ble     LDNX25
        mov     lr, #0xFF
        mov     r9, #0
        orr     r10, lr, #0x7F, 24
        mvn     r7, #0xFF
        mov     r8, r9
        bic     r7, r7, #0x7F, 24
        mov     lr, r8
        sub     r10, r10, #6, 20
        mvn     r7, r7
        mov     r11, lr
        str     lr, [sp, #0x14]
        str     r10, [sp, #0x10]
        str     r12, [sp, #0x18]
        str     r1, [sp, #4]
        str     r0, [sp]
LDNX9:
        add     r0, sp, #0x1C
        ldrsh   r10, [r0, +r9]
        ldr     r0, [sp]
        ldr     r12, [sp, #0x18]
        mov     r11, r10, lsl #1
        add     r3, r6, r10, lsl #4
        add     r2, r11, r12
        add     r0, r0, r10, lsl #4
        add     r1, r4, r11
        bl      ownRE8_Cod
        ldrsh   r1, [r4, +r11]
        cmp     r1, #0
        ble     LDNX24
        mov     r0, r8, lsl #16
        sub     r12, r10, r0, asr #16
        cmp     r7, r12
        mov     r0, r8
        blt     LDNX10
        cmn     r12, #2, 18
        movge   r12, r12, lsl #16
        movge   r12, r12, asr #16
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        b       LDNX11
LDNX10:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LDNX11:
        cmp     r12, #0
        movgt   r0, r10
        cmp     r1, #2
        movlt   r1, #0
        blt     LDNX17
        ldr     r12, [sp, #0x10]
        cmp     r12, r1
        blt     LDNX12
        cmn     r1, #2, 20
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        blt     LDNX13
        mov     r12, r1, lsl #2
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDNX13
LDNX12:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LDNX13:
        add     r12, r1, r12
        cmp     r7, r12
        blt     LDNX14
        cmn     r12, #2, 18
        movge   r1, r12, lsl #16
        movge   r1, r1, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LDNX15
LDNX14:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDNX15:
        sub     r1, r1, #1
        cmp     r7, r1
        blt     LDNX16
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        movlt   r1, #0
        sublt   r1, r1, #2, 18
        b       LDNX17
LDNX16:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r1, r1
LDNX17:
        ldr     r12, [sp, #0x14]
        add     r1, r1, r12
        cmp     r7, r1
        blt     LDNX18
        cmn     r1, #2, 18
        movge   r12, r1, lsl #16
        movge   r12, r12, asr #16
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        b       LDNX19
LDNX18:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LDNX19:
        mov     lr, r0, lsl #16
        add     lr, r12, lr, asr #16
        cmp     r7, lr
        blt     LDNX20
        cmn     lr, #2, 18
        movge   r12, lr, lsl #16
        movge   r12, r12, asr #16
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        b       LDNX21
LDNX20:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LDNX21:
        ldr     lr, [sp, #4]
        sub     r12, r12, lr
        cmp     r7, r12
        blt     LDNX22
        cmn     r12, #2, 18
        movge   r12, r12, lsl #16
        movge   r12, r12, asr #16
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        b       LDNX23
LDNX22:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LDNX23:
        cmp     r12, #0
        movgt   r0, #0
        strgth  r0, [r4, +r11]
        ble     LDNX26
LDNX24:
        subs    r5, r5, #1
        add     r9, r9, #2
        bne     LDNX9
LDNX25:
        add     sp, sp, #0x1C
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LDNX26:
        cmp     r7, r1
        blt     LDNX28
        cmn     r1, #2, 18
        bge     LDNX27
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        str     r1, [sp, #0x14]
        b       LDNX29
LDNX27:
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        str     r1, [sp, #0x14]
        b       LDNX29
LDNX28:
        mov     r1, #0
        sub     r1, r1, #2, 18
        mvn     r1, r1
        str     r1, [sp, #0x14]
LDNX29:
        mov     r8, r0
        b       LDNX24


