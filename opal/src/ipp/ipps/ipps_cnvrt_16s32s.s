        .text
        .align  4
        .globl  _ipps_cnvrt_16s32s


_ipps_cnvrt_16s32s:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r2, #0
        ble     LCCD3
        cmp     r2, #6
        mov     r5, #0
        blt     LCCD1
        sub     r4, r2, #6
        mov     lr, r0
        mov     r12, r1
LCCD0:
        ldrsh   r6, [lr], #0xA
        add     r7, r5, #1
        mov     r6, r6, lsl r3
        str     r6, [r12], #0x14
        mov     r6, r7, lsl #1
        ldrsh   r8, [r0, +r6]
        add     r6, r5, #2
        mov     r8, r8, lsl r3
        str     r8, [r1, +r7, lsl #2]
        mov     r7, r6, lsl #1
        ldrsh   r8, [r0, +r7]
        add     r7, r5, #3
        mov     r8, r8, lsl r3
        str     r8, [r1, +r6, lsl #2]
        mov     r6, r7, lsl #1
        ldrsh   r8, [r0, +r6]
        add     r6, r5, #4
        add     r5, r5, #5
        mov     r8, r8, lsl r3
        str     r8, [r1, +r7, lsl #2]
        mov     r7, r6, lsl #1
        ldrsh   r7, [r0, +r7]
        cmp     r5, r4
        mov     r7, r7, lsl r3
        str     r7, [r1, +r6, lsl #2]
        ble     LCCD0
LCCD1:
        add     r0, r0, r5, lsl #1
        add     r1, r1, r5, lsl #2
LCCD2:
        ldrsh   r12, [r0], #2
        add     r5, r5, #1
        mov     r12, r12, lsl r3
        str     r12, [r1], #4
        cmp     r5, r2
        blt     LCCD2
LCCD3:
        ldmia   sp!, {r4 - r8, pc}


