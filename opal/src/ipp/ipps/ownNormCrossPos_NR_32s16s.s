        .text
        .align  4
        .globl  ownNormCrossPos_NR_32s16s


ownNormCrossPos_NR_32s16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x30]
        ldr     lr, [sp, #0x2C]
        cmp     r12, #0
        ble     LDMV14
        ldr     r8, [pc, #0x1D0]
        ldr     r7, [pc, #0x1D0]
        mov     r4, #2, 2
        sub     r5, r4, #2, 18
        mov     r9, #0
LDMV0:
        ldr     r6, [r1], #4
        cmp     r6, #0
        ble     LDMV12
        cmp     r6, #0
        moveq   r4, #0
        beq     LDMV3
        movs    r4, r6, asr #16
        bne     LDMV1
        bic     r4, r6, #0xFF, 8
        bic     r4, r4, #0xFF, 16
        movs    r10, r4, asr #8
        movne   r10, r10, lsl #1
        ldrnesh r4, [r7, +r10]
        moveq   r4, r4, lsl #1
        ldreqsh r4, [r8, +r4]
        add     r4, r4, #0x10
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
        b       LDMV2
LDMV1:
        bic     r4, r4, #0xFF, 8
        bic     r4, r4, #0xFF, 16
        movs    r10, r4, asr #8
        movne   r10, r10, lsl #1
        ldrnesh r4, [r7, +r10]
        moveq   r4, r4, lsl #1
        ldreqsh r4, [r8, +r4]
LDMV2:
        mov     r6, r6, lsl r4
LDMV3:
        cmp     r5, r6
        movle   r6, #0xFF
        orrle   r6, r6, #0x7F, 24
        ble     LDMV4
        add     r6, r6, #2, 18
        mov     r6, r6, asr #16
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
LDMV4:
        mul     r6, r6, r6
        cmp     r6, #2, 4
        movge   r10, #0
        movlt   r10, #1
        add     r4, r10, r4, lsl #1
        rsb     r10, r10, #0xF
        mov     r6, r6, asr r10
        sub     r11, r0, #4
        sub     r10, r12, r9
        ldr     r11, [r11, +r10, lsl #2]
        mov     r6, r6, lsl #16
        cmn     r11, #7, 2
        mov     r6, r6, asr #16
        mvngt   r10, #2, 2
        bgt     LDMV5
        cmp     r11, #3, 2
        movge   r10, r11, lsl #1
        movlt   r10, #2, 2
LDMV5:
        cmp     r10, #0
        moveq   r11, #0
        beq     LDMV10
        movs    r11, r10, asr #16
        bne     LDMV8
        bic     r11, r10, #0xFF, 8
        bic     r11, r11, #0xFF, 16
        str     r11, [sp, #4]
        movs    r11, r11, asr #8
        str     r11, [sp]
        bne     LDMV6
        ldr     r11, [sp, #4]
        mov     r11, r11, lsl #1
        ldrsh   r11, [r8, +r11]
        b       LDMV7
LDMV6:
        ldr     r11, [sp]
        mov     r11, r11, lsl #1
        ldrsh   r11, [r7, +r11]
LDMV7:
        add     r11, r11, #0x10
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
        b       LDMV9
LDMV8:
        bic     r11, r11, #0xFF, 8
        bic     r11, r11, #0xFF, 16
        str     r11, [sp]
        movs    r11, r11, asr #8
        movne   r11, r11, lsl #1
        ldrnesh r11, [r7, +r11]
        bne     LDMV9
        ldr     r11, [sp]
        mov     r11, r11, lsl #1
        ldrsh   r11, [r8, +r11]
LDMV9:
        mov     r10, r10, lsl r11
LDMV10:
        sub     r4, r4, r11
        cmp     r5, r10
        mov     r4, r4, lsl #16
        mov     r4, r4, asr #16
        movle   r10, #0xFF
        orrle   r10, r10, #0x7F, 24
        ble     LDMV11
        add     r10, r10, #2, 18
        mov     r10, r10, asr #16
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
LDMV11:
        mov     r11, r9, lsl #1
        cmp     r6, r10
        strh    r10, [r2, +r11]
        subge   r4, r4, #1
        movge   r6, r6, asr #1
        b       LDMV13
LDMV12:
        mov     r4, #0x1F
        mov     r6, #0
        mov     r11, r9, lsl #1
LDMV13:
        strh    r6, [r3, +r11]
        add     r9, r9, #1
        cmp     r9, r12
        strh    r4, [lr, +r11]
        blt     LDMV0
LDMV14:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable2
        .long   NormTable


