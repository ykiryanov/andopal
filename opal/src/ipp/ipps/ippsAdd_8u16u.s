        .text
        .align  4
        .globl  _ippsAdd_8u16u


_ippsAdd_8u16u:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LDBU3
        cmp     r1, #0
        beq     LDBU3
        cmp     r2, #0
        beq     LDBU3
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r3, #6
        mov     r6, #0
        blt     LDBU1
        sub     r5, r3, #6
        sub     r4, r0, #1
        sub     lr, r1, #1
        mov     r12, r2
LDBU0:
        ldrb    r7, [lr, #1]
        ldrb    r8, [r4, #1]
        add     r6, r6, #5
        cmp     r6, r5
        add     r7, r8, r7
        strh    r7, [r12]
        ldrb    r7, [lr, #2]
        ldrb    r8, [r4, #2]
        add     r7, r8, r7
        strh    r7, [r12, #2]
        ldrb    r7, [lr, #3]
        ldrb    r8, [r4, #3]
        add     r7, r8, r7
        strh    r7, [r12, #4]
        ldrb    r7, [lr, #4]
        ldrb    r8, [r4, #4]
        add     r7, r8, r7
        strh    r7, [r12, #6]
        ldrb    r7, [lr, #5]!
        ldrb    r8, [r4, #5]!
        add     r7, r8, r7
        strh    r7, [r12, #8]
        add     r12, r12, #0xA
        ble     LDBU0
LDBU1:
        add     r2, r2, r6, lsl #1
        add     r0, r6, r0
        add     r1, r6, r1
LDBU2:
        ldrb    r12, [r1], #1
        ldrb    lr, [r0], #1
        add     r6, r6, #1
        add     r12, lr, r12
        strh    r12, [r2], #2
        cmp     r6, r3
        blt     LDBU2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LDBU3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


