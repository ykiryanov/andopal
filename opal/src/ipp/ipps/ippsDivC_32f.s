        .text
        .align  4
        .globl  _ippsDivC_32f


_ippsDivC_32f:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #8
        mov     r5, r0
        cmp     r5, #0
        mov     r6, r1
        mov     r4, r2
        mov     r7, r3
        beq     LCIB1
        cmp     r4, #0
        beq     LCIB1
        cmp     r7, #0
        ble     LCIB2
        ldr     r12, [pc, #0x6C]
        mov     r0, r6
        ldr     r1, [r12]
        bl      __nesf2
        cmp     r0, #0
        mvneq   r0, #9
        beq     LCIB0
        ldr     r12, [pc, #0x54]
        str     r7, [sp]
        mov     r1, r6
        ldr     r0, [r12]
        bl      __divsf3
        bl      __extendsfdf2
        mov     r2, r1
        mov     r6, r0
        mov     r0, r5
        mov     r3, r4
        mov     r1, r6
        bl      _ippsMulC_32f
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
LCIB0:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
LCIB1:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
LCIB2:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}
        .long   LCIB__2il0floatpacket.1
        .long   LCIB__2il0floatpacket.2


        .data
        .align  4


LCIB__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LCIB__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


