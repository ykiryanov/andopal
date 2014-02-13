        .text
        .align  4
        .globl  _ippsFilterMedian_32f


_ippsFilterMedian_32f:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mov     r4, r1
        mov     r6, r2
        mov     r5, r3
        beq     LBHT0
        cmp     r4, #0
        beq     LBHT0
        cmp     r6, #0
        ble     LBHT1
        cmp     r5, #0
        ble     LBHT1
        mov     r2, r6, lsl #2
        mov     r1, r4
        bl      _ippsCopy_8u
        cmp     r0, #0
        ldmneia sp!, {r4 - r6, pc}
        mov     r0, r4
        mov     r2, r5
        mov     r1, r6
        ldmia   sp!, {r4 - r6, lr}
        b       _ippsFilterMedian_32f_I
LBHT0:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}
LBHT1:
        mvn     r0, #5
        ldmia   sp!, {r4 - r6, pc}


