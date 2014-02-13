        .text
        .align  4
        .globl  _ippsConjPerm_64fc_I


_ippsConjPerm_64fc_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r8, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r1, #0
        mov     r3, #0
        mov     r2, r3
        mov     r12, #1
        movlt   r2, r12
        add     r2, r1, r2
        tst     r1, #1
        mov     r1, r2, asr #1
        add     r12, r1, #1
        subne   r2, r0, #8
        bne     LCXO0
        ldr     r4, [r0, #8]
        ldr     r2, [r0, #0xC]
        add     lr, r0, #0x10
        sub     r1, r1, #1
        str     r4, [lr, +r1, lsl #4]
        add     lr, lr, r1, lsl #4
        str     r2, [lr, #4]
        str     r3, [lr, #8]
        str     r3, [lr, #0xC]
        mov     r2, r0
LCXO0:
        cmp     r1, #0
        ble     LCXO2
        mov     lr, r1, lsl #4
        mov     r12, r12, lsl #4
        add     r4, lr, #0x14
        sub     r12, r12, #0xC
        add     lr, r4, r0
        add     r12, r12, r0
        add     r4, r4, r2
LCXO1:
        ldr     r8, [r4, #-8]
        ldr     r7, [r2, +r1, lsl #4]
        ldr     r6, [r4, #-0xC]
        ldr     r5, [r4, #-0x10]!
        str     r8, [lr, #-8]
        str     r7, [lr, #-0x14]
        str     r6, [lr, #-0xC]
        str     r5, [lr, #-0x10]!
        eor     r8, r8, #2, 2
        sub     r1, r1, #1
        str     r6, [r12, #0x14]
        str     r7, [r12, #0xC]
        str     r8, [r12, #0x18]
        str     r5, [r12, #0x10]!
        cmp     r1, #0
        bgt     LCXO1
LCXO2:
        str     r3, [r0, #8]
        str     r3, [r0, #0xC]
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}


