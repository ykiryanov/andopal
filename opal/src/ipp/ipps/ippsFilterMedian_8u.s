        .text
        .align  4
        .globl  _ippsFilterMedian_8u


_ippsFilterMedian_8u:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mov     r4, r1
        mov     r5, r2
        mov     r6, r3
        beq     LBHN0
        cmp     r4, #0
        beq     LBHN0
        cmp     r5, #0
        ble     LBHN1
        cmp     r6, #0
        ble     LBHN1
        mov     r2, r5
        mov     r1, r4
        bl      _ippsCopy_8u
        cmp     r0, #0
        ldmneia sp!, {r4 - r6, pc}
        mov     r0, r4
        mov     r2, r6
        mov     r1, r5
        ldmia   sp!, {r4 - r6, lr}
        b       _ippsFilterMedian_8u_I
LBHN0:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}
LBHN1:
        mvn     r0, #5
        ldmia   sp!, {r4 - r6, pc}

