        .text
        .align  4
        .globl  _ippsFlip_32fc_I


_ippsFlip_32fc_I:
        stmdb   sp!, {lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldreq   pc, [sp], #4
        cmp     r1, #0
        mvnle   r0, #5
        ldrle   pc, [sp], #4
        mov     r3, #0
        cmp     r1, #0
        mov     r2, #1
        movlt   r3, r2
        add     r3, r1, r3
        sub     r2, r1, #1
        mov     r1, r3, asr #1
        cmp     r1, #0
        ble     LBSY1
        mov     r2, r2, lsl #3
        add     r2, r2, #0xC
        add     r2, r2, r0
        sub     r0, r0, #4
LBSY0:
        ldr     r12, [r2, #-0xC]
        ldr     r3, [r0, #4]
        ldr     lr, [r0, #8]
        str     r12, [r0, #4]
        ldr     r12, [r2, #-8]
        subs    r1, r1, #1
        str     r12, [r0, #8]!
        str     r3, [r2, #-0xC]
        str     lr, [r2, #-8]!
        bne     LBSY0
LBSY1:
        mov     r0, #0
        ldr     pc, [sp], #4


