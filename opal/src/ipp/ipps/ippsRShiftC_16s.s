        .text
        .align  4
        .globl  _ippsRShiftC_16s


_ippsRShiftC_16s:
        stmdb   sp!, {r4 - r7, lr}
        mov     r4, r1
        mov     r1, r2
        cmp     r4, #0
        mov     r2, r3
        ldmeqia sp!, {r4 - r7, lr}
        beq     _ippsCopy_16s
        cmp     r0, #0
        beq     LAYH5
        cmp     r1, #0
        beq     LAYH5
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r4, #0
        mvnlt   r0, #0x1F
        ldmltia sp!, {r4 - r7, pc}
        cmp     r4, #0xF
        mov     r6, #0
        bgt     LAYH3
        cmp     r2, #6
        blt     LAYH1
        sub     r5, r2, #6
        mov     lr, r0
        mov     r12, r1
LAYH0:
        ldrsh   r7, [lr]
        add     r6, r6, #5
        cmp     r6, r5
        mov     r7, r7, asr r4
        strh    r7, [r12]
        ldrsh   r7, [lr, #2]
        mov     r7, r7, asr r4
        strh    r7, [r12, #2]
        ldrsh   r7, [lr, #4]
        mov     r7, r7, asr r4
        strh    r7, [r12, #4]
        ldrsh   r7, [lr, #6]
        mov     r7, r7, asr r4
        strh    r7, [r12, #6]
        ldrsh   r7, [lr, #8]
        add     lr, lr, #0xA
        mov     r7, r7, asr r4
        strh    r7, [r12, #8]
        add     r12, r12, #0xA
        ble     LAYH0
LAYH1:
        add     r0, r0, r6, lsl #1
        add     r1, r1, r6, lsl #1
LAYH2:
        ldrsh   r12, [r0], #2
        add     r6, r6, #1
        mov     r12, r12, asr r4
        strh    r12, [r1], #2
        cmp     r6, r2
        blt     LAYH2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LAYH3:
        mov     r12, #0xFF
        orr     r12, r12, #0xFF, 24
        mov     lr, r6
LAYH4:
        ldrsh   r4, [r0], #2
        cmp     r4, #0
        movlt   r4, r12
        movge   r4, r6
        add     lr, lr, #1
        strh    r4, [r1], #2
        cmp     lr, r2
        blt     LAYH4
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LAYH5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


