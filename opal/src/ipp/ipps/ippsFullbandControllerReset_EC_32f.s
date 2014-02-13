        .text
        .align  4
        .globl  _ippsFullbandControllerReset_EC_32f


_ippsFullbandControllerReset_EC_32f:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        ldr     r1, [pc, #0x28]
        and     r2, r0, #0xF
        rsb     r2, r2, #0
        ldr     r1, [r1]
        and     r2, r2, #0xF
        add     r3, r0, r2
        str     r1, [r2, +r0]
        mov     r0, #0
        str     r1, [r3, #0xC]
        str     r1, [r3, #4]
        str     r1, [r3, #8]
        bx      lr
        .long   LDLL__2il0floatpacket.1


        .data
        .align  4


LDLL__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


