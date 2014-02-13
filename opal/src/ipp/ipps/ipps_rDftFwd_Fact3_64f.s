        .text
        .align  4
        .globl  _ipps_rDftFwd_Fact3_64f


_ipps_rDftFwd_Fact3_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x94
        ldr     r12, [sp, #0xB8]
        cmp     r3, #0
        mov     r9, r0
        mov     r8, r1
        ble     LCNX3
        ldr     r4, [pc, #0x64C]
        ldr     r6, [pc, #0x64C]
        add     r12, r12, #0x20
        ldr     lr, [r4]
        ldr     r4, [r4, #4]
        ldr     r5, [r6]
        ldr     r6, [r6, #4]
        mov     r7, r2, lsl #1
        sub     r7, r7, #3
        mov     r11, r2, asr #1
        rsb     r10, r2, r2, lsl #2
        str     r10, [sp, #0x2C]
        str     r11, [sp, #0x28]
        str     r7, [sp, #0x24]
        str     r12, [sp, #0x20]
        str     r6, [sp, #0x38]
        str     r5, [sp, #0x48]
        str     r4, [sp, #0x44]
        str     lr, [sp, #0x40]
        str     r3, [sp, #0x1C]
        str     r2, [sp, #0x18]
LCNX0:
        ldr     r2, [sp, #0x20]
        ldr     r10, [sp, #0x18]
        str     r2, [sp, #0x14]
        ldr     r2, [sp, #0x24]
        add     r3, r9, r10, lsl #4
        str     r3, [sp]
        str     r2, [sp, #8]
        ldr     r7, [r9, +r10, lsl #4]
        ldr     r6, [r3, #4]
        add     r12, r9, r10, lsl #3
        str     r12, [sp, #4]
        ldr     r11, [r9, +r10, lsl #3]
        ldr     r1, [r12, #4]
        mov     r2, r7
        mov     r3, r6
        mov     r0, r11
        str     r1, [sp, #0x6C]
        bl      __adddf3
        mov     r5, r1
        ldr     r1, [sp, #0x6C]
        mov     r4, r0
        mov     r2, r7
        mov     r3, r6
        mov     r0, r11
        bl      __subdf3
        ldr     r6, [r9]
        ldr     r7, [r9, #4]
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        mov     r11, r0
        str     r1, [sp, #0x6C]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r1, [sp, #0x64]
        ldr     r1, [sp, #0x6C]
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x38]
        str     r0, [sp, #0x68]
        mov     r0, r11
        bl      __muldf3
        str     r1, [sp, #0x6C]
        mov     r11, r0
        mov     r2, r4
        mov     r0, r6
        mov     r1, r7
        mov     r3, r5
        bl      __adddf3
        str     r0, [r8]
        str     r1, [r8, #4]
        str     r11, [r8, +r10, lsl #4]
        ldr     r3, [sp, #0x28]
        add     r2, r8, r10, lsl #4
        sub     r4, r2, #8
        cmp     r3, #1
        ldr     r3, [sp, #0x68]
        str     r3, [r2, #-8]
        ldr     r3, [sp, #0x64]
        str     r3, [r2, #-4]
        ldr     r3, [sp, #0x6C]
        str     r3, [r2, #4]
        blt     LCNX2
        ldr     r2, [sp, #8]
        add     r12, r4, #0xC
        add     r6, r4, #4
        sub     r4, r9, #4
        str     r4, [sp, #0xC]
        ldr     r4, [sp]
        ldr     r1, [sp, #0x28]
        mov     r2, r2, lsl #3
        add     r5, r4, #4
        str     r5, [sp, #0x10]
        sub     r5, r4, #4
        ldr     r4, [sp, #4]
        add     r2, r2, #0x14
        add     r3, r8, #8
        add     r3, r2, r3
        add     r7, r4, #4
        mov     lr, #1
        add     r2, r2, r8
        add     r0, r8, #4
        sub     r11, r8, #4
        add     r10, r9, #4
        sub     r4, r4, #4
        str     r1, [sp, #4]
        str     r4, [sp, #0x64]
        str     r7, [sp, #0x60]
        str     r5, [sp]
        str     r10, [sp, #0x6C]
        str     r11, [sp, #0x4C]
        str     r0, [sp, #0x5C]
        str     r6, [sp, #0x58]
        str     r12, [sp, #0x54]
        str     r2, [sp, #0x50]
        str     r3, [sp, #0x34]
        str     lr, [sp, #0x68]
        str     r8, [sp, #0x3C]
        str     r9, [sp, #0x30]
LCNX1:
        ldr     r0, [sp, #0x14]
        ldr     r12, [sp, #0x60]
        ldr     r1, [sp, #0x64]
        ldr     r8, [r0]
        ldr     r4, [r0, #4]
        ldr     r9, [r12, #0xC]
        ldr     r5, [r12, #0x10]
        ldr     r12, [sp, #0x14]
        ldr     r10, [r1, #0xC]
        ldr     r6, [r1, #0x10]
        mov     r2, r8
        ldr     r7, [r12, #0xC]
        ldr     r11, [r12, #8]
        mov     r3, r4
        mov     r0, r10
        mov     r1, r6
        bl      __muldf3
        str     r0, [sp, #0x70]
        str     r1, [sp, #0x74]
        mov     r0, r9
        mov     r1, r5
        mov     r2, r11
        mov     r3, r7
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x74]
        mov     r2, r0
        ldr     r0, [sp, #0x70]
        bl      __subdf3
        str     r0, [sp, #0x74]
        str     r1, [sp, #0x70]
        mov     r3, r4
        mov     r0, r9
        mov     r2, r8
        mov     r1, r5
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r10
        mov     r2, r11
        mov     r1, r6
        mov     r3, r7
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r3, [sp, #0x14]
        ldr     lr, [sp, #0x10]
        mov     r6, r0
        ldr     r2, [r3, #0x10]
        mov     r4, r1
        str     r2, [sp, #0x78]
        ldr     r3, [r3, #0x14]
        str     r3, [sp, #0x7C]
        ldr     r3, [sp]
        ldr     r2, [r3, #0xC]
        str     r2, [sp, #0x80]
        ldr     r9, [r3, #0x10]
        ldr     r3, [sp, #0x14]
        ldr     r12, [lr, #0xC]
        ldr     r2, [sp, #0x78]
        ldr     r10, [r3, #0x18]
        ldr     r8, [r3, #0x1C]
        ldr     r3, [sp, #0x7C]
        ldr     r0, [sp, #0x80]
        str     r12, [sp, #0x84]
        ldr     r11, [lr, #0x10]
        mov     r1, r9
        bl      __muldf3
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x84]
        str     r1, [sp, #0x8C]
        mov     r1, r11
        mov     r2, r10
        mov     r3, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x8C]
        bl      __subdf3
        ldr     r2, [sp, #0x78]
        ldr     r3, [sp, #0x7C]
        mov     r7, r0
        ldr     r0, [sp, #0x84]
        mov     r5, r1
        mov     r1, r11
        bl      __muldf3
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x80]
        mov     r11, r1
        mov     r2, r10
        mov     r1, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x8C]
        mov     r3, r11
        bl      __adddf3
        mov     r9, r0
        ldr     r0, [sp, #0x74]
        mov     r8, r1
        ldr     r1, [sp, #0x70]
        mov     r3, r5
        mov     r2, r7
        bl      __adddf3
        str     r0, [sp, #0x8C]
        str     r1, [sp, #0x88]
        mov     r2, r9
        mov     r3, r8
        mov     r0, r6
        mov     r1, r4
        bl      __adddf3
        str     r0, [sp, #0x84]
        str     r1, [sp, #0x80]
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0x70]
        mov     r3, r5
        mov     r2, r7
        bl      __subdf3
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x78]
        mov     r1, r4
        mov     r2, r9
        mov     r3, r8
        mov     r0, r6
        bl      __subdf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x8C]
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #0x88]
        bl      __muldf3
        ldr     r3, [sp, #0x68]
        ldr     r2, [sp, #0x30]
        ldr     r3, [r2, +r3, lsl #3]
        ldr     r2, [sp, #0xC]
        str     r3, [sp, #0x90]
        ldr     r6, [r2, #0x10]
        ldr     r2, [sp, #0x90]
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp, #0x6C]
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        ldr     r8, [r12, #0xC]
        ldr     r7, [r12, #0x10]
        mov     r4, r0
        ldr     r0, [sp, #0x84]
        mov     r5, r1
        ldr     r1, [sp, #0x80]
        bl      __muldf3
        mov     r3, r7
        mov     r2, r8
        bl      __adddf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x38]
        mov     r11, r0
        ldr     r0, [sp, #0x74]
        mov     r10, r1
        ldr     r1, [sp, #0x70]
        bl      __muldf3
        mov     r7, r1
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x38]
        ldr     r1, [sp, #0x78]
        mov     r8, r0
        ldr     r0, [sp, #0x7C]
        bl      __muldf3
        ldr     r2, [sp, #0x90]
        str     r0, [sp, #0x7C]
        mov     r9, r1
        ldr     r0, [sp, #0x8C]
        ldr     r1, [sp, #0x88]
        mov     r3, r6
        bl      __adddf3
        ldr     lr, [sp, #0x68]
        ldr     r12, [sp, #0x3C]
        str     r0, [r12, +lr, lsl #3]
        ldr     r12, [sp, #0x4C]
        str     r1, [r12, #0x10]
        ldr     r12, [sp, #0x6C]
        ldr     r2, [sp, #0x84]
        ldr     r3, [sp, #0x80]
        ldr     r0, [r12, #0xC]
        ldr     r1, [r12, #0x10]
        bl      __adddf3
        ldr     r12, [sp, #0x5C]
        mov     r2, r8
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        mov     r0, r4
        mov     r1, r5
        mov     r3, r7
        bl      __subdf3
        ldr     r12, [sp, #0x58]
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r0, [sp, #0x7C]
        mov     r1, r9
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        ldr     r12, [sp, #0x54]
        mov     r2, r8
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        mov     r0, r4
        mov     r1, r5
        mov     r3, r7
        bl      __adddf3
        ldr     r12, [sp, #0x3C]
        ldr     lr, [sp, #8]
        mov     r2, r11
        str     r0, [r12, +lr, lsl #3]
        ldr     r12, [sp, #0x50]
        mov     r3, r10
        str     r1, [r12, #-0x10]
        ldr     r0, [sp, #0x7C]
        mov     r1, r9
        bl      __subdf3
        ldr     r2, [sp, #0x34]
        str     r0, [r2, #-0x14]
        str     r1, [r2, #-0x10]!
        ldr     r0, [sp, #4]
        str     r2, [sp, #0x34]
        subs    r0, r0, #1
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x20
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x10
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x10
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #0x10
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp]
        add     r0, r0, #0x10
        str     r0, [sp]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #0x10
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #0x10
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #2
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x50]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #8]
        sub     r0, r0, #2
        str     r0, [sp, #8]
        ldr     r0, [sp, #4]
        bne     LCNX1
        ldr     r8, [sp, #0x3C]
        ldr     r9, [sp, #0x30]
LCNX2:
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x2C]
        subs    r2, r2, #1
        str     r2, [sp, #0x1C]
        add     r9, r9, r3, lsl #3
        add     r8, r8, r3, lsl #3
        bne     LCNX0
LCNX3:
        add     sp, sp, #0x94
        ldmia   sp!, {r4 - r11, pc}
        .long   LCNX_C_1_3
        .long   LCNX_S_1_3


        .data
        .align  4


LCNX_C_1_3:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0xBF
LCNX_S_1_3:
        .byte   0xAA,0x4C,0x58,0xE8,0x7A,0xB6,0xEB,0xBF


