        .text
        .align  4
        .globl  _ippsToneFree


_ippsToneFree:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        ldr     r2, [r0]
        ldr     r1, [pc, #0x24]
        cmp     r1, r2
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        ldr     r1, [r0, #0x24]
        cmp     r1, #1
        movne   r0, #0
        ldrne   pc, [sp], #4
        bl      _ippsFree
        mov     r0, #0
        ldr     pc, [sp], #4
        .long   0x434d4148


