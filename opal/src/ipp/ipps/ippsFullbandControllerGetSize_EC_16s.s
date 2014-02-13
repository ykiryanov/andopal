        .text
        .align  4
        .globl  _ippsFullbandControllerGetSize_EC_16s


_ippsFullbandControllerGetSize_EC_16s:
        cmp     r3, #0
        mvneq   r0, #7
        bxeq    lr
        cmp     r0, #0
        ble     LDKO1
        cmp     r1, #0
        ble     LDKO1
        cmp     r2, #0x7D, 26
        beq     LDKO0
        cmp     r2, #0xFA, 26
        mvnne   r0, #6
        bxne    lr
LDKO0:
        mov     r0, #0x60
        str     r0, [r3]
        mov     r0, #0
        bx      lr
LDKO1:
        mvn     r0, #4
        bx      lr


