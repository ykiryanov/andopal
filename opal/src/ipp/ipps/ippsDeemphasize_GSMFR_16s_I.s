        .text
        .align  4
        .globl  _ippsDeemphasize_GSMFR_16s_I


_ippsDeemphasize_GSMFR_16s_I:
        stmdb   sp!, {r4, r5, lr}
        cmp     r0, #0
        beq     LDTI4
        cmp     r2, #0
        beq     LDTI4
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4, r5, pc}
        cmp     r1, #0
        ble     LDTI3
        mov     lr, #0x85, 30
        mov     r12, #0xFE, 30
        mov     r3, #0xFF
        orr     lr, lr, #0x1B, 22
        orr     r12, r12, #0x3F, 22
        orr     r3, r3, #0x7F, 24
LDTI0:
        ldrsh   r5, [r2]
        ldrsh   r4, [r0]
        mul     r5, r5, lr
        add     r5, r5, #1, 18
        mov     r5, r5, asr #15
        mov     r5, r5, lsl #16
        add     r5, r4, r5, asr #16
        cmp     r3, r5
        movlt   r4, r3
        blt     LDTI1
        cmn     r5, #2, 18
        movge   r4, r5, lsl #16
        movge   r4, r4, asr #16
        mvnlt   r4, r3
LDTI1:
        mov     r5, r4, lsl #1
        cmp     r3, r5
        strh    r4, [r2]
        movlt   r4, r3
        blt     LDTI2
        cmn     r5, #2, 18
        movge   r5, r5, lsl #16
        movge   r4, r5, asr #16
        mvnlt   r4, r3
LDTI2:
        and     r4, r4, r12
        strh    r4, [r0], #2
        subs    r1, r1, #1
        bne     LDTI0
LDTI3:
        mov     r0, #0
        ldmia   sp!, {r4, r5, pc}
LDTI4:
        mvn     r0, #7
        ldmia   sp!, {r4, r5, pc}


