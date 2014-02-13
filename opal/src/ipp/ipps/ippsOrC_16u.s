        .text
        .align  4
        .globl  _ippsOrC_16u


_ippsOrC_16u:
        stmdb   sp!, {r4 - r7, lr}
        mov     r4, r1
        mov     r1, r2
        cmp     r4, #0
        mov     r2, r3
        ldmeqia sp!, {r4 - r7, lr}
        beq     _ippsCopy_16s
        cmp     r0, #0
        beq     LBJQ3
        cmp     r1, #0
        beq     LBJQ3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r2, #6
        mov     r6, #0
        blt     LBJQ1
        sub     r5, r2, #6
        mov     lr, r0
        mov     r12, r1
LBJQ0:
        ldrh    r7, [lr]
        add     r6, r6, #5
        cmp     r6, r5
        orr     r7, r4, r7
        strh    r7, [r12]
        ldrh    r7, [lr, #2]
        orr     r7, r4, r7
        strh    r7, [r12, #2]
        ldrh    r7, [lr, #4]
        orr     r7, r4, r7
        strh    r7, [r12, #4]
        ldrh    r7, [lr, #6]
        orr     r7, r4, r7
        strh    r7, [r12, #6]
        ldrh    r7, [lr, #8]
        add     lr, lr, #0xA
        orr     r7, r4, r7
        strh    r7, [r12, #8]
        add     r12, r12, #0xA
        ble     LBJQ0
LBJQ1:
        add     r0, r0, r6, lsl #1
        add     r1, r1, r6, lsl #1
LBJQ2:
        ldrh    r12, [r0], #2
        add     r6, r6, #1
        orr     r12, r4, r12
        strh    r12, [r1], #2
        cmp     r6, r2
        blt     LBJQ2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBJQ3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


