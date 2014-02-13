        .text
        .align  4
        .globl  _ippsAutoCorr_NormA_32f


_ippsAutoCorr_NormA_32f:
        stmdb   sp!, {r4 - r7, lr}
        mov     r7, r1
        mov     r5, r2
        mov     r4, r3
        bl      _ippsAutoCorr_32f
        mov     r6, r0
        cmp     r6, #0
        blt     LCYY0
        ldr     r12, [pc, #0x30]
        cmp     r7, r4
        mov     r0, r7
        movlt   r4, r7
        ldr     r7, [r12]
        bl      __floatsisf
        mov     r1, r0
        mov     r0, r7
        bl      __divsf3
        mov     r2, r4
        mov     r1, r5
        bl      _ippsMulC_32f_I
LCYY0:
        mov     r0, r6
        ldmia   sp!, {r4 - r7, pc}
        .long   LCYY__2il0floatpacket.1


        .data
        .align  4


LCYY__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F


