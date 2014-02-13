        .text
        .align  4
        .globl  _ippsWinHybrid_G729E_16s32s


_ippsWinHybrid_G729E_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x95, 30
        add     lr, sp, #8
        and     r4, lr, #0xF
        add     r12, sp, #0x72, 30
        add     r3, sp, #0x4F, 30
        and     r5, r12, #0xF
        rsb     r9, r4, #0
        and     r8, r3, #0xF
        rsb     r4, r8, #0
        rsb     r5, r5, #0
        and     r5, r5, #0xF
        and     r4, r4, #0xF
        add     lr, sp, #8
        add     r12, sp, #0x72, 30
        add     r3, sp, #0x4F, 30
        and     r9, r9, #0xF
        cmp     r0, #0
        add     r8, lr, r9
        add     r5, r12, r5
        add     r4, r3, r4
        mov     r7, r1
        mov     r6, r2
        beq     LDEY3
        cmp     r7, #0
        beq     LDEY3
        cmp     r6, #0
        beq     LDEY3
        ldr     r1, [pc, #0x120]
        mov     r3, #0xF
        str     r3, [sp]
        mov     r3, #0x91
        mov     r2, r8
        bl      ownMul_16s_NoS_Sfs
        add     r0, r8, #0x3C
        mov     r3, #0x1F
        mov     r2, r5
        mov     r1, #0x50
        bl      _ippsAutoCorr_Inv_16s32s
        add     r0, r8, #0xDC
        mov     r3, #0x1F
        mov     r2, r4
        mov     r1, #0x23
        bl      _ippsAutoCorr_Inv_16s32s
        mvn     lr, #2, 2
        mvn     r12, #0
        mvn     r3, #3, 2
        mov     r0, #0x1F
LDEY0:
        ldr     r9, [r6]
        add     r10, r12, #2, 18
        ldr     r8, [r5], #4
        and     r10, r10, r9, asr #1
        mov     r9, r9, asr #16
        add     r11, r10, r10, lsl #2
        mov     r9, r9, lsl #16
        add     r11, r10, r11, lsl #4
        mov     r9, r9, asr #16
        mov     r10, r11, lsl #7
        add     r11, r9, r9, lsl #2
        add     r9, r9, r11, lsl #4
        mov     r10, r10, asr #15
        add     r9, r10, r9, lsl #7
        mov     r10, r9, lsl #1
        adds    r9, r8, r10
        mov     r10, r10, asr #31
        adc     r8, r10, r8, asr #31
        subs    r11, r9, lr
        sbcs    r10, r8, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        movne   r9, lr
        bne     LDEY1
        cmp     r9, #2, 2
        sbcs    r8, r8, r12
        movlt   r9, #2, 2
LDEY1:
        ldr     r10, [r4], #4
        str     r9, [r6], #4
        adds    r8, r10, r9
        mov     r9, r9, asr #31
        adc     r9, r9, r10, asr #31
        subs    r11, r8, lr
        sbcs    r10, r9, #0
        movlt   r11, #0
        movlt   r10, #0
        orrs    r10, r11, r10
        movne   r8, lr
        bne     LDEY2
        cmp     r8, #2, 2
        sbcs    r9, r9, r12
        movlt   r8, #2, 2
LDEY2:
        cmn     r8, #7, 2
        movgt   r8, r3
        str     r8, [r7], #4
        subs    r0, r0, #1
        bne     LDEY0
        mov     r0, #0
        add     sp, sp, #0x95, 30
        ldmia   sp!, {r4 - r11, pc}
LDEY3:
        mvn     r0, #7
        add     sp, sp, #0x95, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   LDEY_hw


        .data
        .align  4


LDEY_hw:
        .byte   0xCB,0x39,0x36,0x3A,0xA1,0x3A,0x0E,0x3B,0x7B,0x3B,0xE9,0x3B,0x57,0x3C,0xC7,0x3C
        .byte   0x37,0x3D,0xA8,0x3D,0x1A,0x3E,0x8D,0x3E,0x01,0x3F,0x75,0x3F,0xEA,0x3F,0x60,0x40
        .byte   0xD7,0x40,0x4F,0x41,0xC8,0x41,0x41,0x42,0xBC,0x42,0x37,0x43,0xB3,0x43,0x30,0x44
        .byte   0xAE,0x44,0x2D,0x45,0xAD,0x45,0x2E,0x46,0xB0,0x46,0x32,0x47,0xB6,0x47,0x3A,0x48
        .byte   0xC0,0x48,0x46,0x49,0xCE,0x49,0x56,0x4A,0xDF,0x4A,0x6A,0x4B,0xF5,0x4B,0x81,0x4C
        .byte   0x0F,0x4D,0x9D,0x4D,0x2D,0x4E,0xBD,0x4E,0x4F,0x4F,0xE1,0x4F,0x75,0x50,0x09,0x51
        .byte   0x9F,0x51,0x36,0x52,0xCE,0x52,0x67,0x53,0x01,0x54,0x9C,0x54,0x39,0x55,0xD6,0x55
        .byte   0x75,0x56,0x14,0x57,0xB5,0x57,0x57,0x58,0xFB,0x58,0x9F,0x59,0x45,0x5A,0xEB,0x5A
        .byte   0x93,0x5B,0x3D,0x5C,0xE7,0x5C,0x93,0x5D,0x40,0x5E,0xEE,0x5E,0x9D,0x5F,0x4E,0x60
        .byte   0x00,0x61,0xB3,0x61,0x68,0x62,0x1D,0x63,0xD5,0x63,0x8D,0x64,0x47,0x65,0x02,0x66
        .byte   0xBF,0x66,0x7C,0x67,0x3C,0x68,0xFC,0x68,0xBE,0x69,0x82,0x6A,0x46,0x6B,0x0D,0x6C
        .byte   0xD4,0x6C,0x9D,0x6D,0x68,0x6E,0x34,0x6F,0x01,0x70,0xD0,0x70,0xA1,0x71,0x73,0x72
        .byte   0x46,0x73,0x1B,0x74,0xF2,0x74,0xCA,0x75,0xA4,0x76,0x7F,0x77,0x5C,0x78,0x3A,0x79
        .byte   0x1A,0x7A,0xFC,0x7A,0xDF,0x7B,0xC4,0x7C,0xAA,0x7D,0x93,0x7E,0x57,0x7F,0xD1,0x7F
        .byte   0xFF,0x7F,0xE3,0x7F,0x7D,0x7F,0xCC,0x7E,0xD0,0x7D,0x8C,0x7C,0xFE,0x7A,0x28,0x79
        .byte   0x0C,0x77,0xAA,0x74,0x04,0x72,0x1C,0x6F,0xF2,0x6B,0x89,0x68,0xE4,0x64,0x03,0x61
        .byte   0xEA,0x5C,0x9A,0x58,0x16,0x54,0x62,0x4F,0x7F,0x4A,0x70,0x45,0x39,0x40,0xDC,0x3A
        .byte   0x5D,0x35,0xBF,0x2F,0x05,0x2A,0x32,0x24,0x4B,0x1E,0x51,0x18,0x49,0x12,0x37,0x0C
        .byte   0x1D,0x06


