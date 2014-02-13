        .text
        .align  4
        .globl  _ippsConjCcs_32fc_I


_ippsConjCcs_32fc_I:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        mov     r3, #0
        cmp     r1, #0
        mov     r2, #1
        movlt   r3, r2
        add     r3, r1, r3
        tst     r1, #1
        mov     r12, r3, asr #1
        add     r4, r12, #1
        subeq   r12, r12, #1
        and     lr, r12, #1
        cmp     r12, lr
        ble     LCYA1
        mov     r2, r4, lsl #3
        mov     r1, r12, lsl #3
        sub     r5, r2, #0xC
        add     r1, r1, #0x14
        sub     r2, r0, #8
        add     r3, r1, r2
        add     r6, r0, #8
        add     r2, r1, r0
        add     r1, r5, r6
        add     r5, r5, r0
LCYA0:
        ldr     r6, [r2, #-0x14]
        add     r4, r4, #2
        sub     r12, r12, #2
        str     r6, [r5, #0xC]
        ldr     r6, [r2, #-0x10]!
        cmp     r12, lr
        eor     r6, r6, #2, 2
        str     r6, [r5, #0x10]!
        ldr     r6, [r3, #-0x14]
        str     r6, [r1, #0xC]
        ldr     r6, [r3, #-0x10]!
        eor     r6, r6, #2, 2
        str     r6, [r1, #0x10]!
        bgt     LCYA0
LCYA1:
        cmp     lr, #0
        beq     LCYA2
        ldr     r1, [r0, +r12, lsl #3]
        add     r12, r0, r12, lsl #3
        str     r1, [r0, +r4, lsl #3]
        ldr     r1, [r12, #4]
        add     r4, r0, r4, lsl #3
        eor     r1, r1, #2, 2
        str     r1, [r4, #4]
LCYA2:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}


