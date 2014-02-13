        .text
        .align  4
        .globl  _ippsConjPerm_16sc_I


_ippsConjPerm_16sc_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        tst     r1, #1
        mov     lr, r1, asr #1
        mov     r7, #0
        add     r1, lr, #1
        subne   r6, r0, #2
        bne     LCUM0
        ldrsh   r3, [r0, #2]
        sub     lr, lr, #1
        mov     r12, #4
        mov     r6, r0
        add     r2, r0, lr, lsl #2
        add     r12, r12, r2
        strh    r3, [r2, #4]
        strh    r7, [r12, #2]
LCUM0:
        cmp     lr, #0
        ble     LCUM2
        mov     r5, lr, lsl #2
        mov     r1, r1, lsl #2
        add     r1, r1, #2
        mov     r12, #0xFF
        add     r3, r5, #2
        add     r2, r5, #6
        orr     r12, r12, #0x7F, 24
        add     r3, r3, r0
        add     r2, r2, r6
        add     r1, r1, r0
        add     r4, r6, lr, lsl #2
LCUM1:
        ldrsh   r8, [r4, #2]
        cmn     r8, #2, 18
        moveq   r8, r12
        rsbne   r8, r8, #0
        strh    r8, [r1]
        ldrsh   r8, [r6, +r5]
        sub     r4, r4, #4
        sub     lr, lr, #1
        strh    r8, [r1, #-2]
        ldrsh   r8, [r2, #-4]!
        add     r1, r1, #4
        strh    r8, [r3]
        ldrsh   r8, [r6, +r5]
        cmp     lr, #0
        sub     r5, r5, #4
        strh    r8, [r3, #-2]
        sub     r3, r3, #4
        bgt     LCUM1
LCUM2:
        strh    r7, [r0, #2]
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}


