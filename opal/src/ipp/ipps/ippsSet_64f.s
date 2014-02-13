        .text
        .align  4
        .globl  _ippsSet_64f


_ippsSet_64f:
        stmdb   sp!, {lr}
        sub     sp, sp, #8
        cmp     r2, #0
        beq     LCVO1
        cmp     r3, #0
        ble     LCVO0
        mov     r12, sp
        str     r0, [r12]
        str     r1, [r12, #4]
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        bl      ownsSet_64s
        mov     r0, #0
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCVO0:
        mvn     r0, #5
        add     sp, sp, #8
        ldr     pc, [sp], #4
LCVO1:
        mvn     r0, #7
        add     sp, sp, #8
        ldr     pc, [sp], #4


