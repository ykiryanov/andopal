        .text
        .align  4
        .globl  _ippsAddC_16s_Sfs


_ippsAddC_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        mov     r4, r1
        mov     r1, r2
        cmp     r12, #0
        mov     r2, r3
        bne     LDCQ0
        cmp     r4, #0
        ldmeqia sp!, {r4 - r11, lr}
        beq     _ippsCopy_16s
        b       LDCQ1
LDCQ0:
        cmp     r12, #0x10
        ble     LDCQ1
        cmp     r0, #0
        beq     LDCQ16
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16s
LDCQ1:
        cmp     r0, #0
        beq     LDCQ16
        cmp     r1, #0
        beq     LDCQ16
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        mvn     lr, #0xFF
        bic     r5, lr, #0x7F, 24
        cmn     r12, #0xF
        mov     lr, #0
        bge     LDCQ4
        cmp     r2, #0
        ble     LDCQ3
LDCQ2:
        ldrsh   r12, [r0], #2
        add     r12, r4, r12
        cmp     r12, #0
        mvngt   r12, r5
        cmp     r12, #0
        sublt   r12, lr, #2, 18
        strh    r12, [r1], #2
        subs    r2, r2, #1
        bne     LDCQ2
LDCQ3:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDCQ4:
        cmp     r12, #0
        bne     LDCQ6
        cmp     r4, #0
        ble     LDCQ14
        mvn     r5, r5
LDCQ5:
        ldrsh   r12, [r0], #2
        add     lr, lr, #1
        add     r12, r4, r12
        cmp     r12, r5
        mov     r6, r5
        movlt   r6, r12
        strh    r6, [r1], #2
        cmp     lr, r2
        blt     LDCQ5
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDCQ6:
        cmp     r12, #0
        ble     LDCQ10
        sub     r5, r12, #1
        mov     r6, #1
        mov     r5, r6, lsl r5
        cmp     r2, #5
        sub     r5, r5, #1
        blt     LDCQ8
        sub     r8, r2, #5
        mov     r7, r0
        mov     r6, r1
LDCQ7:
        ldrsh   r9, [r7]
        add     lr, lr, #4
        cmp     lr, r8
        add     r9, r4, r9
        mov     r10, r9, asr r12
        and     r10, r10, #1
        add     r9, r5, r9
        add     r10, r9, r10
        mov     r9, r10, asr r12
        strh    r9, [r6]
        ldrsh   r9, [r7, #2]
        add     r9, r4, r9
        mov     r10, r9, asr r12
        and     r10, r10, #1
        add     r9, r5, r9
        add     r10, r9, r10
        mov     r9, r10, asr r12
        strh    r9, [r6, #2]
        ldrsh   r9, [r7, #4]
        add     r9, r4, r9
        mov     r10, r9, asr r12
        and     r10, r10, #1
        add     r9, r5, r9
        add     r10, r9, r10
        mov     r9, r10, asr r12
        strh    r9, [r6, #4]
        ldrsh   r9, [r7, #6]
        add     r7, r7, #8
        add     r9, r4, r9
        mov     r10, r9, asr r12
        and     r10, r10, #1
        add     r9, r5, r9
        add     r10, r9, r10
        mov     r9, r10, asr r12
        strh    r9, [r6, #6]
        add     r6, r6, #8
        ble     LDCQ7
LDCQ8:
        add     r0, r0, lr, lsl #1
        add     r1, r1, lr, lsl #1
LDCQ9:
        ldrsh   r6, [r0], #2
        add     lr, lr, #1
        add     r6, r4, r6
        mov     r7, r6, asr r12
        and     r7, r7, #1
        add     r6, r5, r6
        add     r7, r6, r7
        mov     r6, r7, asr r12
        strh    r6, [r1], #2
        cmp     lr, r2
        blt     LDCQ9
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDCQ10:
        cmp     r2, #5
        rsb     r12, r12, #0
        blt     LDCQ12
        mvn     r5, r5
        sub     r9, r2, #5
        sub     r8, lr, #2, 18
        mov     r7, r0
        mov     r6, r1
LDCQ11:
        ldrsh   r10, [r7]
        add     lr, lr, #4
        add     r10, r4, r10
        mov     r11, r10, lsl r12
        cmp     r11, r5
        mov     r10, r5
        movlt   r10, r11
        mov     r11, r8
        cmp     r10, r8
        movgt   r11, r10
        strh    r11, [r6]
        ldrsh   r10, [r7, #2]
        add     r10, r4, r10
        mov     r11, r10, lsl r12
        cmp     r11, r5
        mov     r10, r5
        movlt   r10, r11
        cmp     r10, r8
        mov     r11, r8
        movgt   r11, r10
        strh    r11, [r6, #2]
        ldrsh   r10, [r7, #4]
        add     r10, r4, r10
        mov     r11, r10, lsl r12
        cmp     r11, r5
        mov     r10, r5
        movlt   r10, r11
        cmp     r10, r8
        mov     r11, r8
        movgt   r11, r10
        strh    r11, [r6, #4]
        ldrsh   r10, [r7, #6]
        add     r7, r7, #8
        add     r10, r4, r10
        mov     r11, r10, lsl r12
        cmp     r11, r5
        mov     r10, r5
        movlt   r10, r11
        cmp     r10, r8
        mov     r11, r8
        movgt   r11, r10
        strh    r11, [r6, #6]
        cmp     lr, r9
        add     r6, r6, #8
        ble     LDCQ11
LDCQ12:
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mov     r6, #0
        sub     r6, r6, #2, 18
        mvn     r5, r5
        add     r0, r0, lr, lsl #1
        add     r1, r1, lr, lsl #1
LDCQ13:
        ldrsh   r7, [r0], #2
        add     lr, lr, #1
        add     r7, r4, r7
        mov     r8, r7, lsl r12
        cmp     r8, r5
        mov     r7, r5
        movlt   r7, r8
        cmp     r7, r6
        mov     r8, r6
        movgt   r8, r7
        strh    r8, [r1], #2
        cmp     lr, r2
        blt     LDCQ13
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDCQ14:
        sub     r12, lr, #2, 18
LDCQ15:
        ldrsh   r5, [r0], #2
        add     lr, lr, #1
        add     r5, r4, r5
        cmp     r5, r12
        mov     r6, r12
        movgt   r6, r5
        strh    r6, [r1], #2
        cmp     lr, r2
        blt     LDCQ15
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDCQ16:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


