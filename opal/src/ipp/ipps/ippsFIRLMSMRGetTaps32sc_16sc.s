        .text
        .align  4
        .globl  _ippsFIRLMSMRGetTaps32sc_16sc


_ippsFIRLMSMRGetTaps32sc_16sc:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        beq     LBWO4
        cmp     r1, #0
        beq     LBWO4
        ldr     r3, [r0]
        ldr     r2, [pc, #0xE4]
        cmp     r2, r3
        mvnne   r0, #0x10
        ldmneia sp!, {r4 - r6, pc}
        ldr     r4, [r0, #0xC]
        ldr     r2, [r0, #4]
        cmp     r4, #0
        ble     LBWO3
        cmp     r4, #5
        mov     lr, #0
        sublt   r1, r1, #8
        blt     LBWO1
        sub     r1, r1, #8
        sub     r12, r4, #5
        sub     r3, r2, #4
LBWO0:
        ldr     r5, [r3, #4]
        sub     r0, r4, lr
        add     lr, lr, #4
        str     r5, [r1, +r0, lsl #3]
        ldr     r5, [r3, #8]
        add     r6, r1, r0, lsl #3
        mov     r0, r0, lsl #3
        str     r5, [r6, #4]
        ldr     r5, [r3, #0xC]
        sub     r6, r0, #8
        cmp     lr, r12
        str     r5, [r1, +r6]
        ldr     r5, [r3, #0x10]
        add     r6, r1, r6
        str     r5, [r6, #4]
        ldr     r6, [r3, #0x14]
        sub     r5, r0, #0x10
        sub     r0, r0, #0x18
        str     r6, [r1, +r5]
        ldr     r6, [r3, #0x18]
        add     r5, r1, r5
        str     r6, [r5, #4]
        ldr     r5, [r3, #0x1C]
        str     r5, [r1, +r0]
        ldr     r5, [r3, #0x20]!
        add     r0, r1, r0
        str     r5, [r0, #4]
        ble     LBWO0
LBWO1:
        mov     r0, lr, lsl #3
        sub     r0, r0, #4
        add     r2, r0, r2
LBWO2:
        ldr     r0, [r2, #4]
        sub     r3, r4, lr
        add     lr, lr, #1
        str     r0, [r1, +r3, lsl #3]
        ldr     r0, [r2, #8]!
        add     r3, r1, r3, lsl #3
        cmp     lr, r4
        str     r0, [r3, #4]
        blt     LBWO2
LBWO3:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBWO4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}
        .long   0x4c4d5343


