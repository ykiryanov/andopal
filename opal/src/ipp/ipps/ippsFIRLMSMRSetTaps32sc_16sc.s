        .text
        .align  4
        .globl  _ippsFIRLMSMRSetTaps32sc_16sc


_ippsFIRLMSMRSetTaps32sc_16sc:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        ldr     r3, [r0]
        ldr     r2, [pc, #0xF4]
        cmp     r2, r3
        mvnne   r0, #0x10
        ldmneia sp!, {r4 - r6, pc}
        ldr     r4, [r0, #0xC]
        ldr     r0, [r0, #4]
        cmp     r1, #0
        beq     LBVY4
        cmp     r4, #0
        ble     LBVY3
        cmp     r4, #5
        mov     lr, #0
        sublt   r2, r0, #8
        blt     LBVY1
        sub     r2, r0, #8
        sub     r12, r4, #5
        sub     r3, r1, #4
LBVY0:
        ldr     r5, [r3, #4]
        sub     r0, r4, lr
        add     lr, lr, #4
        str     r5, [r2, +r0, lsl #3]
        ldr     r5, [r3, #8]
        add     r6, r2, r0, lsl #3
        mov     r0, r0, lsl #3
        str     r5, [r6, #4]
        ldr     r5, [r3, #0xC]
        sub     r6, r0, #8
        cmp     lr, r12
        str     r5, [r2, +r6]
        ldr     r5, [r3, #0x10]
        add     r6, r2, r6
        str     r5, [r6, #4]
        ldr     r6, [r3, #0x14]
        sub     r5, r0, #0x10
        sub     r0, r0, #0x18
        str     r6, [r2, +r5]
        ldr     r6, [r3, #0x18]
        add     r5, r2, r5
        str     r6, [r5, #4]
        ldr     r5, [r3, #0x1C]
        str     r5, [r2, +r0]
        ldr     r5, [r3, #0x20]!
        add     r0, r2, r0
        str     r5, [r0, #4]
        ble     LBVY0
LBVY1:
        mov     r0, lr, lsl #3
        sub     r0, r0, #4
        add     r1, r0, r1
LBVY2:
        ldr     r0, [r1, #4]
        sub     r3, r4, lr
        add     lr, lr, #1
        str     r0, [r2, +r3, lsl #3]
        ldr     r0, [r1, #8]!
        add     r3, r2, r3, lsl #3
        cmp     lr, r4
        str     r0, [r3, #4]
        blt     LBVY2
LBVY3:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBVY4:
        mov     r1, r4, lsl #3
        bl      _ippsZero_8u
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
        .long   0x4c4d5343


