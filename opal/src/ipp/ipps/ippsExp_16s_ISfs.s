        .text
        .align  4
        .globl  _ippsExp_16s_ISfs


_ippsExp_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r7, r0
        cmp     r7, #0
        mov     r8, r1
        beq     LCFP52
        cmp     r8, #1
        bge     LCFP0
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP0:
        ldr     r12, [pc, #0x844]
        ldr     r6, [pc, #0x844]
        mov     r4, #0xFF
        mov     lr, #0xFE, 12
        tst     r7, #3
        orr     r4, r4, #0x7F, 24
        orr     r5, lr, #3, 4
        mov     r10, #0
        bne     LCFP20
        cmp     r2, #0
        beq     LCFP13
        cmp     r2, #0
        ble     LCFP32
        cmp     r2, #0x10
        mov     r9, r8, asr #1
        ble     LCFP6
        rsb     r0, r2, #0
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r1, #1, 2
        mov     r0, #0
        bl      pow
        cmp     r9, #0
        mov     r11, r0
        mov     r10, r1
        ble     LCFP4
        mov     r0, r7
        str     r7, [sp, #0xC]
        str     r5, [sp, #4]
        str     r8, [sp, #8]
        mov     r6, r0
LCFP1:
        ldr     r12, [r6]
        mov     lr, r12, lsl #16
        mov     r0, lr, asr #16
        mov     r5, r12, asr #16
        bl      __floatsidf
        bl      exp
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [pc, #0x7A4]
        mov     r8, r0
        mov     r7, r1
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        movgt   r7, r4
        bgt     LCFP2
        mov     r2, r8
        mov     r3, r7
        ldr     r1, [sp, #4]
        mov     r0, #0
        bl      __adddf3
        bl      __fixdfsi
        mov     r7, r0
LCFP2:
        mov     r0, r5
        bl      __floatsidf
        bl      exp
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [pc, #0x750]
        mov     r5, r0
        mov     r8, r1
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        movgt   r0, r4
        bgt     LCFP3
        mov     r2, r5
        mov     r3, r8
        ldr     r1, [sp, #4]
        mov     r0, #0
        bl      __adddf3
        bl      __fixdfsi
LCFP3:
        orr     r0, r7, r0, lsl #16
        str     r0, [r6], #4
        subs    r9, r9, #1
        bne     LCFP1
        ldr     r7, [sp, #0xC]
        ldr     r5, [sp, #4]
        ldr     r8, [sp, #8]
LCFP4:
        tst     r8, #1
        beq     LCFP31
        sub     r7, r7, #2
        mov     r8, r8, lsl #1
        ldrsh   r0, [r7, +r8]
        bl      __floatsidf
        bl      exp
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [pc, #0x6D4]
        mov     r6, r0
        mov     r9, r1
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        bgt     LCFP5
        mov     r1, r5
        mov     r2, r6
        mov     r3, r9
        mov     r0, #0
        bl      __adddf3
        bl      __fixdfsi
        mov     r4, r0
LCFP5:
        strh    r4, [r7, +r8]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP6:
        cmp     r9, #0
        ble     LCFP10
        mov     lr, r7
LCFP7:
        ldr     r3, [lr]
        mov     r5, r3, lsl #16
        mov     r5, r5, asr #16
        cmp     r5, #0x18
        mov     r3, r3, asr #16
        movgt   r5, r4
        bgt     LCFP8
        tst     r5, #2, 18
        movne   r5, r10
        bne     LCFP8
        add     r6, r12, r2, lsl #2
        ldr     r6, [r6, #0x40]
        mov     r5, r5, lsl #1
        ldrsh   r5, [r6, +r5]
LCFP8:
        cmp     r3, #0x18
        movgt   r3, r4
        bgt     LCFP9
        tst     r3, #2, 18
        movne   r3, r10
        bne     LCFP9
        add     r6, r12, r2, lsl #2
        ldr     r6, [r6, #0x40]
        mov     r3, r3, lsl #1
        ldrsh   r3, [r6, +r3]
LCFP9:
        orr     r3, r5, r3, lsl #16
        str     r3, [lr], #4
        subs    r9, r9, #1
        bne     LCFP7
LCFP10:
        tst     r8, #1
        beq     LCFP31
        sub     r7, r7, #2
        mov     r8, r8, lsl #1
        ldrsh   r1, [r7, +r8]
        cmp     r1, #0x18
        ble     LCFP11
        strh    r4, [r7, +r8]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP11:
        tst     r1, #2, 18
        bne     LCFP12
        add     r2, r12, r2, lsl #2
        ldr     r0, [r2, #0x40]
        mov     r1, r1, lsl #1
        ldrsh   r10, [r0, +r1]
LCFP12:
        strh    r10, [r7, +r8]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP13:
        mov     r5, r8, asr #1
        cmp     r5, #0
        ble     LCFP17
        mov     lr, r7
LCFP14:
        ldr     r3, [lr]
        mov     r6, r3, lsl #16
        mov     r6, r6, asr #16
        cmp     r6, #0x18
        mov     r3, r3, asr #16
        movgt   r6, r4
        bgt     LCFP15
        tst     r6, #2, 18
        movne   r6, r10
        bne     LCFP15
        add     r9, r12, r2, lsl #2
        ldr     r9, [r9, #0x40]
        mov     r6, r6, lsl #1
        ldrsh   r6, [r9, +r6]
LCFP15:
        cmp     r3, #0x18
        movgt   r3, r4
        bgt     LCFP16
        tst     r3, #2, 18
        movne   r3, r10
        bne     LCFP16
        add     r9, r12, r2, lsl #2
        ldr     r9, [r9, #0x40]
        mov     r3, r3, lsl #1
        ldrsh   r3, [r9, +r3]
LCFP16:
        orr     r3, r6, r3, lsl #16
        str     r3, [lr], #4
        subs    r5, r5, #1
        bne     LCFP14
LCFP17:
        tst     r8, #1
        beq     LCFP31
        sub     r7, r7, #2
        mov     r8, r8, lsl #1
        ldrsh   r1, [r7, +r8]
        cmp     r1, #0x18
        ble     LCFP18
        strh    r4, [r7, +r8]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP18:
        tst     r1, #2, 18
        bne     LCFP19
        add     r2, r12, r2, lsl #2
        ldr     r0, [r2, #0x40]
        mov     r1, r1, lsl #1
        ldrsh   r10, [r0, +r1]
LCFP19:
        strh    r10, [r7, +r8]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP20:
        cmp     r2, #0
        beq     LCFP27
        cmp     r2, #0
        ble     LCFP45
        cmp     r2, #0x10
        ble     LCFP23
        rsb     r0, r2, #0
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r1, #1, 2
        mov     r0, #0
        bl      pow
        cmp     r8, #0
        mov     r11, r0
        mov     r9, r1
        ble     LCFP31
        str     r5, [sp, #4]
        str     r4, [sp]
LCFP21:
        ldrsh   r0, [r7]
        bl      __floatsidf
        bl      exp
        mov     r2, r11
        mov     r3, r9
        bl      __muldf3
        mov     r5, r0
        mov     r4, r1
        mov     r2, #0
        mov     r3, r6
        bl      __ledf2
        cmp     r0, #0
        ldrgt   r12, [sp]
        bgt     LCFP22
        mov     r2, r5
        mov     r3, r4
        ldr     r1, [sp, #4]
        mov     r0, #0
        bl      __adddf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
LCFP22:
        add     r10, r10, #1
        strh    r12, [r7], #2
        cmp     r10, r8
        blt     LCFP21
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP23:
        cmp     r8, #0
        ble     LCFP31
        mov     r3, r10
LCFP24:
        ldrsh   r5, [r7]
        cmp     r5, #0x18
        strgth  r4, [r7]
        bgt     LCFP26
        tst     r5, #2, 18
        movne   r5, r10
        bne     LCFP25
        add     lr, r12, r2, lsl #2
        ldr     lr, [lr, #0x40]
        mov     r5, r5, lsl #1
        ldrsh   r5, [lr, +r5]
LCFP25:
        strh    r5, [r7]
LCFP26:
        add     r3, r3, #1
        cmp     r3, r8
        add     r7, r7, #2
        blt     LCFP24
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP27:
        cmp     r8, #0
        ble     LCFP31
        mov     r3, r10
LCFP28:
        ldrsh   r5, [r7]
        cmp     r5, #0x18
        strgth  r4, [r7]
        bgt     LCFP30
        tst     r5, #2, 18
        movne   r5, r10
        bne     LCFP29
        add     lr, r12, r2, lsl #2
        ldr     lr, [lr, #0x40]
        mov     r5, r5, lsl #1
        ldrsh   r5, [lr, +r5]
LCFP29:
        strh    r5, [r7]
LCFP30:
        add     r3, r3, #1
        cmp     r3, r8
        add     r7, r7, #2
        blt     LCFP28
LCFP31:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP32:
        cmn     r2, #0x10
        mov     r9, r8, asr #1
        bge     LCFP38
        rsb     r0, r2, #0
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r1, #1, 2
        mov     r0, #0
        bl      pow
        cmp     r9, #0
        mov     r11, r0
        mov     r10, r1
        ble     LCFP36
        mov     r0, r7
        str     r7, [sp, #0xC]
        str     r5, [sp, #4]
        str     r8, [sp, #8]
        mov     r6, r0
LCFP33:
        ldr     r12, [r6]
        mov     lr, r12, lsl #16
        mov     r0, lr, asr #16
        mov     r5, r12, asr #16
        bl      __floatsidf
        bl      exp
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [pc, #0x308]
        mov     r8, r0
        mov     r7, r1
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        movgt   r7, r4
        bgt     LCFP34
        mov     r2, r8
        mov     r3, r7
        ldr     r1, [sp, #4]
        mov     r0, #0
        bl      __adddf3
        bl      __fixdfsi
        mov     r7, r0
LCFP34:
        mov     r0, r5
        bl      __floatsidf
        bl      exp
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [pc, #0x2B4]
        mov     r5, r0
        mov     r8, r1
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        movgt   r0, r4
        bgt     LCFP35
        mov     r2, r5
        mov     r3, r8
        ldr     r1, [sp, #4]
        mov     r0, #0
        bl      __adddf3
        bl      __fixdfsi
LCFP35:
        orr     r0, r7, r0, lsl #16
        str     r0, [r6], #4
        subs    r9, r9, #1
        bne     LCFP33
        ldr     r7, [sp, #0xC]
        ldr     r5, [sp, #4]
        ldr     r8, [sp, #8]
LCFP36:
        tst     r8, #1
        beq     LCFP31
        sub     r7, r7, #2
        mov     r8, r8, lsl #1
        ldrsh   r0, [r7, +r8]
        bl      __floatsidf
        bl      exp
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r3, [pc, #0x238]
        mov     r6, r0
        mov     r9, r1
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        bgt     LCFP37
        mov     r1, r5
        mov     r2, r6
        mov     r3, r9
        mov     r0, #0
        bl      __adddf3
        bl      __fixdfsi
        mov     r4, r0
LCFP37:
        strh    r4, [r7, +r8]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP38:
        cmp     r9, #0
        ble     LCFP42
        mov     r5, r7
LCFP39:
        ldr     r3, [r5]
        mov     lr, r3, lsl #16
        mov     lr, lr, asr #16
        cmp     lr, #0xC
        mov     r3, r3, asr #16
        movgt   lr, r4
        bgt     LCFP40
        cmn     lr, #0xC
        movlt   lr, r10
        blt     LCFP40
        add     r6, r12, r2, lsl #2
        ldr     r6, [r6, #0x40]
        mov     lr, lr, lsl #1
        add     lr, lr, #0x18
        ldrsh   lr, [r6, +lr]
LCFP40:
        cmp     r3, #0xC
        movgt   r3, r4
        bgt     LCFP41
        cmn     r3, #0xC
        movlt   r3, r10
        blt     LCFP41
        add     r6, r12, r2, lsl #2
        ldr     r6, [r6, #0x40]
        mov     r3, r3, lsl #1
        add     r3, r3, #0x18
        ldrsh   r3, [r6, +r3]
LCFP41:
        orr     r3, lr, r3, lsl #16
        str     r3, [r5], #4
        subs    r9, r9, #1
        bne     LCFP39
LCFP42:
        tst     r8, #1
        beq     LCFP31
        sub     r7, r7, #2
        mov     r8, r8, lsl #1
        ldrsh   r1, [r7, +r8]
        cmp     r1, #0xC
        ble     LCFP43
        strh    r4, [r7, +r8]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP43:
        cmn     r1, #0xC
        blt     LCFP44
        add     r2, r12, r2, lsl #2
        ldr     r0, [r2, #0x40]
        mov     r1, r1, lsl #1
        add     r1, r1, #0x18
        ldrsh   r10, [r0, +r1]
LCFP44:
        strh    r10, [r7, +r8]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP45:
        cmn     r2, #0x10
        bge     LCFP48
        rsb     r0, r2, #0
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r1, #1, 2
        mov     r0, #0
        bl      pow
        cmp     r8, #0
        mov     r11, r0
        mov     r9, r1
        ble     LCFP31
        str     r5, [sp, #4]
        str     r4, [sp]
LCFP46:
        ldrsh   r0, [r7]
        bl      __floatsidf
        bl      exp
        mov     r2, r11
        mov     r3, r9
        bl      __muldf3
        mov     r5, r0
        mov     r4, r1
        mov     r2, #0
        mov     r3, r6
        bl      __ledf2
        cmp     r0, #0
        ldrgt   r12, [sp]
        bgt     LCFP47
        mov     r2, r5
        mov     r3, r4
        ldr     r1, [sp, #4]
        mov     r0, #0
        bl      __adddf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
LCFP47:
        add     r10, r10, #1
        strh    r12, [r7], #2
        cmp     r10, r8
        blt     LCFP46
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP48:
        cmp     r8, #0
        ble     LCFP31
        mov     r3, r10
LCFP49:
        ldrsh   r5, [r7]
        cmp     r5, #0xC
        strgth  r4, [r7]
        bgt     LCFP51
        cmn     r5, #0xC
        movlt   r5, r10
        blt     LCFP50
        add     lr, r12, r2, lsl #2
        ldr     lr, [lr, #0x40]
        mov     r5, r5, lsl #1
        add     r5, r5, #0x18
        ldrsh   r5, [lr, +r5]
LCFP50:
        strh    r5, [r7]
LCFP51:
        add     r3, r3, #1
        cmp     r3, r8
        add     r7, r7, #2
        blt     LCFP49
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCFP52:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   LCFP_Point_Tab
        .long   0x40dfffc0


        .data
        .align  4


LCFP_E_Tab_M16:
        .byte   0x00,0x00,0x01,0x00,0x03,0x00,0x08,0x00,0x16,0x00,0x3C,0x00,0xA2,0x00,0xBA,0x01
        .byte   0xB0,0x04,0xBF,0x0C,0xA5,0x22,0x2D,0x5E,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M15:
        .byte   0x00,0x00,0x01,0x00,0x01,0x00,0x04,0x00,0x0B,0x00,0x1E,0x00,0x51,0x00,0xDD,0x00
        .byte   0x58,0x02,0x5F,0x06,0x53,0x11,0x17,0x2F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M14:
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x05,0x00,0x0F,0x00,0x29,0x00,0x6E,0x00
        .byte   0x2C,0x01,0x30,0x03,0xA9,0x08,0x8B,0x17,0x00,0x40,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M13:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x03,0x00,0x07,0x00,0x14,0x00,0x37,0x00
        .byte   0x96,0x00,0x98,0x01,0x55,0x04,0xC6,0x0B,0x00,0x20,0xFC,0x56,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M12:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x01,0x00,0x04,0x00,0x0A,0x00,0x1C,0x00
        .byte   0x4B,0x00,0xCC,0x00,0x2A,0x02,0xE3,0x05,0x00,0x10,0x7E,0x2B,0x3A,0x76,0xFF,0x7F
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M11:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x05,0x00,0x0E,0x00
        .byte   0x26,0x00,0x66,0x00,0x15,0x01,0xF1,0x02,0x00,0x08,0xBF,0x15,0x1D,0x3B,0xFF,0x7F
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M10:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x03,0x00,0x07,0x00
        .byte   0x13,0x00,0x33,0x00,0x8B,0x00,0x79,0x01,0x00,0x04,0xE0,0x0A,0x8E,0x1D,0x58,0x50
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M8:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x02,0x00
        .byte   0x05,0x00,0x0D,0x00,0x23,0x00,0x5E,0x00,0x00,0x01,0xB8,0x02,0x64,0x07,0x16,0x14
        .byte   0x99,0x36,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M7:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00
        .byte   0x02,0x00,0x06,0x00,0x11,0x00,0x2F,0x00,0x80,0x00,0x5C,0x01,0xB2,0x03,0x0B,0x0A
        .byte   0x4D,0x1B,0x35,0x4A,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M6:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x01,0x00,0x03,0x00,0x09,0x00,0x18,0x00,0x40,0x00,0xAE,0x00,0xD9,0x01,0x05,0x05
        .byte   0xA6,0x0D,0x1A,0x25,0xDB,0x64,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M5:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x01,0x00,0x02,0x00,0x04,0x00,0x0C,0x00,0x20,0x00,0x57,0x00,0xEC,0x00,0x83,0x02
        .byte   0xD3,0x06,0x8D,0x12,0x6E,0x32,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M4:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x01,0x00,0x02,0x00,0x06,0x00,0x10,0x00,0x2B,0x00,0x76,0x00,0x41,0x01
        .byte   0x6A,0x03,0x47,0x09,0x37,0x19,0x8A,0x44,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M3:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x03,0x00,0x08,0x00,0x16,0x00,0x3B,0x00,0xA1,0x00
        .byte   0xB5,0x01,0xA3,0x04,0x9B,0x0C,0x45,0x22,0x28,0x5D,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M2:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x01,0x00,0x04,0x00,0x0B,0x00,0x1E,0x00,0x50,0x00
        .byte   0xDA,0x00,0x52,0x02,0x4E,0x06,0x23,0x11,0x94,0x2E,0x9C,0x7E,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_M1:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x05,0x00,0x0F,0x00,0x28,0x00
        .byte   0x6D,0x00,0x29,0x01,0x27,0x03,0x91,0x08,0x4A,0x17,0x4E,0x3F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_0:
        .byte   0x01,0x00,0x03,0x00,0x07,0x00,0x14,0x00,0x37,0x00,0x94,0x00,0x93,0x01,0x49,0x04
        .byte   0xA5,0x0B,0xA7,0x1F,0x0A,0x56,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P1:
        .byte   0x01,0x00,0x01,0x00,0x04,0x00,0x0A,0x00,0x1B,0x00,0x4A,0x00,0xCA,0x00,0x24,0x02
        .byte   0xD2,0x05,0xD4,0x0F,0x05,0x2B,0xF1,0x74,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P2:
        .byte   0x00,0x00,0x01,0x00,0x02,0x00,0x05,0x00,0x0E,0x00,0x25,0x00,0x65,0x00,0x12,0x01
        .byte   0xE9,0x02,0xEA,0x07,0x83,0x15,0x79,0x3A,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P3:
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x03,0x00,0x07,0x00,0x13,0x00,0x32,0x00,0x89,0x00
        .byte   0x75,0x01,0xF5,0x03,0xC1,0x0A,0x3C,0x1D,0x78,0x4F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P4:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x03,0x00,0x09,0x00,0x19,0x00,0x45,0x00
        .byte   0xBA,0x00,0xFA,0x01,0x61,0x05,0x9E,0x0E,0xBC,0x27,0x03,0x6C,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P5:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x05,0x00,0x0D,0x00,0x22,0x00
        .byte   0x5D,0x00,0xFD,0x00,0xB0,0x02,0x4F,0x07,0xDE,0x13,0x01,0x36,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P6:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x06,0x00,0x11,0x00
        .byte   0x2F,0x00,0x7F,0x00,0x58,0x01,0xA8,0x03,0xEF,0x09,0x01,0x1B,0x67,0x49,0xFF,0x7F
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P7:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x03,0x00,0x09,0x00
        .byte   0x17,0x00,0x3F,0x00,0xAC,0x00,0xD4,0x01,0xF8,0x04,0x80,0x0D,0xB3,0x24,0xC3,0x63
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P8:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x04,0x00
        .byte   0x0C,0x00,0x20,0x00,0x56,0x00,0xEA,0x00,0x7C,0x02,0xC0,0x06,0x5A,0x12,0xE2,0x31
        .byte   0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P9:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x02,0x00
        .byte   0x06,0x00,0x10,0x00,0x2B,0x00,0x75,0x00,0x3E,0x01,0x60,0x03,0x2D,0x09,0xF1,0x18
        .byte   0xCC,0x43,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P10:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00
        .byte   0x03,0x00,0x08,0x00,0x16,0x00,0x3A,0x00,0x9F,0x00,0xB0,0x01,0x96,0x04,0x78,0x0C
        .byte   0xE6,0x21,0x25,0x5C,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P11:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00
        .byte   0x01,0x00,0x04,0x00,0x0B,0x00,0x1D,0x00,0x4F,0x00,0xD8,0x00,0x4B,0x02,0x3C,0x06
        .byte   0xF3,0x10,0x12,0x2E,0x3D,0x7D,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P12:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x01,0x00,0x02,0x00,0x05,0x00,0x0F,0x00,0x28,0x00,0x6C,0x00,0x26,0x01,0x1E,0x03
        .byte   0x79,0x08,0x09,0x17,0x9E,0x3E,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P13:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x01,0x00,0x03,0x00,0x07,0x00,0x14,0x00,0x36,0x00,0x93,0x00,0x8F,0x01
        .byte   0x3D,0x04,0x85,0x0B,0x4F,0x1F,0x1B,0x55,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P14:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x04,0x00,0x0A,0x00,0x1B,0x00,0x49,0x00,0xC8,0x00
        .byte   0x1E,0x02,0xC2,0x05,0xA8,0x0F,0x8E,0x2A,0xAC,0x73,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P15:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x05,0x00,0x0E,0x00,0x25,0x00,0x64,0x00
        .byte   0x0F,0x01,0xE1,0x02,0xD4,0x07,0x47,0x15,0xD6,0x39,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F,0x00,0x00
LCFP_E_Tab_P16:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x02,0x00,0x07,0x00,0x12,0x00,0x32,0x00
        .byte   0x88,0x00,0x71,0x01,0xEA,0x03,0xA3,0x0A,0xEB,0x1C,0x9C,0x4E,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F


        .data
        .align  4


LCFP_Point_Tab:
        .long   LCFP_E_Tab_M16
        .long   LCFP_E_Tab_M15
        .long   LCFP_E_Tab_M14
        .long   LCFP_E_Tab_M13
        .long   LCFP_E_Tab_M12
        .long   LCFP_E_Tab_M11
        .long   LCFP_E_Tab_M10
        .long   LCFP_E_Tab_M9
        .long   LCFP_E_Tab_M8
        .long   LCFP_E_Tab_M7
        .long   LCFP_E_Tab_M6
        .long   LCFP_E_Tab_M5
        .long   LCFP_E_Tab_M4
        .long   LCFP_E_Tab_M3
        .long   LCFP_E_Tab_M2
        .long   LCFP_E_Tab_M1
        .long   LCFP_E_Tab_0
        .long   LCFP_E_Tab_P1
        .long   LCFP_E_Tab_P2
        .long   LCFP_E_Tab_P3
        .long   LCFP_E_Tab_P4
        .long   LCFP_E_Tab_P5
        .long   LCFP_E_Tab_P6
        .long   LCFP_E_Tab_P7
        .long   LCFP_E_Tab_P8
        .long   LCFP_E_Tab_P9
        .long   LCFP_E_Tab_P10
        .long   LCFP_E_Tab_P11
        .long   LCFP_E_Tab_P12
        .long   LCFP_E_Tab_P13
        .long   LCFP_E_Tab_P14
        .long   LCFP_E_Tab_P15
        .long   LCFP_E_Tab_P16
LCFP_E_Tab_M9:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x00,0x03,0x00
        .byte   0x09,0x00,0x19,0x00,0x45,0x00,0xBC,0x00,0x00,0x02,0x70,0x05,0xC7,0x0E,0x2C,0x28
        .byte   0x32,0x6D,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F,0xFF,0x7F
        .byte   0xFF,0x7F

