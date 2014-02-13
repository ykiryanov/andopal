        .text
        .align  4
        .globl  _ippsAdd_16s_Sfs


_ippsAdd_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        ldr     lr, [sp, #0x24]
        cmp     lr, #0x10
        ble     LDCD0
        cmp     r0, #0
        beq     LDCD15
        cmp     r1, #0
        beq     LDCD15
        mov     r0, r2
        mov     r1, r3
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16s
LDCD0:
        cmp     r0, #0
        beq     LDCD15
        cmp     r1, #0
        beq     LDCD15
        cmp     r2, #0
        beq     LDCD15
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        mvn     r12, #0xFF
        bic     r5, r12, #0x7F, 24
        cmn     lr, #0xF
        mov     r12, #0
        bge     LDCD3
        cmp     r3, #0
        ble     LDCD2
LDCD1:
        ldrsh   lr, [r1], #2
        ldrsh   r4, [r0], #2
        add     lr, r4, lr
        cmp     lr, #0
        mvngt   lr, r5
        cmp     lr, #0
        sublt   lr, r12, #2, 18
        strh    lr, [r2], #2
        subs    r3, r3, #1
        bne     LDCD1
LDCD2:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDCD3:
        cmp     lr, #0
        bne     LDCD7
        cmp     r3, #5
        blt     LDCD5
        mvn     lr, r5
        sub     r8, r3, #5
        sub     r7, r12, #2, 18
        mov     r6, r0
        mov     r5, r1
        mov     r4, r2
LDCD4:
        ldrsh   r9, [r5]
        ldrsh   r10, [r6]
        add     r12, r12, #4
        add     r10, r10, r9
        mov     r9, lr
        cmp     r10, lr
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4]
        ldrsh   r10, [r6, #2]
        ldrsh   r9, [r5, #2]
        add     r10, r10, r9
        cmp     r10, lr
        mov     r9, lr
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4, #2]
        ldrsh   r10, [r6, #4]
        ldrsh   r9, [r5, #4]
        add     r10, r10, r9
        cmp     r10, lr
        mov     r9, lr
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4, #4]
        ldrsh   r10, [r6, #6]
        ldrsh   r9, [r5, #6]
        add     r6, r6, #8
        add     r5, r5, #8
        add     r10, r10, r9
        cmp     r10, lr
        mov     r9, lr
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4, #6]
        cmp     r12, r8
        add     r4, r4, #8
        ble     LDCD4
LDCD5:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mov     r4, #0
        sub     r4, r4, #2, 18
        mvn     lr, lr
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
        add     r2, r2, r12, lsl #1
LDCD6:
        ldrsh   r6, [r0], #2
        ldrsh   r5, [r1], #2
        add     r12, r12, #1
        add     r6, r6, r5
        cmp     r6, lr
        mov     r5, lr
        movlt   r5, r6
        cmp     r5, r4
        mov     r6, r4
        movgt   r6, r5
        strh    r6, [r2], #2
        cmp     r12, r3
        blt     LDCD6
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDCD7:
        cmp     lr, #0
        ble     LDCD11
        sub     r5, lr, #1
        mov     r4, #1
        mov     r5, r4, lsl r5
        cmp     r3, #5
        sub     r4, r5, #1
        blt     LDCD9
        sub     r8, r3, #5
        mov     r7, r0
        mov     r6, r1
        mov     r5, r2
LDCD8:
        ldrsh   r9, [r7]
        ldrsh   r10, [r6]
        add     r12, r12, #4
        cmp     r12, r8
        add     r9, r9, r10
        mov     r10, r9, asr lr
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr lr
        strh    r9, [r5]
        ldrsh   r9, [r7, #2]
        ldrsh   r10, [r6, #2]
        add     r9, r9, r10
        mov     r10, r9, asr lr
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr lr
        strh    r9, [r5, #2]
        ldrsh   r9, [r7, #4]
        ldrsh   r10, [r6, #4]
        add     r9, r9, r10
        mov     r10, r9, asr lr
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr lr
        strh    r9, [r5, #4]
        ldrsh   r9, [r7, #6]
        ldrsh   r10, [r6, #6]
        add     r7, r7, #8
        add     r6, r6, #8
        add     r9, r9, r10
        mov     r10, r9, asr lr
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr lr
        strh    r9, [r5, #6]
        add     r5, r5, #8
        ble     LDCD8
LDCD9:
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
        add     r2, r2, r12, lsl #1
LDCD10:
        ldrsh   r5, [r0], #2
        ldrsh   r6, [r1], #2
        add     r12, r12, #1
        add     r5, r5, r6
        mov     r6, r5, asr lr
        and     r6, r6, #1
        add     r5, r4, r5
        add     r6, r5, r6
        mov     r5, r6, asr lr
        strh    r5, [r2], #2
        cmp     r12, r3
        blt     LDCD10
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDCD11:
        cmp     r3, #5
        rsb     r4, lr, #0
        blt     LDCD13
        mvn     lr, r5
        sub     r9, r3, #5
        sub     r8, r12, #2, 18
        mov     r7, r0
        mov     r6, r1
        mov     r5, r2
LDCD12:
        ldrsh   r11, [r6]
        ldrsh   r10, [r7]
        add     r12, r12, #4
        add     r11, r10, r11
        mov     r11, r11, lsl r4
        cmp     r11, lr
        mov     r10, lr
        movlt   r10, r11
        mov     r11, r8
        cmp     r10, r8
        movgt   r11, r10
        strh    r11, [r5]
        ldrsh   r11, [r6, #2]
        ldrsh   r10, [r7, #2]
        add     r11, r10, r11
        mov     r11, r11, lsl r4
        cmp     r11, lr
        mov     r10, lr
        movlt   r10, r11
        cmp     r10, r8
        mov     r11, r8
        movgt   r11, r10
        strh    r11, [r5, #2]
        ldrsh   r11, [r6, #4]
        ldrsh   r10, [r7, #4]
        add     r11, r10, r11
        mov     r11, r11, lsl r4
        cmp     r11, lr
        mov     r10, lr
        movlt   r10, r11
        cmp     r10, r8
        mov     r11, r8
        movgt   r11, r10
        strh    r11, [r5, #4]
        ldrsh   r11, [r6, #6]
        ldrsh   r10, [r7, #6]
        add     r7, r7, #8
        add     r6, r6, #8
        add     r11, r10, r11
        mov     r11, r11, lsl r4
        cmp     r11, lr
        mov     r10, lr
        movlt   r10, r11
        cmp     r10, r8
        mov     r11, r8
        movgt   r11, r10
        strh    r11, [r5, #6]
        cmp     r12, r9
        add     r5, r5, #8
        ble     LDCD12
LDCD13:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mov     r5, #0
        sub     r5, r5, #2, 18
        mvn     lr, lr
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
        add     r2, r2, r12, lsl #1
LDCD14:
        ldrsh   r6, [r1], #2
        ldrsh   r7, [r0], #2
        add     r12, r12, #1
        add     r6, r7, r6
        mov     r7, r6, lsl r4
        cmp     r7, lr
        mov     r6, lr
        movlt   r6, r7
        cmp     r6, r5
        mov     r7, r5
        movgt   r7, r6
        strh    r7, [r2], #2
        cmp     r12, r3
        blt     LDCD14
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LDCD15:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


