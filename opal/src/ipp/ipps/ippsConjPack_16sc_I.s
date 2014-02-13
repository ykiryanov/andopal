        .text
        .align  4
        .globl  _ippsConjPack_16sc_I


_ippsConjPack_16sc_I:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        tst     r1, #1
        mov     r2, r1, asr #1
        mov     r12, #0
        sub     r3, r0, #2
        add     r1, r2, #1
        bne     LCUO0
        sub     r2, r2, #1
        add     r4, r3, #4
        mov     lr, r2, lsl #2
        ldrsh   r4, [r4, +lr]
        add     r6, r0, #4
        add     r5, lr, r6
        strh    r4, [r6, +lr]
        strh    r12, [r5, #2]
LCUO0:
        cmp     r2, #0
        ble     LCUO2
        mov     lr, r2, lsl #2
        mov     r1, r1, lsl #2
        add     r4, r1, #2
        add     lr, lr, #2
        mov     r1, #0xFF
        add     r3, lr, r3
        orr     r1, r1, #0x7F, 24
        add     lr, lr, r0
        add     r4, r4, r0
LCUO1:
        ldrsh   r5, [r3]
        cmn     r5, #2, 18
        moveq   r5, r1
        rsbne   r5, r5, #0
        strh    r5, [r4]
        ldrsh   r5, [r3, #-2]
        sub     r2, r2, #1
        cmp     r2, #0
        strh    r5, [r4, #-2]
        ldrsh   r5, [r3]
        add     r4, r4, #4
        strh    r5, [lr]
        ldrsh   r5, [r3, #-2]
        sub     r3, r3, #4
        strh    r5, [lr, #-2]
        sub     lr, lr, #4
        bgt     LCUO1
LCUO2:
        strh    r12, [r0, #2]
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}


