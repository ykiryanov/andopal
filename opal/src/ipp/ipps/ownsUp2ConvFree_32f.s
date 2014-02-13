        .text
        .align  4
        .globl  ownsUp2ConvFree_32f


ownsUp2ConvFree_32f:
        stmdb   sp!, {r4, lr}
        mov     r4, r0
        cmp     r4, #0
        ldmeqia sp!, {r4, pc}
        ldr     r0, [r4, #8]
        bl      _ippsFree
        ldr     r0, [r4, #0x10]
        bl      _ippsFree
        ldr     r0, [r4, #4]
        bl      _ippsFree
        mov     r0, r4
        ldmia   sp!, {r4, lr}
        b       _ippsFree


