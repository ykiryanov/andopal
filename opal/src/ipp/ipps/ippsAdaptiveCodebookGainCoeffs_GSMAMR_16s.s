        .text
        .align  4
        .globl  _ippsAdaptiveCodebookGainCoeffs_GSMAMR_16s


_ippsAdaptiveCodebookGainCoeffs_GSMAMR_16s:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        cmp     r0, #0
        beq     LDPD0
        cmp     r1, #0
        beq     LDPD0
        cmp     r2, #0
        beq     LDPD0
        cmp     r3, #0
        beq     LDPD0
        str     r2, [sp]
        mov     r2, r0
        mov     r0, #1
        bl      _ippsComputeAdaptiveCodebookGain_16s
        mov     r0, #0
        add     sp, sp, #8
        ldr     pc, [sp], #4
LDPD0:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4


