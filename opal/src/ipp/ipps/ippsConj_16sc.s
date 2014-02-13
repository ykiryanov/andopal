        .text
        .align  4
        .globl  _ippsConj_16sc


_ippsConj_16sc:
        cmp     r0, #0
        beq     LCUL2
        cmp     r1, #0
        beq     LCUL2
        cmp     r2, #0
        mvnle   r0, #5
        bxle    lr
        cmp     r2, #0
        ble     LCUL1
        mov     r3, #0xFF
        sub     r1, r1, #2
        orr     r3, r3, #0x7F, 24
LCUL0:
        ldrsh   r12, [r0]
        strh    r12, [r1, #2]
        ldrsh   r12, [r0, #2]
        cmn     r12, #2, 18
        moveq   r12, r3
        rsbne   r12, r12, #0
        strh    r12, [r1, #4]!
        subs    r2, r2, #1
        add     r0, r0, #4
        bne     LCUL0
LCUL1:
        mov     r0, #0
        bx      lr
LCUL2:
        mvn     r0, #7
        bx      lr


