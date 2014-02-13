        .text
        .align  4
        .globl  _ippsFIRLMSMRGetTaps32s_16s


_ippsFIRLMSMRGetTaps32s_16s:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        beq     LBWP4
        cmp     r1, #0
        beq     LBWP4
        ldr     r2, [r0]
        ldr     r3, [pc, #0xB0]
        cmp     r3, r2
        mvnne   r0, #0x10
        ldmneia sp!, {r4 - r6, pc}
        ldr     lr, [r0, #0xC]
        ldr     r0, [r0, #4]
        cmp     lr, #0
        ble     LBWP3
        cmp     lr, #6
        mov     r12, #0
        sublt   r1, r1, #4
        blt     LBWP1
        sub     r1, r1, #4
        sub     r3, lr, #6
        add     r2, r0, #4
LBWP0:
        ldr     r5, [r2, #-4]
        sub     r4, lr, r12
        add     r12, r12, #5
        str     r5, [r1, +r4, lsl #2]
        ldr     r5, [r2]
        mov     r4, r4, lsl #2
        sub     r6, r4, #4
        str     r5, [r1, +r6]
        ldr     r6, [r2, #4]
        sub     r5, r4, #8
        cmp     r12, r3
        str     r6, [r1, +r5]
        ldr     r6, [r2, #8]
        sub     r5, r4, #0xC
        sub     r4, r4, #0x10
        str     r6, [r1, +r5]
        ldr     r5, [r2, #0xC]
        add     r2, r2, #0x14
        str     r5, [r1, +r4]
        ble     LBWP0
LBWP1:
        add     r0, r0, r12, lsl #2
LBWP2:
        ldr     r2, [r0], #4
        sub     r3, lr, r12
        add     r12, r12, #1
        cmp     r12, lr
        str     r2, [r1, +r3, lsl #2]
        blt     LBWP2
LBWP3:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBWP4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}
        .long   0x4c4d5352


