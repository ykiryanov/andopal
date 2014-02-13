        .text
        .align  4
        .globl  _ippsThreshold_LT_32s


_ippsThreshold_LT_32s:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        beq     LAOP3
        cmp     r1, #0
        beq     LAOP3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r2, #6
        mov     r12, #0
        blt     LAOP1
        sub     r5, r2, #6
        add     r4, r0, #4
        add     lr, r1, #4
LAOP0:
        ldr     r6, [r4, #-4]
        add     r12, r12, #5
        cmp     r3, r6
        movgt   r6, r3
        str     r6, [lr, #-4]
        ldr     r6, [r4]
        cmp     r3, r6
        movgt   r6, r3
        str     r6, [lr]
        ldr     r6, [r4, #4]
        cmp     r3, r6
        movgt   r6, r3
        str     r6, [lr, #4]
        ldr     r6, [r4, #8]
        cmp     r3, r6
        movgt   r6, r3
        str     r6, [lr, #8]
        ldr     r6, [r4, #0xC]
        add     r4, r4, #0x14
        cmp     r3, r6
        movgt   r6, r3
        str     r6, [lr, #0xC]
        cmp     r12, r5
        add     lr, lr, #0x14
        ble     LAOP0
LAOP1:
        add     r0, r0, r12, lsl #2
        add     r1, r1, r12, lsl #2
LAOP2:
        ldr     lr, [r0], #4
        add     r12, r12, #1
        cmp     r3, lr
        movgt   lr, r3
        str     lr, [r1], #4
        cmp     r12, r2
        blt     LAOP2
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LAOP3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


