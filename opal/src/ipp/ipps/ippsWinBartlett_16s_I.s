        .text
        .align  4
        .globl  _ippsWinBartlett_16s_I


_ippsWinBartlett_16s_I:
        stmdb   sp!, {r4 - r9, lr}
        mov     r4, r0
        cmp     r4, #0
        mov     r7, r1
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        cmp     r7, #3
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r9, pc}
        sub     r8, r7, #1
        mov     r0, r8
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, #1, 2
        bl      __divdf3
        add     r9, r4, r7, lsl #1
        cmp     r7, #3
        sub     r6, r9, #2
        mov     r5, #0
        beq     LAND4
        mov     r2, #0x1E, 12
        orr     r3, r2, #1, 2
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfsi
        cmp     r8, #0
        mov     r3, r5
        mov     r2, #1
        movlt   r3, r2
        add     r3, r7, r3
        strh    r5, [r9, #-2]
        sub     r1, r3, #1
        strh    r5, [r4], #2
        mov     r1, r1, asr #1
        cmp     r1, #1
        sub     r6, r6, #2
        ble     LAND2
        sub     r3, r1, #1
        cmp     r3, #4
        blt     LAND1
        sub     r12, r1, #4
LAND0:
        ldrsh   r3, [r4]
        add     r5, r0, r5
        add     lr, r5, #2, 18
        add     r5, r0, r5
        add     r2, r2, #3
        mov     lr, lr, asr #16
        mul     r7, lr, r3
        cmp     r2, r12
        sub     r3, r6, #2
        sub     r3, r3, #2
        add     r7, r7, #1, 18
        mov     r7, r7, asr #15
        strh    r7, [r4]
        ldrsh   r7, [r6]
        mul     lr, lr, r7
        add     r7, r5, #2, 18
        add     r5, r0, r5
        mov     r7, r7, asr #16
        add     lr, lr, #1, 18
        mov     lr, lr, asr #15
        strh    lr, [r6]
        ldrsh   r8, [r4, #2]
        add     lr, r5, #2, 18
        mul     r8, r7, r8
        mov     lr, lr, asr #16
        add     r8, r8, #1, 18
        mov     r8, r8, asr #15
        strh    r8, [r4, #2]
        ldrsh   r8, [r6, #-2]
        mul     r8, r7, r8
        add     r7, r8, #1, 18
        mov     r7, r7, asr #15
        strh    r7, [r6, #-2]
        ldrsh   r7, [r4, #4]
        mul     r7, lr, r7
        add     r7, r7, #1, 18
        mov     r7, r7, asr #15
        strh    r7, [r4, #4]
        ldrsh   r7, [r6, #-4]
        add     r4, r4, #6
        mul     r7, lr, r7
        add     lr, r7, #1, 18
        mov     lr, lr, asr #15
        strh    lr, [r6, #-4]
        sub     r6, r3, #2
        ble     LAND0
LAND1:
        ldrsh   r12, [r4]
        add     r5, r0, r5
        add     r3, r5, #2, 18
        add     r2, r2, #1
        cmp     r2, r1
        mov     r3, r3, asr #16
        mul     r12, r3, r12
        add     r12, r12, #1, 18
        mov     r12, r12, asr #15
        strh    r12, [r4], #2
        ldrsh   r12, [r6]
        mul     r12, r3, r12
        add     r3, r12, #1, 18
        mov     r3, r3, asr #15
        strh    r3, [r6], #-2
        blt     LAND1
LAND2:
        cmp     r4, r6
        beq     LAND3
        ldrsh   r1, [r4]
        add     r5, r0, r5
        add     r0, r5, #2, 18
        mov     r0, r0, asr #16
        mul     r1, r1, r0
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        strh    r1, [r4]
        ldrsh   r1, [r6]
        mul     r0, r1, r0
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r6]
LAND3:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LAND4:
        strh    r5, [r4]
        mov     r0, #0
        strh    r5, [r9, #-2]
        ldmia   sp!, {r4 - r9, pc}


