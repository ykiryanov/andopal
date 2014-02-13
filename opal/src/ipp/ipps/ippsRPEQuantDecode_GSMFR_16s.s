        .text
        .align  4
        .globl  _ippsRPEQuantDecode_GSMFR_16s


_ippsRPEQuantDecode_GSMFR_16s:
        stmdb   sp!, {r4, lr}
        mov     r4, r0
        cmp     r4, #0
        beq     LDTF1
        cmp     r3, #0
        beq     LDTF1
        cmp     r2, #0
        mvnlt   r0, #0xC
        ldmltia sp!, {r4, pc}
        cmp     r2, #0
        moveq   lr, #0
        beq     LDTF0
        sub     lr, r2, #1
        mov     r12, #1
        mov     lr, r12, lsl lr
LDTF0:
        mov     r12, lr, lsl #16
        ldrsh   lr, [r4]
        mov     r0, #0
        mov     lr, lr, lsl #1
        sub     lr, lr, #7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     lr, r1, lr
        add     lr, lr, #4
        mov     lr, lr, asr #3
        add     lr, lr, r12, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mov     lr, lr, asr r2
        strh    lr, [r3]
        ldrsh   lr, [r4, #2]
        mov     lr, lr, lsl #1
        sub     lr, lr, #7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     lr, r1, lr
        add     lr, lr, #4
        mov     lr, lr, asr #3
        add     lr, lr, r12, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mov     lr, lr, asr r2
        strh    lr, [r3, #2]
        ldrsh   lr, [r4, #4]
        mov     lr, lr, lsl #1
        sub     lr, lr, #7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     lr, r1, lr
        add     lr, lr, #4
        mov     lr, lr, asr #3
        add     lr, lr, r12, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mov     lr, lr, asr r2
        strh    lr, [r3, #4]
        ldrsh   lr, [r4, #6]
        mov     lr, lr, lsl #1
        sub     lr, lr, #7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     lr, r1, lr
        add     lr, lr, #4
        mov     lr, lr, asr #3
        add     lr, lr, r12, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mov     lr, lr, asr r2
        strh    lr, [r3, #6]
        ldrsh   lr, [r4, #8]
        mov     lr, lr, lsl #1
        sub     lr, lr, #7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     lr, r1, lr
        add     lr, lr, #4
        mov     lr, lr, asr #3
        add     lr, lr, r12, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mov     lr, lr, asr r2
        strh    lr, [r3, #8]
        ldrsh   lr, [r4, #0xA]
        mov     lr, lr, lsl #1
        sub     lr, lr, #7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     lr, r1, lr
        add     lr, lr, #4
        mov     lr, lr, asr #3
        add     lr, lr, r12, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mov     lr, lr, asr r2
        strh    lr, [r3, #0xA]
        ldrsh   lr, [r4, #0xC]
        mov     lr, lr, lsl #1
        sub     lr, lr, #7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     lr, r1, lr
        add     lr, lr, #4
        mov     lr, lr, asr #3
        add     lr, lr, r12, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mov     lr, lr, asr r2
        strh    lr, [r3, #0xC]
        ldrsh   lr, [r4, #0xE]
        mov     lr, lr, lsl #1
        sub     lr, lr, #7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     lr, r1, lr
        add     lr, lr, #4
        mov     lr, lr, asr #3
        add     lr, lr, r12, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mov     lr, lr, asr r2
        strh    lr, [r3, #0xE]
        ldrsh   lr, [r4, #0x10]
        mov     lr, lr, lsl #1
        sub     lr, lr, #7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     lr, r1, lr
        add     lr, lr, #4
        mov     lr, lr, asr #3
        add     lr, lr, r12, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mov     lr, lr, asr r2
        strh    lr, [r3, #0x10]
        ldrsh   lr, [r4, #0x12]
        mov     lr, lr, lsl #1
        sub     lr, lr, #7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     lr, r1, lr
        add     lr, lr, #4
        mov     lr, lr, asr #3
        add     lr, lr, r12, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mov     lr, lr, asr r2
        strh    lr, [r3, #0x12]
        ldrsh   lr, [r4, #0x14]
        mov     lr, lr, lsl #1
        sub     lr, lr, #7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     lr, r1, lr
        add     lr, lr, #4
        mov     lr, lr, asr #3
        add     lr, lr, r12, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mov     lr, lr, asr r2
        strh    lr, [r3, #0x14]
        ldrsh   lr, [r4, #0x16]
        mov     lr, lr, lsl #1
        sub     lr, lr, #7
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     lr, r1, lr
        add     lr, lr, #4
        mov     lr, lr, asr #3
        add     lr, lr, r12, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mov     lr, lr, asr r2
        strh    lr, [r3, #0x16]
        ldrsh   r4, [r4, #0x18]
        mov     r4, r4, lsl #1
        sub     r4, r4, #7
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
        mul     r4, r1, r4
        add     r1, r4, #4
        mov     r1, r1, asr #3
        add     r12, r1, r12, asr #16
        mov     r1, r12, lsl #16
        mov     r1, r1, asr #16
        mov     r2, r1, asr r2
        strh    r2, [r3, #0x18]
        ldmia   sp!, {r4, pc}
LDTF1:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}


