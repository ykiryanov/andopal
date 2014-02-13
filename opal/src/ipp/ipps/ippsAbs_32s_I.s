        .text
        .align  4
        .globl  _ippsAbs_32s_I


_ippsAbs_32s_I:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r1, #0
        mvnle   r0, #5
        bxle    lr
        cmp     r1, #0
        ble     LDDM2
        mvn     r2, #2, 2
LDDM0:
        ldr     r3, [r0]
        cmp     r3, #0
        blt     LDDM3
LDDM1:
        subs    r1, r1, #1
        add     r0, r0, #4
        bne     LDDM0
LDDM2:
        mov     r0, #0
        bx      lr
LDDM3:
        cmp     r3, #2, 2
        moveq   r3, r2
        rsbne   r3, r3, #0
        str     r3, [r0]
        b       LDDM1


