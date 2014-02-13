        .text
        .align  4
        .globl  _ippsOr_16u_I


_ippsOr_16u_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LBJJ3
        cmp     r1, #0
        beq     LBJJ3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r2, #6
        mov     r6, #0
        blt     LBJJ1
        sub     r5, r2, #6
        mov     r4, r1
        mov     lr, r0
LBJJ0:
        ldrh    r12, [lr]
        ldrh    r8, [r4]
        ldrh    r3, [r4, #2]
        ldrh    r7, [r4, #4]
        add     r6, r6, #5
        orr     r12, r8, r12
        strh    r12, [r4]
        ldrh    r8, [lr, #2]
        ldrh    r12, [r4, #6]
        cmp     r6, r5
        orr     r8, r3, r8
        strh    r8, [r4, #2]
        ldrh    r8, [lr, #4]
        ldrh    r3, [r4, #8]
        orr     r8, r7, r8
        strh    r8, [r4, #4]
        ldrh    r7, [lr, #6]
        orr     r7, r12, r7
        strh    r7, [r4, #6]
        ldrh    r12, [lr, #8]
        add     lr, lr, #0xA
        orr     r12, r3, r12
        strh    r12, [r4, #8]
        add     r4, r4, #0xA
        ble     LBJJ0
LBJJ1:
        add     r1, r1, r6, lsl #1
        add     r0, r0, r6, lsl #1
LBJJ2:
        ldrh    r3, [r0], #2
        ldrh    r12, [r1]
        add     r6, r6, #1
        cmp     r6, r2
        orr     r3, r12, r3
        strh    r3, [r1], #2
        blt     LBJJ2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBJJ3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


