        .text
        .align  4
        .globl  _ippsThreshold_GTAbs_16s_I


_ippsThreshold_GTAbs_16s_I:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r1, #0
        mvnle   r0, #5
        bxle    lr
        cmp     r2, #0
        mvnlt   r0, #0x12
        bxlt    lr
        cmp     r1, #0
        rsb     r3, r2, #0
        ble     LARG3
LARG0:
        ldrsh   r12, [r0]
        cmp     r12, r2
        bgt     LARG1
        cmp     r12, r3
        bge     LARG2
LARG1:
        cmp     r12, #0
        movlt   r12, r3
        movge   r12, r2
        strh    r12, [r0]
LARG2:
        subs    r1, r1, #1
        add     r0, r0, #2
        bne     LARG0
LARG3:
        mov     r0, #0
        bx      lr


