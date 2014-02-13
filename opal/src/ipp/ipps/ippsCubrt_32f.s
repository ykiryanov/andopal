        .text
        .align  4
        .globl  _ippsCubrt_32f


_ippsCubrt_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        mov     r6, r0
        cmp     r6, #0
        mov     r8, r1
        mov     r7, r2
        beq     LCUD6
        cmp     r8, #0
        beq     LCUD6
        cmp     r7, #1
        blt     LCUD4
        cmp     r7, #0
        ble     LCUD3
        ldr     r9, [pc, #0x2AC]
        ldr     r3, [pc, #0x2AC]
LCUD0:
        ldr     r10, [r6], #4
        mov     r11, #0xFF, 12
        mov     r0, r10
        bl      __extendsfdf2
        mov     r5, r1
        orr     r11, r11, #3, 4
        mov     r4, r0
        sub     r3, r11, #0x7E, 12
        bic     r1, r5, #2, 2
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        ldrle   r3, [pc, #0x278]
        ldrle   r0, [r3]
        ble     LCUD2
        mvn     r3, #2, 2
        bics    r3, r10, r3
        str     r10, [sp, #0x28]
        mov     r12, r3, asr #30
        add     r12, r12, #1
        str     r12, [sp]
        eorne   r5, r5, #2, 2
        add     r2, sp, #0x2C
        mov     r1, r5
        mov     r0, r4
        bl      frexp
        ldr     r12, [pc, #0x244]
        ldr     r10, [sp, #0x2C]
        mov     r5, r0
        mov     r4, r1
        smull   r12, lr, r10, r12
        sub     lr, lr, r10, asr #31
        add     lr, lr, lr, lsl #1
        sub     r11, r10, lr
        cmp     r11, #0
        ble     LCUD5
        sub     r11, r11, #3
        mov     r1, r4
        mov     r0, r5
        mov     r2, r11
        bl      ldexp
        mov     r5, r0
        mov     r4, r1
LCUD1:
        ldr     lr, [pc, #0x200]
        ldr     r0, [r9, #0x20]
        sub     r10, r10, r11
        smull   lr, r11, r10, lr
        sub     r11, r11, r10, asr #31
        str     r11, [sp, #4]
        ldr     r10, [r9]
        str     r11, [sp, #0x2C]
        ldr     r11, [r9, #4]
        ldr     r1, [r9, #0x24]
        ldr     r12, [r9, #8]
        mov     r2, r5
        str     r12, [sp, #8]
        ldr     r12, [r9, #0xC]
        mov     r3, r4
        str     r12, [sp, #0xC]
        ldr     r12, [r9, #0x10]
        str     r12, [sp, #0x10]
        ldr     r12, [r9, #0x14]
        str     r12, [sp, #0x14]
        ldr     r12, [r9, #0x18]
        str     r12, [sp, #0x18]
        ldr     r12, [r9, #0x1C]
        str     r12, [sp, #0x1C]
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r12, #0xFF, 12
        mov     r2, r0
        mov     r3, r1
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x18]
        ldr     r12, [r9, #0x28]
        mov     r2, r5
        mov     r3, r4
        str     r12, [sp, #0x14]
        ldr     r12, [r9, #0x2C]
        str     r12, [sp, #0x10]
        ldr     r0, [r9, #0x48]
        ldr     r1, [r9, #0x4C]
        ldr     r12, [r9, #0x30]
        str     r12, [sp, #0xC]
        ldr     r12, [r9, #0x34]
        str     r12, [sp, #8]
        ldr     r12, [r9, #0x38]
        str     r12, [sp, #0x20]
        ldr     r12, [r9, #0x40]
        ldr     r10, [r9, #0x3C]
        str     r12, [sp, #0x24]
        ldr     r11, [r9, #0x44]
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        mov     r3, r11
        bl      __adddf3
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        mov     r3, r10
        bl      __adddf3
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        bl      __adddf3
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        bl      __muldf3
        ldr     r2, [sp, #4]
        bl      ldexp
        mov     r4, r0
        ldr     r0, [sp]
        mov     r5, r1
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
LCUD2:
        str     r0, [r8], #4
        subs    r7, r7, #1
        bne     LCUD0
LCUD3:
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCUD4:
        mvn     r0, #5
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCUD5:
        cmp     r11, #0
        bge     LCUD1
        mov     r1, r4
        mov     r0, r5
        mov     r2, r11
        bl      ldexp
        mov     r5, r0
        mov     r4, r1
        b       LCUD1
LCUD6:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
        .long   LCUD_Q4
        .long   LCUD__2il0floatpacket.1
        .long   0x55555556


        .data
        .align  4


LCUD__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


        .data
        .align  4


LCUD_Q4:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xF0,0x3F
LCUD_Q3:
        .byte   0x75,0xC3,0xE2,0xC9,0xCB,0xFE,0x40,0x40
LCUD_Q2:
        .byte   0xCE,0x12,0x81,0x6A,0xD0,0x10,0x65,0x40
LCUD_Q1:
        .byte   0x15,0x58,0x28,0xC0,0x15,0xFF,0x62,0x40
LCUD_Q0:
        .byte   0x21,0xDB,0x0E,0x66,0x20,0x9E,0x2D,0x40
LCUD_P4:
        .byte   0x2D,0x5D,0xF5,0x83,0x5F,0xF1,0xC4,0x3F
LCUD_P3:
        .byte   0x00,0x75,0x82,0xD2,0x70,0xDD,0x2A,0x40
LCUD_P2:
        .byte   0x14,0xAE,0x9C,0x43,0x97,0xCA,0x5D,0x40
LCUD_P1:
        .byte   0xE0,0x16,0x61,0x6C,0xF4,0x08,0x68,0x40
LCUD_P0:
        .byte   0x70,0xBA,0x53,0x66,0x9E,0xA0,0x46,0x40


