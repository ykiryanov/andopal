        .text
        .align  4
        .globl  _ippsRandGaussInit_16s


_ippsRandGaussInit_16s:
        cmp     r0, #0
        mvneq   r0, #7
        bxeq    lr
        strh    r2, [r0, #0xA]
        ldr     r2, [pc, #0x68]
        str     r3, [r0, #4]
        str     r3, [r0, #0x10]
        mul     r3, r3, r2
        strh    r1, [r0, #8]
        ldr     r1, [pc, #0x58]
        ldr     r12, [pc, #0x58]
        add     r3, r3, r1
        str     r3, [r0, #0x14]
        str     r12, [r0, #0xC]
        mul     r12, r3, r2
        mov     r2, #0
        str     r2, [r0, #0x28]
        str     r2, [r0, #0x2C]
        add     r1, r12, r1
        str     r1, [r0, #0x18]
        mov     r1, #0x27
        str     r1, [r0]
        mvn     r1, #0
        str     r1, [r0, #0x1C]
        mov     r1, #1
        str     r1, [r0, #0x20]
        str     r2, [r0, #0x30]
        str     r2, [r0, #0x34]
        str     r2, [r0, #0x38]
        str     r2, [r0, #0x3C]
        mov     r0, #0
        bx      lr
        .long   0x00010dcd
        .long   0x3c6ef373
        .long   0x436cbae9


