        .text
        .align  4
        .globl  _ippsAdd_16u


_ippsAdd_16u:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r0, #0
        beq     LDCA3
        cmp     r1, #0
        beq     LDCA3
        cmp     r2, #0
        beq     LDCA3
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        mov     r12, #0xFF
        cmp     r3, #5
        orr     r12, r12, #0xFF, 24
        mov     r7, #0
        blt     LDCA1
        sub     r6, r3, #5
        mov     r5, r0
        mov     r4, r1
        mov     lr, r2
LDCA0:
        ldrh    r8, [r5]
        ldrh    r9, [r4]
        add     r7, r7, #4
        add     r8, r8, r9
        cmp     r8, r12
        mov     r9, r12
        movcc   r9, r8
        strh    r9, [lr]
        ldrh    r8, [r5, #2]
        ldrh    r9, [r4, #2]
        add     r8, r8, r9
        cmp     r8, r12
        mov     r9, r12
        movcc   r9, r8
        strh    r9, [lr, #2]
        ldrh    r8, [r5, #4]
        ldrh    r9, [r4, #4]
        add     r8, r8, r9
        cmp     r8, r12
        mov     r9, r12
        movcc   r9, r8
        strh    r9, [lr, #4]
        ldrh    r8, [r5, #6]
        ldrh    r9, [r4, #6]
        add     r5, r5, #8
        add     r4, r4, #8
        add     r8, r8, r9
        cmp     r8, r12
        mov     r9, r12
        movcc   r9, r8
        strh    r9, [lr, #6]
        cmp     r7, r6
        add     lr, lr, #8
        ble     LDCA0
LDCA1:
        add     r0, r0, r7, lsl #1
        add     r1, r1, r7, lsl #1
        add     r2, r2, r7, lsl #1
LDCA2:
        ldrh    lr, [r0], #2
        ldrh    r4, [r1], #2
        add     r7, r7, #1
        add     lr, lr, r4
        cmp     lr, r12
        mov     r4, r12
        movcc   r4, lr
        strh    r4, [r2], #2
        cmp     r7, r3
        blt     LDCA2
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LDCA3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


