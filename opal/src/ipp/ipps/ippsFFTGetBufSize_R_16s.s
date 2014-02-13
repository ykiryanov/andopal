        .text
        .align  4
        .globl  _ippsFFTGetBufSize_R_16s


_ippsFFTGetBufSize_R_16s:
        cmp     r1, #0
        beq     LCDC0
        cmp     r0, #0
        beq     LCDC0
        ldr     r2, [r0]
        cmp     r2, #3
        mvnne   r0, #0x10
        bxne    lr
        ldr     r0, [r0, #0x18]
        cmp     r0, #0
        movle   r0, #0
        addgt   r0, r0, #0x20
        str     r0, [r1]
        mov     r0, #0
        bx      lr
LCDC0:
        mvn     r0, #7
        bx      lr


