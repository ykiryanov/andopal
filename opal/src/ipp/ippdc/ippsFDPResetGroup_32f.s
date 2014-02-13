        .text
        .align  4
        .globl  _ippsFDPResetGroup_32f


_ippsFDPResetGroup_32f:
        stmdb   sp!, {lr}
        cmp     r2, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r1, #0
        mvnlt   r0, #5
        ldrlt   pc, [sp], #4
        cmp     r0, #1
        mvnlt   r0, #0xD
        ldrlt   pc, [sp], #4
        ldr     r3, [r2, #0x1C]
        cmp     r3, #0x3B
        mvnne   r0, #0x10
        ldrne   pc, [sp], #4
        ldr     r3, [r2, #0x18]
        cmp     r1, r3
        bge     LGEY1
        ldr     r3, [pc, #0x50]
        ldr     r12, [pc, #0x50]
        ldr     r3, [r3]
        ldr     r12, [r12]
LGEY0:
        ldr     lr, [r2, #4]
        str     r3, [lr, +r1, lsl #2]
        ldr     lr, [r2]
        str     r3, [lr, +r1, lsl #2]
        ldr     lr, [r2, #0x14]
        str     r3, [lr, +r1, lsl #2]
        ldr     lr, [r2, #0x10]
        str     r3, [lr, +r1, lsl #2]
        ldr     lr, [r2, #0xC]
        str     r12, [lr, +r1, lsl #2]
        ldr     lr, [r2, #8]
        str     r12, [lr, +r1, lsl #2]
        ldr     lr, [r2, #0x18]
        add     r1, r0, r1
        cmp     r1, lr
        blt     LGEY0
LGEY1:
        mov     r0, #0
        ldr     pc, [sp], #4
        .long   LGEY__2il0floatpacket.1
        .long   LGEY__2il0floatpacket.2


        .data
        .align  4


LGEY__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LGEY__2il0floatpacket.2:
        .byte   0x00,0x00,0x80,0x3F


