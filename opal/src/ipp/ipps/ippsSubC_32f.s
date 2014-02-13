        .text
        .align  4
        .globl  _ippsSubC_32f


_ippsSubC_32f:
        stmdb   sp!, {r4 - r7, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r4, r1
        mov     r5, r2
        mov     r7, r3
        beq     LAUP3
        cmp     r5, #0
        beq     LAUP3
        cmp     r7, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        ldr     r12, [pc, #0x5C]
        mov     r0, r4
        ldr     r1, [r12]
        bl      __eqsf2
        cmp     r0, #0
        beq     LAUP2
        cmp     r7, #0
        sub     r7, r7, #1
        beq     LAUP1
LAUP0:
        ldr     r0, [r6], #4
        mov     r1, r4
        sub     r7, r7, #1
        bl      __subsf3
        str     r0, [r5], #4
        cmn     r7, #1
        bne     LAUP0
LAUP1:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LAUP2:
        mov     r0, r6
        mov     r2, r7
        mov     r1, r5
        ldmia   sp!, {r4 - r7, lr}
        b       _ippsCopy_32f
LAUP3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}
        .long   LAUP__2il0floatpacket.1


        .data
        .align  4


LAUP__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


