        .text
        .align  4
        .globl  _ippsFIROne32f_16s_Sfs


_ippsFIROne32f_16s_Sfs:
        stmdb   sp!, {lr}
        cmp     r2, #0
        beq     LBXG0
        cmp     r1, #0
        beq     LBXG0
        ldr     lr, [r2, #0x58]
        ldr     r12, [pc, #0x20]
        cmp     r12, lr
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        ldr     r12, [r2, #0x64]
        blx     r12
        mov     r0, #0
        ldr     pc, [sp], #4
LBXG0:
        mvn     r0, #7
        ldr     pc, [sp], #4
        .long   0x46493035


