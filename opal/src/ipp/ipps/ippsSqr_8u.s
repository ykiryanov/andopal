        .text
        .align  4
        .globl  ownippsSqr_8u


ownippsSqr_8u:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r3, #0
        mov     r6, #0
        mov     r7, #0xFF
        bne     LAWF3
        subs    lr, r2, #4
        bmi     LAWF1
        mov     r3, r0
        sub     r12, r1, #1
LAWF0:
        ldrb    r4, [r3]
        ldrb    r7, [r3, #1]
        ldrb    r8, [r3, #2]
        ldrb    r5, [r3, #3]
        cmp     r4, #0xF
        mulle   r4, r4, r4
        movgt   r4, #0xFF
        cmp     r7, #0xF
        mulle   r7, r7, r7
        movgt   r7, #0xFF
        cmp     r8, #0xF
        mulle   r8, r8, r8
        movgt   r8, #0xFF
        cmp     r5, #0xF
        mulle   r5, r5, r5
        movgt   r5, #0xFF
        add     r6, r6, #4
        strb    r4, [r12, #1]
        strb    r7, [r12, #2]
        strb    r8, [r12, #3]
        strb    r5, [r12, #4]!
        cmp     r6, lr
        add     r3, r3, #4
        ble     LAWF0
LAWF1:
        and     r3, r2, #3
        sub     r3, r2, r3
        cmp     r3, r2
        bge     LAWF25
        add     r0, r3, r0
        add     r1, r3, r1
LAWF2:
        ldrb    r12, [r0], #1
        cmp     r12, #0xF
        mulle   r12, r12, r12
        movgt   r12, #0xFF
        add     r3, r3, #1
        strb    r12, [r1], #1
        cmp     r3, r2
        blt     LAWF2
        ldmia   sp!, {r4 - r11, pc}
LAWF3:
        cmp     r3, #0
        ble     LAWF26
        cmp     r3, #3
        bgt     LAWF9
        subs    r9, r2, #4
        bmi     LAWF5
        sub     r8, r0, #1
        sub     r5, r1, #1
LAWF4:
        ldrb    r12, [r8, #1]
        ldrb    lr, [r8, #2]
        ldrb    r4, [r8, #3]
        mul     r12, r12, r12
        ldrb    r10, [r8, #4]!
        mul     lr, lr, lr
        mul     r4, r4, r4
        mul     r10, r10, r10
        mov     r12, r12, asr r3
        cmp     r12, #0xFF
        movgt   r12, r7
        mov     lr, lr, asr r3
        cmp     lr, #0xFF
        movgt   lr, r7
        mov     r4, r4, asr r3
        cmp     r4, #0xFF
        movgt   r4, r7
        mov     r10, r10, asr r3
        cmp     r10, #0xFF
        movgt   r10, r7
        add     r6, r6, #4
        strb    r12, [r5, #1]
        strb    lr, [r5, #2]
        strb    r4, [r5, #3]
        strb    r10, [r5, #4]!
        cmp     r6, r9
        ble     LAWF4
LAWF5:
        and     r12, r2, #3
        sub     lr, r2, r12
        cmp     lr, r2
        bge     LAWF25
        sub     r12, r2, lr
        cmp     r12, #5
        blt     LAWF7
        sub     r12, lr, #1
        add     r4, r12, r0
        sub     r5, r2, #5
        add     r12, r12, r1
LAWF6:
        ldrb    r6, [r4, #1]
        add     lr, lr, #4
        mul     r6, r6, r6
        mov     r6, r6, asr r3
        cmp     r6, #0xFF
        movgt   r6, r7
        strb    r6, [r12, #1]
        ldrb    r6, [r4, #2]
        mul     r6, r6, r6
        mov     r6, r6, asr r3
        cmp     r6, #0xFF
        movgt   r6, r7
        strb    r6, [r12, #2]
        ldrb    r6, [r4, #3]
        mul     r6, r6, r6
        mov     r6, r6, asr r3
        cmp     r6, #0xFF
        movgt   r6, r7
        strb    r6, [r12, #3]
        ldrb    r6, [r4, #4]!
        mul     r6, r6, r6
        mov     r6, r6, asr r3
        cmp     r6, #0xFF
        movgt   r6, r7
        strb    r6, [r12, #4]!
        cmp     lr, r5
        ble     LAWF6
LAWF7:
        add     r0, lr, r0
        add     r1, lr, r1
LAWF8:
        ldrb    r12, [r0], #1
        add     lr, lr, #1
        mul     r12, r12, r12
        mov     r12, r12, asr r3
        cmp     r12, #0xFF
        movgt   r12, r7
        strb    r12, [r1], #1
        cmp     lr, r2
        blt     LAWF8
        ldmia   sp!, {r4 - r11, pc}
LAWF9:
        cmp     r3, #8
        mov     r12, #1
        bge     LAWF15
        sub     lr, r3, #1
        and     r4, r3, #1
        subs    r10, r2, #4
        rsb     r5, r4, r12, lsl lr
        bmi     LAWF11
        sub     r9, r0, #1
        sub     r8, r1, #1
LAWF10:
        ldrb    r12, [r9, #1]
        ldrb    lr, [r9, #2]
        ldrb    r4, [r9, #3]
        mla     r12, r12, r12, r5
        ldrb    r11, [r9, #4]!
        mla     lr, lr, lr, r5
        mla     r4, r4, r4, r5
        mla     r11, r11, r11, r5
        mov     r12, r12, asr r3
        cmp     r12, #0xFF
        movgt   r12, r7
        mov     lr, lr, asr r3
        cmp     lr, #0xFF
        movgt   lr, r7
        mov     r4, r4, asr r3
        cmp     r4, #0xFF
        movgt   r4, r7
        mov     r11, r11, asr r3
        cmp     r11, #0xFF
        movgt   r11, r7
        add     r6, r6, #4
        strb    r12, [r8, #1]
        strb    lr, [r8, #2]
        strb    r4, [r8, #3]
        strb    r11, [r8, #4]!
        cmp     r6, r10
        ble     LAWF10
LAWF11:
        and     r12, r2, #3
        sub     lr, r2, r12
        cmp     lr, r2
        bge     LAWF25
        sub     r12, r2, lr
        cmp     r12, #5
        blt     LAWF13
        sub     r12, lr, #1
        add     r4, r12, r0
        sub     r6, r2, #5
        add     r12, r12, r1
LAWF12:
        ldrb    r8, [r4, #1]
        add     lr, lr, #4
        mla     r8, r8, r8, r5
        mov     r8, r8, asr r3
        cmp     r8, #0xFF
        movgt   r8, r7
        strb    r8, [r12, #1]
        ldrb    r8, [r4, #2]
        mla     r8, r8, r8, r5
        mov     r8, r8, asr r3
        cmp     r8, #0xFF
        movgt   r8, r7
        strb    r8, [r12, #2]
        ldrb    r8, [r4, #3]
        mla     r8, r8, r8, r5
        mov     r8, r8, asr r3
        cmp     r8, #0xFF
        movgt   r8, r7
        strb    r8, [r12, #3]
        ldrb    r8, [r4, #4]!
        mla     r8, r8, r8, r5
        mov     r8, r8, asr r3
        cmp     r8, #0xFF
        movgt   r8, r7
        strb    r8, [r12, #4]!
        cmp     lr, r6
        ble     LAWF12
LAWF13:
        add     r0, lr, r0
        add     r1, lr, r1
LAWF14:
        ldrb    r12, [r0], #1
        add     lr, lr, #1
        mla     r12, r12, r12, r5
        mov     r12, r12, asr r3
        cmp     r12, #0xFF
        movgt   r12, r7
        strb    r12, [r1], #1
        cmp     lr, r2
        blt     LAWF14
        ldmia   sp!, {r4 - r11, pc}
LAWF15:
        cmp     r3, #0x10
        bgt     LAWF21
        sub     lr, r3, #1
        and     r4, r3, #1
        subs    r10, r2, #4
        rsb     r7, r4, r12, lsl lr
        bmi     LAWF17
        sub     r9, r0, #1
        sub     r8, r1, #1
LAWF16:
        ldrb    r12, [r9, #1]
        ldrb    r4, [r9, #2]
        ldrb    r5, [r9, #3]
        ldrb    lr, [r9, #4]!
        mla     r12, r12, r12, r7
        mla     r4, r4, r4, r7
        mla     r5, r5, r5, r7
        mla     lr, lr, lr, r7
        mov     r12, r12, asr r3
        add     r6, r6, #4
        mov     r4, r4, asr r3
        mov     r5, r5, asr r3
        mov     lr, lr, asr r3
        strb    r12, [r8, #1]
        strb    r4, [r8, #2]
        strb    r5, [r8, #3]
        strb    lr, [r8, #4]!
        cmp     r6, r10
        ble     LAWF16
LAWF17:
        and     r12, r2, #3
        sub     lr, r2, r12
        cmp     lr, r2
        bge     LAWF25
        sub     r12, r2, lr
        cmp     r12, #5
        blt     LAWF19
        sub     r12, lr, #1
        add     r4, r12, r0
        sub     r5, r2, #5
        add     r12, r12, r1
LAWF18:
        ldrb    r6, [r4, #1]
        add     lr, lr, #4
        cmp     lr, r5
        mla     r6, r6, r6, r7
        mov     r6, r6, asr r3
        strb    r6, [r12, #1]
        ldrb    r6, [r4, #2]
        mla     r6, r6, r6, r7
        mov     r6, r6, asr r3
        strb    r6, [r12, #2]
        ldrb    r6, [r4, #3]
        mla     r6, r6, r6, r7
        mov     r6, r6, asr r3
        strb    r6, [r12, #3]
        ldrb    r6, [r4, #4]!
        mla     r6, r6, r6, r7
        mov     r6, r6, asr r3
        strb    r6, [r12, #4]!
        ble     LAWF18
LAWF19:
        add     r0, lr, r0
        add     r1, lr, r1
LAWF20:
        ldrb    r12, [r0], #1
        add     lr, lr, #1
        mla     r12, r12, r12, r7
        cmp     lr, r2
        mov     r12, r12, asr r3
        strb    r12, [r1], #1
        blt     LAWF20
        ldmia   sp!, {r4 - r11, pc}
LAWF21:
        cmp     r2, #0
        ble     LAWF25
        cmp     r2, #6
        movlt   r0, r6
        blt     LAWF23
        mov     r0, r6
        sub     lr, r2, #6
        mov     r12, r0
        sub     r3, r1, #1
LAWF22:
        add     r0, r0, #5
        strb    r12, [r3, #1]
        strb    r12, [r3, #2]
        strb    r12, [r3, #3]
        strb    r12, [r3, #4]
        strb    r12, [r3, #5]!
        cmp     r0, lr
        ble     LAWF22
LAWF23:
        add     r1, r0, r1
LAWF24:
        add     r0, r0, #1
        strb    r6, [r1], #1
        cmp     r0, r2
        blt     LAWF24
LAWF25:
        ldmia   sp!, {r4 - r11, pc}
LAWF26:
        cmn     r3, #8
        ble     LAWF32
        subs    r9, r2, #4
        rsb     r3, r3, #0
        bmi     LAWF28
        sub     r8, r0, #1
        sub     r5, r1, #1
LAWF27:
        ldrb    r12, [r8, #1]
        ldrb    lr, [r8, #2]
        ldrb    r4, [r8, #3]
        mul     r12, r12, r12
        ldrb    r10, [r8, #4]!
        mul     lr, lr, lr
        mul     r4, r4, r4
        mul     r10, r10, r10
        mov     r12, r12, lsl r3
        cmp     r12, #0xFF
        movgt   r12, r7
        mov     lr, lr, lsl r3
        cmp     lr, #0xFF
        movgt   lr, r7
        mov     r4, r4, lsl r3
        cmp     r4, #0xFF
        movgt   r4, r7
        mov     r10, r10, lsl r3
        cmp     r10, #0xFF
        movgt   r10, r7
        add     r6, r6, #4
        strb    r12, [r5, #1]
        strb    lr, [r5, #2]
        strb    r4, [r5, #3]
        strb    r10, [r5, #4]!
        cmp     r6, r9
        ble     LAWF27
LAWF28:
        and     r12, r2, #3
        sub     lr, r2, r12
        cmp     lr, r2
        bge     LAWF25
        sub     r12, r2, lr
        cmp     r12, #5
        blt     LAWF30
        sub     r12, lr, #1
        add     r4, r12, r0
        sub     r5, r2, #5
        add     r12, r12, r1
LAWF29:
        ldrb    r6, [r4, #1]
        add     lr, lr, #4
        mul     r6, r6, r6
        mov     r6, r6, lsl r3
        cmp     r6, #0xFF
        movgt   r6, r7
        strb    r6, [r12, #1]
        ldrb    r6, [r4, #2]
        mul     r6, r6, r6
        mov     r6, r6, lsl r3
        cmp     r6, #0xFF
        movgt   r6, r7
        strb    r6, [r12, #2]
        ldrb    r6, [r4, #3]
        mul     r6, r6, r6
        mov     r6, r6, lsl r3
        cmp     r6, #0xFF
        movgt   r6, r7
        strb    r6, [r12, #3]
        ldrb    r6, [r4, #4]!
        mul     r6, r6, r6
        mov     r6, r6, lsl r3
        cmp     r6, #0xFF
        movgt   r6, r7
        strb    r6, [r12, #4]!
        cmp     lr, r5
        ble     LAWF29
LAWF30:
        add     r0, lr, r0
        add     r1, lr, r1
LAWF31:
        ldrb    r12, [r0], #1
        add     lr, lr, #1
        mul     r12, r12, r12
        mov     r12, r12, lsl r3
        cmp     r12, #0xFF
        movgt   r12, r7
        strb    r12, [r1], #1
        cmp     lr, r2
        blt     LAWF31
        ldmia   sp!, {r4 - r11, pc}
LAWF32:
        cmp     r2, #0
        ble     LAWF25
        mov     r3, r6
LAWF33:
        ldrb    r12, [r0], #1
        cmp     r12, #0
        moveq   r12, r6
        movne   r12, #0xFF
        add     r3, r3, #1
        strb    r12, [r1], #1
        cmp     r3, r2
        blt     LAWF33
        ldmia   sp!, {r4 - r11, pc}


