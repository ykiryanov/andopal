        .text
        .align  4
        .globl  _ippsOr_32u_I


_ippsOr_32u_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LBJH3
        cmp     r1, #0
        beq     LBJH3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r2, #6
        mov     r6, #0
        blt     LBJH1
        sub     r5, r2, #6
        add     r4, r1, #4
        add     lr, r0, #4
LBJH0:
        ldr     r12, [lr, #-4]
        ldr     r8, [r4, #-4]
        ldr     r3, [r4]
        ldr     r7, [r4, #4]
        add     r6, r6, #5
        orr     r12, r8, r12
        str     r12, [r4, #-4]
        ldr     r8, [lr]
        ldr     r12, [r4, #8]
        cmp     r6, r5
        orr     r8, r3, r8
        str     r8, [r4]
        ldr     r8, [lr, #4]
        ldr     r3, [r4, #0xC]
        orr     r8, r7, r8
        str     r8, [r4, #4]
        ldr     r7, [lr, #8]
        orr     r7, r12, r7
        str     r7, [r4, #8]
        ldr     r12, [lr, #0xC]
        add     lr, lr, #0x14
        orr     r12, r3, r12
        str     r12, [r4, #0xC]
        add     r4, r4, #0x14
        ble     LBJH0
LBJH1:
        add     r1, r1, r6, lsl #2
        add     r0, r0, r6, lsl #2
LBJH2:
        ldr     r3, [r0], #4
        ldr     r12, [r1]
        add     r6, r6, #1
        cmp     r6, r2
        orr     r3, r12, r3
        str     r3, [r1], #4
        blt     LBJH2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBJH3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


