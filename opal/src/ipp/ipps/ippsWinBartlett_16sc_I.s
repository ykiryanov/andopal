        .text
        .align  4
        .globl  _ippsWinBartlett_16sc_I


_ippsWinBartlett_16sc_I:
        stmdb   sp!, {r4 - r9, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r9, r1
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        cmp     r9, #3
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r9, pc}
        sub     r8, r9, #1
        mov     r0, r8
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, #1, 2
        bl      __divdf3
        add     r7, r6, r9, lsl #2
        cmp     r9, #3
        sub     r5, r7, #4
        mov     r4, #0
        beq     LANB3
        mov     r2, #0x1E, 12
        orr     r3, r2, #1, 2
        mov     r2, #0
        bl      __muldf3
        bl      __fixdfsi
        cmp     r8, #0
        mov     r2, r4
        mov     r3, #1
        movlt   r2, r3
        add     r2, r9, r2
        sub     r1, r2, #1
        strh    r4, [r6, #2]
        strh    r4, [r6], #4
        mov     r1, r1, asr #1
        cmp     r1, #1
        strh    r4, [r7, #-2]
        strh    r4, [r7, #-4]
        sub     r5, r5, #4
        ble     LANB1
        sub     r2, r1, #1
LANB0:
        ldrsh   r12, [r6]
        ldrsh   r3, [r6, #2]
        add     r4, r0, r4
        add     r1, r4, #2, 18
        subs    r2, r2, #1
        mov     r1, r1, asr #16
        mul     r3, r1, r3
        mul     r12, r1, r12
        add     r3, r3, #1, 18
        mov     r3, r3, asr #15
        strh    r3, [r6, #2]
        add     r12, r12, #1, 18
        mov     r12, r12, asr #15
        strh    r12, [r6], #4
        ldrsh   r3, [r5]
        ldrsh   r12, [r5, #2]
        mul     r3, r1, r3
        mul     r1, r1, r12
        add     r3, r3, #1, 18
        mov     r3, r3, asr #15
        strh    r3, [r5]
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        strh    r1, [r5, #2]
        sub     r5, r5, #4
        bne     LANB0
LANB1:
        cmp     r6, r5
        beq     LANB2
        ldrsh   r2, [r6]
        ldrsh   r1, [r6, #2]
        add     r4, r0, r4
        add     r0, r4, #2, 18
        mov     r0, r0, asr #16
        mul     r1, r1, r0
        mul     r2, r2, r0
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        strh    r1, [r6, #2]
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        strh    r2, [r6]
        ldrsh   r1, [r5]
        ldrsh   r2, [r5, #2]
        mul     r1, r1, r0
        mul     r0, r2, r0
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        strh    r1, [r5]
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r5, #2]
LANB2:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LANB3:
        strh    r4, [r6, #2]
        strh    r4, [r6]
        mov     r0, #0
        strh    r4, [r7, #-2]
        strh    r4, [r7, #-4]
        ldmia   sp!, {r4 - r9, pc}


