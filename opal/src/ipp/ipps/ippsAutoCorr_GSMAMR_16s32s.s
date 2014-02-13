        .text
        .align  4
        .globl  _ippsAutoCorr_GSMAMR_16s32s


_ippsAutoCorr_GSMAMR_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x83, 30
        add     r12, sp, #8
        and     r12, r12, #0x1F
        rsb     r12, r12, #0
        mov     r5, r0
        add     r3, sp, #8
        and     r12, r12, #0x1F
        cmp     r5, #0
        add     r4, r3, r12
        mov     r7, r1
        beq     LDOV14
        cmp     r7, #0
        beq     LDOV14
        ldr     r6, [pc, #0x36C]
        cmp     r2, #0
        mov     r10, #0
        mov     r9, #1
        mov     r8, #0xF
        beq     LDOV0
        cmp     r2, #1
        beq     LDOV0
        cmp     r2, #3
        beq     LDOV0
        cmp     r2, #6
        beq     LDOV0
        cmp     r2, #7
        beq     LDOV0
        cmp     r2, #8
        beq     LDOV0
        cmp     r2, #0xB
        beq     LDOV0
        cmp     r2, #0xC
        beq     LDOV5
        cmp     r2, #0x19
        beq     LDOV0
        mvn     r0, #6
        add     sp, sp, #0x83, 30
        ldmia   sp!, {r4 - r11, pc}
LDOV0:
        ldr     r1, [pc, #0x30C]
        str     r8, [sp]
        mov     r0, r5
        mov     r3, #0xF0
        mov     r2, r4
        bl      _ippsMul_NR_16s_Sfs
LDOV1:
        add     r3, sp, #0x82, 30
        str     r10, [sp]
        mov     r2, #0xF0
        mov     r1, r4
        mov     r0, r4
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r3, [sp, #0x208]
        cmn     r3, #7, 2
        movle   r3, r10
        ble     LDOV2
        mov     r1, r4
        mov     r2, #0xF0
        mov     r0, #2
        bl      _ippsRShiftC_16s_I
        mov     r3, #1
LDOV2:
        cmp     r3, #0
        bne     LDOV1
        ldr     r3, [sp, #0x208]
        mov     r3, r3, lsl #1
        adds    r3, r3, #1
        str     r3, [sp, #0x208]
        beq     LDOV4
        movs    lr, r3, lsr #16
        bne     LDOV3
        bic     r12, r3, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        ldrne   r6, [pc, #0x28C]
        movne   r12, lr, lsl #1
        moveq   r12, r12, lsl #1
        ldrsh   r12, [r6, +r12]
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     r10, r12, asr #16
        b       LDOV4
LDOV3:
        movs    r12, r3, lsr #24
        moveq   lr, lr, lsl #1
        ldreqsh r10, [r6, +lr]
        beq     LDOV4
        ldr     lr, [pc, #0x25C]
        mov     r12, r12, lsl #1
        ldrsh   r10, [lr, +r12]
LDOV4:
        mov     r3, r3, lsl r10
        str     r3, [r7], #4
        add     r10, r10, #1
        str     r9, [sp, #4]
        str     r10, [sp]
        mov     r0, r4
        mov     r1, #0xF0
        mov     r3, #0xA
        mov     r2, r7
        bl      _ippsAutoCorr_G729_16s32s_Sfs
        mov     r0, r7
        mov     r1, #0xA
        bl      _ippsLagWindow_G729_32s_I
        mov     r0, #0
        add     sp, sp, #0x83, 30
        ldmia   sp!, {r4 - r11, pc}
LDOV5:
        ldr     r1, [pc, #0x214]
        str     r8, [sp]
        mov     r3, #0xF0
        mov     r2, r4
        mov     r0, r5
        bl      _ippsMul_NR_16s_Sfs
LDOV6:
        add     r3, sp, #0x82, 30
        str     r10, [sp]
        mov     r2, #0xF0
        mov     r1, r4
        mov     r0, r4
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r3, [sp, #0x208]
        cmn     r3, #7, 2
        movle   r3, r10
        ble     LDOV7
        mov     r1, r4
        mov     r2, #0xF0
        mov     r0, #2
        bl      _ippsRShiftC_16s_I
        mov     r3, #1
LDOV7:
        cmp     r3, #0
        bne     LDOV6
        ldr     r3, [sp, #0x208]
        mov     r3, r3, lsl #1
        adds    r3, r3, #1
        str     r3, [sp, #0x208]
        moveq   r12, r10
        beq     LDOV9
        movs    lr, r3, lsr #16
        bne     LDOV8
        bic     r12, r3, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        movne   r12, lr, lsl #1
        ldrne   lr, [pc, #0x184]
        moveq   r12, r12, lsl #1
        moveq   lr, r6
        ldrsh   r12, [lr, +r12]
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDOV9
LDOV8:
        movs    r12, r3, lsr #24
        moveq   lr, lr, lsl #1
        ldreqsh r12, [r6, +lr]
        beq     LDOV9
        ldr     lr, [pc, #0x154]
        mov     r12, r12, lsl #1
        ldrsh   r12, [lr, +r12]
LDOV9:
        mov     r3, r3, lsl r12
        str     r3, [r7]
        add     r12, r12, #1
        str     r12, [sp]
        str     r9, [sp, #4]
        add     r11, r7, #4
        mov     r1, #0xF0
        mov     r0, r4
        mov     r3, #0xA
        mov     r2, r11
        bl      _ippsAutoCorr_G729_16s32s_Sfs
        mov     r0, r11
        mov     r1, #0xA
        bl      _ippsLagWindow_G729_32s_I
        ldr     r1, [pc, #0x118]
        str     r8, [sp]
        mov     r0, r5
        mov     r3, #0xF0
        mov     r2, r4
        bl      _ippsMul_NR_16s_Sfs
LDOV10:
        add     r3, sp, #0x82, 30
        str     r10, [sp]
        mov     r2, #0xF0
        mov     r1, r4
        mov     r0, r4
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r3, [sp, #0x208]
        cmn     r3, #7, 2
        movle   r3, r10
        ble     LDOV11
        mov     r1, r4
        mov     r2, #0xF0
        mov     r0, #2
        bl      _ippsRShiftC_16s_I
        mov     r3, #1
LDOV11:
        cmp     r3, #0
        bne     LDOV10
        ldr     r3, [sp, #0x208]
        mov     r3, r3, lsl #1
        adds    r3, r3, #1
        str     r3, [sp, #0x208]
        beq     LDOV13
        movs    lr, r3, lsr #16
        bne     LDOV12
        bic     r12, r3, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        ldrne   r6, [pc, #0x8C]
        movne   r12, lr, lsl #1
        moveq   r12, r12, lsl #1
        ldrsh   r12, [r6, +r12]
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     r10, r12, asr #16
        b       LDOV13
LDOV12:
        movs    r12, r3, lsr #24
        moveq   lr, lr, lsl #1
        ldreqsh r10, [r6, +lr]
        beq     LDOV13
        ldr     lr, [pc, #0x5C]
        mov     r12, r12, lsl #1
        ldrsh   r10, [lr, +r12]
LDOV13:
        mov     r3, r3, lsl r10
        str     r3, [r7, #0x2C]
        add     r10, r10, #1
        str     r9, [sp, #4]
        str     r10, [sp]
        add     r7, r7, #0x30
        mov     r0, r4
        mov     r1, #0xF0
        mov     r3, #0xA
        mov     r2, r7
        bl      _ippsAutoCorr_G729_16s32s_Sfs
        mov     r0, r7
        mov     r1, #0xA
        bl      _ippsLagWindow_G729_32s_I
        mov     r0, #0
        add     sp, sp, #0x83, 30
        ldmia   sp!, {r4 - r11, pc}
LDOV14:
        mvn     r0, #7
        add     sp, sp, #0x83, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable2
        .long   win200_40
        .long   NormTable
        .long   win160_80
        .long   win232_8


