        .text
        .align  4
        .globl  _ippsOpenLoopPitchSearch_AMRWBE_16s


_ippsOpenLoopPitchSearch_AMRWBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        ldr     r12, [sp, #0x78]
        ldr     r10, [sp, #0x6C]
        ldr     r9, [sp, #0x70]
        ldr     r8, [sp, #0x74]
        ldr     r11, [sp, #0x7C]
        ldr     r7, [sp, #0x84]
        ldr     lr, [sp, #0x88]
        str     r12, [sp, #0x28]
        ldr     r12, [sp, #0x80]
        cmp     r0, #0
        str     r0, [sp, #0xC]
        mov     r6, r2
        mov     r5, r3
        beq     LDEG40
        cmp     r1, #0
        beq     LDEG40
        cmp     r6, #0
        beq     LDEG40
        cmp     r5, #0
        beq     LDEG40
        cmp     r10, #0
        beq     LDEG40
        cmp     r9, #0
        beq     LDEG40
        cmp     r8, #0
        beq     LDEG40
        ldr     r0, [sp, #0x28]
        cmp     r0, #0
        beq     LDEG40
        cmp     r11, #0
        beq     LDEG40
        cmp     r12, #0
        ble     LDEG41
        ldrsh   r4, [r6]
        ldr     r0, [pc, #0x7D4]
        cmp     lr, r7
        str     r4, [sp]
        rsb     r4, r4, lr
        mov     r2, #0x51, 30
        add     r4, r0, r4, lsl #1
        add     r0, r0, #0x83, 30
        add     r2, r2, r4
        movle   r4, #0
        ble     LDEG5
        mov     r4, #2, 2
        str     r4, [sp, #8]
        mvn     r3, #2, 2
        str     r8, [sp, #0x14]
        str     r9, [sp, #0x18]
        str     r10, [sp, #0x1C]
        ldr     r8, [sp, #8]
        ldr     r9, [sp]
        ldr     r10, [sp, #0xC]
        str     r3, [sp, #4]
        mvn     r3, #0
        mov     r4, #0
        str     r1, [sp, #0x38]
        str     r3, [sp, #0x3C]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x24]
LDEG0:
        cmp     r12, #0
        movle   r6, #0
        ble     LDEG3
        rsb     r1, lr, #0
        str     lr, [sp, #0x34]
        str     r7, [sp, #0x30]
        ldr     lr, [sp, #0x3C]
        ldr     r7, [sp, #4]
        mov     r6, #0
        add     r1, r10, r1, lsl #1
        mov     r3, r10
        mov     r5, r12
        str     r12, [sp, #0x2C]
        str     r11, [sp, #0x10]
LDEG1:
        ldrsh   r10, [r1], #2
        ldrsh   r12, [r3], #2
        mul     r10, r12, r10
        cmp     r10, #1, 2
        mvneq   r12, #2, 2
        movne   r12, r10, lsl #1
        mov     r10, r6, asr #31
        adds    r6, r6, r12
        adc     r12, r10, r12, asr #31
        subs    r10, r6, r7
        sbcs    r11, r12, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        mvnne   r6, #2, 2
        bne     LDEG2
        cmp     r6, #2, 2
        sbcs    r12, r12, lr
        movlt   r6, #2, 2
LDEG2:
        subs    r5, r5, #1
        bne     LDEG1
        ldr     lr, [sp, #0x34]
        ldr     r7, [sp, #0x30]
        ldr     r12, [sp, #0x2C]
        ldr     r11, [sp, #0x10]
        ldr     r10, [sp, #0xC]
LDEG3:
        ldrsh   r3, [r0], #-2
        mvn     r1, #0
        add     r1, r1, #2, 18
        and     r1, r1, r6, asr #1
        mul     r1, r3, r1
        mov     r6, r6, asr #16
        mov     r5, r6, lsl #16
        mov     r1, r1, asr #15
        cmp     r9, #0
        mov     r5, r5, asr #16
        mla     r1, r5, r3, r1
        mov     r3, r1, lsl #1
        ble     LDEG4
        ldrsh   r1, [r11]
        cmp     r1, #0
        ble     LDEG4
        ldrsh   r5, [r2], #-2
        mvn     r1, #0
        add     r1, r1, #2, 18
        and     r1, r1, r3, asr #1
        mul     r1, r1, r5
        mov     r3, r3, asr #16
        mov     r3, r3, lsl #16
        mov     r1, r1, asr #15
        mov     r3, r3, asr #16
        mla     r1, r3, r5, r1
        mov     r3, r1, lsl #1
LDEG4:
        cmp     r3, r8
        movge   r4, lr
        movge   r8, r3
        sub     lr, lr, #1
        cmp     lr, r7
        bgt     LDEG0
        ldr     r1, [sp, #0x38]
        ldr     r8, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0x24]
LDEG5:
        mov     lr, #1
        cmp     r12, #0
        mov     r0, lr
        movle   r7, #0
        ble     LDEG10
        rsb     r7, r4, #0
        mvn     r3, #2, 2
        add     r7, r1, r7, lsl #1
        str     r7, [sp, #8]
        str     r9, [sp, #0x18]
        ldr     r9, [sp, #8]
        mov     r7, #0
        mvn     r2, #0
        str     r11, [sp, #0x10]
        str     r8, [sp, #0x14]
        str     r10, [sp, #0x1C]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x24]
LDEG6:
        ldrsh   r8, [r1], #2
        ldrsh   r6, [r9], #2
        mul     r5, r8, r6
        cmp     r5, #1, 2
        mvneq   r5, #2, 2
        movne   r5, r5, lsl #1
        mov     r10, r7, asr #31
        adds    r7, r7, r5
        adc     r5, r10, r5, asr #31
        subs    r11, r7, r3
        sbcs    r10, r5, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        mvnne   r7, #2, 2
        bne     LDEG7
        cmp     r7, #2, 2
        sbcs    r5, r5, r2
        movlt   r7, #2, 2
LDEG7:
        mul     r6, r6, r6
        cmp     r6, #1, 2
        mvneq   r5, #2, 2
        movne   r5, r6, lsl #1
        mov     r6, r0, asr #31
        adds    r0, r0, r5
        adc     r5, r6, r5, asr #31
        subs    r10, r0, r3
        sbcs    r6, r5, #0
        movlt   r10, #0
        movlt   r6, #0
        orrs    r6, r10, r6
        mvnne   r0, #2, 2
        bne     LDEG8
        cmp     r0, #2, 2
        sbcs    r5, r5, r2
        movlt   r0, #2, 2
LDEG8:
        mul     r8, r8, r8
        cmp     r8, #1, 2
        mvneq   r5, #2, 2
        movne   r5, r8, lsl #1
        mov     r6, lr, asr #31
        adds    lr, lr, r5
        adc     r5, r6, r5, asr #31
        subs    r8, lr, r3
        sbcs    r6, r5, #0
        movlt   r8, #0
        movlt   r6, #0
        orrs    r6, r8, r6
        mvnne   lr, #2, 2
        bne     LDEG9
        cmp     lr, #2, 2
        sbcs    r5, r5, r2
        movlt   lr, #2, 2
LDEG9:
        subs    r12, r12, #1
        bne     LDEG6
        ldr     r11, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0x24]
LDEG10:
        cmp     r7, #0
        mov     r12, r7
        moveq   r1, #0
        streq   r1, [sp, #8]
        beq     LDEG14
        cmn     r7, #1
        beq     LDEG36
        cmp     r7, #0
        mvnlt   r12, r7
        cmp     r12, #0
        moveq   r1, #0
        streq   r1, [sp, #8]
        beq     LDEG13
        movs    r1, r12, lsr #16
        bne     LDEG11
        bic     r12, r12, #0xFF, 8
        bic     r1, r12, #0xFF, 16
        movs    r12, r1, asr #8
        movne   r1, r12, lsl #1
        ldrne   r12, [pc, #0x4AC]
        ldreq   r12, [pc, #0x4AC]
        moveq   r1, r1, lsl #1
        ldrsh   r1, [r12, +r1]
        add     r1, r1, #0x10
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        str     r1, [sp, #8]
        b       LDEG13
LDEG11:
        movs    r12, r12, lsr #24
        bne     LDEG12
        ldr     r12, [pc, #0x484]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r12, +r1]
        str     r1, [sp, #8]
        b       LDEG13
LDEG12:
        ldr     r1, [pc, #0x46C]
        mov     r12, r12, lsl #1
        ldrsh   r12, [r1, +r12]
        str     r12, [sp, #8]
LDEG13:
        ldr     r1, [sp, #8]
        mov     r7, r7, lsl r1
LDEG14:
        cmp     r0, #0
        mov     r12, r0
        moveq   r12, #0
        beq     LDEG18
        cmn     r0, #1
        moveq   r0, #2, 2
        moveq   r12, #0x1F
        beq     LDEG18
        cmp     r0, #0
        mvnlt   r12, r0
        cmp     r12, #0
        moveq   r12, #0
        beq     LDEG17
        movs    r1, r12, lsr #16
        bne     LDEG15
        bic     r12, r12, #0xFF, 8
        bic     r1, r12, #0xFF, 16
        movs    r12, r1, asr #8
        movne   r1, r12, lsl #1
        ldrne   r12, [pc, #0x408]
        ldreq   r12, [pc, #0x408]
        moveq   r1, r1, lsl #1
        ldrsh   r1, [r12, +r1]
        add     r1, r1, #0x10
        mov     r1, r1, lsl #16
        mov     r12, r1, asr #16
        b       LDEG17
LDEG15:
        movs    r12, r12, lsr #24
        bne     LDEG16
        ldr     r12, [pc, #0x3E4]
        mov     r1, r1, lsl #1
        ldrsh   r12, [r12, +r1]
        b       LDEG17
LDEG16:
        ldr     r1, [pc, #0x3D0]
        mov     r12, r12, lsl #1
        ldrsh   r12, [r1, +r12]
LDEG17:
        mov     r0, r0, lsl r12
LDEG18:
        cmp     lr, #0
        mov     r2, lr
        moveq   r1, #0
        beq     LDEG22
        cmn     lr, #1
        moveq   lr, #2, 2
        moveq   r1, #0x1F
        beq     LDEG22
        cmp     lr, #0
        mvnlt   r2, lr
        cmp     r2, #0
        moveq   r1, #0
        beq     LDEG21
        movs    r1, r2, lsr #16
        bne     LDEG19
        bic     r2, r2, #0xFF, 8
        bic     r2, r2, #0xFF, 16
        movs    r3, r2, asr #8
        ldrne   r1, [pc, #0x378]
        movne   r2, r3, lsl #1
        ldreq   r1, [pc, #0x374]
        moveq   r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        add     r1, r2, #0x10
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        b       LDEG21
LDEG19:
        movs    r2, r2, lsr #24
        bne     LDEG20
        ldr     r2, [pc, #0x350]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r2, +r1]
        b       LDEG21
LDEG20:
        ldr     r1, [pc, #0x33C]
        mov     r2, r2, lsl #1
        ldrsh   r1, [r1, +r2]
LDEG21:
        mov     lr, lr, lsl r1
LDEG22:
        mov     r2, #2, 2
        sub     r2, r2, #2, 18
        cmp     r2, r0
        mvnle   r0, #0
        addle   r0, r0, #2, 18
        ble     LDEG23
        add     r0, r0, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDEG23:
        mov     r2, #2, 2
        sub     r2, r2, #2, 18
        cmp     r2, lr
        mvnle   lr, #0
        addle   lr, lr, #2, 18
        ble     LDEG24
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDEG24:
        mul     lr, r0, lr
        movs    lr, lr, lsl #1
        mov     r2, lr
        moveq   r0, #0
        streq   lr, [sp, #0x40]
        beq     LDEG28
        cmn     lr, #1
        beq     LDEG37
        cmp     lr, #0
        mvnlt   r2, lr
        cmp     r2, #0
        moveq   r0, #0
        beq     LDEG27
        movs    r0, r2, lsr #16
        bne     LDEG25
        bic     r2, r2, #0xFF, 8
        bic     r2, r2, #0xFF, 16
        movs    r3, r2, asr #8
        ldrne   r0, [pc, #0x294]
        movne   r2, r3, lsl #1
        ldreq   r0, [pc, #0x290]
        moveq   r2, r2, lsl #1
        ldrsh   r2, [r0, +r2]
        add     r0, r2, #0x10
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LDEG27
LDEG25:
        movs    r2, r2, lsr #24
        bne     LDEG26
        ldr     r2, [pc, #0x26C]
        mov     r0, r0, lsl #1
        ldrsh   r0, [r2, +r0]
        b       LDEG27
LDEG26:
        ldr     r0, [pc, #0x258]
        mov     r2, r2, lsl #1
        ldrsh   r0, [r0, +r2]
LDEG27:
        mov     lr, lr, lsl r0
        str     lr, [sp, #0x40]
LDEG28:
        add     r1, r12, r1
        add     r0, r1, r0
        rsb     r12, r0, #0x3E
        mvn     r2, #0
        str     r2, [sp, #0xC]
        add     r1, sp, #0x44
        add     r0, sp, #0x40
        strh    r12, [sp, #0x44]
        bl      ownInvSqrt_32s16s_I
        mov     r1, #2, 2
        sub     r1, r1, #2, 18
        cmp     r1, r7
        ldrle   r1, [sp, #0xC]
        addle   r1, r1, #2, 18
        ble     LDEG29
        add     r7, r7, #2, 18
        mov     r7, r7, asr #16
        mov     r7, r7, lsl #16
        mov     r1, r7, asr #16
LDEG29:
        ldr     r12, [sp, #0x40]
        mov     lr, #2, 2
        sub     lr, lr, #2, 18
        cmp     lr, r12
        ldrle   r12, [sp, #0xC]
        addle   r12, r12, #2, 18
        ble     LDEG30
        add     r12, r12, #2, 18
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LDEG30:
        mul     r1, r1, r12
        ldr     lr, [sp, #8]
        ldrsh   r12, [sp, #0x44]
        rsb     lr, lr, #0x1F
        mov     r1, r1, lsl #1
        add     lr, r12, lr
        mov     r12, #2, 2
        mov     lr, lr, lsl #16
        movs    lr, lr, asr #16
        bmi     LDEG38
        bic     lr, lr, #0xFF, 8
        bic     r7, lr, #0xFF, 16
        mvn     lr, #2, 2
        cmp     r1, lr, asr r7
        bgt     LDEG31
        cmp     r1, r12, asr r7
        movge   lr, r1, lsl r7
        movlt   lr, #2, 2
LDEG31:
        mov     r1, #2, 2
        sub     r1, r1, #2, 18
        cmp     r1, lr
        mvnle   r1, #0
        addle   lr, r1, #2, 18
        ble     LDEG32
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDEG32:
        strh    lr, [r8]
LDEG33:
        strh    r4, [r10]
        ldrsh   r1, [r8]
        mov     r12, #0xCD
        orr     r12, r12, #0x13, 22
        cmp     r12, r1
        bge     LDEG34
        mov     r0, r4
        ldr     r1, [sp, #0x28]
        bl      LDEG_ownMedOLag_WBE
        strh    r0, [r6]
        mov     r0, #0xFF
        orr     r0, r0, #0x7F, 24
        strh    r0, [r5]
        mvn     r0, #0
        add     r0, r0, #2, 18
        b       LDEG35
LDEG34:
        ldrsh   r0, [r5]
        mov     r1, #0x33
        orr     r1, r1, #0x73, 24
        mul     r1, r0, r1
        mov     r0, r1, asr #15
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        strh    r0, [r5]
LDEG35:
        mov     r1, #0x66
        orr     r1, r1, #0x66, 24
        cmp     r1, r0
        movle   r0, #1
        movgt   r0, #0
        strh    r0, [r11]
        ldrsh   r1, [r9]
        mov     r0, #0x32
        orr     r0, r0, #0x53, 24
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #17
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        strh    r1, [r9]
        ldrsh   r8, [r8]
        cmp     r0, r8
        orrlt   r1, r1, #1, 18
        strlth  r1, [r9]
        ldrsh   r1, [r10]
        mov     r0, #0
        mov     r1, r1, lsl #1
        strh    r1, [r10]
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LDEG36:
        mov     r1, #0x1F
        mov     r7, #2, 2
        str     r1, [sp, #8]
        b       LDEG14
LDEG37:
        mov     lr, #2, 2
        mov     r0, #0x1F
        str     lr, [sp, #0x40]
        b       LDEG28
LDEG38:
        rsb     lr, lr, #0
        mov     lr, r1, asr lr
        sub     r12, r12, #2, 18
        cmp     r12, lr
        mvnle   r1, #0
        addle   lr, r1, #2, 18
        ble     LDEG39
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDEG39:
        strh    lr, [r8]
        b       LDEG33
LDEG40:
        mvn     r0, #7
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LDEG41:
        mvn     r0, #5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LDEG_ownMedOLag_WBE:
        ldrsh   r3, [r1, #6]
        ldrsh   r2, [r1, #4]
        strh    r3, [r1, #8]
        ldrsh   r3, [r1, #2]
        strh    r2, [r1, #6]
        ldrsh   r2, [r1]
        strh    r0, [r1]
        strh    r3, [r1, #4]
        strh    r2, [r1, #2]
        mov     r0, r1
        mov     r1, #5
        b       ownGmed_n
        .long   LDEG_corrweight
        .long   NormTable
        .long   NormTable2


        .data
        .align  4


LDEG_corrweight:
        .byte   0x8F,0x24,0xA5,0x24,0xBB,0x24,0xD1,0x24,0xE7,0x24,0xFD,0x24,0x13,0x25,0x29,0x25
        .byte   0x3F,0x25,0x55,0x25,0x6B,0x25,0x82,0x25,0x98,0x25,0xAE,0x25,0xC4,0x25,0xDA,0x25
        .byte   0xF0,0x25,0x06,0x26,0x1C,0x26,0x32,0x26,0x48,0x26,0x5E,0x26,0x74,0x26,0x8A,0x26
        .byte   0xA1,0x26,0xB7,0x26,0xCD,0x26,0xE3,0x26,0xF9,0x26,0x0F,0x27,0x25,0x27,0x3B,0x27
        .byte   0x51,0x27,0x67,0x27,0x7D,0x27,0x93,0x27,0xAA,0x27,0xC0,0x27,0xD6,0x27,0xEC,0x27
        .byte   0x02,0x28,0x18,0x28,0x2E,0x28,0x44,0x28,0x5A,0x28,0x70,0x28,0x86,0x28,0x9C,0x28
        .byte   0xB3,0x28,0xC9,0x28,0xDF,0x28,0xF5,0x28,0x0B,0x29,0x21,0x29,0x37,0x29,0x4D,0x29
        .byte   0x63,0x29,0x79,0x29,0x8F,0x29,0xA5,0x29,0xBB,0x29,0xD2,0x29,0xE8,0x29,0xFE,0x29
        .byte   0x14,0x2A,0x2A,0x2A,0x40,0x2A,0x57,0x2A,0x6E,0x2A,0x85,0x2A,0x9C,0x2A,0xB4,0x2A
        .byte   0xCB,0x2A,0xE4,0x2A,0xFC,0x2A,0x15,0x2B,0x2E,0x2B,0x47,0x2B,0x61,0x2B,0x7B,0x2B
        .byte   0x95,0x2B,0xAF,0x2B,0xCA,0x2B,0xE6,0x2B,0x01,0x2C,0x1D,0x2C,0x3A,0x2C,0x56,0x2C
        .byte   0x73,0x2C,0x91,0x2C,0xAF,0x2C,0xCD,0x2C,0xEC,0x2C,0x0B,0x2D,0x2B,0x2D,0x4B,0x2D
        .byte   0x6C,0x2D,0x8D,0x2D,0xAE,0x2D,0xD0,0x2D,0xF3,0x2D,0x16,0x2E,0x3A,0x2E,0x5E,0x2E
        .byte   0x83,0x2E,0xA9,0x2E,0xCF,0x2E,0xF6,0x2E,0x1D,0x2F,0x45,0x2F,0x6E,0x2F,0x98,0x2F
        .byte   0xC2,0x2F,0xEE,0x2F,0x1A,0x30,0x46,0x30,0x74,0x30,0xA3,0x30,0xD2,0x30,0x03,0x31
        .byte   0x34,0x31,0x67,0x31,0x9B,0x31,0xCF,0x31,0x05,0x32,0x3D,0x32,0x75,0x32,0xAF,0x32
        .byte   0xEA,0x32,0x27,0x33,0x65,0x33,0xA5,0x33,0xE6,0x33,0x29,0x34,0x6E,0x34,0xB5,0x34
        .byte   0xFE,0x34,0x49,0x35,0x97,0x35,0xE6,0x35,0x38,0x36,0x8D,0x36,0xE5,0x36,0x3F,0x37
        .byte   0x9D,0x37,0xFE,0x37,0x63,0x38,0xCB,0x38,0x38,0x39,0xA9,0x39,0x1F,0x3A,0x9A,0x3A
        .byte   0x1A,0x3B,0xA1,0x3B,0x2E,0x3C,0xC2,0x3C,0x5E,0x3D,0x02,0x3E,0xB8,0x3E,0x00,0x40
        .byte   0x00,0x40,0x00,0x40,0x00,0x40,0x00,0x40,0x00,0x40,0x00,0x40,0xB8,0x3E,0x02,0x3E
        .byte   0x5E,0x3D,0xC2,0x3C,0x2E,0x3C,0xA1,0x3B,0x1A,0x3B,0x9A,0x3A,0x1F,0x3A,0xA9,0x39
        .byte   0x38,0x39,0xCB,0x38,0x63,0x38,0xFE,0x37,0x9D,0x37,0x3F,0x37,0xE5,0x36,0x8D,0x36
        .byte   0x38,0x36,0xE6,0x35,0x97,0x35,0x49,0x35,0xFE,0x34,0xB5,0x34,0x6E,0x34,0x29,0x34
        .byte   0xE6,0x33,0xA5,0x33,0x65,0x33,0x27,0x33,0xEA,0x32,0xAF,0x32,0x75,0x32,0x3D,0x32
        .byte   0x05,0x32,0xCF,0x31,0x9B,0x31,0x67,0x31,0x34,0x31,0x03,0x31,0xD2,0x30,0xA3,0x30
        .byte   0x74,0x30,0x46,0x30,0x1A,0x30,0xEE,0x2F,0xC2,0x2F,0x98,0x2F,0x6E,0x2F,0x45,0x2F
        .byte   0x1D,0x2F,0xF6,0x2E,0xCF,0x2E,0xA9,0x2E,0x83,0x2E,0x5E,0x2E,0x3A,0x2E,0x16,0x2E
        .byte   0xF3,0x2D,0xD0,0x2D,0xAE,0x2D,0x8D,0x2D,0x6C,0x2D,0x4B,0x2D,0x2B,0x2D,0x0B,0x2D
        .byte   0xEC,0x2C,0xCD,0x2C,0xAF,0x2C,0x91,0x2C,0x73,0x2C,0x56,0x2C,0x3A,0x2C,0x1D,0x2C
        .byte   0x01,0x2C,0xE6,0x2B,0xCA,0x2B,0xAF,0x2B,0x95,0x2B,0x7B,0x2B,0x61,0x2B,0x47,0x2B
        .byte   0x2E,0x2B,0x15,0x2B,0xFC,0x2A,0xE4,0x2A,0xCB,0x2A,0xB4,0x2A,0x9C,0x2A,0x85,0x2A
        .byte   0x6E,0x2A,0x57,0x2A,0x40,0x2A,0x2A,0x2A,0x14,0x2A,0xFE,0x29,0xE8,0x29,0xFE,0x29
        .byte   0xE8,0x29,0xD2,0x29,0xBB,0x29,0xA5,0x29,0x8F,0x29,0x79,0x29,0x63,0x29,0x4D,0x29
        .byte   0x37,0x29,0x21,0x29,0x0B,0x29,0xF5,0x28,0xDF,0x28,0xC9,0x28,0xB3,0x28,0x9C,0x28
        .byte   0x86,0x28,0x70,0x28,0x5A,0x28,0x44,0x28,0x2E,0x28,0x18,0x28,0x02,0x28,0xEC,0x27
        .byte   0xD6,0x27,0xC0,0x27,0xAA,0x27,0x93,0x27,0x7D,0x27,0x67,0x27,0x51,0x27,0x3B,0x27
        .byte   0x25,0x27,0x0F,0x27,0xF9,0x26,0xE3,0x26,0xCD,0x26,0xB7,0x26,0xA1,0x26,0x8A,0x26
        .byte   0x74,0x26,0x5E,0x26,0x48,0x26,0x32,0x26,0x1C,0x26,0x06,0x26,0xF0,0x25,0xDA,0x25
        .byte   0xC4,0x25,0xAE,0x25,0x98,0x25,0x82,0x25,0x6B,0x25,0x55,0x25,0x3F,0x25,0x29,0x25
        .byte   0x13,0x25,0xFD,0x24,0xE7,0x24,0xD1,0x24,0xBB,0x24,0xA5,0x24,0x8F,0x24


