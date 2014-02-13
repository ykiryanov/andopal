        .text
        .align  4
        .globl  _ippsGainQuant_G723_16s


_ippsGainQuant_G723_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xE7, 30
        add     r10, sp, #0x5C
        and     r10, r10, #0x1F
        add     lr, sp, #0x5B, 30
        add     r6, sp, #0xA1, 30
        rsb     r10, r10, #0
        and     lr, lr, #0xF
        and     r6, r6, #0xF
        add     r9, sp, #0x7E, 30
        mov     r4, r0
        and     r10, r10, #0x1F
        add     r0, sp, #0x5C
        rsb     lr, lr, #0
        rsb     r6, r6, #0
        and     r9, r9, #0xF
        add     r10, r0, r10
        str     r10, [sp, #0x2C]
        and     lr, lr, #0xF
        add     r12, sp, #0xC3, 30
        and     r6, r6, #0xF
        mov     r5, r1
        rsb     r9, r9, #0
        add     r1, sp, #0xA1, 30
        add     r10, sp, #0x5B, 30
        add     lr, r10, lr
        ldr     r10, [sp, #0x3C4]
        and     r12, r12, #0xF
        add     r6, r1, r6
        rsb     r11, r12, #0
        and     r9, r9, #0xF
        str     lr, [sp, #0x48]
        ldr     lr, [sp, #0x3C8]
        add     r1, sp, #0x7E, 30
        str     r6, [sp, #0x58]
        add     r9, r1, r9
        add     r12, sp, #0xC3, 30
        and     r6, r11, #0xF
        str     lr, [sp, #0x20]
        ldr     lr, [sp, #0x3D0]
        str     r9, [sp, #0x38]
        ldr     r9, [sp, #0x3C0]
        ldr     r11, [sp, #0x3CC]
        add     r12, r12, r6
        cmp     r4, #0
        mov     r7, r2
        mov     r8, r3
        str     lr, [sp, #0x28]
        str     r12, [sp, #0x34]
        beq     LDRB27
        cmp     r5, #0
        beq     LDRB27
        cmp     r7, #0
        beq     LDRB27
        cmp     r8, #0
        beq     LDRB27
        cmp     r9, #0
        beq     LDRB27
        cmp     r10, #0
        beq     LDRB27
        ldr     r12, [sp, #0x20]
        cmp     r12, #0
        beq     LDRB27
        ldr     r12, [sp, #0x28]
        cmp     r12, #0
        beq     LDRB27
        cmp     r11, #6
        beq     LDRB0
        cmp     r11, #5
        beq     LDRB0
        mvn     r0, #4
        add     sp, sp, #0xE7, 30
        ldmia   sp!, {r4 - r11, pc}
LDRB0:
        ldr     r2, [sp, #0x58]
        mov     r0, r4
        mov     r3, #0x3C
        mov     r1, #1
        bl      _ippsRShiftC_16s
        add     lr, sp, #0xD7, 30
        mov     r12, #0x1E
        str     r12, [sp]
        str     lr, [sp, #4]
        ldr     r0, [sp, #0x58]
        ldr     r3, [sp, #0x34]
        mov     r2, #2
        mov     r1, #0x3C
        bl      _ippsAutoCorr_NormE_Step_NR_16s
        ldr     r12, [sp, #0x35C]
        ldr     r3, [sp, #0x2C]
        mov     r2, #0x3C
        rsb     r12, r12, #3
        str     r12, [sp]
        mov     r1, r5
        mov     r0, r4
        bl      _ippsCrossCorr_16s32s_Sfs
        ldr     r0, [sp, #0x28]
        mov     r2, #0
        mov     lr, r2
        str     lr, [r0]
        str     r10, [sp, #0x1C]
        str     r7, [sp, #0x10]
        str     r5, [sp, #0xC]
        ldr     r5, [sp, #0x48]
        ldr     r10, [sp, #0x38]
        ldr     r7, [sp, #0x2C]
        sub     r1, r11, #5
        sub     r0, r11, #6
        mvn     r3, #2, 2
        str     r11, [sp, #0x24]
        str     r9, [sp, #0x18]
        str     r4, [sp, #8]
        add     r12, sp, #0x39, 28
        str     r3, [sp, #0x50]
        str     r0, [sp, #0x54]
        str     r1, [sp, #0x58]
        str     r8, [sp, #0x14]
        mov     r4, r2
        mov     r9, #1
        add     r11, sp, #0xC3, 30
LDRB1:
        add     r3, sp, #0x39, 28
        str     r3, [sp]
        add     r12, sp, #0x36, 28
        str     r12, [sp, #4]
        ldrsh   r3, [r6, +r11]
        mov     r1, r10
        mov     r2, r4
        mov     r0, r7
        bl      ownComputeMaxAmplitude_G723
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x18]
        mov     r8, #1
        str     r6, [sp, #0x30]
LDRB2:
        add     r0, sp, #0x39, 28
        ldrsh   r0, [r0]
        mov     lr, #0
        add     r3, sp, #3, 24
        ldrsh   r3, [r3, #0x60]
        subs    r0, r0, r4
        movmi   lr, r9
        add     lr, r0, lr
        ldr     r0, [sp, #0x38]
        add     r12, sp, #0x39, 28
        add     r3, r3, r8
        mov     lr, lr, asr #1
        strh    lr, [r12]
        sub     r3, r3, #2
        mov     r2, #0x3C
        mov     r1, r5
        mov     r6, r3, lsl #16
        bl      _ippsCopy_16s
        ldr     r12, [pc, #0x4C8]
        mov     r6, r6, asr #16
        add     r0, sp, #0xD9, 30
        mov     r1, #0x1F
        mov     r3, r6, lsl #1
        ldrsh   r7, [r12, +r3]
        bl      _ippsZero_8u
        add     r0, sp, #0x39, 28
        ldrsh   r0, [r0]
        ldr     r3, [r5, +r0, lsl #2]
        cmp     r3, #0
        movge   r3, r7
        blt     LDRB26
LDRB3:
        add     lr, sp, #0xE1, 30
        add     r12, sp, #0xD9, 30
        cmp     r10, #1
        strh    r3, [lr]
        strb    r9, [r0, +r12]
        ble     LDRB13
        rsb     r0, r7, #0
        ldr     r1, [sp, #0x34]
        mov     r3, r0, lsl #16
        add     r0, sp, #0x39, 28
        mov     lr, #2
        mov     r3, r3, asr #16
        sub     r12, r10, #1
        str     r6, [sp, #0x3C]
        str     r8, [sp, #0x40]
        str     r4, [sp, #0x44]
LDRB4:
        ldrsh   r11, [r0], #2
        add     r2, sp, #0x39, 28
        cmp     r11, #0
        ldrlesh r2, [r2, +lr]
        movle   r10, #2, 2
        ble     LDRB8
        ldrsh   r2, [r2, +lr]
        str     r7, [sp, #0x4C]
        add     r7, sp, #3, 24
        mov     r10, #2, 2
        mov     r8, #0
        add     r6, r1, r11, lsl #1
        mov     r4, r5
        add     r7, r7, #0x82
LDRB5:
        add     r1, sp, #0xD9, 30
        ldrb    r1, [r8, +r1]
        cmp     r1, #0
        bne     LDRB7
        ldrsh   r1, [r7, +lr]
        ldr     r5, [r4]
        rsb     r9, r8, #0
        mov     r1, r1, lsl #1
        mov     r9, r9, lsl #1
        ldrsh   r9, [r6, +r9]
        rsb     r1, r1, #0
        mlas    r5, r1, r9, r5
        str     r5, [r4]
        bpl     LDRB6
        cmp     r5, #2, 2
        mvneq   r5, #2, 2
        rsbne   r5, r5, #0
LDRB6:
        cmp     r5, r10
        ble     LDRB7
        add     r1, sp, #0x39, 28
        mov     r2, r8
        mov     r10, r5
        strh    r2, [r1, +lr]
LDRB7:
        add     r8, r8, #1
        cmp     r8, r11
        add     r4, r4, #4
        blt     LDRB5
        ldr     r7, [sp, #0x4C]
        ldr     r5, [sp, #0x48]
        ldr     r1, [sp, #0x34]
        mov     r9, #1
LDRB8:
        cmp     r11, #0x1E
        bge     LDRB12
        rsb     r4, r11, #0
        add     r8, sp, #3, 24
        add     r4, r1, r4, lsl #1
        add     r6, r5, r11, lsl #2
        add     r4, r4, r11, lsl #1
        add     r8, r8, #0x82
LDRB9:
        add     r1, sp, #0xD9, 30
        ldrb    r1, [r11, +r1]
        cmp     r1, #0
        bne     LDRB11
        ldrsh   r9, [r8, +lr]
        ldr     r5, [r6]
        ldrsh   r1, [r4]
        mov     r9, r9, lsl #1
        rsb     r9, r9, #0
        mlas    r5, r9, r1, r5
        str     r5, [r6]
        bpl     LDRB10
        cmp     r5, #2, 2
        mvneq   r5, #2, 2
        rsbne   r5, r5, #0
LDRB10:
        cmp     r5, r10
        ble     LDRB11
        add     r1, sp, #0x39, 28
        mov     r2, r11
        mov     r10, r5
        strh    r2, [r1, +lr]
LDRB11:
        add     r11, r11, #1
        cmp     r11, #0x1E
        add     r4, r4, #2
        add     r6, r6, #4
        blt     LDRB9
        ldr     r5, [sp, #0x48]
        ldr     r1, [sp, #0x34]
        mov     r9, #1
LDRB12:
        ldr     r6, [r5, +r2, lsl #2]
        add     r4, sp, #0xE1, 30
        cmp     r6, #0
        movlt   r8, r3
        movge   r8, r7
        add     r6, sp, #0xD9, 30
        strh    r8, [r4, +lr]
        subs    r12, r12, #1
        strb    r9, [r2, +r6]
        add     lr, lr, #2
        bne     LDRB4
        ldr     r6, [sp, #0x3C]
        ldr     r8, [sp, #0x40]
        ldr     r4, [sp, #0x44]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x18]
LDRB13:
        cmp     r10, #0
        ble     LDRB17
        cmp     r10, #6
        movlt   r3, #0
        blt     LDRB15
        ldr     r7, [sp, #0x54]
        mov     r0, #0
        mov     r3, r0
LDRB14:
        add     r10, sp, #0x39, 28
        ldrsh   r2, [r10, +r0]
        add     r5, r10, r0
        ldrsh   r11, [r5, #2]
        ldrsh   r1, [r5, #4]
        ldrsh   r12, [r5, #6]
        ldrsh   lr, [r5, #8]
        add     r2, r4, r2, lsl #1
        add     r3, r3, #5
        strh    r2, [r10, +r0]
        add     r11, r4, r11, lsl #1
        add     r1, r4, r1, lsl #1
        add     r12, r4, r12, lsl #1
        add     lr, r4, lr, lsl #1
        cmp     r3, r7
        strh    r11, [r5, #2]
        strh    r1, [r5, #4]
        strh    r12, [r5, #6]
        strh    lr, [r5, #8]
        add     r0, r0, #0xA
        ble     LDRB14
        ldr     r5, [sp, #0x48]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x18]
LDRB15:
        mov     r12, r3, lsl #1
LDRB16:
        add     r0, sp, #0x39, 28
        ldrsh   lr, [r0, +r12]
        add     r3, r3, #1
        cmp     r3, r10
        add     lr, r4, lr, lsl #1
        strh    lr, [r0, +r12]
        add     r12, r12, #2
        blt     LDRB16
LDRB17:
        ldr     r1, [sp, #0x50]
        ldr     r2, [sp, #0xC]
        ldr     lr, [sp, #8]
        mov     r12, #0
        mov     r0, r12
        mov     r3, r0
        str     r6, [sp, #0x3C]
        str     r8, [sp, #0x40]
        str     r4, [sp, #0x44]
LDRB18:
        cmp     r10, #0
        movle   r8, #0
        movle   r9, r12, lsl #1
        ble     LDRB21
        mov     r7, #0
        mov     r9, r12, lsl #1
        mov     r8, r7
        add     r6, lr, r9
        mov     r5, r10
LDRB19:
        add     r4, sp, #0x39, 28
        ldrsh   r4, [r4, +r7]
        cmp     r4, r12
        bgt     LDRB20
        rsb     r4, r4, #0
        add     r11, sp, #0xE1, 30
        mov     r4, r4, lsl #1
        ldrsh   r4, [r6, +r4]
        ldrsh   r11, [r11, +r7]
        mla     r8, r11, r4, r8
LDRB20:
        subs    r5, r5, #1
        add     r7, r7, #2
        bne     LDRB19
LDRB21:
        ldrsh   r9, [r2, +r9]
        mov     r8, r8, asr #13
        mul     r9, r9, r8
        mov     r4, r9, lsl #1
        adds    r0, r0, r4
        adc     r3, r3, r4, asr #31
        subs    r5, r0, r1
        sbcs    r4, r3, #0
        movlt   r5, #0
        movlt   r4, #0
        orrs    r4, r5, r4
        mvnne   r0, #2, 2
        movne   r3, #0
        mul     r8, r8, r8
        add     r12, r12, #1
        subs    r0, r0, r8
        sbc     r3, r3, r8, asr #31
        cmp     r12, #0x3C
        blt     LDRB18
        ldr     r11, [sp, #0x18]
        ldr     r6, [sp, #0x3C]
        ldr     r8, [sp, #0x40]
        ldr     r3, [r11]
        ldr     r4, [sp, #0x44]
        ldr     r5, [sp, #0x48]
        mov     r9, #1
        cmp     r0, r3
        ble     LDRB25
        str     r0, [r11]
        ldr     r0, [sp, #0x1C]
        cmp     r10, #0
        strh    r4, [r0]
        ldr     r0, [sp, #0x20]
        strh    r6, [r0]
        ldr     r0, [sp, #0x28]
        str     r9, [r0]
        ble     LDRB25
        cmp     r10, #5
        movlt   lr, #0
        blt     LDRB23
        ldr     r3, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        ldr     r11, [sp, #0x58]
        mov     r12, #0
        mov     lr, r12
LDRB22:
        add     r7, sp, #0xE1, 30
        ldrsh   r2, [r7, +r12]
        add     r6, sp, #0x39, 28
        ldrsh   r10, [r6, +r12]
        strh    r2, [r3]
        add     r7, r7, r12
        ldrsh   r1, [r7, #2]
        strh    r10, [r0]
        ldrsh   r2, [r7, #4]
        add     r6, r6, r12
        ldrsh   r10, [r6, #2]
        strh    r1, [r3, #2]
        ldrsh   r1, [r6, #4]
        ldrsh   r7, [r7, #6]
        strh    r10, [r0, #2]
        strh    r2, [r3, #4]
        ldrsh   r6, [r6, #6]
        strh    r1, [r0, #4]
        strh    r7, [r3, #6]
        add     lr, lr, #4
        strh    r6, [r0, #6]
        cmp     lr, r11
        add     r3, r3, #8
        add     r0, r0, #8
        add     r12, r12, #8
        ble     LDRB22
        str     r11, [sp, #0x58]
        ldr     r10, [sp, #0x24]
        ldr     r11, [sp, #0x18]
LDRB23:
        ldr     r0, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        mov     r12, lr, lsl #1
        add     r0, r0, lr, lsl #1
        add     r3, r3, lr, lsl #1
LDRB24:
        add     r6, sp, #0xE1, 30
        ldrsh   r6, [r6, +r12]
        add     r7, sp, #0x39, 28
        ldrsh   r7, [r7, +r12]
        strh    r6, [r0], #2
        add     lr, lr, #1
        strh    r7, [r3], #2
        cmp     lr, r10
        add     r12, r12, #2
        blt     LDRB24
LDRB25:
        add     r8, r8, #1
        cmp     r8, #4
        ble     LDRB2
        ldr     r10, [sp, #0x38]
        ldr     r6, [sp, #0x30]
        ldr     r7, [sp, #0x2C]
        add     r4, r4, #1
        cmp     r4, #2
        add     r11, sp, #0xC3, 30
        blt     LDRB1
        mov     r0, #0
        add     sp, sp, #0xE7, 30
        ldmia   sp!, {r4 - r11, pc}
LDRB26:
        rsb     r3, r7, #0
        mov     r3, r3, lsl #16
        mov     r3, r3, asr #16
        b       LDRB3
LDRB27:
        mvn     r0, #7
        add     sp, sp, #0xE7, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   LDRB_GainDBLvls


        .data
        .align  4


LDRB_GainDBLvls:
        .byte   0x01,0x00,0x02,0x00,0x03,0x00,0x04,0x00,0x06,0x00,0x09,0x00,0x0D,0x00,0x12,0x00
        .byte   0x1A,0x00,0x26,0x00,0x37,0x00,0x50,0x00,0x73,0x00,0xA6,0x00,0xF0,0x00,0x5C,0x01
        .byte   0xF6,0x01,0xD6,0x02,0x1A,0x04,0xED,0x05,0x91,0x08,0x62,0x0C,0xE6,0x11,0xDF,0x19


