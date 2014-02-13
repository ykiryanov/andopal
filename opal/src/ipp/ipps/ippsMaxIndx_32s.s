        .text
        .align  4
        .globl  _ippsMaxIndx_32s


_ippsMaxIndx_32s:
        stmdb   sp!, {r4, r5, lr}
        cmp     r1, #0
        mov     r12, #0
        mov     r4, #2, 2
        movle   lr, r12
        ble     LDSD1
        mov     lr, r12
LDSD0:
        ldr     r5, [r0], #4
        cmp     r5, r4
        movgt   r4, r5
        movgt   lr, r12
        add     r12, r12, #1
        cmp     r12, r1
        blt     LDSD0
LDSD1:
        str     r4, [r2]
        str     lr, [r3]
        ldmia   sp!, {r4, r5, pc}


