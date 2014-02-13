        .text
        .align  4
        .globl  _ippsConjPack_64fc_I


_ippsConjPack_64fc_I:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r1, #0
        mov     r3, #0
        mov     r2, r3
        mov     r12, #1
        movlt   r2, r12
        add     r2, r1, r2
        tst     r1, #1
        mov     r1, r2, asr #1
        add     r12, r1, #1
        sub     r2, r0, #8
        bne     LCXS0
        add     r4, r2, #0x10
        sub     r1, r1, #1
        ldr     lr, [r4, +r1, lsl #4]
        add     r4, r4, r1, lsl #4
        ldr     r4, [r4, #4]
        add     r5, r0, #0x10
        str     lr, [r5, +r1, lsl #4]
        add     r5, r5, r1, lsl #4
        str     r4, [r5, #4]
        str     r3, [r5, #8]
        str     r3, [r5, #0xC]
LCXS0:
        cmp     r1, #0
        ble     LCXS2
        mov     lr, r1, lsl #4
        mov     r12, r12, lsl #4
        add     lr, lr, #0x14
        sub     r12, r12, #0xC
        add     r2, lr, r2
        add     r12, r12, r0
        add     lr, lr, r0
LCXS1:
        ldr     r7, [r2, #-8]
        ldr     r6, [r2, #-0xC]
        ldr     r4, [r2, #-0x14]
        ldr     r5, [r2, #-0x10]!
        str     r7, [lr, #-8]
        str     r6, [lr, #-0xC]
        str     r4, [lr, #-0x14]
        str     r5, [lr, #-0x10]!
        eor     r7, r7, #2, 2
        sub     r1, r1, #1
        str     r6, [r12, #0x14]
        str     r7, [r12, #0x18]
        str     r4, [r12, #0xC]
        str     r5, [r12, #0x10]!
        cmp     r1, #0
        bgt     LCXS1
LCXS2:
        str     r3, [r0, #8]
        str     r3, [r0, #0xC]
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}


