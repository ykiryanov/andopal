        .text
        .align  4
        .globl  _ippsFFTGetBufSize_R_32s


_ippsFFTGetBufSize_R_32s:
        cmp     r1, #0
        beq     LCBG0
        cmp     r0, #0
        beq     LCBG0
        ldr     r3, [r0]
        ldr     r2, [pc, #0x2C]
        cmp     r2, r3
        mvnne   r0, #0x10
        bxne    lr
        ldr     r0, [r0, #0xC]
        cmp     r0, #0
        movle   r0, #0
        addgt   r0, r0, #0x20
        str     r0, [r1]
        mov     r0, #0
        bx      lr
LCBG0:
        mvn     r0, #7
        bx      lr
        .long   0x434d414e

