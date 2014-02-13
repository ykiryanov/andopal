        .text
        .align  4
        .globl  _ippsFDPReset_32f


_ippsFDPReset_32f:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        ldr     r1, [r0, #0x1C]
        cmp     r1, #0x3B
        mvnne   r0, #0x10
        bxne    lr
        ldr     r1, [r0, #0x18]
        cmp     r1, #0
        ble     LGEW1
        ldr     r1, [pc, #0x54]
        ldr     r3, [pc, #0x54]
        mov     r2, #0
        ldr     r1, [r1]
        ldr     r3, [r3]
LGEW0:
        ldr     r12, [r0, #4]
        str     r1, [r12, +r2, lsl #2]
        ldr     r12, [r0]
        str     r1, [r12, +r2, lsl #2]
        ldr     r12, [r0, #0x14]
        str     r1, [r12, +r2, lsl #2]
        ldr     r12, [r0, #0x10]
        str     r1, [r12, +r2, lsl #2]
        ldr     r12, [r0, #0xC]
        str     r3, [r12, +r2, lsl #2]
        ldr     r12, [r0, #8]
        str     r3, [r12, +r2, lsl #2]
        ldr     r12, [r0, #0x18]
        add     r2, r2, #1
        cmp     r2, r12
        blt     LGEW0
LGEW1:
        mov     r0, #0
        bx      lr
        .long   LGEW__2il0floatpacket.1
        .long   LGEW__2il0floatpacket.2


        .data
        .align  4


LGEW__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LGEW__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


