        .text
        .align  4
        .globl  _ippsFIRSetTaps32f_16s


_ippsFIRSetTaps32f_16s:
        stmdb   sp!, {lr}
        cmp     r1, #0
        beq     LBXC1
        cmp     r0, #0
        beq     LBXC1
        ldr     r3, [r1, #0x58]
        ldr     r2, [pc, #0x30]
        subs    r3, r3, r2
        beq     LBXC0
        adds    r2, r3, #2
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        bl      ownsSRSetTaps32f_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LBXC0:
        bl      ownsMRSetTaps32f_16s
        mov     r0, #0
        ldr     pc, [sp], #4
LBXC1:
        mvn     r0, #7
        ldr     pc, [sp], #4
        .long   0x46493037


