        .text
        .align  4
        .globl  _ippsSqrt_32f


_ippsSqrt_32f:
        stmdb   sp!, {r4 - r10, lr}
        mov     r5, r0
        cmp     r5, #0
        mov     r7, r1
        mov     r6, r2
        beq     LAVY2
        cmp     r7, #0
        beq     LAVY2
        cmp     r6, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r6, #0
        mov     r8, #0
        movle   r0, r8
        ldmleia sp!, {r4 - r10, pc}
        ldr     r3, [pc, #0x48]
        ldr     r9, [pc, #0x48]
        ldr     r4, [r3]
LAVY0:
        ldr     r10, [r5], #4
        mov     r1, r4
        mov     r0, r10
        bl      __gesf2
        cmp     r0, #0
        ldrlt   r0, [r9]
        movlt   r8, #3
        blt     LAVY1
        mov     r0, r10
        bl      sqrtf
LAVY1:
        str     r0, [r7], #4
        subs    r6, r6, #1
        bne     LAVY0
        mov     r0, r8
        ldmia   sp!, {r4 - r10, pc}
LAVY2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}
        .long   LAVY__2il0floatpacket.1
        .long   ippConstantOfNAN_32f


        .data
        .align  4


LAVY__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


