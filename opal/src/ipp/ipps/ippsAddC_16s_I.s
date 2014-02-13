        .text
        .align  4
        .globl  _ippsAddC_16s_I


_ippsAddC_16s_I:
        stmdb   sp!, {lr}
        cmp     r1, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r2, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        cmp     r0, #0
        beq     LDCS2
        cmp     r2, #0
        ble     LDCS2
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
LDCS0:
        ldrsh   r12, [r1]
        cmp     r0, #0
        add     r12, r0, r12
        ble     LDCS3
        mvn     lr, r3
        cmp     r12, lr
        movlt   lr, r12
LDCS1:
        strh    lr, [r1], #2
        subs    r2, r2, #1
        bne     LDCS0
LDCS2:
        mov     r0, #0
        ldr     pc, [sp], #4
LDCS3:
        cmp     r12, r3
        mov     lr, r3
        movgt   lr, r12
        b       LDCS1


