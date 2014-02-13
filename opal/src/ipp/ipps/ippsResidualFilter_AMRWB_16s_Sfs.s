        .text
        .align  4
        .globl  _ippsResidualFilter_AMRWB_16s_Sfs


_ippsResidualFilter_AMRWB_16s_Sfs:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     lr, [sp, #0xC]
        ldr     r12, [sp, #0x10]
        cmp     r0, #0
        beq     LDJG3
        cmp     r2, #0
        beq     LDJG3
        cmp     r3, #0
        beq     LDJG3
        cmp     r1, #0
        ble     LDJG2
        cmp     lr, #0
        ble     LDJG2
        cmp     lr, r1
        blt     LDJG2
        cmp     r12, #0
        blt     LDJG0
        cmp     r12, #0xF
        ble     LDJG1
LDJG0:
        mvn     r0, #0xC
        add     sp, sp, #8
        ldr     pc, [sp], #4
LDJG1:
        str     r12, [sp, #4]
        str     lr, [sp]
        bl      ownResidualFilter_16s_Sfs
        mov     r0, #0
        add     sp, sp, #8
        ldr     pc, [sp], #4
LDJG2:
        mvn     r0, #5
        add     sp, sp, #8
        ldr     pc, [sp], #4
LDJG3:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4


