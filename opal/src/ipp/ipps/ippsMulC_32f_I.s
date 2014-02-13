        .text
        .align  4
        .globl  _ippsMulC_32f_I


_ippsMulC_32f_I:
        stmdb   sp!, {r4 - r6, lr}
        mov     r6, r1
        cmp     r6, #0
        mov     r4, r0
        mov     r5, r2
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r5, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        ldr     r3, [pc, #0x68]
        mov     r0, r4
        ldr     r1, [r3]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBER1
        ldr     r3, [pc, #0x54]
        mov     r0, r4
        ldr     r1, [r3]
        bl      __eqsf2
        cmp     r0, #0
        beq     LBER2
        cmp     r5, #0
        sub     r5, r5, #1
        beq     LBER1
LBER0:
        ldr     r0, [r6]
        mov     r1, r4
        sub     r5, r5, #1
        bl      __mulsf3
        str     r0, [r6], #4
        cmn     r5, #1
        bne     LBER0
LBER1:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBER2:
        mov     r0, r6
        mov     r1, r5
        ldmia   sp!, {r4 - r6, lr}
        b       _ippsZero_32f
        .long   LBER__2il0floatpacket.1
        .long   LBER__2il0floatpacket.2


        .data
        .align  4


LBER__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LBER__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


