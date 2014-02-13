        .text
        .align  4
        .globl  _ippsAdd_16sc_Sfs


_ippsAdd_16sc_Sfs:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0xC]
        cmp     r3, #0
        ble     LDCB0
        mov     r3, r3, lsl #1
        str     r12, [sp]
        bl      _ippsAdd_16s_Sfs
        add     sp, sp, #8
        ldr     pc, [sp], #4
LDCB0:
        mvn     r0, #5
        add     sp, sp, #8
        ldr     pc, [sp], #4


