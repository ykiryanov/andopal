        .text
        .align  4
        .globl  _ippsSwapBytes_64u


_ippsSwapBytes_64u:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LARV2
        cmp     r1, #0
        beq     LARV2
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r2, #0
        ble     LARV1
        sub     r1, r1, #4
        sub     r0, r0, #4
        mvn     r12, #0xFF, 8
LARV0:
        ldr     r4, [r0, #4]
        ldr     r3, [r0, #8]!
        subs    r2, r2, #1
        mov     lr, r4, lsl #8
        and     r5, lr, #0xFF, 16
        mov     r6, r3, lsr #8
        mov     lr, r3, lsl #8
        and     r8, r6, #0xFF, 24
        orr     r6, lr, r4, lsr #24
        mov     lr, r3, lsl #24
        mov     r7, r4, lsr #8
        orr     lr, lr, r4, lsr #8
        and     r7, r7, #0xFF, 24
        and     r6, r6, #0xFF, 16
        orr     r5, r5, r4, lsl #24
        orr     r3, r8, r3, lsr #24
        bic     lr, lr, r12
        orr     r7, r5, r7
        orr     r6, r3, r6
        orr     lr, r6, lr
        orr     r4, r7, r4, lsr #24
        str     lr, [r1, #4]
        str     r4, [r1, #8]!
        bne     LARV0
LARV1:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LARV2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


