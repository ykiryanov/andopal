        .text
        .align  4
        .globl  _ippsFlip_64f_I


_ippsFlip_64f_I:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r1, #0
        mov     r4, #0
        mov     r3, r4
        mov     r2, #1
        movlt   r3, r2
        add     r3, r1, r3
        sub     r2, r1, #1
        mov     r3, r3, asr #1
        cmp     r3, #0
        ble     LBSS3
        cmp     r3, #5
        blt     LBSS1
        mov     r1, r2, lsl #3
        add     r1, r1, #0xC
        add     r1, r1, r0
        sub     lr, r3, #5
        sub     r12, r0, #4
LBSS0:
        ldr     r7, [r1, #-0xC]
        ldr     r5, [r1, #-8]
        ldr     r6, [r12, #4]
        str     r7, [r12, #4]
        ldr     r7, [r12, #8]
        str     r5, [r12, #8]
        str     r6, [r1, #-0xC]
        ldr     r5, [r1, #-0x14]
        str     r7, [r1, #-8]
        ldr     r6, [r1, #-0x10]
        ldr     r7, [r12, #0xC]
        str     r5, [r12, #0xC]
        ldr     r5, [r12, #0x10]
        str     r6, [r12, #0x10]
        str     r7, [r1, #-0x14]
        ldr     r6, [r1, #-0x1C]
        str     r5, [r1, #-0x10]
        ldr     r5, [r1, #-0x18]
        ldr     r7, [r12, #0x14]
        str     r6, [r12, #0x14]
        ldr     r6, [r12, #0x18]
        str     r5, [r12, #0x18]
        str     r7, [r1, #-0x1C]
        ldr     r5, [r1, #-0x24]
        str     r6, [r1, #-0x18]
        ldr     r6, [r1, #-0x20]
        ldr     r7, [r12, #0x1C]
        str     r5, [r12, #0x1C]
        ldr     r5, [r12, #0x20]
        str     r6, [r12, #0x20]!
        add     r4, r4, #4
        str     r7, [r1, #-0x24]
        str     r5, [r1, #-0x20]!
        cmp     r4, lr
        sub     r2, r2, #4
        ble     LBSS0
LBSS1:
        mov     r1, r2, lsl #3
        mov     r2, r4, lsl #3
        add     r1, r1, #0xC
        sub     r2, r2, #4
        add     r1, r1, r0
        add     r0, r2, r0
LBSS2:
        ldr     r5, [r1, #-0xC]
        ldr     lr, [r1, #-8]
        ldr     r12, [r0, #4]
        ldr     r2, [r0, #8]
        str     r5, [r0, #4]
        str     lr, [r0, #8]!
        add     r4, r4, #1
        str     r12, [r1, #-0xC]
        str     r2, [r1, #-8]!
        cmp     r4, r3
        blt     LBSS2
LBSS3:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}


