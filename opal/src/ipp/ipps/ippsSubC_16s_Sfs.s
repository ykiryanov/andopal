        .text
        .align  4
        .globl  _ippsSubC_16s_Sfs


_ippsSubC_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        mov     r4, r1
        mov     r1, r2
        cmp     r12, #0
        mov     r2, r3
        bne     LATM0
        cmp     r4, #0
        ldmeqia sp!, {r4 - r11, lr}
        beq     _ippsCopy_16s
        b       LATM1
LATM0:
        cmp     r12, #0x10
        ble     LATM1
        cmp     r0, #0
        beq     LATM16
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16s
LATM1:
        cmp     r0, #0
        beq     LATM16
        cmp     r1, #0
        beq     LATM16
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        mvn     lr, #0xFF
        cmn     r12, #0xF
        bic     r6, lr, #0x7F, 24
        bge     LATM4
        cmp     r2, #0
        ble     LATM3
LATM2:
        ldrsh   r12, [r0], #2
        sub     r12, r12, r4
        cmp     r12, #0
        mvngt   r12, r6
        cmp     r12, #0
        movlt   r12, r6
        strh    r12, [r1], #2
        subs    r2, r2, #1
        bne     LATM2
LATM3:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LATM4:
        cmp     r12, #0
        mov     lr, #0
        bne     LATM6
        cmp     r4, #0
        blt     LATM14
        sub     r12, lr, #2, 18
LATM5:
        ldrsh   r5, [r0], #2
        add     lr, lr, #1
        sub     r5, r5, r4
        cmp     r5, r12
        mov     r6, r12
        movgt   r6, r5
        strh    r6, [r1], #2
        cmp     lr, r2
        blt     LATM5
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LATM6:
        cmp     r12, #0
        ble     LATM10
        sub     r5, r12, #1
        mov     r7, #1
        mov     r5, r7, lsl r5
        cmp     r2, #5
        sub     r5, r5, #1
        blt     LATM8
        mvn     r6, r6
        sub     r9, r2, #5
        mov     r8, r0
        mov     r7, r1
LATM7:
        ldrsh   r10, [r8]
        add     lr, lr, #4
        sub     r10, r10, r4
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r5, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        mov     r11, r6
        cmp     r10, r6
        movlt   r11, r10
        strh    r11, [r7]
        ldrsh   r10, [r8, #2]
        sub     r10, r10, r4
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r5, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        cmp     r10, r6
        mov     r11, r6
        movlt   r11, r10
        strh    r11, [r7, #2]
        ldrsh   r10, [r8, #4]
        sub     r10, r10, r4
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r5, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        cmp     r10, r6
        mov     r11, r6
        movlt   r11, r10
        strh    r11, [r7, #4]
        ldrsh   r10, [r8, #6]
        add     r8, r8, #8
        sub     r10, r10, r4
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r5, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        cmp     r10, r6
        mov     r11, r6
        movlt   r11, r10
        strh    r11, [r7, #6]
        cmp     lr, r9
        add     r7, r7, #8
        ble     LATM7
LATM8:
        mvn     r6, #0xFF
        bic     r6, r6, #0x7F, 24
        mvn     r6, r6
        add     r0, r0, lr, lsl #1
        add     r1, r1, lr, lsl #1
LATM9:
        ldrsh   r7, [r0], #2
        add     lr, lr, #1
        sub     r7, r7, r4
        mov     r8, r7, asr r12
        and     r8, r8, #1
        add     r7, r5, r7
        add     r8, r7, r8
        mov     r7, r8, asr r12
        cmp     r7, r6
        mov     r8, r6
        movlt   r8, r7
        strh    r8, [r1], #2
        cmp     lr, r2
        blt     LATM9
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LATM10:
        cmp     r2, #5
        rsb     r12, r12, #0
        blt     LATM12
        mvn     r5, r6
        sub     r9, r2, #5
        sub     r8, lr, #2, 18
        mov     r7, r0
        mov     r6, r1
LATM11:
        ldrsh   r10, [r7]
        add     lr, lr, #4
        sub     r10, r10, r4
        mov     r11, r10, lsl r12
        cmp     r11, r5
        mov     r10, r5
        movlt   r10, r11
        mov     r11, r8
        cmp     r10, r8
        movgt   r11, r10
        strh    r11, [r6]
        ldrsh   r10, [r7, #2]
        sub     r10, r10, r4
        mov     r11, r10, lsl r12
        cmp     r11, r5
        mov     r10, r5
        movlt   r10, r11
        cmp     r10, r8
        mov     r11, r8
        movgt   r11, r10
        strh    r11, [r6, #2]
        ldrsh   r10, [r7, #4]
        sub     r10, r10, r4
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
        sub     r10, r10, r4
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
        ble     LATM11
LATM12:
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mov     r6, #0
        sub     r6, r6, #2, 18
        mvn     r5, r5
        add     r0, r0, lr, lsl #1
        add     r1, r1, lr, lsl #1
LATM13:
        ldrsh   r7, [r0], #2
        add     lr, lr, #1
        sub     r7, r7, r4
        mov     r8, r7, lsl r12
        cmp     r8, r5
        mov     r7, r5
        movlt   r7, r8
        cmp     r7, r6
        mov     r8, r6
        movgt   r8, r7
        strh    r8, [r1], #2
        cmp     lr, r2
        blt     LATM13
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LATM14:
        sub     r12, lr, #2, 18
        mvn     r12, r12
LATM15:
        ldrsh   r5, [r0], #2
        add     lr, lr, #1
        sub     r5, r5, r4
        cmp     r5, r12
        mov     r6, r12
        movlt   r6, r5
        strh    r6, [r1], #2
        cmp     lr, r2
        blt     LATM15
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LATM16:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


