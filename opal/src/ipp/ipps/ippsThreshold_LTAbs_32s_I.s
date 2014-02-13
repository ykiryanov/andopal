        .text
        .align  4
        .globl  _ippsThreshold_LTAbs_32s_I


_ippsThreshold_LTAbs_32s_I:
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
        ble     LAPU2
LAPU0:
        ldr     r12, [r0]
        cmp     r12, r2
        bge     LAPU1
        cmp     r12, r3
        ble     LAPU1
        cmp     r12, #0
        movlt   r12, r3
        movge   r12, r2
        str     r12, [r0]
LAPU1:
        subs    r1, r1, #1
        add     r0, r0, #4
        bne     LAPU0
LAPU2:
        mov     r0, #0
        bx      lr


