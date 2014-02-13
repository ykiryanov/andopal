        .text
        .align  4
        .globl  _ippsLongTermPostFilter_G729A_16s


_ippsLongTermPostFilter_G729A_16s:
        stmdb   sp!, {r4 - r6, lr}
        ldr     r5, [sp, #0x10]
        cmp     r1, #0
        mov     r4, r0
        beq     LDPL2
        cmp     r2, #0
        beq     LDPL2
        cmp     r3, #0
        beq     LDPL2
        cmp     r5, #0
        beq     LDPL2
        cmp     r4, #0x12
        blt     LDPL0
        cmp     r4, #0x91
        ble     LDPL1
LDPL0:
        mvn     r0, #6
        ldmia   sp!, {r4 - r6, pc}
LDPL1:
        mov     r0, r1
        mov     r1, r2
        add     r6, r3, #0x4D, 30
        mov     r2, r6
        bl      _ippsResidualFilter_G729_16s
        mov     r0, r4
        mov     r2, r5
        mov     r1, r6
        bl      _ippsHarmonicPostFilter_G729A_16s
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LDPL2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


