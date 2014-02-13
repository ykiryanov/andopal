        .text
        .align  4
        .globl  _ipps_cDftInv_Fact3_64fc


_ipps_cDftInv_Fact3_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x88
        ldr     r12, [sp, #0xAC]
        cmp     r3, #0
        mov     r9, r0
        mov     r8, r1
        ble     LCPP3
        ldr     r4, [pc, #0x714]
        ldr     r6, [pc, #0x714]
        add     r12, r12, #0x20
        ldr     lr, [r4]
        ldr     r4, [r4, #4]
        ldr     r5, [r6]
        ldr     r6, [r6, #4]
        mov     r10, r2, lsl #1
        rsb     r7, r2, r2, lsl #2
        str     r7, [sp, #0x20]
        str     r10, [sp, #0x24]
        str     r6, [sp, #0x3C]
        str     r5, [sp, #0x38]
        str     r4, [sp, #0x34]
        str     lr, [sp, #0x30]
        str     r12, [sp, #0x1C]
        str     r3, [sp, #0x18]
        str     r2, [sp, #0x14]
LCPP0:
        ldr     r2, [sp, #0x1C]
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        add     r4, r9, r2, lsl #4
        str     r4, [sp, #4]
        ldr     r10, [r9, +r2, lsl #4]
        ldr     r6, [r4, #4]
        add     r11, r9, r2, lsl #5
        str     r11, [sp]
        ldr     r2, [r9, +r2, lsl #5]
        mov     r1, r6
        mov     r0, r10
        str     r2, [sp, #0x60]
        ldr     r3, [r11, #4]
        str     r3, [sp, #0x5C]
        ldr     r3, [sp, #0x5C]
        bl      __adddf3
        ldr     r7, [r4, #8]
        ldr     r5, [r11, #8]
        ldr     r4, [r4, #0xC]
        ldr     r11, [r11, #0xC]
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x54]
        mov     r1, r4
        mov     r2, r5
        mov     r3, r11
        mov     r0, r7
        bl      __adddf3
        ldr     r3, [sp, #0x5C]
        ldr     r2, [sp, #0x60]
        str     r1, [sp, #0x4C]
        str     r0, [sp, #0x50]
        mov     r0, r10
        mov     r1, r6
        bl      __subdf3
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        mov     r2, r5
        mov     r3, r11
        mov     r0, r7
        mov     r1, r4
        bl      __subdf3
        ldr     r10, [r9]
        ldr     r11, [r9, #4]
        str     r0, [sp, #0x48]
        str     r1, [sp, #0x44]
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0x30]
        ldr     r0, [sp, #0x58]
        ldr     r1, [sp, #0x54]
        mov     r3, r4
        mov     r2, r5
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x50]
        mov     r6, r1
        ldr     r1, [sp, #0x4C]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        bl      __adddf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        mov     r4, r0
        ldr     r0, [sp, #0x48]
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0x44]
        bl      __muldf3
        mov     r5, r0
        mov     r7, r1
        ldr     r0, [sp, #0x60]
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        ldr     r1, [sp, #0x5C]
        bl      __muldf3
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x54]
        str     r0, [sp, #0x60]
        str     r1, [sp, #0x5C]
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r0, [r9, #8]
        ldr     r1, [r9, #0xC]
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x4C]
        bl      __adddf3
        str     r1, [r8, #0xC]
        str     r0, [r8, #8]
        ldr     r0, [sp, #0x40]
        mov     r2, r5
        mov     r1, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [sp, #0x14]
        str     r0, [r8, +r12, lsl #4]
        add     r10, r8, r12, lsl #4
        str     r1, [r10, #4]
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        mov     r0, r4
        bl      __subdf3
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        ldr     r0, [sp, #0x40]
        mov     r2, r5
        mov     r1, r6
        mov     r3, r7
        bl      __subdf3
        ldr     r2, [sp, #0x14]
        str     r0, [r8, +r2, lsl #5]
        add     r5, r8, r2, lsl #5
        str     r1, [r5, #4]
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        mov     r0, r4
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        add     lr, r9, #8
        cmp     r2, #2
        add     r3, r8, #8
        str     r0, [r5, #8]
        str     r1, [r5, #0xC]
        ble     LCPP2
        mov     r2, #2
        str     r2, [sp, #8]
        ldr     r7, [sp]
        ldr     r0, [sp, #4]
        add     r2, r5, #0xC
        add     r4, r9, #4
        str     r2, [sp, #0xC]
        str     r4, [sp, #0x40]
        ldr     r4, [sp, #8]
        add     r2, r10, #0xC
        add     r6, r7, #4
        add     r11, r0, #4
        add     r5, r5, #4
        add     r10, r10, #4
        add     r3, r3, #4
        add     r12, r8, #4
        add     lr, lr, #4
        add     r7, r7, #0xC
        add     r0, r0, #0xC
        str     r0, [sp, #4]
        str     r11, [sp, #0x58]
        str     r7, [sp]
        str     r6, [sp, #0x5C]
        str     lr, [sp, #0x60]
        str     r12, [sp, #0x44]
        str     r3, [sp, #0x54]
        str     r10, [sp, #0x50]
        str     r2, [sp, #0x4C]
        str     r5, [sp, #0x48]
        str     r8, [sp, #0x28]
        str     r9, [sp, #0x2C]
LCPP1:
        ldr     r1, [sp, #0x58]
        ldr     r3, [sp, #0x10]
        ldr     r12, [sp, #0x10]
        ldr     r10, [r1, #0xC]
        ldr     r8, [r1, #0x10]
        ldr     r2, [r3]
        mov     r1, r8
        mov     r0, r10
        str     r2, [sp, #0x64]
        ldr     r2, [sp, #4]
        ldr     r5, [r3, #4]
        ldr     r11, [r12, #8]
        ldr     r6, [r2, #0x10]
        ldr     r9, [r2, #0xC]
        ldr     r2, [sp, #0x64]
        ldr     r7, [r12, #0xC]
        mov     r3, r5
        bl      __muldf3
        str     r0, [sp, #0x68]
        str     r1, [sp, #0x6C]
        mov     r2, r11
        mov     r3, r7
        mov     r1, r6
        mov     r0, r9
        bl      __muldf3
        ldr     r3, [sp, #0x6C]
        ldr     r2, [sp, #0x68]
        bl      __adddf3
        ldr     r2, [sp, #0x64]
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        mov     r3, r5
        mov     r1, r6
        mov     r0, r9
        bl      __muldf3
        mov     r5, r0
        mov     r6, r1
        mov     r3, r7
        mov     r1, r8
        mov     r0, r10
        mov     r2, r11
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r6
        bl      __subdf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x10]
        mov     r5, r0
        ldr     r11, [r2, #0xC]
        ldr     r10, [r2, #0x10]
        ldr     r2, [r3, #0x10]
        mov     r7, r1
        mov     r0, r11
        mov     r1, r10
        str     r2, [sp, #0x64]
        ldr     r3, [r3, #0x14]
        str     r3, [sp, #0x70]
        ldr     r3, [sp]
        ldr     r2, [r3, #0xC]
        str     r2, [sp, #0x74]
        ldr     r3, [r3, #0x10]
        str     r3, [sp, #0x78]
        ldr     r3, [sp, #0x10]
        ldr     r2, [r3, #0x18]
        str     r2, [sp, #0x7C]
        ldr     r9, [r3, #0x1C]
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x70]
        bl      __muldf3
        ldr     r2, [sp, #0x7C]
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x74]
        str     r1, [sp, #0x84]
        ldr     r1, [sp, #0x78]
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [sp, #0x84]
        ldr     r2, [sp, #0x80]
        bl      __adddf3
        mov     r8, r1
        ldr     r1, [sp, #0x78]
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x70]
        mov     r6, r0
        ldr     r0, [sp, #0x74]
        bl      __muldf3
        ldr     r2, [sp, #0x7C]
        str     r1, [sp, #0x80]
        str     r0, [sp, #0x84]
        mov     r1, r10
        mov     r3, r9
        mov     r0, r11
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x84]
        mov     r3, r1
        ldr     r1, [sp, #0x80]
        bl      __subdf3
        mov     r10, r0
        ldr     r0, [sp, #0x6C]
        mov     r9, r1
        ldr     r1, [sp, #0x68]
        mov     r2, r6
        mov     r3, r8
        bl      __adddf3
        str     r0, [sp, #0x84]
        str     r1, [sp, #0x80]
        mov     r2, r10
        mov     r0, r5
        mov     r3, r9
        mov     r1, r7
        bl      __adddf3
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x78]
        ldr     r0, [sp, #0x6C]
        ldr     r1, [sp, #0x68]
        mov     r2, r6
        mov     r3, r8
        bl      __subdf3
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x70]
        mov     r0, r5
        mov     r3, r9
        mov     r1, r7
        mov     r2, r10
        bl      __subdf3
        str     r0, [sp, #0x6C]
        str     r1, [sp, #0x68]
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x80]
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x40]
        ldr     r11, [r3, #0x10]
        ldr     r10, [r2, +r4, lsl #3]
        mov     r3, r11
        mov     r2, r10
        bl      __adddf3
        mov     r5, r0
        mov     r9, r1
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x78]
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        bl      __muldf3
        ldr     r12, [sp, #0x60]
        ldr     r2, [r12, #0xC]
        ldr     r3, [r12, #0x10]
        bl      __adddf3
        mov     r8, r1
        ldr     r1, [sp, #0x68]
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        mov     r7, r0
        ldr     r0, [sp, #0x6C]
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        str     r0, [sp, #0x6C]
        mov     r6, r1
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0x70]
        bl      __muldf3
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x84]
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #0x80]
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [sp, #0x28]
        str     r0, [r2, +r4, lsl #3]
        ldr     r2, [sp, #0x44]
        add     r4, r4, #2
        str     r1, [r2, #0x10]
        ldr     r12, [sp, #0x60]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x78]
        ldr     r2, [r12, #0xC]
        ldr     r3, [r12, #0x10]
        bl      __adddf3
        ldr     r2, [sp, #0x54]
        mov     r3, r6
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0x6C]
        mov     r0, r5
        mov     r1, r9
        bl      __adddf3
        ldr     r2, [sp, #0x50]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x70]
        mov     r0, r7
        mov     r1, r8
        bl      __subdf3
        ldr     r2, [sp, #0x4C]
        mov     r3, r6
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0x6C]
        mov     r0, r5
        mov     r1, r9
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [sp, #0x74]
        ldr     r3, [sp, #0x70]
        mov     r0, r7
        mov     r1, r8
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r0, [sp, #0x24]
        cmp     r4, r0
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x20
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #0x10
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x10
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x10
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x10
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #0x10
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x10
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x5C]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x10
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #4]
        add     r0, r0, #0x10
        str     r0, [sp, #4]
        blt     LCPP1
        ldr     r8, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
LCPP2:
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x20]
        subs    r2, r2, #1
        str     r2, [sp, #0x18]
        add     r9, r9, r3, lsl #4
        add     r8, r8, r3, lsl #4
        bne     LCPP0
LCPP3:
        add     sp, sp, #0x88
        ldmia   sp!, {r4 - r11, pc}
        .long   LCPP_C_1_3
        .long   LCPP_S_1_3


        .data
        .align  4


LCPP_C_1_3:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0xBF
LCPP_S_1_3:
        .byte   0xAA,0x4C,0x58,0xE8,0x7A,0xB6,0xEB,0xBF


