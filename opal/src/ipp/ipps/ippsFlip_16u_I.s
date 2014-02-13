        .text
        .align  4
        .globl  _ippsFlip_16u_I


_ippsFlip_16u_I:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r6, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        mov     r4, r1, asr #1
        cmp     r4, #0
        sub     r1, r1, #1
        ble     LASE3
        cmp     r4, #5
        mov     lr, #0
        blt     LASE1
        sub     r12, r4, #5
        add     r3, r0, r1, lsl #1
        mov     r2, r0
LASE0:
        ldrh    r6, [r3]
        ldrh    r5, [r2]
        add     lr, lr, #4
        strh    r6, [r2]
        ldrh    r6, [r3, #-2]
        strh    r5, [r3]
        ldrh    r5, [r2, #2]
        strh    r6, [r2, #2]
        ldrh    r6, [r3, #-4]
        strh    r5, [r3, #-2]
        ldrh    r5, [r2, #4]
        strh    r6, [r2, #4]
        ldrh    r6, [r3, #-6]
        strh    r5, [r3, #-4]
        ldrh    r5, [r2, #6]
        strh    r6, [r2, #6]
        cmp     lr, r12
        strh    r5, [r3, #-6]
        add     r2, r2, #8
        sub     r3, r3, #8
        sub     r1, r1, #4
        ble     LASE0
LASE1:
        add     r1, r0, r1, lsl #1
        add     r0, r0, lr, lsl #1
LASE2:
        ldrh    r3, [r1]
        ldrh    r2, [r0]
        add     lr, lr, #1
        strh    r3, [r0], #2
        cmp     lr, r4
        strh    r2, [r1], #-2
        blt     LASE2
LASE3:
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}


