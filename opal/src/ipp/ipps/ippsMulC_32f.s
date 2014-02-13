        .text
        .align  4
        .globl  _ippsMulC_32f


_ippsMulC_32f:
        stmdb   sp!, {r4 - r7, lr}
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r6, r2
        mov     r5, r3
        beq     LBET4
        cmp     r6, #0
        beq     LBET4
        cmp     r5, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        ldr     r12, [pc, #0x84]
        mov     r0, r4
        ldr     r1, [r12]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBET3
        ldr     r12, [pc, #0x70]
        mov     r0, r4
        ldr     r1, [r12]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBET2
        cmp     r5, #0
        sub     r5, r5, #1
        beq     LBET1
LBET0:
        ldr     r0, [r7], #4
        mov     r1, r4
        sub     r5, r5, #1
        bl      __mulsf3
        str     r0, [r6], #4
        cmn     r5, #1
        bne     LBET0
LBET1:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBET2:
        mov     r0, r6
        mov     r1, r5
        ldmia   sp!, {r4 - r7, lr}
        b       _ippsZero_32f
LBET3:
        mov     r0, r7
        mov     r2, r5
        mov     r1, r6
        ldmia   sp!, {r4 - r7, lr}
        b       _ippsCopy_32f
LBET4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}
        .long   LBET__2il0floatpacket.1
        .long   LBET__2il0floatpacket.2


        .data
        .align  4


LBET__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBET__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


