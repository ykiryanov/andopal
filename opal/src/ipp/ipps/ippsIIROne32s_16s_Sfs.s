        .text
        .align  4
        .globl  _ippsIIROne32s_16s_Sfs


_ippsIIROne32s_16s_Sfs:
        stmdb   sp!, {r4, r5, lr}
        cmp     r1, #0
        mov     r4, r2
        beq     LBOA1
        cmp     r4, #0
        beq     LBOA1
        ldr     r12, [r4]
        ldr     r5, [pc, #0x4C]
        subs    r12, r12, r5
        beq     LBOA0
        adds    r12, r12, #0xF7
        mvnne   r0, #0x10
        ldmneia sp!, {r4, r5, pc}
        sub     r12, r5, #0xFB
        str     r12, [r4]
        mov     r2, r4
        bl      _ippsIIROne32f_16s_Sfs
        sub     r5, r5, #0xF7
        str     r5, [r4]
        ldmia   sp!, {r4, r5, pc}
LBOA0:
        sub     r12, r5, #0xFA
        str     r12, [r4]
        mov     r2, r4
        bl      _ippsIIROne32f_16s_Sfs
        str     r5, [r4]
        ldmia   sp!, {r4, r5, pc}
LBOA1:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}
        .long   0x49493130


