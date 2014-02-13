        .text
        .align  4
        .globl  _ippsGainQuant_AMRWBE_16s


_ippsGainQuant_AMRWBE_16s:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0x2C
        ldr     r7, [sp, #0x4C]
        ldr     r6, [sp, #0x50]
        ldr     lr, [sp, #0x54]
        ldr     r5, [sp, #0x5C]
        ldr     r4, [sp, #0x60]
        ldr     r12, [sp, #0x64]
        ldr     r8, [sp, #0x68]
        cmp     r0, #0
        beq     LDIW1
        cmp     r1, #0
        beq     LDIW1
        cmp     r3, #0
        beq     LDIW1
        cmp     r7, #0
        beq     LDIW1
        cmp     lr, #0
        beq     LDIW1
        cmp     r5, #0
        beq     LDIW1
        cmp     r4, #0
        beq     LDIW1
        cmp     r12, #0
        beq     LDIW1
        cmp     r8, #0
        beq     LDIW1
        cmp     r6, #0
        ble     LDIW0
        ldrsh   r9, [r5]
        add     r10, sp, #0x28
        strh    r9, [r10]
        str     r12, [sp, #0x10]
        add     r12, sp, #0x58
        str     r12, [sp, #8]
        mov     r12, #0x1A
        str     r12, [sp, #0x20]
        str     r6, [sp, #0x1C]
        mov     r12, #0
        add     r6, sp, #0x28
        str     lr, [sp, #4]
        str     r12, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r6, [sp, #0xC]
        str     r7, [sp]
        bl      LDIW_ownGainQuant_WB_WBE_16s
        add     r0, sp, #0x28
        ldrsh   r2, [r0]
        add     r1, sp, #0x28
        ldrsh   r1, [r1, #2]
        strh    r2, [r5]
        mov     r0, #0
        strh    r1, [r4]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r10, pc}
LDIW0:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r10, pc}
LDIW1:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r10, pc}
LDIW_ownGainQuant_WB_WBE_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x60
        ldr     r12, [sp, #0x8C]
        ldr     r11, [sp, #0x88]
        ldr     r6, [sp, #0x84]
        str     r12, [sp, #0x14]
        add     lr, sp, #0x24
        and     r12, lr, #0xF
        ldrsh   lr, [r11, #4]
        rsb     r4, r12, #0
        ldrsh   r12, [r11]
        ldr     r5, [sp, #0x90]
        ldr     r7, [sp, #0x9C]
        and     r4, r4, #0xF
        str     r5, [sp, #0xC]
        ldr     r5, [sp, #0x94]
        str     r4, [sp, #0x1C]
        str     r5, [sp, #8]
        str     r1, [sp, #0x18]
        mov     r9, r0
        ldrsh   r0, [r11, #2]
        ldr     r5, [sp, #0xA0]
        cmn     lr, #2, 18
        str     r0, [sp, #0x10]
        add     r0, sp, #0x24
        add     r4, r0, r4
        mov     r10, r2
        mov     r8, r3
        strh    r12, [r4, #2]
        mvneq   r12, #0
        addeq   r12, r12, #2, 18
        beq     LDIW2
        rsb     lr, lr, #0
        mov     lr, lr, lsl #16
        mov     r12, lr, asr #16
LDIW2:
        ldrsh   r11, [r11, #6]
        add     r3, sp, #0x5C
        str     r11, [sp, #0x20]
        strh    r12, [r4, #6]
        mvn     r12, #0
        str     r12, [sp]
        mov     r2, r5
        mov     r1, r6
        mov     r0, r6
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x5C]
        cmn     r12, #6, 2
        addne   r12, r12, #1
        strne   r12, [sp, #0x5C]
        cmp     r12, #0
        moveq   r11, #0
        beq     LDIW6
        movs    lr, r12, asr #16
        bne     LDIW3
        bic     lr, r12, #0xFF, 8
        bic     r11, lr, #0xFF, 16
        movs    r0, r11, asr #8
        ldrne   lr, [pc, #0x640]
        movne   r11, r0, lsl #1
        ldreq   lr, [pc, #0x63C]
        moveq   r11, r11, lsl #1
        ldrsh   r11, [lr, +r11]
        add     lr, r11, #0x10
        mov     lr, lr, lsl #16
        mov     r11, lr, asr #16
        b       LDIW5
LDIW3:
        bic     lr, lr, #0xFF, 8
        bic     lr, lr, #0xFF, 16
        movs    r11, lr, asr #8
        bne     LDIW4
        ldr     r11, [pc, #0x610]
        mov     lr, lr, lsl #1
        ldrsh   r11, [r11, +lr]
        b       LDIW5
LDIW4:
        ldr     lr, [pc, #0x5FC]
        mov     r11, r11, lsl #1
        ldrsh   r11, [lr, +r11]
LDIW5:
        mov     r12, r12, lsl r11
        str     r12, [sp, #0x5C]
LDIW6:
        rsb     lr, r11, #0xC
        mov     r12, r12, asr #16
        strh    r12, [r4, #0xA]
        mov     lr, lr, lsl #16
        mvn     r12, #0
        mov     r11, lr, asr #16
        strh    r11, [sp, #0x58]
        add     r3, sp, #0x5C
        str     r12, [sp]
        mov     r0, r9
        mov     r2, r5
        mov     r1, r6
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x5C]
        add     r9, r11, r10, lsl #1
        cmn     r12, #6, 2
        addne   r12, r12, #1
        strne   r12, [sp, #0x5C]
        cmp     r12, #0
        mov     r11, r12
        moveq   r11, #0
        beq     LDIW10
        cmn     r12, #1
        beq     LDIW22
        cmp     r12, #0
        mvnlt   r11, r12
        cmp     r11, #0
        moveq   r11, #0
        beq     LDIW9
        movs    lr, r11, lsr #16
        bne     LDIW7
        bic     r11, r11, #0xFF, 8
        bic     r11, r11, #0xFF, 16
        movs    r0, r11, asr #8
        ldrne   lr, [pc, #0x560]
        movne   r11, r0, lsl #1
        ldreq   lr, [pc, #0x55C]
        moveq   r11, r11, lsl #1
        ldrsh   r11, [lr, +r11]
        add     lr, r11, #0x10
        mov     lr, lr, lsl #16
        mov     r11, lr, asr #16
        b       LDIW9
LDIW7:
        movs    r11, r11, lsr #24
        bne     LDIW8
        ldr     r11, [pc, #0x538]
        mov     lr, lr, lsl #1
        ldrsh   r11, [r11, +lr]
        b       LDIW9
LDIW8:
        ldr     lr, [pc, #0x524]
        mov     r11, r11, lsl #1
        ldrsh   r11, [lr, +r11]
LDIW9:
        mov     r12, r12, lsl r11
        str     r12, [sp, #0x5C]
LDIW10:
        rsb     r11, r11, #0x16
        cmp     r12, #2, 2
        mov     r11, r11, lsl #16
        mov     r11, r11, asr #16
        strh    r11, [sp, #0x58]
        mvneq   r12, #2, 2
        rsbne   r12, r12, #0
        mov     r12, r12, asr #16
        strh    r12, [r4, #0xE]
        mvn     r12, #0
        str     r12, [sp]
        ldr     r0, [sp, #0x18]
        add     r3, sp, #0x5C
        mov     r2, r5
        mov     r1, r6
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x5C]
        add     r11, r11, r10
        str     r11, [sp, #0x18]
        cmn     r12, #6, 2
        addne   r12, r12, #1
        strne   r12, [sp, #0x5C]
        cmp     r12, #0
        mov     r6, r12
        moveq   lr, #0
        beq     LDIW14
        cmn     r12, #1
        beq     LDIW23
        cmp     r12, #0
        mvnlt   r6, r12
        cmp     r6, #0
        moveq   lr, #0
        beq     LDIW13
        movs    lr, r6, lsr #16
        bne     LDIW11
        bic     r6, r6, #0xFF, 8
        bic     r6, r6, #0xFF, 16
        movs    r11, r6, asr #8
        ldrne   lr, [pc, #0x478]
        movne   r6, r11, lsl #1
        ldreq   lr, [pc, #0x474]
        moveq   r6, r6, lsl #1
        ldrsh   r6, [lr, +r6]
        add     lr, r6, #0x10
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        b       LDIW13
LDIW11:
        movs    r6, r6, lsr #24
        bne     LDIW12
        ldr     r6, [pc, #0x450]
        mov     lr, lr, lsl #1
        ldrsh   lr, [r6, +lr]
        b       LDIW13
LDIW12:
        ldr     lr, [pc, #0x43C]
        mov     r6, r6, lsl #1
        ldrsh   lr, [lr, +r6]
LDIW13:
        mov     r12, r12, lsl lr
        str     r12, [sp, #0x5C]
LDIW14:
        rsb     lr, lr, #0x16
        mov     r12, r12, asr #16
        strh    r12, [r4, #0x12]
        mov     lr, lr, lsl #16
        add     r3, sp, #0x5C
        mov     r6, lr, asr #16
        strh    r6, [sp, #0x58]
        mvn     r12, #0
        str     r12, [sp]
        mov     r2, r5
        mov     r1, r8
        mov     r0, r8
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r0, [sp, #0x5C]
        add     r11, r6, r10
        cmn     r0, #6, 2
        addne   r0, r0, #1
        strne   r0, [sp, #0x5C]
        cmp     r0, #0
        moveq   r5, #0
        beq     LDIW18
        movs    r1, r0, asr #16
        bne     LDIW15
        bic     r1, r0, #0xFF, 8
        bic     r2, r1, #0xFF, 16
        movs    r12, r2, asr #8
        ldrne   r1, [pc, #0x3C0]
        movne   r2, r12, lsl #1
        ldreq   r1, [pc, #0x3BC]
        moveq   r2, r2, lsl #1
        ldrsh   r2, [r1, +r2]
        add     r1, r2, #0x10
        mov     r1, r1, lsl #16
        mov     r5, r1, asr #16
        b       LDIW17
LDIW15:
        bic     r1, r1, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        movs    r2, r1, asr #8
        bne     LDIW16
        ldr     r2, [pc, #0x390]
        mov     r1, r1, lsl #1
        ldrsh   r5, [r2, +r1]
        b       LDIW17
LDIW16:
        ldr     r1, [pc, #0x37C]
        mov     r2, r2, lsl #1
        ldrsh   r5, [r1, +r2]
LDIW17:
        mov     r0, r0, lsl r5
        str     r0, [sp, #0x5C]
LDIW18:
        add     r2, sp, #0x54
        add     r1, sp, #0x58
        bl      ownLog2
        ldrsh   r2, [sp, #0x58]
        mvn     r6, #0x18
        ldrsh   r1, [sp, #0x54]
        ldr     r0, [sp, #0x14]
        rsb     r6, r5, r6
        add     r12, r2, r6
        ldrsh   r0, [r0]
        mvn     r2, #0x53
        bic     r2, r2, #6, 20
        mul     r1, r1, r2
        mov     r12, r12, lsl #16
        mov     r0, r0, lsl #7
        mov     r12, r12, asr #16
        mul     r2, r12, r2
        mvn     r5, #0
        strh    r12, [sp, #0x58]
        add     r12, r5, #2, 12
        add     r1, r2, r1, asr #15
        add     r1, r0, r1, lsl #1
        cmp     r12, r1
        mvnlt   r1, #2, 2
        blt     LDIW19
        cmn     r1, #2, 12
        movge   r1, r1, lsl #10
        movlt   r1, #2, 2
LDIW19:
        mov     r0, r1, asr #16
        mov     r1, #0x43
        mov     r0, r0, lsl #16
        orr     r1, r1, #0x15, 24
        mov     r0, r0, asr #16
        mul     r1, r0, r1
        ldr     r0, [sp, #0x20]
        mvn     lr, #0
        add     r5, lr, #2, 18
        str     r1, [sp, #0x5C]
        mov     r12, r1, asr #23
        str     lr, [sp, #0x14]
        sub     r0, r0, #0xD
        and     r1, r5, r1, asr #8
        strh    r1, [sp, #0x54]
        ldr     r2, [sp, #0x10]
        sub     r12, r12, #0xA
        sub     r2, r2, #0xD
        mov     r12, r12, lsl #16
        mov     r6, r12, asr #16
        mov     r12, r0, lsl #16
        mov     r2, r2, lsl #16
        mov     r0, #0xE
        mov     r8, r12, asr #16
        mov     r10, r2, asr #16
        add     r9, r9, r6, lsl #1
        bl      ownPow2
        ldrsh   r3, [r4, #2]
        add     r2, sp, #0x48
        strh    r10, [r2]
        add     r2, sp, #0x48
        ldrsh   r12, [r2]
        add     r1, sp, #0x48
        strh    r8, [r1, #2]
        add     r1, sp, #0x48
        ldrsh   r2, [r1, #2]
        ldr     r1, [sp, #0x18]
        cmp     r10, r8
        add     r11, r11, r6
        add     r9, r9, #0xF
        add     r1, r1, r6
        add     lr, r11, #1
        mov     r9, r9, lsl #16
        mov     r1, r1, lsl #16
        movgt   r8, r10
        mov     r11, lr, lsl #16
        add     lr, sp, #0x48
        mov     r1, r1, asr #16
        strh    r1, [lr, #6]
        mov     r10, r9, asr #16
        cmp     r10, r1
        add     lr, sp, #0x48
        ldrsh   lr, [lr, #6]
        movgt   r1, r10
        add     r9, sp, #0x48
        strh    r10, [r9, #4]
        mov     r11, r11, asr #16
        cmp     r11, r1
        movgt   r1, r11
        cmp     r8, r1
        add     r10, sp, #0x48
        add     r9, sp, #0x48
        ldrsh   r9, [r9, #4]
        movgt   r1, r8
        strh    r11, [r10, #8]
        sub     r12, r1, r12
        add     r12, r12, #2
        mov     r8, #0x1F
        cmp     r12, #0x1F
        movgt   r12, r8
        sub     r2, r1, r2
        add     r10, sp, #0x48
        ldrsh   r10, [r10, #8]
        mov     r3, r3, lsl #16
        mov     r8, r3, asr r12
        str     r10, [sp, #0x20]
        add     r2, r2, #2
        cmp     r2, #0x1F
        mov     r12, #0x1F
        movgt   r2, r12
        sub     r12, r1, r9
        and     r9, r5, r8, asr #1
        mov     r8, r8, asr #16
        strh    r8, [r4, #2]
        mov     r9, r9, lsl #16
        add     r12, r12, #2
        cmp     r12, #0x1F
        mov     r8, r9, asr #19
        ldr     r9, [sp, #0x1C]
        sub     lr, r1, lr
        mov     r3, #0x1F
        movgt   r12, r3
        add     lr, lr, #2
        cmp     lr, #0x1F
        mov     r3, #0x1F
        add     r10, sp, #0x24
        strh    r8, [r9, +r10]
        ldrsh   r9, [r4, #6]
        ldrsh   r10, [r4, #0xA]
        ldrsh   r11, [r4, #0xE]
        ldrsh   r8, [r4, #0x12]
        movgt   lr, r3
        ldr     r3, [sp, #0x20]
        mov     r9, r9, lsl #16
        mov     r8, r8, lsl #16
        mov     r10, r10, lsl #16
        sub     r1, r1, r3
        add     r1, r1, #2
        cmp     r1, #0x1F
        mov     r3, #0x1F
        movgt   r1, r3
        mov     r11, r11, lsl #16
        mov     lr, r11, asr lr
        mov     r1, r8, asr r1
        mov     r12, r10, asr r12
        mov     r2, r9, asr r2
        and     r11, r5, r12, asr #1
        and     r8, r5, lr, asr #1
        and     r10, r5, r2, asr #1
        and     r9, r5, r1, asr #1
        mov     r5, r11, lsl #16
        mov     r8, r8, lsl #16
        mov     r10, r10, lsl #16
        mov     r11, r8, asr #19
        mov     r9, r9, lsl #16
        mov     r2, r2, asr #16
        mov     r5, r5, asr #19
        mov     r8, r1, asr #16
        str     r1, [sp, #0x5C]
        strh    r2, [r4, #6]
        strh    r5, [r4, #8]
        mov     r12, r12, asr #16
        mov     lr, lr, asr #16
        strh    r12, [r4, #0xA]
        strh    lr, [r4, #0xE]
        mov     r10, r10, asr #19
        mov     r9, r9, asr #19
        strh    r10, [r4, #4]
        strh    r11, [r4, #0xC]
        strh    r8, [r4, #0x12]
        strh    r9, [r4, #0x10]
        ldr     r2, [pc, #0xCC]
        str     r7, [sp, #4]
        mov     r1, #0x80
        mov     r0, r0, lsl #16
        str     r1, [sp]
        mov     r3, r4
        ldr     r4, [pc, #0xB8]
        mov     r5, r0, asr #16
        mov     r0, r5
        mov     r1, r4
        bl      ownWeightedMSE_AMRWB
        ldrsh   r2, [r7]
        cmp     r6, #0
        strh    r2, [r7]
        mov     r2, r2, lsl #2
        ldrsh   r2, [r4, +r2]
        ldr     r3, [sp, #0xC]
        strh    r2, [r3]
        ldrsh   r7, [r7]
        add     r7, r4, r7, lsl #2
        ldrsh   r1, [r7, #2]
        mul     r5, r5, r1
        blt     LDIW20
        add     r6, r6, #1
        bic     r6, r6, #0xFF, 8
        bic     r2, r6, #0xFF, 16
        mvn     r3, #2, 2
        cmp     r5, r3, asr r2
        mov     r0, #2, 2
        movgt   r0, r3
        bgt     LDIW21
        cmp     r5, r0, asr r2
        movge   r0, r5, lsl r2
        b       LDIW21
LDIW20:
        ldr     r0, [sp, #0x14]
        rsb     r0, r6, r0
        mov     r0, r5, asr r0
LDIW21:
        ldr     r2, [sp, #8]
        str     r0, [r2]
        ldr     r0, [sp, #0xC]
        strh    r1, [r0, #2]
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LDIW22:
        mov     r12, #2, 2
        mov     r11, #0x1F
        str     r12, [sp, #0x5C]
        b       LDIW10
LDIW23:
        mov     r12, #2, 2
        mov     lr, #0x1F
        str     r12, [sp, #0x5C]
        b       LDIW14
        .long   NormTable
        .long   NormTable2
        .long   LDIW_pitchSq7
        .long   gain_sq7Tbl


        .data
        .align  4


LDIW_pitchSq7:
        .byte   0x01,0x00,0x07,0x00,0x17,0x00,0x23,0x00,0x32,0x00,0x53,0x00,0x68,0x00,0x69,0x00
        .byte   0x79,0x00,0xA9,0x00,0xD8,0x00,0xDF,0x00,0xE0,0x00,0x38,0x01,0x75,0x01,0x99,0x01
        .byte   0xE4,0x01,0x1E,0x02,0x53,0x02,0xA1,0x02,0x72,0x03,0x75,0x03,0xA1,0x03,0xB2,0x03
        .byte   0xCC,0x03,0xD6,0x03,0x3B,0x04,0x16,0x05,0x85,0x05,0x8B,0x05,0xBD,0x05,0x50,0x06
        .byte   0x5D,0x06,0xA5,0x06,0x85,0x07,0xA5,0x07,0xA5,0x07,0x44,0x08,0x49,0x08,0x0A,0x09
        .byte   0xA2,0x09,0xB9,0x09,0x31,0x0A,0x46,0x0A,0x1C,0x0B,0x79,0x0B,0x35,0x0C,0x44,0x0C
        .byte   0x83,0x0C,0xBC,0x0C,0x10,0x0D,0x86,0x0D,0x4C,0x0E,0x58,0x0E,0xF6,0x0E,0x4A,0x0F
        .byte   0x84,0x10,0xB5,0x10,0xFF,0x10,0x09,0x11,0x18,0x11,0x1A,0x11,0x20,0x11,0x71,0x12
        .byte   0xE8,0x12,0x09,0x13,0x1A,0x13,0xCB,0x13,0x19,0x14,0x9A,0x14,0xD9,0x14,0x38,0x15
        .byte   0x67,0x15,0xE2,0x15,0x12,0x16,0x3A,0x16,0xA5,0x16,0xED,0x16,0x20,0x18,0x25,0x18
        .byte   0x4D,0x18,0xDA,0x18,0xE5,0x18,0xEB,0x18,0x15,0x1A,0x2D,0x1A,0x76,0x1A,0xE2,0x1A
        .byte   0xFE,0x1A,0x12,0x1B,0x4A,0x1C,0x4A,0x1C,0xE6,0x1C,0x56,0x1D,0x5A,0x1D,0x61,0x1D
        .byte   0xA7,0x1D,0x04,0x1E,0x67,0x1E,0x7A,0x1F,0xD2,0x1F,0x28,0x20,0x63,0x20,0x92,0x20
        .byte   0xEE,0x20,0xCD,0x21,0x93,0x22,0x96,0x22,0xD3,0x22,0xF4,0x22,0xE4,0x23,0xFC,0x23
        .byte   0xC9,0x24,0xF7,0x24,0x17,0x25,0x46,0x27,0x79,0x27,0x7F,0x27,0x98,0x29,0xB8,0x2A
        .byte   0x45,0x2C,0x7C,0x2C,0x25,0x2D,0x0C,0x2E,0x91,0x2E,0x44,0x2F,0xE0,0x2F,0xC0,0x35


