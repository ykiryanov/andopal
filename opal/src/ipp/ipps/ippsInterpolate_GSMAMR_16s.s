        .text
        .align  4
        .globl  _ippsInterpolate_GSMAMR_16s


_ippsInterpolate_GSMAMR_16s:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LDPA3
        cmp     r1, #0
        beq     LDPA3
        cmp     r2, #0
        beq     LDPA3
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r3, #5
        mov     r6, #0
        blt     LDPA1
        sub     r5, r3, #5
        mov     r4, r1
        mov     lr, r0
        mov     r12, r2
LDPA0:
        ldrsh   r8, [lr]
        ldrsh   r7, [r4]
        add     r6, r6, #4
        mov     r8, r8, lsl #16
        cmp     r6, r5
        add     r8, r7, r8, asr #18
        sub     r8, r8, r7, asr #2
        strh    r8, [r12]
        ldrsh   r8, [lr, #2]
        ldrsh   r7, [r4, #2]
        mov     r8, r8, lsl #16
        add     r8, r7, r8, asr #18
        sub     r8, r8, r7, asr #2
        strh    r8, [r12, #2]
        ldrsh   r8, [lr, #4]
        ldrsh   r7, [r4, #4]
        mov     r8, r8, lsl #16
        add     r8, r7, r8, asr #18
        sub     r8, r8, r7, asr #2
        strh    r8, [r12, #4]
        ldrsh   r8, [lr, #6]
        ldrsh   r7, [r4, #6]
        add     r4, r4, #8
        mov     r8, r8, lsl #16
        add     lr, lr, #8
        add     r8, r7, r8, asr #18
        sub     r8, r8, r7, asr #2
        strh    r8, [r12, #6]
        add     r12, r12, #8
        ble     LDPA0
LDPA1:
        add     r1, r1, r6, lsl #1
        add     r0, r0, r6, lsl #1
        add     r2, r2, r6, lsl #1
LDPA2:
        ldrsh   lr, [r0], #2
        ldrsh   r12, [r1], #2
        mov     lr, lr, lsl #16
        add     r6, r6, #1
        add     lr, r12, lr, asr #18
        cmp     r6, r3
        sub     lr, lr, r12, asr #2
        strh    lr, [r2], #2
        blt     LDPA2
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LDPA3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


