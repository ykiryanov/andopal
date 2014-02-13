        .text
        .align  4
        .globl  _ippsAddC_32f


_ippsAddC_32f:
        stmdb   sp!, {r4 - r7, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r4, r1
        mov     r5, r2
        mov     r7, r3
        beq     LDDJ3
        cmp     r5, #0
        beq     LDDJ3
        cmp     r7, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        ldr     r12, [pc, #0x5C]
        mov     r0, r4
        ldr     r1, [r12]
        bl      __eqsf2
        cmp     r0, #0
        beq     LDDJ2
        cmp     r7, #0
        sub     r7, r7, #1
        beq     LDDJ1
LDDJ0:
        ldr     r1, [r6], #4
        mov     r0, r4
        sub     r7, r7, #1
        bl      __addsf3
        str     r0, [r5], #4
        cmn     r7, #1
        bne     LDDJ0
LDDJ1:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LDDJ2:
        mov     r0, r6
        mov     r2, r7
        mov     r1, r5
        ldmia   sp!, {r4 - r7, lr}
        b       _ippsCopy_32s
LDDJ3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}
        .long   LDDJ__2il0floatpacket.1


        .data
        .align  4


LDDJ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


