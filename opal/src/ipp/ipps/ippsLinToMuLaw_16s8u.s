        .text
        .align  4
        .globl  _ippsLinToMuLaw_16s8u


_ippsLinToMuLaw_16s8u:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LBKY4
        cmp     r1, #0
        beq     LBKY4
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmp     r2, #0
        ble     LBKY3
        mov     r3, #0xFF
        orr     r3, r3, #0x1F, 24
LBKY0:
        ldrsh   r12, [r0], #2
        cmp     r12, #0
        mvnlt   lr, r12
        movlt   lr, lr, asr #2
        movge   lr, r12, asr #2
        add     lr, lr, #0x21
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        cmp     r3, lr
        movlt   lr, r3
        mov     r4, lr, asr #6
        cmp     r4, #0
        moveq   r5, #1
        beq     LBKY2
        mov     r5, #1
LBKY1:
        mov     r4, r4, asr #1
        cmp     r4, #0
        add     r5, r5, #1
        bne     LBKY1
LBKY2:
        cmp     r12, #0
        mov     r5, r5, lsl #16
        mov     r12, r5, asr #16
        mov     lr, lr, asr r12
        and     lr, lr, #0xF
        rsb     r12, r12, #8
        rsb     lr, lr, #0xF
        orr     r12, lr, r12, lsl #4
        and     r12, r12, #0xFF
        strltb  r12, [r1]
        orrge   r12, r12, #0x80
        strgeb  r12, [r1]
        subs    r2, r2, #1
        add     r1, r1, #1
        bne     LBKY0
LBKY3:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LBKY4:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


