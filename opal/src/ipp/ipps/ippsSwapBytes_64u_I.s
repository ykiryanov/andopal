        .text
        .align  4
        .globl  _ippsSwapBytes_64u_I


_ippsSwapBytes_64u_I:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r1, #0
        ble     LARU1
        sub     r0, r0, #4
        mvn     r2, #0xFF, 8
LARU0:
        ldr     r3, [r0, #4]
        ldr     r12, [r0, #8]
        subs    r1, r1, #1
        mov     lr, r3, lsl #8
        and     r4, lr, #0xFF, 16
        mov     r5, r12, lsr #8
        mov     lr, r12, lsl #8
        and     r7, r5, #0xFF, 24
        orr     r5, lr, r3, lsr #24
        mov     lr, r12, lsl #24
        mov     r6, r3, lsr #8
        orr     lr, lr, r3, lsr #8
        and     r6, r6, #0xFF, 24
        and     r5, r5, #0xFF, 16
        orr     r4, r4, r3, lsl #24
        orr     r12, r7, r12, lsr #24
        bic     lr, lr, r2
        orr     r6, r4, r6
        orr     r5, r12, r5
        orr     lr, r5, lr
        orr     r3, r6, r3, lsr #24
        str     lr, [r0, #4]
        str     r3, [r0, #8]!
        bne     LARU0
LARU1:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}


