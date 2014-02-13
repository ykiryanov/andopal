        .text
        .align  4
        .globl  _ippsFlip_64fc_I


_ippsFlip_64fc_I:
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
        sub     r2, r1, #1
        mov     r1, r3, asr #1
        cmp     r1, #0
        ble     LBSW1
        mov     r2, r2, lsl #4
        add     r2, r2, #0x1C
        add     r2, r2, r0
        sub     r0, r0, #4
LBSW0:
        ldr     r12, [r2, #-0x1C]
        ldr     lr, [r2, #-0x18]
        ldr     r3, [r0, #4]
        str     r12, [r0, #4]
        ldr     r12, [r0, #8]
        str     lr, [r0, #8]
        ldr     lr, [r2, #-0x14]
        ldr     r4, [r2, #-0x10]
        ldr     r5, [r0, #0xC]
        ldr     r6, [r0, #0x10]
        str     lr, [r0, #0xC]
        str     r4, [r0, #0x10]!
        str     r3, [r2, #-0x1C]
        str     r12, [r2, #-0x18]
        str     r5, [r2, #-0x14]
        str     r6, [r2, #-0x10]!
        subs    r1, r1, #1
        bne     LBSW0
LBSW1:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}


