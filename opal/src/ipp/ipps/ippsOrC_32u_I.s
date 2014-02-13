        .text
        .align  4
        .globl  _ippsOrC_32u_I


_ippsOrC_32u_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r0, #0
        moveq   r0, #0
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r2, #6
        mov     lr, #0
        blt     LBJN1
        sub     r12, r2, #6
        add     r3, r1, #4
LBJN0:
        ldr     r8, [r3, #-4]
        ldr     r7, [r3]
        ldr     r6, [r3, #4]
        ldr     r5, [r3, #8]
        ldr     r4, [r3, #0xC]
        orr     r8, r8, r0
        orr     r7, r7, r0
        orr     r6, r6, r0
        orr     r5, r5, r0
        orr     r4, r4, r0
        add     lr, lr, #5
        str     r8, [r3, #-4]
        str     r7, [r3]
        str     r6, [r3, #4]
        str     r5, [r3, #8]
        str     r4, [r3, #0xC]
        cmp     lr, r12
        add     r3, r3, #0x14
        ble     LBJN0
LBJN1:
        add     r1, r1, lr, lsl #2
LBJN2:
        ldr     r3, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        orr     r3, r3, r0
        str     r3, [r1], #4
        blt     LBJN2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}


