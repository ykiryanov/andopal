        .text
        .align  4
        .globl  _ippsSwapBytes_32u_I


_ippsSwapBytes_32u_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r1, #4
        mov     lr, #0
        blt     LARW1
        sub     r12, r1, #4
        add     r3, r0, #4
LARW0:
        ldr     r6, [r3, #-4]
        ldr     r2, [r3]
        ldr     r4, [r3, #4]
        mov     r5, r6, lsr #24
        mov     r8, r6, lsr #8
        orr     r5, r5, r6, lsl #24
        mov     r6, r6, lsl #8
        and     r8, r8, #0xFF, 24
        and     r6, r6, #0xFF, 16
        orr     r8, r5, r8
        orr     r6, r8, r6
        str     r6, [r3, #-4]
        mov     r6, r4, lsr #24
        mov     r7, r2, lsr #24
        mov     r5, r2, lsr #8
        mov     r8, r4, lsr #8
        orr     r6, r6, r4, lsl #24
        orr     r7, r7, r2, lsl #24
        mov     r2, r2, lsl #8
        mov     r4, r4, lsl #8
        and     r5, r5, #0xFF, 24
        and     r8, r8, #0xFF, 24
        and     r2, r2, #0xFF, 16
        and     r4, r4, #0xFF, 16
        orr     r5, r7, r5
        orr     r6, r6, r8
        orr     r2, r5, r2
        orr     r4, r6, r4
        add     lr, lr, #3
        str     r2, [r3]
        str     r4, [r3, #4]
        cmp     lr, r12
        add     r3, r3, #0xC
        ble     LARW0
LARW1:
        add     r0, r0, lr, lsl #2
LARW2:
        ldr     r3, [r0]
        add     lr, lr, #1
        cmp     lr, r1
        mov     r2, r3, lsr #24
        mov     r12, r3, lsr #8
        orr     r2, r2, r3, lsl #24
        mov     r3, r3, lsl #8
        and     r12, r12, #0xFF, 24
        and     r3, r3, #0xFF, 16
        orr     r12, r2, r12
        orr     r3, r12, r3
        str     r3, [r0], #4
        blt     LARW2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}


