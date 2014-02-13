        .text
        .align  4
        .globl  _ippsWinBartlett_16s


_ippsWinBartlett_16s:
        stmdb   sp!, {r4 - r11, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r4, r1
        mov     r5, r2
        beq     LANE4
        cmp     r4, #0
        beq     LANE4
        cmp     r5, #3
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r11, pc}
        sub     r10, r5, #1
        mov     r0, r10
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, #0
        mov     r1, #1, 2
        bl      __divdf3
        add     r3, r6, r5, lsl #1
        add     r11, r4, r5, lsl #1
        cmp     r5, #3
        sub     r8, r3, #4
        add     r9, r6, #2
        sub     r12, r11, #2
        mov     r7, #0
        beq     LANE5
        mov     r3, #0x1E, 12
        orr     r3, r3, #1, 2
        mov     r2, #0
        sub     r6, r12, #2
        bl      __muldf3
        bl      __fixdfsi
        cmp     r10, #0
        mov     r12, r7
        mov     r3, #1
        movlt   r12, r3
        add     r12, r5, r12
        strh    r7, [r11, #-2]
        sub     r2, r12, #1
        strh    r7, [r4], #2
        mov     r2, r2, asr #1
        cmp     r2, #1
        ble     LANE2
        sub     r1, r2, #1
        cmp     r1, #4
        blt     LANE1
        sub     r5, r2, #4
LANE0:
        ldrsh   r12, [r9]
        add     r7, r0, r7
        add     r1, r7, #2, 18
        add     lr, r0, r7
        add     r3, r3, #3
        mov     r1, r1, asr #16
        mul     r7, r12, r1
        cmp     r3, r5
        sub     r12, r8, #2
        sub     r12, r12, #2
        add     r11, lr, #2, 18
        add     r7, r7, #1, 18
        mov     r7, r7, asr #15
        strh    r7, [r4]
        ldrsh   r7, [r8]
        mul     r7, r7, r1
        sub     r1, r6, #2
        sub     r1, r1, #2
        add     r7, r7, #1, 18
        mov     r7, r7, asr #15
        strh    r7, [r6]
        ldrsh   r10, [r9, #2]
        add     r7, r0, lr
        mov     lr, r11, asr #16
        mul     r10, r10, lr
        add     r11, r7, #2, 18
        mov     r11, r11, asr #16
        add     r10, r10, #1, 18
        mov     r10, r10, asr #15
        strh    r10, [r4, #2]
        ldrsh   r10, [r8, #-2]
        mul     lr, r10, lr
        add     lr, lr, #1, 18
        mov     lr, lr, asr #15
        strh    lr, [r6, #-2]
        ldrsh   lr, [r9, #4]
        add     r9, r9, #6
        mul     lr, lr, r11
        add     lr, lr, #1, 18
        mov     lr, lr, asr #15
        strh    lr, [r4, #4]
        ldrsh   r8, [r8, #-4]
        add     r4, r4, #6
        mul     r11, r8, r11
        sub     r8, r12, #2
        add     r11, r11, #1, 18
        mov     r12, r11, asr #15
        strh    r12, [r6, #-4]
        sub     r6, r1, #2
        ble     LANE0
LANE1:
        ldrsh   r12, [r9], #2
        add     r7, r0, r7
        add     r1, r7, #2, 18
        add     r3, r3, #1
        mov     r1, r1, asr #16
        mul     r12, r12, r1
        cmp     r3, r2
        add     r12, r12, #1, 18
        mov     r12, r12, asr #15
        strh    r12, [r4], #2
        ldrsh   r12, [r8], #-2
        mul     r1, r12, r1
        add     r1, r1, #1, 18
        mov     r1, r1, asr #15
        strh    r1, [r6], #-2
        blt     LANE1
LANE2:
        cmp     r4, r6
        beq     LANE3
        ldrsh   r9, [r9]
        add     r7, r0, r7
        add     r0, r7, #2, 18
        mov     r0, r0, asr #16
        mul     r9, r9, r0
        add     r9, r9, #1, 18
        mov     r9, r9, asr #15
        strh    r9, [r4]
        ldrsh   r8, [r8]
        mul     r0, r8, r0
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
        strh    r0, [r6]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LANE3:
        ldrsh   r9, [r9]
        strh    r9, [r4]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LANE4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
LANE5:
        strh    r7, [r4]
        ldrsh   r6, [r6, #2]
        mov     r0, #0
        strh    r6, [r4, #2]
        strh    r7, [r11, #-2]
        ldmia   sp!, {r4 - r11, pc}


