        .text
        .align  4
        .globl  _ippsHarmonicFilter_NR_16s


_ippsHarmonicFilter_NR_16s:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r12, [sp, #0x1C]
        cmp     r2, #0
        beq     LDUG3
        cmp     r3, #0
        beq     LDUG3
        cmp     r12, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        cmp     r12, #5
        rsb     r1, r1, #0
        mov     r7, #0
        addlt   r1, r2, r1, lsl #1
        blt     LDUG1
        add     r1, r2, r1, lsl #1
        sub     r6, r12, #5
        mov     r5, r2
        mov     r4, r1
        mov     lr, r3
LDUG0:
        ldrsh   r9, [r5]
        ldrsh   r8, [r4]
        add     r7, r7, #4
        mov     r9, r9, lsl #15
        cmp     r7, r6
        mla     r9, r0, r8, r9
        add     r8, r9, #1, 18
        mov     r8, r8, asr #15
        strh    r8, [lr]
        ldrsh   r9, [r5, #2]
        ldrsh   r8, [r4, #2]
        mov     r9, r9, lsl #15
        mla     r9, r0, r8, r9
        add     r8, r9, #1, 18
        mov     r8, r8, asr #15
        strh    r8, [lr, #2]
        ldrsh   r9, [r5, #4]
        ldrsh   r8, [r4, #4]
        mov     r9, r9, lsl #15
        mla     r9, r0, r8, r9
        add     r8, r9, #1, 18
        mov     r8, r8, asr #15
        strh    r8, [lr, #4]
        ldrsh   r9, [r5, #6]
        ldrsh   r8, [r4, #6]
        add     r5, r5, #8
        mov     r9, r9, lsl #15
        add     r4, r4, #8
        mla     r9, r0, r8, r9
        add     r8, r9, #1, 18
        mov     r8, r8, asr #15
        strh    r8, [lr, #6]
        add     lr, lr, #8
        ble     LDUG0
LDUG1:
        add     r2, r2, r7, lsl #1
        add     r3, r3, r7, lsl #1
        mov     lr, r7, lsl #1
LDUG2:
        ldrsh   r5, [r2], #2
        ldrsh   r4, [r1, +lr]
        mov     r5, r5, lsl #15
        add     lr, lr, #2
        mla     r5, r0, r4, r5
        add     r7, r7, #1
        cmp     r7, r12
        add     r4, r5, #1, 18
        mov     r4, r4, asr #15
        strh    r4, [r3], #2
        blt     LDUG2
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LDUG3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


