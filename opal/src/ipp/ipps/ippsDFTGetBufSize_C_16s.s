        .text
        .align  4
        .globl  _ippsDFTGetBufSize_C_16s


_ippsDFTGetBufSize_C_16s:
        cmp     r1, #0
        beq     LCMX0
        cmp     r0, #0
        beq     LCMX0
        ldr     r2, [r0]
        cmp     r2, #0xB
        mvnne   r0, #0x10
        bxne    lr
        b       LCMX1
LCMX0:
        mvn     r0, #7
        bx      lr
LCMX1:
        ldr     r2, [r0, #0xC]
        mov     r0, #0
        str     r2, [r1]
        bx      lr


