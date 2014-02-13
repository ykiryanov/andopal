        .text
        .align  4
        .globl  _ippsXorC_32u_I


_ippsXorC_32u_I:
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
        blt     LBJB1
        sub     r12, r2, #6
        add     r3, r1, #4
LBJB0:
        ldr     r8, [r3, #-4]
        ldr     r7, [r3]
        ldr     r6, [r3, #4]
        ldr     r5, [r3, #8]
        ldr     r4, [r3, #0xC]
        eor     r8, r8, r0
        eor     r7, r7, r0
        eor     r6, r6, r0
        eor     r5, r5, r0
        eor     r4, r4, r0
        add     lr, lr, #5
        str     r8, [r3, #-4]
        str     r7, [r3]
        str     r6, [r3, #4]
        str     r5, [r3, #8]
        str     r4, [r3, #0xC]
        cmp     lr, r12
        add     r3, r3, #0x14
        ble     LBJB0
LBJB1:
        add     r1, r1, lr, lsl #2
LBJB2:
        ldr     r3, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        eor     r3, r3, r0
        str     r3, [r1], #4
        blt     LBJB2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}


