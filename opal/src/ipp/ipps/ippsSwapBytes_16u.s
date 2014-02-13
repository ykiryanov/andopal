        .text
        .align  4
        .globl  _ippsSwapBytes_16u


_ippsSwapBytes_16u:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        beq     LASB3
        cmp     r1, #0
        beq     LASB3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r2, #5
        mov     r4, #0
        blt     LASB1
        sub     lr, r2, #5
        mov     r12, r0
        mov     r3, r1
LASB0:
        ldrh    r6, [r12]
        add     r4, r4, #4
        cmp     r4, lr
        mov     r5, r6, asr #8
        orr     r6, r5, r6, lsl #8
        strh    r6, [r3]
        ldrh    r6, [r12, #2]
        mov     r5, r6, asr #8
        orr     r6, r5, r6, lsl #8
        strh    r6, [r3, #2]
        ldrh    r6, [r12, #4]
        mov     r5, r6, asr #8
        orr     r6, r5, r6, lsl #8
        strh    r6, [r3, #4]
        ldrh    r6, [r12, #6]
        add     r12, r12, #8
        mov     r5, r6, asr #8
        orr     r6, r5, r6, lsl #8
        strh    r6, [r3, #6]
        add     r3, r3, #8
        ble     LASB0
LASB1:
        add     r0, r0, r4, lsl #1
        add     r1, r1, r4, lsl #1
LASB2:
        ldrh    r12, [r0], #2
        add     r4, r4, #1
        mov     r3, r12, asr #8
        orr     r12, r3, r12, lsl #8
        strh    r12, [r1], #2
        cmp     r4, r2
        blt     LASB2
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LASB3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


