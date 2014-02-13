        .text
        .align  4
        .globl  _ippsAutoCorr_NormA_64f


_ippsAutoCorr_NormA_64f:
        stmdb   sp!, {r4 - r7, lr}
        mov     r7, r1
        mov     r5, r2
        mov     r4, r3
        bl      _ippsAutoCorr_64f
        mov     r6, r0
        cmp     r6, #0
        blt     LCYW0
        ldr     r12, [pc, #0x34]
        cmp     r7, r4
        mov     r0, r7
        movlt   r4, r7
        ldr     r7, [r12]
        bl      __floatsisf
        mov     r1, r0
        mov     r0, r7
        bl      __divsf3
        bl      __extendsfdf2
        mov     r3, r4
        mov     r2, r5
        bl      _ippsMulC_64f_I
LCYW0:
        mov     r0, r6
        ldmia   sp!, {r4 - r7, pc}
        .long   LCYW__2il0floatpacket.1


        .data
        .align  4


LCYW__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F


