        .text
        .align  4
        .globl  _ippsAndC_32u_I


_ippsAndC_32u_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LBKF3
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r2, #6
        mov     lr, #0
        blt     LBKF1
        sub     r12, r2, #6
        add     r3, r1, #4
LBKF0:
        ldr     r8, [r3, #-4]
        ldr     r7, [r3]
        ldr     r6, [r3, #4]
        ldr     r5, [r3, #8]
        ldr     r4, [r3, #0xC]
        and     r8, r8, r0
        and     r7, r7, r0
        and     r6, r6, r0
        and     r5, r5, r0
        and     r4, r4, r0
        add     lr, lr, #5
        str     r8, [r3, #-4]
        str     r7, [r3]
        str     r6, [r3, #4]
        str     r5, [r3, #8]
        str     r4, [r3, #0xC]
        cmp     lr, r12
        add     r3, r3, #0x14
        ble     LBKF0
LBKF1:
        add     r1, r1, lr, lsl #2
LBKF2:
        ldr     r3, [r1]
        add     lr, lr, #1
        cmp     lr, r2
        and     r3, r3, r0
        str     r3, [r1], #4
        blt     LBKF2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBKF3:
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r8, lr}
        b       _ippsZero_32s


