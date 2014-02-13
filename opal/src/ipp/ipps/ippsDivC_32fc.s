        .text
        .align  4
        .globl  _ippsDivC_32fc


_ippsDivC_32fc:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0x18
        ldr     r7, [sp, #0x34]
        str     r1, [sp, #0x10]
        mov     r6, r0
        cmp     r6, #0
        str     r2, [sp, #0x14]
        mov     r5, r3
        beq     LCHZ1
        cmp     r5, #0
        beq     LCHZ1
        cmp     r7, #0
        ble     LCHZ2
        ldr     r4, [sp, #0x10]
        ldr     r9, [sp, #0x14]
        mov     r0, r4
        mov     r1, r4
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r9
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [pc, #0x8C]
        mov     r8, r0
        ldr     r1, [r2]
        bl      __nesf2
        cmp     r0, #0
        mvneq   r0, #9
        beq     LCHZ0
        ldr     r2, [pc, #0x74]
        mov     r1, r8
        eor     r9, r9, #2, 2
        ldr     r0, [r2]
        bl      __divsf3
        mov     r8, r0
        mov     r1, r4
        bl      __mulsf3
        mov     r2, r0
        str     r2, [sp, #8]
        mov     r0, r9
        mov     r1, r8
        bl      __mulsf3
        str     r0, [sp, #0xC]
        str     r7, [sp]
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #8]
        mov     r0, r6
        mov     r3, r5
        bl      _ippsMulC_32fc
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r9, pc}
LCHZ0:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r9, pc}
LCHZ1:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r9, pc}
LCHZ2:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r9, pc}
        .long   LCHZ__2il0floatpacket.1
        .long   LCHZ__2il0floatpacket.2


        .data
        .align  4


LCHZ__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LCHZ__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


