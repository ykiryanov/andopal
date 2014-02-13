        .text
        .align  4
        .globl  _ippsFIRGetTaps32sc_16sc


_ippsFIRGetTaps32sc_16sc:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LBUN3
        cmp     r1, #0
        beq     LBUN3
        cmp     r2, #0
        beq     LBUN3
        ldr     r12, [pc, #0x88]
        ldr     r3, [r0, #0x58]
        sub     lr, r12, #2
        cmp     lr, r3
        beq     LBUN0
        cmp     r12, r3
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
LBUN0:
        ldr     r12, [r0, #8]
        cmp     r12, #0
        ble     LBUN2
        sub     r1, r1, #4
        mov     r3, #0
LBUN1:
        sub     lr, r12, r3
        ldr     r12, [r0]
        mov     lr, lr, lsl #2
        sub     lr, lr, #4
        ldrsh   lr, [r12, +lr]
        str     lr, [r1, #4]
        ldr     lr, [r0, #8]
        ldr     r12, [r0]
        sub     lr, lr, r3
        sub     lr, lr, #1
        add     r3, r3, #1
        add     lr, r12, lr, lsl #2
        ldrsh   r12, [lr, #2]
        str     r12, [r1, #8]!
        ldr     r12, [r0, #8]
        cmp     r3, r12
        blt     LBUN1
LBUN2:
        ldr     r1, [r0, #0x28]
        mov     r0, #0
        str     r1, [r2]
        ldr     pc, [sp], #4
LBUN3:
        mvn     r0, #7
        ldr     pc, [sp], #4
        .long   0x46493132


