        .text
        .align  4
        .globl  ownsCvt32scTo16sc


ownsCvt32scTo16sc:
        stmdb   sp!, {r4 - r10, lr}
        mov     r4, r0
        ldr     r3, [r4]
        eor     lr, r3, r3, asr #31
        mov     r12, r2, lsl #1
        cmp     r12, #1
        suble   lr, lr, r3, asr #31
        ble     LBVS2
        sub     lr, lr, r3, asr #31
        sub     r3, r12, #1
        add     r12, r4, #4
LBVS0:
        ldr     r5, [r12]
        eor     r6, r5, r5, asr #31
        sub     r6, r6, r5, asr #31
        cmp     r6, lr
        ble     LBVS1
        ldr     lr, [r12]
        eor     r5, lr, lr, asr #31
        sub     lr, r5, lr, asr #31
LBVS1:
        subs    r3, r3, #1
        add     r12, r12, #4
        bne     LBVS0
LBVS2:
        mvn     r3, #1
        add     r12, r3, #2, 18
        cmp     r12, lr
        mov     r12, #0
        movge   r0, r12
        bge     LBVS4
        mov     r0, r12
        add     r5, r3, #2, 18
LBVS3:
        mov     lr, lr, asr #1
        cmp     r5, lr
        add     r0, r0, #1
        blt     LBVS3
LBVS4:
        cmp     r2, #0
        ble     LBVS8
        cmp     r2, #5
        sub     lr, r2, #1
        addlt   lr, r4, lr, lsl #3
        blt     LBVS6
        add     lr, r4, lr, lsl #3
        mvn     r8, #0
        mvn     r7, #2
        sub     r6, r2, #5
        sub     r5, r1, #2
LBVS5:
        rsb     r4, r12, #0
        ldr     r10, [lr, +r4, lsl #3]
        add     r4, lr, r4, lsl #3
        rsb     r9, r12, r8
        mov     r10, r10, asr r0
        strh    r10, [r5, #2]
        ldr     r10, [r4, #4]
        rsb     r4, r12, r7
        mov     r10, r10, asr r0
        strh    r10, [r5, #4]
        ldr     r10, [lr, +r9, lsl #3]
        add     r9, lr, r9, lsl #3
        mov     r10, r10, asr r0
        strh    r10, [r5, #6]
        ldr     r10, [r9, #4]
        rsb     r9, r12, r3
        add     r12, r12, #4
        mov     r10, r10, asr r0
        strh    r10, [r5, #8]
        ldr     r10, [lr, +r9, lsl #3]
        cmp     r12, r6
        add     r9, lr, r9, lsl #3
        mov     r10, r10, asr r0
        strh    r10, [r5, #0xA]
        ldr     r10, [r9, #4]
        add     r9, lr, r4, lsl #3
        mov     r10, r10, asr r0
        strh    r10, [r5, #0xC]
        ldr     r4, [lr, +r4, lsl #3]
        mov     r4, r4, asr r0
        strh    r4, [r5, #0xE]
        ldr     r9, [r9, #4]
        mov     r9, r9, asr r0
        strh    r9, [r5, #0x10]!
        ble     LBVS5
LBVS6:
        mov     r3, r12, lsl #2
        sub     r3, r3, #2
        add     r1, r3, r1
LBVS7:
        rsb     r3, r12, #0
        ldr     r4, [lr, +r3, lsl #3]
        add     r3, lr, r3, lsl #3
        add     r12, r12, #1
        mov     r4, r4, asr r0
        strh    r4, [r1, #2]
        ldr     r3, [r3, #4]
        cmp     r12, r2
        mov     r3, r3, asr r0
        strh    r3, [r1, #4]!
        blt     LBVS7
LBVS8:
        ldmia   sp!, {r4 - r10, pc}


