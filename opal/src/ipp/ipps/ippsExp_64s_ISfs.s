        .text
        .align  4
        .globl  _ippsExp_64s_ISfs


_ippsExp_64s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r1
        beq     LCFG17
        cmp     r5, #1
        blt     LCFG8
        ldr     r3, [pc, #0x2B0]
        cmp     r2, #0
        mvn     r7, #2, 2
        mvn     r8, #0
        mov     r6, #0
        beq     LCFG3
        cmp     r2, #1
        beq     LCFG13
        cmn     r2, #1
        beq     LCFG9
        rsb     r0, r2, #0
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r1, #1, 2
        mov     r0, #0
        bl      pow
        cmp     r5, #0
        mov     r10, r0
        mov     r9, r1
        ble     LCFG7
        mov     r12, #0x3E, 12
        orr     r11, r12, #1, 2
        str     r8, [sp]
        str     r7, [sp, #4]
LCFG0:
        ldr     r0, [r4]
        ldr     r1, [r4, #4]
        bl      __floatdidf
        bl      exp
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r8, r0
        mov     r7, r1
        mov     r3, r11
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LCFG1
        ldr     r12, [sp]
        str     r12, [r4]
        ldr     r12, [sp, #4]
        str     r12, [r4, #4]
        b       LCFG2
LCFG1:
        mov     r0, r8
        mov     r1, r7
        bl      __fixdfdi
        str     r0, [r4]
        str     r1, [r4, #4]
LCFG2:
        add     r6, r6, #1
        cmp     r6, r5
        add     r4, r4, #8
        blt     LCFG0
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCFG3:
        cmp     r5, #0
        ble     LCFG7
        mov     r12, r6
LCFG4:
        ldr     r2, [r4]
        ldr     lr, [r4, #4]
        subs    r9, r2, #0x2C
        sbcs    r10, lr, #0
        movlt   r9, #0
        movlt   r10, #0
        orrs    r10, r9, r10
        strne   r8, [r4]
        strne   r7, [r4, #4]
        bne     LCFG6
        bic     lr, lr, r7
        orrs    lr, lr, #0
        movne   r2, r6
        movne   lr, r2
        bne     LCFG5
        add     lr, r3, r2, lsl #3
        ldr     r2, [r3, +r2, lsl #3]
        ldr     lr, [lr, #4]
LCFG5:
        str     r2, [r4]
        str     lr, [r4, #4]
LCFG6:
        add     r12, r12, #1
        cmp     r12, r5
        add     r4, r4, #8
        blt     LCFG4
LCFG7:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCFG8:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCFG9:
        cmp     r5, #0
        ble     LCFG7
        mov     r9, r6
        mov     lr, r9
        mov     r12, #1
LCFG10:
        ldr     r2, [r4]
        ldr     r10, [r4, #4]
        subs    r0, r2, #0x2A
        sbcs    r11, r10, #0
        movlt   r0, #0
        movlt   r11, #0
        orrs    r11, r0, r11
        strne   r8, [r4]
        strne   r7, [r4, #4]
        bne     LCFG12
        cmp     r10, r8
        cmpeq   r2, r8
        streq   r12, [r4]
        streq   lr, [r4, #4]
        beq     LCFG12
        and     r10, r2, #2, 18
        orrs    r10, r10, #0
        movne   r2, r6
        movne   r10, r2
        bne     LCFG11
        add     r10, r3, r2, lsl #3
        ldr     r2, [r3, +r2, lsl #3]
        ldr     r10, [r10, #4]
LCFG11:
        mov     r11, r2, lsr #31
        orr     r10, r11, r10, lsl #1
        mov     r2, r2, lsl #1
        str     r10, [r4, #4]
        str     r2, [r4]
LCFG12:
        add     r9, r9, #1
        cmp     r9, r5
        add     r4, r4, #8
        blt     LCFG10
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCFG13:
        cmp     r5, #0
        ble     LCFG7
        ldr     lr, [pc, #0xA8]
        ldr     r12, [pc, #0xA8]
        mov     r9, #0x2C
LCFG14:
        ldr     r2, [r4]
        ldr     r10, [r4, #4]
        subs    r0, r2, #0x2C
        sbcs    r11, r10, #0
        movlt   r0, #0
        movlt   r11, #0
        orrs    r11, r0, r11
        strne   r8, [r4]
        strne   r7, [r4, #4]
        bne     LCFG16
        cmp     r10, #0
        cmpeq   r2, r9
        streq   r12, [r4]
        streq   lr, [r4, #4]
        beq     LCFG16
        and     r10, r2, #2, 18
        orrs    r10, r10, #0
        movne   r2, #0
        movne   r10, r2
        bne     LCFG15
        ldr     r10, [r3, +r2, lsl #3]
        add     r11, r3, r2, lsl #3
        ldr     r2, [r11, #4]
LCFG15:
        adds    r10, r10, #1
        adc     r2, r2, #0
        mov     r11, r2, lsl #31
        orr     r10, r11, r10, lsr #1
        mov     r2, r2, asr #1
        str     r10, [r4]
        str     r2, [r4, #4]
LCFG16:
        add     r6, r6, #1
        cmp     r6, r5
        add     r4, r4, #8
        blt     LCFG14
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCFG17:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   LCFG_ExpTab
        .long   0x592d071b
        .long   0x4de0c7fa


        .data
        .align  4


LCFG_ExpTab:
        .byte   0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x07,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x14,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x37,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x94,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x93,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x49,0x04,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0xA5,0x0B,0x00,0x00,0x00,0x00,0x00,0x00,0xA7,0x1F,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x0A,0x56,0x00,0x00,0x00,0x00,0x00,0x00,0xE2,0xE9,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0xC3,0x7B,0x02,0x00,0x00,0x00,0x00,0x00,0x2D,0xC0,0x06,0x00,0x00,0x00,0x00,0x00
        .byte   0xAC,0x59,0x12,0x00,0x00,0x00,0x00,0x00,0x99,0xE1,0x31,0x00,0x00,0x00,0x00,0x00
        .byte   0x5F,0x97,0x87,0x00,0x00,0x00,0x00,0x00,0x49,0x93,0x70,0x01,0x00,0x00,0x00,0x00
        .byte   0x41,0xE4,0xE9,0x03,0x00,0x00,0x00,0x00,0x7D,0x6C,0xA3,0x0A,0x00,0x00,0x00,0x00
        .byte   0x8B,0x08,0xEB,0x1C,0x00,0x00,0x00,0x00,0xF6,0x87,0x9B,0x4E,0x00,0x00,0x00,0x00
        .byte   0xCE,0x6D,0xAD,0xD5,0x00,0x00,0x00,0x00,0x76,0xE6,0xD5,0x44,0x02,0x00,0x00,0x00
        .byte   0x52,0xED,0xDF,0x2A,0x06,0x00,0x00,0x00,0x09,0x92,0xD3,0xC3,0x10,0x00,0x00,0x00
        .byte   0xD5,0xD2,0x64,0x92,0x2D,0x00,0x00,0x00,0xDA,0xDF,0x8B,0xE0,0x7B,0x00,0x00,0x00
        .byte   0x63,0x79,0xA3,0xBB,0x50,0x01,0x00,0x00,0x38,0xC6,0xC8,0x55,0x93,0x03,0x00,0x00
        .byte   0x14,0x76,0x85,0x23,0xB8,0x09,0x00,0x00,0xDF,0x8C,0x5D,0x76,0x6B,0x1A,0x00,0x00
        .byte   0x99,0x2D,0x31,0xFF,0xD0,0x47,0x00,0x00,0xBC,0x92,0x53,0x9A,0x37,0xC3,0x00,0x00
        .byte   0xDF,0x43,0xE7,0xC5,0xA7,0x12,0x02,0x00,0x57,0x23,0x6F,0x88,0x78,0xA2,0x05,0x00
        .byte   0xBB,0x06,0xE9,0xD0,0x0A,0x51,0x0F,0x00,0x33,0x00,0x34,0x76,0x7F,0xA2,0x29,0x00
        .byte   0x9C,0x31,0x5F,0x18,0xCD,0x2C,0x71,0x00,0x93,0x51,0x2A,0x28,0x3D,0xA4,0x33,0x01
        .byte   0x51,0x5D,0x2E,0x2F,0xA7,0x41,0x44,0x03,0x25,0x31,0xB4,0x6F,0x44,0x2E,0xE1,0x08
        .byte   0x37,0x59,0x11,0x20,0x58,0x25,0x23,0x18,0x01,0xC5,0xE1,0x7A,0xF2,0xA8,0x9C,0x41
        .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x7F


