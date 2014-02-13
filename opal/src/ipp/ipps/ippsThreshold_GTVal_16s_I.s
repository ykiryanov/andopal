        .text
        .align  4
        .globl  _ippsThreshold_GTVal_16s_I


_ippsThreshold_GTVal_16s_I:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r1, #0
        mvnle   r0, #5
        bxle    lr
        cmp     r1, #0
        ble     LAQY1
LAQY0:
        ldrsh   r12, [r0]
        cmp     r12, r2
        strgth  r3, [r0]
        subs    r1, r1, #1
        add     r0, r0, #2
        bne     LAQY0
LAQY1:
        mov     r0, #0
        bx      lr


