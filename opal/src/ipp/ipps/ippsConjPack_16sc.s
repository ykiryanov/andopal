        .text
        .align  4
        .globl  _ippsConjPack_16sc


_ippsConjPack_16sc:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        beq     LCUP3
        cmp     r1, #0
        beq     LCUP3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        ldrsh   r3, [r0], #-2
        tst     r2, #1
        mov     r2, r2, asr #1
        strh    r3, [r1]
        mov     r3, #0
        strh    r3, [r1, #2]
        add     r12, r2, #1
        bne     LCUP0
        sub     r2, r2, #1
        add     r4, r0, #4
        mov     lr, r2, lsl #2
        ldrsh   r4, [r4, +lr]
        add     r6, r1, #4
        add     r5, lr, r6
        strh    r4, [r6, +lr]
        strh    r3, [r5, #2]
LCUP0:
        cmp     r2, #0
        ble     LCUP2
        mov     r12, r12, lsl #2
        mov     r3, r2, lsl #2
        add     lr, r3, #2
        sub     r12, r12, #2
        mov     r3, #0xFF
        add     r12, r12, r1
        orr     r3, r3, #0x7F, 24
        add     r1, lr, r1
        add     r0, lr, r0
LCUP1:
        ldrsh   lr, [r0, #-2]
        strh    lr, [r12, #2]
        ldrsh   lr, [r0]
        cmn     lr, #2, 18
        moveq   lr, r3
        rsbne   lr, lr, #0
        strh    lr, [r12, #4]!
        ldrsh   lr, [r0]
        sub     r2, r2, #1
        cmp     r2, #0
        strh    lr, [r1]
        ldrsh   lr, [r0, #-2]
        sub     r0, r0, #4
        strh    lr, [r1, #-2]
        sub     r1, r1, #4
        bgt     LCUP1
LCUP2:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LCUP3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


