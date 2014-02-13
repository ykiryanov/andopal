        .text
        .align  4
        .globl  ownNorm_32s_I


ownNorm_32s_I:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r2, #0
        ble     LDMU4
        ldr     r12, [pc, #0xA0]
        ldr     r3, [pc, #0xA0]
        mov     lr, #2, 2
LDMU0:
        ldr     r4, [r0]
        cmp     r4, #0
        mov     r6, r4
        moveq   r5, #0
        beq     LDMU3
        cmn     r4, #1
        streq   lr, [r0]
        moveq   r5, #0x1F
        beq     LDMU3
        cmp     r4, #0
        mvnlt   r6, r4
        cmp     r6, #0
        moveq   r5, #0
        beq     LDMU2
        movs    r5, r6, lsr #16
        bne     LDMU1
        bic     r6, r6, #0xFF, 8
        bic     r5, r6, #0xFF, 16
        movs    r6, r5, asr #8
        movne   r6, r6, lsl #1
        ldrnesh r5, [r3, +r6]
        moveq   r5, r5, lsl #1
        ldreqsh r5, [r12, +r5]
        add     r5, r5, #0x10
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
        b       LDMU2
LDMU1:
        movs    r6, r6, lsr #24
        movne   r6, r6, lsl #1
        ldrnesh r5, [r3, +r6]
        moveq   r5, r5, lsl #1
        ldreqsh r5, [r12, +r5]
LDMU2:
        mov     r4, r4, lsl r5
        str     r4, [r0]
LDMU3:
        strh    r5, [r1], #2
        subs    r2, r2, #1
        add     r0, r0, #4
        bne     LDMU0
LDMU4:
        ldmia   sp!, {r4 - r6, pc}
        .long   NormTable2
        .long   NormTable


