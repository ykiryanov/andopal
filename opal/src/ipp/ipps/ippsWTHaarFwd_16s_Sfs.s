        .text
        .align  4
        .globl  _ippsWTHaarFwd_16s_Sfs


_ippsWTHaarFwd_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r4, [sp, #0x2C]
        cmp     r4, #0
        beq     LAJQ23
        cmp     r0, #0
        beq     LAJQ28
        cmp     r2, #0
        beq     LAJQ28
        cmp     r3, #0
        beq     LAJQ28
        cmp     r1, #0
        ble     LAJQ27
        add     r9, r4, #1
        cmp     r9, #2, 2
        mov     lr, #0
        mov     r5, #1
        beq     LAJQ14
        mvn     r12, #0xFF
        cmp     r9, #0
        bic     r6, r12, #0x7F, 24
        bne     LAJQ2
        sub     r8, r1, #1
        cmp     r8, #0
        movle   r9, lr
        ble     LAJQ1
        mvn     r12, r6
        mov     r9, lr
        add     r7, r0, #2
        sub     r6, lr, #2, 18
        mov     r5, r2
        mov     r4, r0
        str     r0, [sp]
LAJQ0:
        ldrsh   r11, [r7], #4
        ldrsh   r10, [r4], #4
        add     lr, lr, #1
        add     r0, r10, r11
        cmp     r12, r0
        movlt   r0, r12
        cmn     r0, #2, 18
        movlt   r0, r6
        sub     r11, r11, r10
        cmp     r12, r11
        movlt   r11, r12
        cmn     r11, #2, 18
        strh    r0, [r5], #2
        movlt   r11, r6
        add     r9, r9, #2
        strh    r11, [r3], #2
        cmp     r9, r8
        blt     LAJQ0
        ldr     r0, [sp]
LAJQ1:
        tst     r1, #1
        beq     LAJQ22
        mov     r9, r9, lsl #1
        ldrsh   r0, [r0, +r9]
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mov     r0, r0, lsl #1
        mvn     r1, r1
        cmp     r1, r0
        movlt   r0, r1
        mov     r1, #0
        cmn     r0, #2, 18
        sub     r1, r1, #2, 18
        movlt   r0, r1
        mov     lr, lr, lsl #1
        strh    r0, [r2, +lr]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJQ2:
        cmp     r9, #0x10
        bgt     LAJQ14
        cmn     r9, #0x10
        bgt     LAJQ8
        sub     r8, r1, #1
        cmp     r8, #0
        movle   r9, lr
        ble     LAJQ6
        mov     r9, lr
        add     r6, r0, #2
        mov     r7, r2
        mov     r5, r0
LAJQ3:
        ldrsh   r4, [r6], #4
        ldrsh   r10, [r5], #4
        sub     r12, r4, r10
        cmp     r12, #0
        add     r4, r10, r4
        ble     LAJQ26
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LAJQ4:
        cmp     r4, #0
        ble     LAJQ25
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        mvn     r4, r4
LAJQ5:
        strh    r4, [r7], #2
        add     lr, lr, #2
        strh    r12, [r3], #2
        cmp     lr, r8
        add     r9, r9, #1
        blt     LAJQ3
LAJQ6:
        tst     r1, #1
        beq     LAJQ22
        mov     lr, lr, lsl #1
        ldrsh   lr, [r0, +lr]
        cmp     lr, #0
        ble     LAJQ24
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     lr, r0
LAJQ7:
        mov     r9, r9, lsl #1
        strh    lr, [r2, +r9]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJQ8:
        cmp     r9, #0
        sub     r12, r1, #1
        ble     LAJQ11
        mov     r4, r5, lsl r4
        cmp     r12, #0
        sub     r4, r4, #1
        movle   r8, lr
        ble     LAJQ10
        mov     r8, lr
        add     r7, r0, #2
        mov     r6, r2
        mov     r5, r0
        str     r0, [sp]
LAJQ9:
        ldrsh   r0, [r7], #4
        ldrsh   r10, [r5], #4
        add     r8, r8, #1
        add     r11, r10, r0
        sub     r0, r0, r10
        mov     r10, r11, asr r9
        and     r10, r10, #1
        add     r11, r4, r11
        add     r10, r11, r10
        mov     r10, r10, asr r9
        strh    r10, [r6], #2
        mov     r10, r0, asr r9
        and     r10, r10, #1
        add     r0, r4, r0
        add     r10, r0, r10
        mov     r0, r10, asr r9
        add     lr, lr, #2
        strh    r0, [r3], #2
        cmp     lr, r12
        blt     LAJQ9
        ldr     r0, [sp]
LAJQ10:
        tst     r1, #1
        beq     LAJQ22
        mov     lr, lr, lsl #1
        ldrsh   lr, [r0, +lr]
        mov     r8, r8, lsl #1
        mov     r1, lr, lsl #1
        mov     r0, r1, asr r9
        and     r0, r0, #1
        add     r1, r4, r1
        add     r0, r1, r0
        mov     r9, r0, asr r9
        strh    r9, [r2, +r8]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJQ11:
        cmp     r12, #0
        rsb     r9, r9, #0
        movle   r10, lr
        ble     LAJQ13
        mvn     r4, r6
        mov     r10, lr
        add     r8, r0, #2
        sub     r7, lr, #2, 18
        mov     r6, r2
        mov     r5, r0
        str     r1, [sp, #4]
        str     r0, [sp]
LAJQ12:
        ldrsh   r1, [r8], #4
        ldrsh   r11, [r5], #4
        add     lr, lr, #1
        add     r10, r10, #2
        add     r0, r11, r1
        mov     r0, r0, lsl r9
        cmp     r4, r0
        movlt   r0, r4
        cmn     r0, #2, 18
        sub     r1, r1, r11
        movlt   r0, r7
        mov     r1, r1, lsl r9
        cmp     r4, r1
        movlt   r1, r4
        cmn     r1, #2, 18
        strh    r0, [r6], #2
        movlt   r1, r7
        strh    r1, [r3], #2
        cmp     r10, r12
        blt     LAJQ12
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LAJQ13:
        tst     r1, #1
        beq     LAJQ22
        mov     r10, r10, lsl #1
        ldrsh   r1, [r0, +r10]
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mov     r1, r1, lsl #1
        mov     r9, r1, lsl r9
        mvn     r0, r0
        cmp     r0, r9
        movlt   r9, r0
        mov     r0, #0
        cmn     r9, #2, 18
        sub     r0, r0, #2, 18
        movlt   r9, r0
        mov     lr, lr, lsl #1
        strh    r9, [r2, +lr]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJQ14:
        adds    r12, r1, #1
        mov     r0, lr
        movmi   r0, r5
        add     r0, r1, r0
        add     r0, r0, #1
        mov     r0, r0, asr #1
        cmp     r0, #0
        ble     LAJQ18
        cmp     r0, #6
        movlt   r12, lr
        blt     LAJQ16
        mov     r12, lr
        sub     r4, r0, #6
        mov     r6, r12
        mov     r7, r2
LAJQ15:
        add     r12, r12, #5
        strh    r6, [r7]
        strh    r6, [r7, #2]
        strh    r6, [r7, #4]
        strh    r6, [r7, #6]
        strh    r6, [r7, #8]
        cmp     r12, r4
        add     r7, r7, #0xA
        ble     LAJQ15
LAJQ16:
        add     r2, r2, r12, lsl #1
LAJQ17:
        add     r12, r12, #1
        strh    lr, [r2], #2
        cmp     r12, r0
        blt     LAJQ17
LAJQ18:
        cmp     r1, #0
        mov     r0, lr
        movlt   r0, r5
        add     r0, r1, r0
        mov     r0, r0, asr #1
        cmp     r0, #0
        ble     LAJQ22
        cmp     r0, #6
        movlt   r1, lr
        blt     LAJQ20
        mov     r1, lr
        sub     r2, r0, #6
        mov     r12, r1
        mov     r4, r3
LAJQ19:
        add     r1, r1, #5
        strh    r12, [r4]
        strh    r12, [r4, #2]
        strh    r12, [r4, #4]
        strh    r12, [r4, #6]
        strh    r12, [r4, #8]
        cmp     r1, r2
        add     r4, r4, #0xA
        ble     LAJQ19
LAJQ20:
        add     r3, r3, r1, lsl #1
LAJQ21:
        add     r1, r1, #1
        strh    lr, [r3], #2
        cmp     r1, r0
        blt     LAJQ21
LAJQ22:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJQ23:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsWTHaarFwd_16s
LAJQ24:
        cmp     lr, #0
        movlt   r0, #0
        sublt   lr, r0, #2, 18
        b       LAJQ7
LAJQ25:
        cmp     r4, #0
        movlt   r4, #0
        sublt   r4, r4, #2, 18
        b       LAJQ5
LAJQ26:
        cmp     r12, #0
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        b       LAJQ4
LAJQ27:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LAJQ28:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


