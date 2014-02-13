        .text
        .align  4
        .globl  _ippsConvert_32s16s


_ippsConvert_32s16s:
        stmdb   sp!, {lr}
        cmp     r0, #0
        beq     LCWB3
        cmp     r1, #0
        beq     LCWB3
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r2, #0
        ble     LCWB2
        mov     r3, #0xFF
        orr     r3, r3, #0x7F, 24
LCWB0:
        ldr     r12, [r0], #4
        cmp     r3, r12
        movlt   r12, r3
        blt     LCWB1
        cmn     r12, #2, 18
        mvn     lr, r3
        movlt   r12, lr
LCWB1:
        strh    r12, [r1], #2
        subs    r2, r2, #1
        bne     LCWB0
LCWB2:
        mov     r0, #0
        ldr     pc, [sp], #4
LCWB3:
        mvn     r0, #7
        ldr     pc, [sp], #4


