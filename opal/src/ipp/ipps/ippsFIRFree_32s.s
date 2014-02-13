        .text
        .align  4
        .globl  _ippsFIRFree_32s


_ippsFIRFree_32s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r2, [r0]
        ldr     r1, [pc, #0x20]
        cmp     r1, r2
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        ldr     r1, [r0, #0x58]
        cmp     r1, #0
        beq     LBTJ0
        bl      _ippsFree
LBTJ0:
        mov     r0, #0
        ldr     pc, [sp], #4
        .long   0x46493231


