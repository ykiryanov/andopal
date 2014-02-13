        .text
        .align  4
        .globl  _ippsConjCcs_16sc_I


_ippsConjCcs_16sc_I:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r1, #0
        mvnle   r0, #5
        bxle    lr
        tst     r1, #1
        mov     r1, r1, asr #1
        add     r2, r1, #1
        subeq   r1, r1, #1
        cmp     r1, #0
        ble     LCUR1
        mov     r2, r2, lsl #2
        sub     r2, r2, #2
        mov     r3, #0xFF
        add     r2, r2, r0
        add     r0, r0, r1, lsl #2
        orr     r3, r3, #0x7F, 24
LCUR0:
        ldrsh   r12, [r0]
        strh    r12, [r2, #2]
        ldrsh   r12, [r0, #2]
        cmn     r12, #2, 18
        moveq   r12, r3
        rsbne   r12, r12, #0
        sub     r1, r1, #1
        strh    r12, [r2, #4]!
        cmp     r1, #0
        sub     r0, r0, #4
        bgt     LCUR0
LCUR1:
        mov     r0, #0
        bx      lr


