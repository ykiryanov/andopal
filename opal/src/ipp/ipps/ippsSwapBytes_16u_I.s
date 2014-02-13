        .text
        .align  4
        .globl  _ippsSwapBytes_16u_I


_ippsSwapBytes_16u_I:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r7, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r1, #5
        mov     r12, #0
        blt     LASA1
        sub     r3, r1, #5
        mov     r2, r0
LASA0:
        ldrh    r7, [r2]
        ldrh    r5, [r2, #2]
        ldrh    r4, [r2, #4]
        ldrh    lr, [r2, #6]
        mov     r6, r7, asr #8
        orr     r7, r6, r7, lsl #8
        mov     r6, r5, asr #8
        orr     r5, r6, r5, lsl #8
        strh    r5, [r2, #2]
        mov     r5, r4, asr #8
        orr     r4, r5, r4, lsl #8
        strh    r4, [r2, #4]
        mov     r4, lr, asr #8
        orr     lr, r4, lr, lsl #8
        add     r12, r12, #4
        strh    r7, [r2]
        strh    lr, [r2, #6]
        cmp     r12, r3
        add     r2, r2, #8
        ble     LASA0
LASA1:
        add     r0, r0, r12, lsl #1
LASA2:
        ldrh    r3, [r0]
        add     r12, r12, #1
        cmp     r12, r1
        mov     r2, r3, asr #8
        orr     r3, r2, r3, lsl #8
        strh    r3, [r0], #2
        blt     LASA2
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}


