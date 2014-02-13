        .text
        .align  4
        .globl  _ippsFlip_32f_I


_ippsFlip_32f_I:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r1, #0
        mov     r4, #0
        mov     r3, r4
        mov     r2, #1
        movlt   r3, r2
        add     r3, r1, r3
        sub     r2, r1, #1
        mov     r3, r3, asr #1
        cmp     r3, #0
        ble     LBSU3
        cmp     r3, #5
        blt     LBSU1
        mov     r1, r2, lsl #2
        sub     r1, r1, #4
        add     r1, r1, r0
        sub     lr, r3, #5
        add     r12, r0, #4
LBSU0:
        ldr     r6, [r1, #4]
        ldr     r5, [r12, #-4]
        add     r4, r4, #4
        str     r6, [r12, #-4]
        ldr     r6, [r1]
        str     r5, [r1, #4]
        ldr     r5, [r12]
        str     r6, [r12]
        ldr     r6, [r1, #-4]
        str     r5, [r1]
        ldr     r5, [r12, #4]
        str     r6, [r12, #4]
        ldr     r6, [r1, #-8]
        str     r5, [r1, #-4]
        ldr     r5, [r12, #8]
        str     r6, [r12, #8]
        cmp     r4, lr
        str     r5, [r1, #-8]
        add     r12, r12, #0x10
        sub     r1, r1, #0x10
        sub     r2, r2, #4
        ble     LBSU0
LBSU1:
        add     r2, r0, r2, lsl #2
        add     r0, r0, r4, lsl #2
LBSU2:
        ldr     r12, [r2]
        ldr     r1, [r0]
        add     r4, r4, #1
        str     r12, [r0], #4
        cmp     r4, r3
        str     r1, [r2], #-4
        blt     LBSU2
LBSU3:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}


