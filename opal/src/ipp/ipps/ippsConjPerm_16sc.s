        .text
        .align  4
        .globl  _ippsConjPerm_16sc


_ippsConjPerm_16sc:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        beq     LCUN4
        cmp     r1, #0
        beq     LCUN4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        tst     r2, #1
        mov     r12, r2, asr #1
        mov     r3, #0
        strh    r3, [r1, #2]
        add     r2, r12, #1
        beq     LCUN0
        sub     r0, r0, #2
        ldrsh   r3, [r0, #2]
        strh    r3, [r1]
        b       LCUN1
LCUN0:
        ldrsh   lr, [r0]
        sub     r12, r12, #1
        mov     r5, #4
        strh    lr, [r1]
        ldrsh   r4, [r0, #2]
        add     lr, r1, r12, lsl #2
        add     r5, r5, lr
        strh    r4, [lr, #4]
        strh    r3, [r5, #2]
LCUN1:
        cmp     r12, #0
        ble     LCUN3
        mov     r2, r2, lsl #2
        mov     lr, r12, lsl #2
        sub     r2, r2, #2
        add     r5, lr, #2
        add     r2, r2, r1
        mov     r3, #0xFF
        add     r4, lr, #6
        add     r1, r5, r1
        orr     r3, r3, #0x7F, 24
        add     r4, r4, r0
        add     r5, r0, r12, lsl #2
LCUN2:
        ldrsh   r6, [r0, +lr]
        strh    r6, [r2, #2]
        ldrsh   r6, [r5, #2]
        cmn     r6, #2, 18
        moveq   r6, r3
        rsbne   r6, r6, #0
        strh    r6, [r2, #4]!
        ldrsh   r6, [r4, #-4]!
        sub     r12, r12, #1
        strh    r6, [r1]
        ldrsh   r6, [r0, +lr]
        cmp     r12, #0
        sub     lr, lr, #4
        strh    r6, [r1, #-2]
        sub     r1, r1, #4
        sub     r5, r5, #4
        bgt     LCUN2
LCUN3:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LCUN4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


