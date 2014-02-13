        .text
        .align  4
        .globl  _ippsSubbandControllerGetSize_EC_32f


_ippsSubbandControllerGetSize_EC_32f:
        ldr     r12, [sp]
        cmp     r0, #0
        ble     LDLG1
        cmp     r1, #0
        ble     LDLG1
        cmp     r2, #0
        ble     LDLG1
        cmp     r3, #0x7D, 26
        beq     LDLG0
        cmp     r3, #0xFA, 26
        mvnne   r0, #6
        bxne    lr
LDLG0:
        cmp     r12, #0
        mvneq   r0, #7
        bxeq    lr
        mov     r0, r0, lsl #4
        add     r0, r0, #0x60
        str     r0, [r12]
        mov     r0, #0
        bx      lr
LDLG1:
        mvn     r0, #4
        bx      lr


