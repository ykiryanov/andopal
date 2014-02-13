        .text
        .align  4
        .globl  _ippsIIR32s_16s_ISfs


_ippsIIR32s_16s_ISfs:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        mov     r4, r2
        beq     LBPG1
        cmp     r4, #0
        beq     LBPG1
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        ldr     r12, [r4]
        ldr     r5, [pc, #0x4C]
        subs    r12, r12, r5
        beq     LBPG0
        adds    r12, r12, #0xF7
        mvnne   r0, #0x10
        ldmneia sp!, {r4, r5, pc}
        sub     r12, r5, #0xFB
        str     r12, [r4]
        mov     r2, r4
        bl      _ippsIIR32f_16s_ISfs
        sub     r5, r5, #0xF7
        str     r5, [r4]
        ldmia   sp!, {r4, r5, pc}
LBPG0:
        sub     r12, r5, #0xFA
        str     r12, [r4]
        mov     r2, r4
        bl      _ippsIIR32f_16s_ISfs
        str     r5, [r4]
        ldmia   sp!, {r4, r5, pc}
LBPG1:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}
        .long   0x49493130


