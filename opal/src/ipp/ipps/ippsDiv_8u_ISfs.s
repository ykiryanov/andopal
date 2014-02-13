        .text
        .align  4
        .globl  _ippsDiv_8u_ISfs


_ippsDiv_8u_ISfs:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        cmp     r0, #0
        beq     LCHC1
        cmp     r1, #0
        beq     LCHC1
        cmp     r2, #0
        ble     LCHC0
        str     r3, [sp]
        mov     r3, r2
        mov     r2, r1
        bl      _ippsDiv_8u_Sfs
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCHC0:
        mvn     r0, #5
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCHC1:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4


