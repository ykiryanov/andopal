        .text
        .align  4
        .globl  _ippsThreshold_GT_32s_I


_ippsThreshold_GT_32s_I:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r1, #6
        mov     lr, #0
        blt     LAQE1
        sub     r12, r1, #6
        add     r3, r0, #4
LAQE0:
        ldr     r6, [r3, #-4]
        ldr     r5, [r3]
        ldr     r7, [r3, #4]
        cmp     r6, r2
        mov     r4, r2
        movlt   r4, r6
        cmp     r5, r2
        mov     r6, r2
        movlt   r6, r5
        ldr     r5, [r3, #8]
        str     r4, [r3, #-4]
        cmp     r7, r2
        mov     r4, r2
        movlt   r4, r7
        ldr     r7, [r3, #0xC]
        str     r6, [r3]
        cmp     r5, r2
        mov     r6, r2
        movlt   r6, r5
        cmp     r7, r2
        mov     r5, r2
        movlt   r5, r7
        add     lr, lr, #5
        str     r4, [r3, #4]
        str     r6, [r3, #8]
        str     r5, [r3, #0xC]
        cmp     lr, r12
        add     r3, r3, #0x14
        ble     LAQE0
LAQE1:
        add     r0, r0, lr, lsl #2
LAQE2:
        ldr     r12, [r0]
        mov     r3, r2
        add     lr, lr, #1
        cmp     r12, r2
        movlt   r3, r12
        str     r3, [r0], #4
        cmp     lr, r1
        blt     LAQE2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}


