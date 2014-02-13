        .text
        .align  4
        .globl  _ippsAdaptiveCodebookGain_GSMAMR_16s


_ippsAdaptiveCodebookGain_GSMAMR_16s:
        stmdb   sp!, {lr}
        sub     sp, sp, #0x10
        cmp     r0, #0
        beq     LDPC0
        cmp     r1, #0
        beq     LDPC0
        cmp     r2, #0
        beq     LDPC0
        str     r2, [sp]
        add     r3, sp, #8
        mov     r2, r0
        mov     r0, #1
        bl      _ippsComputeAdaptiveCodebookGain_16s
        mov     r0, #0
        add     sp, sp, #0x10
        ldr     pc, [sp], #4
LDPC0:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldr     pc, [sp], #4


