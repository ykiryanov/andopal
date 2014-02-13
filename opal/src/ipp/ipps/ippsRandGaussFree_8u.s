        .text
        .align  4
        .globl  _ippsRandGaussFree_8u


_ippsRandGaussFree_8u:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r1, [r0]
        cmp     r1, #0x26
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        bl      _ippsFree
        mov     r0, #0
        ldr     pc, [sp], #4


