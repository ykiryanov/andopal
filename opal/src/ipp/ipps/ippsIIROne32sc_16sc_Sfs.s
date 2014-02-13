        .text
        .align  4
        .globl  _ippsIIROne32sc_16sc_Sfs


_ippsIIROne32sc_16sc_Sfs:
        stmdb   sp!, {r1, r4, r5, lr}
        cmp     r1, #0
        str     r0, [sp]
        mov     r4, r2
        beq     LBNZ2
        cmp     r4, #0
        beq     LBNZ2
        ldr     r0, [r4]
        ldr     r5, [pc, #0x68]
        subs    r0, r0, r5
        beq     LBNZ1
        adds    r0, r0, #1
        beq     LBNZ0
        mvn     r0, #0x10
        ldmia   sp!, {r1, r4, r5, pc}
LBNZ0:
        sub     r0, r5, #0xFB
        str     r0, [r4]
        ldrh    r0, [sp, #2]
        ldrh    r12, [sp]
        sub     r5, r5, #1
        mov     r2, r4
        orr     r0, r12, r0, lsl #16
        bl      _ippsIIROne32fc_16sc_Sfs
        str     r5, [r4]
        ldmia   sp!, {r1, r4, r5, pc}
LBNZ1:
        sub     r0, r5, #0xFA
        str     r0, [r4]
        ldrh    r0, [sp]
        ldrh    r12, [sp, #2]
        mov     r2, r4
        orr     r0, r0, r12, lsl #16
        bl      _ippsIIROne32fc_16sc_Sfs
        str     r5, [r4]
        ldmia   sp!, {r1, r4, r5, pc}
LBNZ2:
        mvn     r0, #7
        ldmia   sp!, {r1, r4, r5, pc}
        .long   0x49493132


