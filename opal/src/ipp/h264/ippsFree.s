        .text
        .align  4
        .globl  _ippsFree


_ippsFree:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LJEG0
        ldr     r1, [pc, #0xC]
        ldr     r0, [r0, #-4]
        ldr     r1, [r1]
        blx     r1
LJEG0:
        ldr     pc, [sp], #4
        .long   i_free


