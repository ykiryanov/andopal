        .text
        .align  4
        .globl  _ippsDecodeAdaptiveVector_G729_16s


_ippsDecodeAdaptiveVector_G729_16s:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        mov     r5, r1
        mov     r4, r2
        beq     LDPQ2
        cmp     r5, #0
        beq     LDPQ2
        cmp     r4, #0
        beq     LDPQ2
        ldrsh   r3, [r0]
        ldrsh   r12, [r0, #2]
        cmp     r3, #0x12
        blt     LDPQ0
        cmp     r3, #0x90
        bgt     LDPQ0
        cmn     r12, #1
        blt     LDPQ0
        cmp     r12, #1
        ble     LDPQ1
LDPQ0:
        mvn     r0, #0xA
        ldmia   sp!, {r4, r5, pc}
LDPQ1:
        mov     r1, r5
        bl      _ippsDecodeAdaptiveVector_G729_16s_I
        add     r0, r5, #0x4D, 30
        mov     r1, r4
        mov     r2, #0x28
        bl      _ippsCopy_16s
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LDPQ2:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


