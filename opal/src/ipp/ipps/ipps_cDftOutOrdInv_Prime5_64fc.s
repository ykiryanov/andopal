        .text
        .align  4
        .globl  _ipps_cDftOutOrdInv_Prime5_64fc


_ipps_cDftOutOrdInv_Prime5_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xAC
        rsb     r3, r2, r2, lsl #2
        add     r8, r0, r3, lsl #4
        cmp     r2, #0
        add     r10, r0, r2, lsl #4
        add     r9, r0, r2, lsl #5
        add     r3, r1, r3, lsl #4
        add     r7, r0, r2, lsl #6
        add     lr, r1, r2, lsl #4
        add     r12, r1, r2, lsl #5
        add     r4, r1, r2, lsl #6
        ble     LCOS1
        ldr     r6, [pc, #0x62C]
        ldr     r5, [pc, #0x62C]
        sub     r10, r10, #4
        str     r10, [sp, #0xC]
        sub     r8, r8, #4
        sub     r7, r7, #4
        sub     r9, r9, #4
        sub     r4, r4, #4
        str     r8, [sp]
        str     r7, [sp, #8]
        str     r9, [sp, #4]
        str     r4, [sp, #0x10]
        ldr     r10, [pc, #0x604]
        ldr     r7, [r6]
        ldr     r8, [r6, #4]
        ldr     r11, [pc, #0x5FC]
        ldr     r9, [r10]
        ldr     r6, [r10, #4]
        sub     r4, r0, #4
        ldr     r0, [r5]
        ldr     r10, [r11]
        ldr     r5, [r5, #4]
        ldr     r11, [r11, #4]
        sub     r3, r3, #4
        sub     r12, r12, #4
        sub     lr, lr, #4
        sub     r1, r1, #4
        str     r1, [sp, #0x18]
        str     lr, [sp, #0x44]
        str     r12, [sp, #0x1C]
        str     r3, [sp, #0x20]
        str     r11, [sp, #0x3C]
        str     r10, [sp, #0x40]
        str     r6, [sp, #0x2C]
        str     r9, [sp, #0x24]
        str     r8, [sp, #0x30]
        str     r7, [sp, #0x28]
        str     r5, [sp, #0x38]
        str     r0, [sp, #0x34]
        str     r2, [sp, #0x14]
LCOS0:
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r8, [r0, #8]
        ldr     r10, [r0, #4]
        ldr     r0, [r1, #4]
        mov     r3, r8
        str     r0, [sp, #0x48]
        ldr     r5, [r1, #8]
        ldr     r0, [sp, #0x48]
        mov     r2, r10
        mov     r1, r5
        bl      __adddf3
        ldr     r12, [sp, #0xC]
        ldr     r7, [r12, #0x10]
        ldr     r11, [r12, #0xC]
        ldr     r12, [sp, #8]
        ldr     r6, [r12, #0x10]
        ldr     r9, [r12, #0xC]
        str     r0, [sp, #0x4C]
        str     r1, [sp, #0x50]
        mov     r1, r7
        mov     r0, r11
        mov     r2, r9
        mov     r3, r6
        bl      __adddf3
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x48]
        str     r1, [sp, #0x58]
        mov     r3, r8
        mov     r2, r10
        mov     r1, r5
        bl      __subdf3
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x5C]
        mov     r1, r7
        mov     r0, r11
        mov     r2, r9
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        ldr     r10, [r2, #4]
        ldr     r5, [r2, #8]
        ldr     r2, [r3, #4]
        str     r2, [sp, #0x60]
        ldr     r7, [r3, #8]
        ldr     r2, [sp, #0x60]
        str     r0, [sp, #0x64]
        str     r1, [sp, #0x68]
        mov     r0, r10
        mov     r1, r5
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [sp]
        ldr     r8, [r12, #0x10]
        ldr     r11, [r12, #0xC]
        ldr     r12, [sp, #4]
        mov     r2, r11
        mov     r3, r8
        ldr     r6, [r12, #0x10]
        ldr     r9, [r12, #0xC]
        str     r1, [sp, #0x70]
        str     r0, [sp, #0x6C]
        mov     r1, r6
        mov     r0, r9
        bl      __adddf3
        ldr     r2, [sp, #0x60]
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x78]
        mov     r3, r7
        mov     r1, r5
        mov     r0, r10
        bl      __subdf3
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x7C]
        mov     r2, r11
        mov     r1, r6
        mov     r3, r8
        mov     r0, r9
        bl      __subdf3
        ldr     r7, [r4, #4]
        ldr     r5, [r4, #8]
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x38]
        str     r0, [sp, #0x80]
        mov     r8, r1
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x50]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r5
        bl      __adddf3
        mov     r9, r1
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x30]
        ldr     r1, [sp, #0x70]
        mov     r6, r0
        ldr     r0, [sp, #0x6C]
        bl      __muldf3
        mov     r3, r9
        mov     r2, r6
        bl      __adddf3
        ldr     r10, [r4, #0xC]
        ldr     r9, [r4, #0x10]
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x38]
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x54]
        str     r1, [sp, #0x88]
        ldr     r1, [sp, #0x58]
        bl      __muldf3
        mov     r3, r9
        mov     r2, r10
        bl      __adddf3
        mov     r11, r1
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x30]
        ldr     r1, [sp, #0x78]
        mov     r6, r0
        ldr     r0, [sp, #0x74]
        bl      __muldf3
        mov     r3, r11
        mov     r2, r6
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x2C]
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x64]
        str     r1, [sp, #0x90]
        ldr     r1, [sp, #0x68]
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        mov     r6, r0
        ldr     r0, [sp, #0x80]
        mov     r11, r1
        mov     r1, r8
        bl      __muldf3
        mov     r3, r11
        mov     r2, r6
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x2C]
        str     r0, [sp, #0x94]
        ldr     r0, [sp, #0x48]
        str     r1, [sp, #0x98]
        ldr     r1, [sp, #0x5C]
        bl      __muldf3
        mov     r6, r0
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        ldr     r0, [sp, #0x60]
        mov     r11, r1
        ldr     r1, [sp, #0x7C]
        bl      __muldf3
        mov     r3, r11
        mov     r2, r6
        bl      __adddf3
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x30]
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x4C]
        str     r1, [sp, #0xA0]
        ldr     r1, [sp, #0x50]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x38]
        mov     r6, r0
        ldr     r0, [sp, #0x6C]
        mov     r11, r1
        ldr     r1, [sp, #0x70]
        bl      __muldf3
        mov     r3, r11
        mov     r2, r6
        bl      __adddf3
        str     r0, [sp, #0xA4]
        mov     r6, r1
        ldr     r0, [sp, #0x54]
        ldr     r1, [sp, #0x58]
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x30]
        bl      __muldf3
        mov     r3, r9
        mov     r2, r10
        bl      __adddf3
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x38]
        mov     r9, r0
        ldr     r0, [sp, #0x74]
        mov     r10, r1
        ldr     r1, [sp, #0x78]
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0x64]
        mov     r9, r1
        ldr     r1, [sp, #0x68]
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x2C]
        mov     r10, r0
        ldr     r0, [sp, #0x80]
        mov     r11, r1
        mov     r1, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x48]
        mov     r8, r1
        ldr     r1, [sp, #0x5C]
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x2C]
        mov     r10, r0
        ldr     r0, [sp, #0x60]
        mov     r11, r1
        ldr     r1, [sp, #0x7C]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [sp, #0x4C]
        ldr     r3, [sp, #0x50]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r7
        mov     r1, r5
        bl      __adddf3
        ldr     r2, [sp, #0x6C]
        ldr     r3, [sp, #0x70]
        bl      __adddf3
        ldr     r12, [sp, #0x18]
        str     r0, [r12, #4]
        str     r1, [r12, #8]
        ldr     r2, [sp, #0x54]
        ldr     r3, [sp, #0x58]
        ldr     r0, [r4, #0xC]
        ldr     r1, [r4, #0x10]!
        bl      __adddf3
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x78]
        bl      __adddf3
        ldr     r12, [sp, #0x18]
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x88]
        bl      __adddf3
        ldr     r12, [sp, #0x44]
        str     r0, [r12, #4]
        ldr     r12, [sp, #0x44]
        str     r1, [r12, #8]
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0xA0]
        ldr     r0, [sp, #0x8C]
        ldr     r1, [sp, #0x90]
        bl      __subdf3
        ldr     r12, [sp, #0x44]
        mov     r3, r8
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r2, [sp, #0x80]
        ldr     r0, [sp, #0xA4]
        mov     r1, r6
        bl      __adddf3
        ldr     r12, [sp, #0x1C]
        str     r1, [r12, #8]
        str     r0, [r12, #4]
        ldr     r0, [sp, #0xA8]
        mov     r2, r10
        mov     r3, r11
        mov     r1, r9
        bl      __subdf3
        ldr     r12, [sp, #0x1C]
        mov     r3, r8
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0xA4]
        ldr     r2, [sp, #0x80]
        mov     r1, r6
        bl      __subdf3
        ldr     r12, [sp, #0x20]
        mov     r2, r10
        str     r0, [r12, #4]
        str     r1, [r12, #8]
        ldr     r0, [sp, #0xA8]
        mov     r1, r9
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #0x20]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x88]
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x98]
        bl      __subdf3
        ldr     r2, [sp, #0x10]
        str     r0, [r2, #4]
        str     r1, [r2, #8]
        ldr     r0, [sp, #0x8C]
        ldr     r1, [sp, #0x90]
        ldr     r2, [sp, #0x9C]
        ldr     r3, [sp, #0xA0]
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x14]
        add     r2, r2, #0x10
        add     r1, r1, #0x10
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        subs    r0, r0, #1
        str     r0, [sp, #0x14]
        add     r1, r1, #0x10
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x44]
        str     r2, [sp, #0x10]
        add     r1, r1, #0x10
        str     r1, [sp, #0x44]
        ldr     r1, [sp, #0x18]
        add     r1, r1, #0x10
        str     r1, [sp, #0x18]
        ldr     r1, [sp]
        add     r1, r1, #0x10
        str     r1, [sp]
        ldr     r1, [sp, #4]
        add     r1, r1, #0x10
        str     r1, [sp, #4]
        ldr     r1, [sp, #8]
        add     r1, r1, #0x10
        str     r1, [sp, #8]
        ldr     r1, [sp, #0xC]
        add     r1, r1, #0x10
        str     r1, [sp, #0xC]
        bne     LCOS0
LCOS1:
        add     sp, sp, #0xAC
        ldmia   sp!, {r4 - r11, pc}
        .long   LCOS_C_2_5
        .long   LCOS_C_1_5
        .long   LCOS_S_1_5
        .long   LCOS_S_2_5


        .data
        .align  4


LCOS_C_1_5:
        .byte   0x50,0xE9,0x2F,0x37,0xEF,0xC6,0xD3,0x3F
LCOS_C_2_5:
        .byte   0xA7,0xF4,0x97,0x9B,0x77,0xE3,0xE9,0xBF
LCOS_S_1_5:
        .byte   0xFF,0x54,0x44,0x13,0x0E,0x6F,0xEE,0xBF
LCOS_S_2_5:
        .byte   0x5F,0x5A,0x75,0x04,0x23,0xCF,0xE2,0xBF


