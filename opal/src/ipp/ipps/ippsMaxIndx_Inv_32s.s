        .text
        .align  4
        .globl  _ippsMaxIndx_Inv_32s


_ippsMaxIndx_Inv_32s:
        stmdb   sp!, {r4, r5, lr}
        cmp     r1, #0
        mov     r12, #0
        mov     r4, #2, 2
        movle   lr, r12
        ble     LDSC1
        mov     lr, r12
LDSC0:
        ldr     r5, [r0], #4
        cmp     r5, r4
        movge   r4, r5
        movge   lr, r12
        add     r12, r12, #1
        cmp     r12, r1
        blt     LDSC0
LDSC1:
        str     r4, [r2]
        str     lr, [r3]
        ldmia   sp!, {r4, r5, pc}


