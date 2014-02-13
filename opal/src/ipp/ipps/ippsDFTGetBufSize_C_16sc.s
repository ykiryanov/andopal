        .text
        .align  4
        .globl  _ippsDFTGetBufSize_C_16sc


_ippsDFTGetBufSize_C_16sc:
        cmp     r1, #0
        beq     LCMW0
        cmp     r0, #0
        beq     LCMW0
        ldr     r2, [r0]
        cmp     r2, #0xA
        mvnne   r0, #0x10
        bxne    lr
        b       LCMW1
LCMW0:
        mvn     r0, #7
        bx      lr
LCMW1:
        ldr     r2, [r0, #0xC]
        mov     r0, #0
        str     r2, [r1]
        bx      lr


