        .text
        .align  4
        .globl  _ippsFullbandControllerGetSize_EC_32f


_ippsFullbandControllerGetSize_EC_32f:
        cmp     r3, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #0
        ble     LDLN1
        cmp     r1, #0
        ble     LDLN1
        cmp     r2, #0x7D, 26
        beq     LDLN0
        cmp     r2, #0xFA, 26
        mvnne   r0, #6
        bxne    lr
LDLN0:
        mov     r0, #0x48
        str     r0, [r3]
        mov     r0, #0
        bx      lr
LDLN1:
        mvn     r0, #4
        bx      lr


