        .text
        .align  4
        .globl  _ippsIIR32s_16s_Sfs


_ippsIIR32s_16s_Sfs:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x14]
        cmp     r0, #0
        mov     r4, r3
        beq     LBPF2
        cmp     r1, #0
        beq     LBPF2
        cmp     r4, #0
        beq     LBPF2
        cmp     r2, #0
        ble     LBPF3
        ldr     lr, [r4]
        ldr     r5, [pc, #0x74]
        subs    lr, lr, r5
        beq     LBPF1
        adds    lr, lr, #0xF7
        beq     LBPF0
        mvn     r0, #0x10
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBPF0:
        sub     lr, r5, #0xFB
        str     lr, [r4]
        str     r12, [sp]
        mov     r3, r4
        bl      _ippsIIR32f_16s_Sfs
        sub     r5, r5, #0xF7
        str     r5, [r4]
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBPF1:
        sub     lr, r5, #0xFA
        str     lr, [r4]
        str     r12, [sp]
        mov     r3, r4
        bl      _ippsIIR32f_16s_Sfs
        str     r5, [r4]
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBPF2:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
LBPF3:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4, r5, pc}
        .long   0x49493130


