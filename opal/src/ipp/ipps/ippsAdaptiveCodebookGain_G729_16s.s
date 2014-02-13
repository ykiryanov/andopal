        .text
        .align  4
        .globl  _ippsAdaptiveCodebookGain_G729_16s


_ippsAdaptiveCodebookGain_G729_16s:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #0x10
        ldr     r6, [sp, #0x20]
        mov     r5, r0
        cmp     r5, #0
        mov     r0, r2
        mov     r4, r3
        beq     LDPV0
        cmp     r1, #0
        beq     LDPV0
        cmp     r0, #0
        beq     LDPV0
        cmp     r4, #0
        beq     LDPV0
        cmp     r6, #0
        beq     LDPV0
        mov     r12, #0xC
        str     r12, [sp]
        mov     r3, #0x28
        mov     r2, r4
        bl      _ippsConvPartial_16s_Sfs
        add     r3, sp, #8
        str     r6, [sp]
        mov     r2, r5
        mov     r1, r4
        mov     r0, #0
        bl      _ippsComputeAdaptiveCodebookGain_16s
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r6, pc}
LDPV0:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r6, pc}


