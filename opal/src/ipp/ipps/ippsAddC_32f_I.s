        .text
        .align  4
        .globl  _ippsAddC_32f_I


_ippsAddC_32f_I:
        stmdb   sp!, {r4 - r6, lr}
        mov     r5, r1
        cmp     r5, #0
        mov     r4, r0
        mov     r6, r2
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r6, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        ldr     r3, [pc, #0x40]
        mov     r0, r4
        ldr     r1, [r3]
        bl      __eqsf2
        cmp     r0, #0
        beq     LDDI1
        cmp     r6, #0
        sub     r6, r6, #1
        beq     LDDI1
LDDI0:
        ldr     r1, [r5]
        mov     r0, r4
        sub     r6, r6, #1
        bl      __addsf3
        str     r0, [r5], #4
        cmn     r6, #1
        bne     LDDI0
LDDI1:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
        .long   LDDI__2il0floatpacket.1


        .data
        .align  4


LDDI__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00

