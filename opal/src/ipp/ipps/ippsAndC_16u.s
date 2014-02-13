        .text
        .align  4
        .globl  _ippsAndC_16u


_ippsAndC_16u:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r1, #0
        bne     LBKI0
        cmp     r0, #0
        beq     LBKI4
        mov     r0, r2
        mov     r1, r3
        ldmia   sp!, {r4 - r6, lr}
        b       _ippsZero_16s
LBKI0:
        cmp     r0, #0
        beq     LBKI4
        cmp     r2, #0
        beq     LBKI4
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r3, #6
        mov     r5, #0
        blt     LBKI2
        sub     r4, r3, #6
        mov     lr, r0
        mov     r12, r2
LBKI1:
        ldrh    r6, [lr]
        add     r5, r5, #5
        cmp     r5, r4
        and     r6, r1, r6
        strh    r6, [r12]
        ldrh    r6, [lr, #2]
        and     r6, r1, r6
        strh    r6, [r12, #2]
        ldrh    r6, [lr, #4]
        and     r6, r1, r6
        strh    r6, [r12, #4]
        ldrh    r6, [lr, #6]
        and     r6, r1, r6
        strh    r6, [r12, #6]
        ldrh    r6, [lr, #8]
        add     lr, lr, #0xA
        and     r6, r1, r6
        strh    r6, [r12, #8]
        add     r12, r12, #0xA
        ble     LBKI1
LBKI2:
        add     r0, r0, r5, lsl #1
        add     r2, r2, r5, lsl #1
LBKI3:
        ldrh    r12, [r0], #2
        add     r5, r5, #1
        and     r12, r1, r12
        strh    r12, [r2], #2
        cmp     r5, r3
        blt     LBKI3
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBKI4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


