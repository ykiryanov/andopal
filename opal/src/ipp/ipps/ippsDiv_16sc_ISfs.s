        .text
        .align  4
        .globl  _ippsDiv_16sc_ISfs


_ippsDiv_16sc_ISfs:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        cmp     r0, #0
        beq     LCHP1
        cmp     r1, #0
        beq     LCHP1
        cmp     r2, #0
        ble     LCHP0
        str     r3, [sp]
        mov     r3, r2
        mov     r2, r1
        bl      _ippsDiv_16sc_Sfs
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCHP0:
        mvn     r0, #5
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCHP1:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4


