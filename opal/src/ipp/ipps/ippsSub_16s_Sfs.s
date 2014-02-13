        .text
        .align  4
        .globl  _ippsSub_16s_Sfs


_ippsSub_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        cmp     r12, #0x10
        ble     LATA0
        cmp     r0, #0
        beq     LATA15
        cmp     r1, #0
        beq     LATA15
        mov     r0, r2
        mov     r1, r3
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_16s
LATA0:
        cmp     r0, #0
        beq     LATA15
        cmp     r1, #0
        beq     LATA15
        cmp     r2, #0
        beq     LATA15
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        mvn     lr, #0xFF
        bic     r6, lr, #0x7F, 24
        cmn     r12, #0xF
        mov     lr, #0
        bge     LATA3
        cmp     r3, #0
        ble     LATA2
LATA1:
        ldrsh   r12, [r1], #2
        ldrsh   r4, [r0], #2
        sub     r12, r12, r4
        cmp     r12, #0
        mvngt   r12, r6
        cmp     r12, #0
        sublt   r12, lr, #2, 18
        strh    r12, [r2], #2
        subs    r3, r3, #1
        bne     LATA1
LATA2:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LATA3:
        cmp     r12, #0
        bne     LATA7
        cmp     r3, #5
        blt     LATA5
        mvn     r12, r6
        sub     r8, r3, #5
        sub     r7, lr, #2, 18
        mov     r6, r1
        mov     r5, r0
        mov     r4, r2
LATA4:
        ldrsh   r9, [r5]
        ldrsh   r10, [r6]
        add     lr, lr, #4
        sub     r10, r10, r9
        mov     r9, r12
        cmp     r10, r12
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4]
        ldrsh   r10, [r6, #2]
        ldrsh   r9, [r5, #2]
        sub     r10, r10, r9
        cmp     r10, r12
        mov     r9, r12
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4, #2]
        ldrsh   r10, [r6, #4]
        ldrsh   r9, [r5, #4]
        sub     r10, r10, r9
        cmp     r10, r12
        mov     r9, r12
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4, #4]
        ldrsh   r10, [r6, #6]
        ldrsh   r9, [r5, #6]
        add     r6, r6, #8
        add     r5, r5, #8
        sub     r10, r10, r9
        cmp     r10, r12
        mov     r9, r12
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4, #6]
        cmp     lr, r8
        add     r4, r4, #8
        ble     LATA4
LATA5:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mov     r4, #0
        sub     r4, r4, #2, 18
        mvn     r12, r12
        add     r1, r1, lr, lsl #1
        add     r0, r0, lr, lsl #1
        add     r2, r2, lr, lsl #1
LATA6:
        ldrsh   r6, [r0], #2
        ldrsh   r5, [r1], #2
        add     lr, lr, #1
        sub     r6, r5, r6
        cmp     r6, r12
        mov     r5, r12
        movlt   r5, r6
        cmp     r5, r4
        mov     r6, r4
        movgt   r6, r5
        strh    r6, [r2], #2
        cmp     lr, r3
        blt     LATA6
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LATA7:
        cmp     r12, #0
        ble     LATA11
        sub     r5, r12, #1
        mov     r4, #1
        mov     r5, r4, lsl r5
        cmp     r3, #4
        sub     r5, r5, #1
        blt     LATA9
        mvn     r4, r6
        sub     r9, r3, #4
        mov     r8, r1
        mov     r7, r0
        mov     r6, r2
LATA8:
        ldrsh   r11, [r8]
        ldrsh   r10, [r7]
        add     lr, lr, #3
        sub     r10, r11, r10
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r5, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        cmp     r10, r4
        mov     r11, r4
        movlt   r11, r10
        strh    r11, [r6]
        ldrsh   r10, [r7, #2]
        ldrsh   r11, [r8, #2]
        sub     r10, r11, r10
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r5, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        cmp     r10, r4
        mov     r11, r4
        movlt   r11, r10
        strh    r11, [r6, #2]
        ldrsh   r10, [r7, #4]
        ldrsh   r11, [r8, #4]
        add     r8, r8, #6
        add     r7, r7, #6
        sub     r10, r11, r10
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r5, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        cmp     r10, r4
        mov     r11, r4
        movlt   r11, r10
        strh    r11, [r6, #4]
        cmp     lr, r9
        add     r6, r6, #6
        ble     LATA8
LATA9:
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        mvn     r4, r4
        add     r1, r1, lr, lsl #1
        add     r0, r0, lr, lsl #1
        add     r2, r2, lr, lsl #1
LATA10:
        ldrsh   r6, [r1], #2
        ldrsh   r7, [r0], #2
        add     lr, lr, #1
        sub     r6, r6, r7
        mov     r7, r6, asr r12
        and     r7, r7, #1
        add     r6, r5, r6
        add     r7, r6, r7
        mov     r6, r7, asr r12
        cmp     r6, r4
        mov     r7, r4
        movlt   r7, r6
        strh    r7, [r2], #2
        cmp     lr, r3
        blt     LATA10
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LATA11:
        cmp     r3, #5
        rsb     r4, r12, #0
        blt     LATA13
        mvn     r12, r6
        sub     r9, r3, #5
        sub     r8, lr, #2, 18
        mov     r7, r1
        mov     r6, r0
        mov     r5, r2
LATA12:
        ldrsh   r11, [r7]
        ldrsh   r10, [r6]
        add     lr, lr, #4
        sub     r11, r11, r10
        mov     r11, r11, lsl r4
        cmp     r11, r12
        mov     r10, r12
        movlt   r10, r11
        mov     r11, r8
        cmp     r10, r8
        movgt   r11, r10
        strh    r11, [r5]
        ldrsh   r11, [r7, #2]
        ldrsh   r10, [r6, #2]
        sub     r11, r11, r10
        mov     r11, r11, lsl r4
        cmp     r11, r12
        mov     r10, r12
        movlt   r10, r11
        cmp     r10, r8
        mov     r11, r8
        movgt   r11, r10
        strh    r11, [r5, #2]
        ldrsh   r11, [r7, #4]
        ldrsh   r10, [r6, #4]
        sub     r11, r11, r10
        mov     r11, r11, lsl r4
        cmp     r11, r12
        mov     r10, r12
        movlt   r10, r11
        cmp     r10, r8
        mov     r11, r8
        movgt   r11, r10
        strh    r11, [r5, #4]
        ldrsh   r11, [r7, #6]
        ldrsh   r10, [r6, #6]
        add     r7, r7, #8
        add     r6, r6, #8
        sub     r11, r11, r10
        mov     r11, r11, lsl r4
        cmp     r11, r12
        mov     r10, r12
        movlt   r10, r11
        cmp     r10, r8
        mov     r11, r8
        movgt   r11, r10
        strh    r11, [r5, #6]
        cmp     lr, r9
        add     r5, r5, #8
        ble     LATA12
LATA13:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mov     r5, #0
        sub     r5, r5, #2, 18
        mvn     r12, r12
        add     r1, r1, lr, lsl #1
        add     r0, r0, lr, lsl #1
        add     r2, r2, lr, lsl #1
LATA14:
        ldrsh   r6, [r1], #2
        ldrsh   r7, [r0], #2
        add     lr, lr, #1
        sub     r6, r6, r7
        mov     r7, r6, lsl r4
        cmp     r7, r12
        mov     r6, r12
        movlt   r6, r7
        cmp     r6, r5
        mov     r7, r5
        movgt   r7, r6
        strh    r7, [r2], #2
        cmp     lr, r3
        blt     LATA14
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LATA15:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


