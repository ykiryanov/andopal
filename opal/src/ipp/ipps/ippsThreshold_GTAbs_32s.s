        .text
        .align  4
        .globl  _ippsThreshold_GTAbs_32s


_ippsThreshold_GTAbs_32s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LARD4
        cmp     r1, #0
        beq     LARD4
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r3, #0
        mvnlt   r0, #0x12
        ldrlt   pc, [sp], #4
        cmp     r2, #0
        rsb     r12, r3, #0
        ble     LARD3
LARD0:
        ldr     lr, [r0], #4
        cmp     lr, r3
        bgt     LARD1
        cmp     lr, r12
        strge   lr, [r1]
        bge     LARD2
LARD1:
        cmp     lr, #0
        movlt   lr, r12
        movge   lr, r3
        str     lr, [r1]
LARD2:
        subs    r2, r2, #1
        add     r1, r1, #4
        bne     LARD0
LARD3:
        mov     r0, #0
        ldr     pc, [sp], #4
LARD4:
        mvn     r0, #7
        ldr     pc, [sp], #4


