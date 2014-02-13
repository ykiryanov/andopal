        .text
        .align  4
        .globl  _ippsFIRGetTaps32s_16s


_ippsFIRGetTaps32s_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LBUP3
        cmp     r1, #0
        beq     LBUP3
        cmp     r2, #0
        beq     LBUP3
        ldr     r12, [pc, #0x68]
        ldr     r3, [r0, #0x58]
        sub     lr, r12, #0xF8
        cmp     lr, r3
        beq     LBUP0
        cmp     r12, r3
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
LBUP0:
        ldr     r12, [r0, #8]
        cmp     r12, #0
        ble     LBUP2
        mov     r3, #0
LBUP1:
        sub     lr, r12, r3
        ldr     r12, [r0]
        mov     lr, lr, lsl #1
        sub     lr, lr, #2
        ldrsh   lr, [r12, +lr]
        add     r3, r3, #1
        str     lr, [r1], #4
        ldr     r12, [r0, #8]
        cmp     r3, r12
        blt     LBUP1
LBUP2:
        ldr     r1, [r0, #0x28]
        mov     r0, #0
        str     r1, [r2]
        ldr     pc, [sp], #4
LBUP3:
        mvn     r0, #7
        ldr     pc, [sp], #4
        .long   0x46493131


