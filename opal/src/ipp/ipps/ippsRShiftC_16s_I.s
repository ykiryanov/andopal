        .text
        .align  4
        .globl  _ippsRShiftC_16s_I


_ippsRShiftC_16s_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r0, #0
        mvnlt   r0, #0x1F
        ldmltia sp!, {r4 - r8, pc}
        cmp     r0, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r0, #0xF
        mov     lr, #0
        bgt     LAYG3
        cmp     r2, #6
        blt     LAYG1
        sub     r12, r2, #6
        mov     r3, r1
LAYG0:
        ldrsh   r8, [r3]
        ldrsh   r7, [r3, #2]
        ldrsh   r6, [r3, #4]
        ldrsh   r5, [r3, #6]
        ldrsh   r4, [r3, #8]
        mov     r8, r8, asr r0
        mov     r7, r7, asr r0
        mov     r6, r6, asr r0
        mov     r5, r5, asr r0
        mov     r4, r4, asr r0
        add     lr, lr, #5
        strh    r8, [r3]
        strh    r7, [r3, #2]
        strh    r6, [r3, #4]
        strh    r5, [r3, #6]
        strh    r4, [r3, #8]
        cmp     lr, r12
        add     r3, r3, #0xA
        ble     LAYG0
LAYG1:
        add     r1, r1, lr, lsl #1
LAYG2:
        ldrsh   r3, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        mov     r3, r3, asr r0
        strh    r3, [r1], #2
        blt     LAYG2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LAYG3:
        mov     r0, #0xFF
        orr     r0, r0, #0xFF, 24
        mov     r3, lr
LAYG4:
        ldrsh   r12, [r1]
        cmp     r12, #0
        movlt   r12, r0
        movge   r12, lr
        add     r3, r3, #1
        strh    r12, [r1], #2
        cmp     r3, r2
        blt     LAYG4
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}


