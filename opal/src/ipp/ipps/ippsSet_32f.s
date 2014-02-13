        .text
        .align  4
        .globl  _ippsSet_32f


_ippsSet_32f:
        stmdb   sp!, {r1, lr}
        cmp     r1, #0
        beq     LCVQ1
        cmp     r2, #0
        ble     LCVQ0
        mov     r3, sp
        str     r0, [r3]
        ldr     r0, [sp]
        bl      ownsSet_32s
        mov     r0, #0
        ldmia   sp!, {r1, pc}
LCVQ0:
        mvn     r0, #5
        ldmia   sp!, {r1, pc}
LCVQ1:
        mvn     r0, #7
        ldmia   sp!, {r1, pc}


