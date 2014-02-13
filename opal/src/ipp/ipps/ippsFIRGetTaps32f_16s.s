        .text
        .align  4
        .globl  _ippsFIRGetTaps32f_16s


_ippsFIRGetTaps32f_16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LBXS1
        cmp     r1, #0
        beq     LBXS1
        ldr     r3, [pc, #0x3C]
        ldr     r12, [r0, #0x58]
        sub     r2, r3, #2
        cmp     r2, r12
        beq     LBXS0
        cmp     r3, r12
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
LBXS0:
        ldr     r2, [r0, #0x54]
        ldr     r3, [r0, #8]
        mov     r0, r2
        mov     r2, r3, lsl #2
        bl      _ippsCopy_8u
        mov     r0, #0
        ldr     pc, [sp], #4
LBXS1:
        mvn     r0, #7
        ldr     pc, [sp], #4
        .long   0x46493037


