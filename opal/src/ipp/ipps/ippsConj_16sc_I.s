        .text
        .align  4
        .globl  _ippsConj_16sc_I


_ippsConj_16sc_I:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r1, #0
        mvnle   r0, #5
        bxle    lr
        cmp     r1, #0
        ble     LCUK1
        mov     r2, #0xFF
        orr     r2, r2, #0x7F, 24
        sub     r0, r0, #2
LCUK0:
        ldrsh   r3, [r0, #4]
        cmn     r3, #2, 18
        moveq   r3, r2
        rsbne   r3, r3, #0
        strh    r3, [r0, #4]!
        subs    r1, r1, #1
        bne     LCUK0
LCUK1:
        mov     r0, #0
        bx      lr


