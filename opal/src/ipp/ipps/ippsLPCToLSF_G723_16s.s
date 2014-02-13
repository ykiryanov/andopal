        .text
        .align  4
        .globl  _ippsLPCToLSF_G723_16s


_ippsLPCToLSF_G723_16s:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        mov     r5, r1
        mov     r4, r2
        beq     LDQC1
        cmp     r5, #0
        beq     LDQC1
        cmp     r4, #0
        beq     LDQC1
        mov     r1, r4
        bl      _ippsLPCToLSF_Norm_G723_16s
        cmp     r0, #0
        beq     LDQC0
        mov     r1, r4
        mov     r0, r5
        mov     r2, #0xA
        bl      _ippsCopy_16s
LDQC0:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LDQC1:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


