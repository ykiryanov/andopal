        .text
        .align  4
        .globl  _ippsWinBartlett_16sc


_ippsWinBartlett_16sc:
        stmdb   sp!, {r4 - r11, lr}
        mov     r11, r0
        cmp     r11, #0
        mov     r5, r1
        mov     r4, r2
        beq     LANC3
        cmp     r5, #0
        beq     LANC3
        cmp     r4, #3
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r11, pc}
        sub     r6, r4, #1
        mov     r0, r6
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, #1, 2
        bl      __divdf3
        add     r3, r11, r4, lsl #2
        add     r8, r5, r4, lsl #2
        cmp     r4, #3
        sub     r7, r3, #8
        add     r10, r11, #4
        sub     r12, r8, #4
        mov     r9, #0
        beq     LANC4
        mov     r3, #0x1E, 12
        orr     r3, r3, #1, 2
        mov     r2, #0
        sub     r11, r12, #4
        bl      __muldf3
        bl      __fixdfsi
        cmp     r6, #0
        mov     r3, r9
        mov     r12, #1
        movlt   r3, r12
        add     r3, r4, r3
        sub     r2, r3, #1
        strh    r9, [r5, #2]
        strh    r9, [r5], #4
        mov     r2, r2, asr #1
        cmp     r2, #1
        strh    r9, [r8, #-2]
        strh    r9, [r8, #-4]
        ble     LANC1
        sub     r1, r2, #1
LANC0:
        ldrsh   r3, [r10]
        add     r9, r0, r9
        add     r2, r9, #2, 18
        subs    r1, r1, #1
        mov     r2, r2, asr #16
        mul     r3, r3, r2
        add     r3, r3, #1, 18
        mov     r3, r3, asr #15
        strh    r3, [r5]
        ldrsh   r3, [r10, #2]
        add     r10, r10, #4
        mul     r3, r3, r2
        add     r3, r3, #1, 18
        mov     r3, r3, asr #15
        strh    r3, [r5, #2]
        ldrsh   r3, [r7]
        add     r5, r5, #4
        mul     r3, r3, r2
        add     r3, r3, #1, 18
        mov     r3, r3, asr #15
        strh    r3, [r11]
        ldrsh   r3, [r7, #2]
        sub     r7, r7, #4
        mul     r2, r3, r2
        add     r2, r2, #1, 18
        mov     r2, r2, asr #15
        strh    r2, [r11, #2]
        sub     r11, r11, #4
        bne     LANC0
LANC1:
        cmp     r5, r11
        beq     LANC2
        ldrsh   r1, [r10]
        add     r9, r0, r9
        add     r0, r9, #2, 18
        mov     r0, r0, asr #16
        mul     r1, r1, r0
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        strh    r1, [r5]
        ldrsh   r10, [r10, #2]
        mul     r1, r10, r0
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        strh    r1, [r5, #2]
        ldrsh   r1, [r7]
        mul     r1, r1, r0
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        strh    r1, [r11]
        ldrsh   r7, [r7, #2]
        mul     r0, r7, r0
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r11, #2]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LANC2:
        ldrsh   r0, [r10]
        strh    r0, [r5]
        ldrsh   r10, [r10, #2]
        strh    r10, [r5, #2]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LANC3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
LANC4:
        strh    r9, [r5, #2]
        strh    r9, [r5]
        ldrsh   r2, [r11, #4]
        mov     r0, #0
        strh    r2, [r5, #4]
        ldrsh   r11, [r11, #6]
        strh    r11, [r5, #6]
        strh    r9, [r8, #-2]
        strh    r9, [r8, #-4]
        ldmia   sp!, {r4 - r11, pc}


