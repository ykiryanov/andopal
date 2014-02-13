        .text
        .align  4
        .globl  _ippsConjCcs_16sc


_ippsConjCcs_16sc:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LCUS3
        cmp     r1, #0
        beq     LCUS3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        ldrsh   r3, [r0]
        tst     r2, #1
        mov     r2, r2, asr #1
        strh    r3, [r1]
        ldrsh   r12, [r0, #2]
        add     r3, r2, #1
        strh    r12, [r1, #2]
        bne     LCUS0
        sub     r2, r2, #1
        add     r5, r0, #4
        mov     lr, r2, lsl #2
        ldrsh   r4, [r5, +lr]
        add     r12, r1, #4
        add     r5, lr, r5
        strh    r4, [r12, +lr]
        ldrsh   r4, [r5, #2]
        add     r12, lr, r12
        strh    r4, [r12, #2]
LCUS0:
        cmp     r2, #0
        ble     LCUS2
        mov     r12, r2, lsl #2
        mov     r3, r3, lsl #2
        add     lr, r12, #6
        sub     r12, r3, #2
        mov     r3, #0xFF
        add     r12, r12, r1
        orr     r3, r3, #0x7F, 24
        add     r1, lr, r1
        add     r0, lr, r0
LCUS1:
        ldrsh   lr, [r0, #-6]
        strh    lr, [r12, #2]
        ldrsh   lr, [r0, #-4]
        cmn     lr, #2, 18
        moveq   lr, r3
        rsbne   lr, lr, #0
        strh    lr, [r12, #4]!
        ldrsh   lr, [r0, #-6]
        sub     r2, r2, #1
        cmp     r2, #0
        strh    lr, [r1, #-6]
        ldrsh   lr, [r0, #-4]!
        strh    lr, [r1, #-4]!
        bgt     LCUS1
LCUS2:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LCUS3:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


