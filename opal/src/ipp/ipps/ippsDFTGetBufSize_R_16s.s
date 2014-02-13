        .text
        .align  4
        .globl  _ippsDFTGetBufSize_R_16s


_ippsDFTGetBufSize_R_16s:
        cmp     r1, #0
        beq     LCMV0
        cmp     r0, #0
        beq     LCMV0
        ldr     r2, [r0]
        cmp     r2, #0xC
        mvnne   r0, #0x10
        bxne    lr
        b       LCMV1
LCMV0:
        mvn     r0, #7
        bx      lr
LCMV1:
        ldr     r2, [r0, #0xC]
        mov     r0, #0
        str     r2, [r1]
        bx      lr


