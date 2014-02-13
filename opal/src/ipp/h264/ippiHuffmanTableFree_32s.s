        .text
        .align  4
        .globl  _ippiHuffmanTableFree_32s


_ippiHuffmanTableFree_32s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        bl      _ippsFree
        mov     r0, #0
        ldr     pc, [sp], #4


