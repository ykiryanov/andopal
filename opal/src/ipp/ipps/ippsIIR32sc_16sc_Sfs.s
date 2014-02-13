        .text
        .align  4
        .globl  _ippsIIR32sc_16sc_Sfs


_ippsIIR32sc_16sc_Sfs:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x14]
        cmp     r0, #0
        mov     r4, r3
        beq     LBPD2
        cmp     r1, #0
        beq     LBPD2
        cmp     r4, #0
        beq     LBPD2
        cmp     r2, #0
        ble     LBPD3
        ldr     lr, [r4]
        ldr     r5, [pc, #0x74]
        subs    lr, lr, r5
        beq     LBPD1
        adds    lr, lr, #1
        beq     LBPD0
        mvn     r0, #0x10
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBPD0:
        sub     lr, r5, #0xFB
        str     lr, [r4]
        str     r12, [sp]
        mov     r3, r4
        bl      _ippsIIR32fc_16sc_Sfs
        sub     r5, r5, #1
        str     r5, [r4]
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBPD1:
        sub     lr, r5, #0xFA
        str     lr, [r4]
        str     r12, [sp]
        mov     r3, r4
        bl      _ippsIIR32fc_16sc_Sfs
        str     r5, [r4]
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBPD2:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBPD3:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
        .long   0x49493132


