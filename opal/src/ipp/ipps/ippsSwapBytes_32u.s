        .text
        .align  4
        .globl  _ippsSwapBytes_32u


_ippsSwapBytes_32u:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LARX3
        cmp     r1, #0
        beq     LARX3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r2, #4
        mov     r4, #0
        blt     LARX1
        sub     lr, r2, #4
        add     r12, r0, #4
        add     r3, r1, #4
LARX0:
        ldr     r6, [r12, #-4]
        add     r4, r4, #3
        cmp     r4, lr
        mov     r5, r6, lsr #24
        mov     r7, r6, lsr #8
        orr     r5, r5, r6, lsl #24
        mov     r6, r6, lsl #8
        and     r7, r7, #0xFF, 24
        and     r6, r6, #0xFF, 16
        orr     r7, r5, r7
        orr     r6, r7, r6
        str     r6, [r3, #-4]
        ldr     r6, [r12]
        mov     r5, r6, lsr #24
        mov     r7, r6, lsr #8
        orr     r5, r5, r6, lsl #24
        mov     r6, r6, lsl #8
        and     r7, r7, #0xFF, 24
        and     r6, r6, #0xFF, 16
        orr     r7, r5, r7
        orr     r6, r7, r6
        str     r6, [r3]
        ldr     r6, [r12, #4]
        add     r12, r12, #0xC
        mov     r5, r6, lsr #24
        mov     r7, r6, lsr #8
        orr     r5, r5, r6, lsl #24
        mov     r6, r6, lsl #8
        and     r7, r7, #0xFF, 24
        and     r6, r6, #0xFF, 16
        orr     r7, r5, r7
        orr     r6, r7, r6
        str     r6, [r3, #4]
        add     r3, r3, #0xC
        ble     LARX0
LARX1:
        add     r0, r0, r4, lsl #2
        add     r1, r1, r4, lsl #2
LARX2:
        ldr     r12, [r0], #4
        add     r4, r4, #1
        mov     r3, r12, lsr #24
        mov     lr, r12, lsr #8
        orr     r3, r3, r12, lsl #24
        mov     r12, r12, lsl #8
        and     lr, lr, #0xFF, 24
        and     r12, r12, #0xFF, 16
        orr     lr, r3, lr
        orr     r12, lr, r12
        str     r12, [r1], #4
        cmp     r4, r2
        blt     LARX2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LARX3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


