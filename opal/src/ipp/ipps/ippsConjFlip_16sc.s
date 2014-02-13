        .text
        .align  4
        .globl  _ippsConjFlip_16sc


_ippsConjFlip_16sc:
        cmp     r0, #0
        beq     LCUQ2
        cmp     r1, #0
        beq     LCUQ2
        cmp     r2, #0
        mvnle   r0, #5
        bxle    lr
        cmp     r2, #0
        sub     r3, r2, #1
        ble     LCUQ1
        mov     r3, r3, lsl #2
        add     r3, r3, #6
        add     r1, r3, r1
        mov     r3, #0xFF
        orr     r3, r3, #0x7F, 24
LCUQ0:
        ldrsh   r12, [r0]
        strh    r12, [r1, #-6]
        ldrsh   r12, [r0, #2]
        cmn     r12, #2, 18
        moveq   r12, r3
        rsbne   r12, r12, #0
        strh    r12, [r1, #-4]!
        subs    r2, r2, #1
        add     r0, r0, #4
        bne     LCUQ0
LCUQ1:
        mov     r0, #0
        bx      lr
LCUQ2:
        mvn     r0, #7
        bx      lr


