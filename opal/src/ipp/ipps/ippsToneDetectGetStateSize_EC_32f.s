        .text
        .align  4
        .globl  _ippsToneDetectGetStateSize_EC_32f


_ippsToneDetectGetStateSize_EC_32f:
        cmp     r1, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #0x7D, 26
        beq     LDKY0
        cmp     r0, #0xFA, 26
        mvnne   r0, #6
        bxne    lr
LDKY0:
        mov     r0, #0x48
        str     r0, [r1]
        mov     r0, #0
        bx      lr


