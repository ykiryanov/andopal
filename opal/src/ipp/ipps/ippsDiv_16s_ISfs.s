        .text
        .align  4
        .globl  _ippsDiv_16s_ISfs


_ippsDiv_16s_ISfs:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        cmp     r0, #0
        beq     LCHR1
        cmp     r1, #0
        beq     LCHR1
        cmp     r2, #0
        ble     LCHR0
        str     r3, [sp]
        mov     r3, r2
        mov     r2, r1
        bl      _ippsDiv_16s_Sfs
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCHR0:
        mvn     r0, #5
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCHR1:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4


