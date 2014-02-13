        .text
        .align  4
        .globl  _ippsHighPassFilter_GSMFR_16s


_ippsHighPassFilter_GSMFR_16s:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r0, #0
        beq     LDTH2
        cmp     r1, #0
        beq     LDTH2
        cmp     r3, #0
        beq     LDTH2
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        ldr     r12, [r3, #4]
        ldr     r5, [r3]
        cmp     r2, #0
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        ble     LDTH1
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
LDTH0:
        ldrsh   r6, [r0], #2
        and     r4, r5, r12
        mov     r6, r6, lsl #16
        rsb     r7, r4, r4, lsl #10
        mov     r5, r5, asr #15
        mov     r6, r6, asr #19
        rsb     r7, r4, r7, lsl #5
        subs    r2, r2, #1
        mov     r6, r6, lsl #2
        add     r4, r7, #1, 18
        mov     r5, r5, lsl #16
        mov     r6, r6, lsl #16
        mov     r7, r6, asr #16
        sub     r6, r7, lr
        mov     r5, r5, asr #16
        mov     lr, r7
        mov     r6, r6, lsl #16
        rsb     r7, r5, r5, lsl #10
        rsb     r7, r5, r7, lsl #5
        add     r4, r7, r4, asr #15
        mov     r6, r6, asr #16
        add     r5, r4, r6, lsl #15
        add     r4, r5, #1, 18
        mov     r4, r4, asr #15
        strh    r4, [r1], #2
        bne     LDTH0
LDTH1:
        mov     r0, #0
        str     lr, [r3, #4]
        str     r5, [r3]
        ldmia   sp!, {r4 - r7, pc}
LDTH2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


