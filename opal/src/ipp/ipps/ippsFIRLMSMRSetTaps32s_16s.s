        .text
        .align  4
        .globl  _ippsFIRLMSMRSetTaps32s_16s


_ippsFIRLMSMRSetTaps32s_16s:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        ldr     r2, [r0]
        ldr     r3, [pc, #0xC0]
        cmp     r3, r2
        mvnne   r0, #0x10
        ldmneia sp!, {r4 - r6, pc}
        ldr     lr, [r0, #0xC]
        ldr     r0, [r0, #4]
        cmp     r1, #0
        beq     LBVZ4
        cmp     lr, #0
        ble     LBVZ3
        cmp     lr, #6
        mov     r12, #0
        sublt   r0, r0, #4
        blt     LBVZ1
        sub     r0, r0, #4
        sub     r3, lr, #6
        add     r2, r1, #4
LBVZ0:
        ldr     r5, [r2, #-4]
        sub     r4, lr, r12
        add     r12, r12, #5
        str     r5, [r0, +r4, lsl #2]
        ldr     r5, [r2]
        mov     r4, r4, lsl #2
        sub     r6, r4, #4
        str     r5, [r0, +r6]
        ldr     r6, [r2, #4]
        sub     r5, r4, #8
        cmp     r12, r3
        str     r6, [r0, +r5]
        ldr     r6, [r2, #8]
        sub     r5, r4, #0xC
        sub     r4, r4, #0x10
        str     r6, [r0, +r5]
        ldr     r5, [r2, #0xC]
        add     r2, r2, #0x14
        str     r5, [r0, +r4]
        ble     LBVZ0
LBVZ1:
        add     r1, r1, r12, lsl #2
LBVZ2:
        ldr     r2, [r1], #4
        sub     r3, lr, r12
        add     r12, r12, #1
        cmp     r12, lr
        str     r2, [r0, +r3, lsl #2]
        blt     LBVZ2
LBVZ3:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBVZ4:
        mov     r1, lr, lsl #2
        bl      _ippsZero_8u
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
        .long   0x4c4d5352


