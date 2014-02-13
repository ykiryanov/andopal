        .text
        .align  4
        .globl  _ippsFilterMedian_32s


_ippsFilterMedian_32s:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mov     r4, r1
        mov     r5, r2
        mov     r6, r3
        beq     LBHR0
        cmp     r4, #0
        beq     LBHR0
        cmp     r5, #0
        ble     LBHR1
        cmp     r6, #0
        ble     LBHR1
        mov     r2, r5
        mov     r1, r4
        bl      _ippsCopy_16sc
        cmp     r0, #0
        ldmneia sp!, {r4 - r6, pc}
        mov     r0, r4
        mov     r2, r6
        mov     r1, r5
        ldmia   sp!, {r4 - r6, lr}
        b       _ippsFilterMedian_32s_I
LBHR0:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}
LBHR1:
        mvn     r0, #5
        ldmia   sp!, {r4 - r6, pc}


