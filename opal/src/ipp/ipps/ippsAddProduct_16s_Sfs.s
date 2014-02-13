        .text
        .align  4
        .globl  _ippsAddProduct_16s_Sfs


_ippsAddProduct_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r12, [sp, #0x34]
        cmp     r0, #0
        beq     LDBQ13
        cmp     r1, #0
        beq     LDBQ13
        cmp     r2, #0
        beq     LDBQ13
        cmp     r3, #0
        ble     LDBQ14
        mvn     lr, #0xFF
        cmp     r12, #0
        bic     lr, lr, #0x7F, 24
        mov     r10, #0
        bne     LDBQ3
        cmp     r3, #4
        blt     LDBQ1
        mvn     r12, lr
        sub     r7, r3, #4
        sub     r6, r10, #2, 18
        mov     r5, r2
        mov     r4, r1
        mov     lr, r0
        str     r0, [sp, #8]
        str     r3, [sp, #0xC]
LDBQ0:
        ldrsh   r11, [r4]
        ldrsh   r9, [r5]
        ldrsh   r0, [lr]
        ldrsh   r3, [r5, #2]
        ldrsh   r8, [r5, #4]
        mla     r11, r0, r11, r9
        mov     r9, r12
        add     r10, r10, #3
        cmp     r11, r12
        movlt   r9, r11
        cmp     r9, r6
        mov     r11, r6
        movgt   r11, r9
        strh    r11, [r5]
        ldrsh   r9, [r4, #2]
        ldrsh   r11, [lr, #2]
        mla     r9, r11, r9, r3
        mov     r3, r12
        cmp     r9, r12
        movlt   r3, r9
        cmp     r3, r6
        mov     r9, r6
        movgt   r9, r3
        strh    r9, [r5, #2]
        ldrsh   r3, [r4, #4]
        ldrsh   r9, [lr, #4]
        add     r4, r4, #6
        add     lr, lr, #6
        mla     r8, r9, r3, r8
        mov     r3, r12
        cmp     r8, r12
        movlt   r3, r8
        cmp     r3, r6
        mov     r8, r6
        movgt   r8, r3
        strh    r8, [r5, #4]
        cmp     r10, r7
        add     r5, r5, #6
        ble     LDBQ0
        ldr     r0, [sp, #8]
        ldr     r3, [sp, #0xC]
LDBQ1:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mov     lr, #0
        sub     lr, lr, #2, 18
        mvn     r12, r12
        add     r2, r2, r10, lsl #1
        add     r1, r1, r10, lsl #1
        add     r0, r0, r10, lsl #1
LDBQ2:
        ldrsh   r5, [r1], #2
        ldrsh   r4, [r2]
        ldrsh   r6, [r0], #2
        mla     r5, r6, r5, r4
        mov     r4, r12
        add     r10, r10, #1
        cmp     r5, r12
        movlt   r4, r5
        cmp     r4, lr
        mov     r5, lr
        movgt   r5, r4
        strh    r5, [r2], #2
        cmp     r10, r3
        blt     LDBQ2
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDBQ3:
        cmp     r12, #0
        ble     LDBQ9
        cmp     r12, #0x1E
        bgt     LDBQ8
        sub     r5, r12, #1
        mov     r4, #1
        mov     r5, r4, lsl r5
        cmp     r3, #4
        sub     r4, r5, #1
        blt     LDBQ5
        mvn     lr, lr
        sub     r9, r3, #4
        sub     r8, r10, #2, 18
        mov     r7, r2
        mov     r6, r1
        mov     r5, r0
        str     r2, [sp]
        str     r1, [sp, #4]
        str     r0, [sp, #8]
        str     r3, [sp, #0xC]
LDBQ4:
        ldrsh   r2, [r7]
        ldrsh   r3, [r6]
        ldrsh   r11, [r5]
        ldrsh   r0, [r7, #2]
        ldrsh   r1, [r7, #4]
        mla     r3, r11, r3, r2
        add     r10, r10, #3
        mov     r2, r3, asr r12
        and     r2, r2, #1
        add     r3, r4, r3
        add     r2, r3, r2
        mov     r3, r2, asr r12
        mov     r2, lr
        cmp     r3, lr
        movlt   r2, r3
        cmp     r2, r8
        mov     r3, r8
        movgt   r3, r2
        strh    r3, [r7]
        ldrsh   r2, [r6, #2]
        ldrsh   r3, [r5, #2]
        mla     r2, r3, r2, r0
        mov     r0, r2, asr r12
        and     r0, r0, #1
        add     r2, r4, r2
        add     r0, r2, r0
        mov     r2, r0, asr r12
        cmp     r2, lr
        mov     r0, lr
        movlt   r0, r2
        cmp     r0, r8
        mov     r2, r8
        movgt   r2, r0
        strh    r2, [r7, #2]
        ldrsh   r0, [r6, #4]
        ldrsh   r2, [r5, #4]
        add     r6, r6, #6
        add     r5, r5, #6
        mla     r1, r2, r0, r1
        mov     r0, r1, asr r12
        and     r0, r0, #1
        add     r1, r4, r1
        add     r0, r1, r0
        mov     r1, r0, asr r12
        cmp     r1, lr
        mov     r0, lr
        movlt   r0, r1
        cmp     r0, r8
        mov     r1, r8
        movgt   r1, r0
        strh    r1, [r7, #4]
        cmp     r10, r9
        add     r7, r7, #6
        ble     LDBQ4
        ldr     r2, [sp]
        ldr     r1, [sp, #4]
        ldr     r0, [sp, #8]
        ldr     r3, [sp, #0xC]
LDBQ5:
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mov     r5, #0
        sub     r5, r5, #2, 18
        mvn     lr, lr
        add     r2, r2, r10, lsl #1
        add     r1, r1, r10, lsl #1
        add     r0, r0, r10, lsl #1
LDBQ6:
        ldrsh   r7, [r1], #2
        ldrsh   r6, [r2]
        ldrsh   r8, [r0], #2
        mla     r7, r8, r7, r6
        add     r10, r10, #1
        mov     r6, r7, asr r12
        and     r6, r6, #1
        add     r7, r4, r7
        add     r6, r7, r6
        mov     r7, r6, asr r12
        cmp     r7, lr
        mov     r6, lr
        movlt   r6, r7
        cmp     r6, r5
        mov     r7, r5
        movgt   r7, r6
        strh    r7, [r2], #2
        cmp     r10, r3
        blt     LDBQ6
LDBQ7:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDBQ8:
        mov     r0, r2
        mov     r1, r3
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16s
LDBQ9:
        cmn     r12, #0xF
        bgt     LDBQ11
        cmp     r3, #0
        ble     LDBQ7
        mov     r12, r10
LDBQ10:
        ldrsh   r6, [r2]
        ldrsh   r5, [r1], #2
        ldrsh   r4, [r0], #2
        mla     r6, r4, r5, r6
        cmp     r6, #0
        mvngt   r6, lr
        cmp     r6, #0
        sublt   r6, r10, #2, 18
        add     r12, r12, #1
        strh    r6, [r2], #2
        cmp     r12, r3
        blt     LDBQ10
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDBQ11:
        cmp     r3, #0
        rsb     r12, r12, #0
        ble     LDBQ7
        mvn     lr, lr
        sub     r4, r10, #2, 18
LDBQ12:
        ldrsh   r6, [r1], #2
        ldrsh   r5, [r2]
        ldrsh   r7, [r0], #2
        mla     r6, r7, r6, r5
        mov     r5, r4
        add     r10, r10, #1
        cmp     r6, r4
        movgt   r5, r6
        cmp     r5, lr
        mov     r6, lr
        movlt   r6, r5
        mov     r6, r6, lsl r12
        cmp     r6, r4
        mov     r5, r4
        movgt   r5, r6
        cmp     r5, lr
        mov     r6, lr
        movlt   r6, r5
        strh    r6, [r2], #2
        cmp     r10, r3
        blt     LDBQ12
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDBQ13:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDBQ14:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


