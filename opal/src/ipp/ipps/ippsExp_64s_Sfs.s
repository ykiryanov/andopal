        .text
        .align  4
        .globl  _ippsExp_64s_Sfs


_ippsExp_64s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r7, r2
        beq     LCFF16
        cmp     r4, #0
        beq     LCFF16
        cmp     r7, #1
        blt     LCFF7
        ldr     r12, [pc, #0x2C0]
        cmp     r3, #0
        mvn     r8, #0
        mvn     r9, #2, 2
        mov     r6, #0
        beq     LCFF2
        cmp     r3, #1
        beq     LCFF12
        cmn     r3, #1
        beq     LCFF8
        rsb     r0, r3, #0
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r1, #1, 2
        mov     r0, #0
        bl      pow
        cmp     r7, #0
        mov     r10, r1
        ble     LCFF6
        mov     r12, #0x3E, 12
        sub     r4, r4, #4
        str     r9, [sp]
        str     r8, [sp, #4]
        str     r7, [sp, #8]
        orr     r11, r12, #1, 2
        mov     r7, r0
        mov     r9, r4
        mov     r8, r6
LCFF0:
        ldr     r0, [r5]
        ldr     r1, [r5, #4]
        bl      __floatdidf
        bl      exp
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        mov     r6, r0
        mov     r4, r1
        mov     r3, r11
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        ldrgt   r0, [sp, #4]
        ldrgt   r1, [sp]
        bgt     LCFF1
        mov     r0, r6
        mov     r1, r4
        bl      __fixdfdi
LCFF1:
        str     r0, [r9, #4]
        str     r1, [r9, #8]!
        ldr     r12, [sp, #8]
        add     r8, r8, #1
        cmp     r8, r12
        add     r5, r5, #8
        blt     LCFF0
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCFF2:
        cmp     r7, #0
        ble     LCFF6
        mov     lr, r6
LCFF3:
        ldr     r3, [r5]
        ldr     r11, [r5, #4]
        subs    r10, r3, #0x2C
        sbcs    r11, r11, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        strne   r8, [r4]
        strne   r9, [r4, #4]
        bne     LCFF5
        and     r10, r3, #2, 18
        orrs    r10, r10, #0
        movne   r3, r6
        movne   r10, r3
        bne     LCFF4
        add     r10, r12, r3, lsl #3
        ldr     r3, [r12, +r3, lsl #3]
        ldr     r10, [r10, #4]
LCFF4:
        str     r3, [r4]
        str     r10, [r4, #4]
LCFF5:
        add     lr, lr, #1
        cmp     lr, r7
        add     r4, r4, #8
        add     r5, r5, #8
        blt     LCFF3
LCFF6:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCFF7:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCFF8:
        cmp     r7, #0
        ble     LCFF6
        mov     r10, r6
        mov     lr, #1
LCFF9:
        ldr     r3, [r5]
        ldr     r11, [r5, #4]
        subs    r1, r3, #0x2A
        sbcs    r0, r11, #0
        movlt   r1, #0
        movlt   r0, #0
        orrs    r0, r1, r0
        strne   r8, [r4]
        strne   r9, [r4, #4]
        bne     LCFF11
        cmp     r11, r8
        cmpeq   r3, r8
        streq   lr, [r4]
        streq   r6, [r4, #4]
        beq     LCFF11
        and     r11, r3, #2, 18
        orrs    r11, r11, #0
        movne   r11, #0
        movne   r3, r11
        bne     LCFF10
        add     r11, r12, r3, lsl #3
        ldr     r3, [r12, +r3, lsl #3]
        ldr     r11, [r11, #4]
LCFF10:
        mov     r0, r3, lsr #31
        orr     r11, r0, r11, lsl #1
        mov     r3, r3, lsl #1
        str     r11, [r4, #4]
        str     r3, [r4]
LCFF11:
        add     r10, r10, #1
        cmp     r10, r7
        add     r4, r4, #8
        add     r5, r5, #8
        blt     LCFF9
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCFF12:
        cmp     r7, #0
        ble     LCFF6
        ldr     r11, [pc, #0xAC]
        ldr     r10, [pc, #0xAC]
        mov     r0, #0x2C
LCFF13:
        ldr     lr, [r5]
        ldr     r3, [r5, #4]
        subs    r2, lr, #0x2C
        sbcs    r1, r3, #0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        strne   r8, [r4]
        strne   r9, [r4, #4]
        bne     LCFF15
        cmp     r3, #0
        cmpeq   lr, r0
        streq   r10, [r4]
        streq   r11, [r4, #4]
        beq     LCFF15
        and     r3, lr, #2, 18
        orrs    r3, r3, #0
        movne   r3, #0
        movne   lr, r3
        bne     LCFF14
        add     r3, r12, lr, lsl #3
        ldr     lr, [r12, +lr, lsl #3]
        ldr     r3, [r3, #4]
LCFF14:
        adds    lr, lr, #1
        adc     r3, r3, #0
        mov     r1, r3, lsl #31
        orr     lr, r1, lr, lsr #1
        mov     r3, r3, asr #1
        str     lr, [r4]
        str     r3, [r4, #4]
LCFF15:
        add     r6, r6, #1
        cmp     r6, r7
        add     r4, r4, #8
        add     r5, r5, #8
        blt     LCFF13
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCFF16:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   LCFF_ExpTab
        .long   0x592d071b
        .long   0x4de0c7fa


        .data
        .align  4


LCFF_ExpTab:
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


