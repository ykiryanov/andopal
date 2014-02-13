        .text
        .align  4
        .globl  _ippsAnd_16u


_ippsAnd_16u:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LBKC3
        cmp     r1, #0
        beq     LBKC3
        cmp     r2, #0
        beq     LBKC3
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r3, #6
        mov     r6, #0
        blt     LBKC1
        sub     r5, r3, #6
        mov     r4, r0
        mov     lr, r1
        mov     r12, r2
LBKC0:
        ldrh    r7, [lr]
        ldrh    r8, [r4]
        add     r6, r6, #5
        cmp     r6, r5
        and     r7, r8, r7
        strh    r7, [r12]
        ldrh    r7, [lr, #2]
        ldrh    r8, [r4, #2]
        and     r7, r8, r7
        strh    r7, [r12, #2]
        ldrh    r7, [lr, #4]
        ldrh    r8, [r4, #4]
        and     r7, r8, r7
        strh    r7, [r12, #4]
        ldrh    r7, [lr, #6]
        ldrh    r8, [r4, #6]
        and     r7, r8, r7
        strh    r7, [r12, #6]
        ldrh    r7, [lr, #8]
        ldrh    r8, [r4, #8]
        add     r4, r4, #0xA
        add     lr, lr, #0xA
        and     r7, r8, r7
        strh    r7, [r12, #8]
        add     r12, r12, #0xA
        ble     LBKC0
LBKC1:
        add     r0, r0, r6, lsl #1
        add     r1, r1, r6, lsl #1
        add     r2, r2, r6, lsl #1
LBKC2:
        ldrh    r12, [r1], #2
        ldrh    lr, [r0], #2
        add     r6, r6, #1
        and     r12, lr, r12
        strh    r12, [r2], #2
        cmp     r6, r3
        blt     LBKC2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBKC3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


