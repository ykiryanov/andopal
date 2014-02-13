        .text
        .align  4
        .globl  _ippsFIRInit32sc_16sc32fc


_ippsFIRInit32sc_16sc32fc:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x10]
        mov     r4, r0
        str     r12, [sp]
        bl      _ippsFIRInit32fc_16sc
        cmp     r0, #0
        bne     LBUI0
        ldr     r4, [r4]
        ldr     r1, [pc, #8]
        str     r1, [r4, #0x58]
LBUI0:
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}
        .long   0x46493130


