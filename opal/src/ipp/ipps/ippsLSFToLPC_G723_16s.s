        .text
        .align  4
        .globl  _ippsLSFToLPC_G723_16s


_ippsLSFToLPC_G723_16s:
        stmdb   sp!, {r4, lr}
        cmp     r0, #0
        mov     r4, r1
        beq     LDQA0
        cmp     r4, #0
        beq     LDQA0
        mov     r1, r4
        mov     r2, #0xA
        bl      _ippsCopy_16s
        mov     r0, r4
        bl      _ippsLSFToLPC_G723_16s_I
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LDQA0:
        mvn     r0, #7
        ldmia   sp!, {r4, pc}


