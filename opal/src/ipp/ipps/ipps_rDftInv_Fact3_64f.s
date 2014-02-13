        .text
        .align  4
        .globl  _ipps_rDftInv_Fact3_64f


_ipps_rDftInv_Fact3_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x98
        ldr     r12, [sp, #0xBC]
        cmp     r3, #0
        mov     r9, r0
        mov     r8, r1
        mov     r7, r2
        ble     LCNQ3
        ldr     r4, [pc, #0x614]
        ldr     r6, [pc, #0x614]
        add     r12, r12, #0x20
        ldr     lr, [r4]
        ldr     r4, [r4, #4]
        ldr     r5, [r6]
        ldr     r6, [r6, #4]
        mov     r10, r7, lsl #1
        sub     r10, r10, #3
        mov     r0, r7, asr #1
        rsb     r11, r7, r7, lsl #2
        str     r11, [sp, #0x30]
        str     r0, [sp, #0x2C]
        str     r10, [sp, #0x28]
        str     r12, [sp, #0x24]
        str     r6, [sp, #0x38]
        str     r5, [sp, #0x48]
        str     r4, [sp, #0x44]
        str     lr, [sp, #0x40]
        str     r3, [sp, #0x20]
LCNQ0:
        ldr     r3, [sp, #0x24]
        add     r4, r9, r7, lsl #4
        sub     r12, r4, #8
        str     r3, [sp, #0x18]
        ldr     r3, [sp, #0x28]
        str     r3, [sp, #4]
        ldr     r2, [r4, #-8]
        ldr     r3, [r4, #-4]
        str     r12, [sp]
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        ldr     r2, [r9, +r7, lsl #4]
        ldr     r3, [r4, #4]
        str     r0, [sp, #0x6C]
        mov     r10, r1
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        ldr     r11, [r9]
        ldr     r12, [r9, #4]
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        str     r12, [sp, #0x68]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x6C]
        mov     r5, r1
        mov     r1, r10
        bl      __muldf3
        ldr     r3, [sp, #0x68]
        mov     r2, r11
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [sp, #0x64]
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x38]
        mov     r6, r1
        mov     r1, r5
        bl      __muldf3
        str     r1, [sp, #0x64]
        ldr     r1, [sp, #0x68]
        ldr     r2, [sp, #0x6C]
        mov     r5, r0
        mov     r3, r10
        mov     r0, r11
        bl      __adddf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r3, [sp, #0x64]
        mov     r0, r4
        mov     r1, r6
        mov     r2, r5
        bl      __adddf3
        str     r0, [r8, +r7, lsl #3]
        add     r10, r8, r7, lsl #3
        str     r1, [r10, #4]
        ldr     r3, [sp, #0x64]
        mov     r0, r4
        mov     r1, r6
        mov     r2, r5
        bl      __subdf3
        str     r0, [r8, +r7, lsl #4]
        ldr     r3, [sp, #0x2C]
        add     lr, r8, r7, lsl #4
        cmp     r3, #1
        str     r1, [lr, #4]
        blt     LCNQ2
        ldr     r3, [sp, #4]
        ldr     r0, [sp]
        ldr     r1, [sp, #0x2C]
        mov     r3, r3, lsl #3
        add     r4, r3, #0x14
        add     r3, r9, #8
        add     r3, r4, r3
        add     r4, r4, r9
        str     r4, [sp, #8]
        add     r4, lr, #4
        sub     lr, lr, #4
        str     lr, [sp, #0x10]
        add     lr, r10, #4
        str     r4, [sp, #0xC]
        str     lr, [sp, #0x14]
        add     r4, r9, #4
        sub     lr, r9, #4
        str     r9, [sp, #0x3C]
        ldr     r9, [sp, #0x18]
        add     r11, r0, #0xC
        mov     r12, #1
        sub     r10, r10, #4
        add     r6, r8, #4
        sub     r5, r8, #4
        add     r0, r0, #4
        str     r1, [sp]
        str     r0, [sp, #0x60]
        str     r11, [sp, #0x58]
        str     lr, [sp, #0x4C]
        str     r4, [sp, #0x6C]
        str     r5, [sp, #0x50]
        str     r6, [sp, #0x64]
        str     r10, [sp, #0x54]
        str     r3, [sp, #0x5C]
        str     r12, [sp, #0x68]
        str     r7, [sp, #0x1C]
        str     r8, [sp, #0x34]
LCNQ1:
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #4]
        ldr     r2, [sp, #8]
        ldr     r1, [r0, +r1, lsl #3]
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #0x60]
        ldr     r6, [r2, #-0x10]
        ldr     r2, [sp, #0x70]
        ldr     r4, [r1, #0x10]
        ldr     r10, [r1, #0xC]
        mov     r3, r6
        mov     r0, r10
        mov     r1, r4
        bl      __adddf3
        ldr     r12, [sp, #0x5C]
        ldr     r11, [r12, #-0x14]
        ldr     r7, [r12, #-0x10]
        ldr     r12, [sp, #0x58]
        mov     r2, r11
        mov     r3, r7
        ldr     r8, [r12, #0xC]
        ldr     r5, [r12, #0x10]
        str     r1, [sp, #0x78]
        str     r0, [sp, #0x74]
        mov     r0, r8
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [sp, #0x70]
        str     r0, [sp, #0x7C]
        str     r1, [sp, #0x80]
        mov     r0, r10
        mov     r3, r6
        mov     r1, r4
        bl      __subdf3
        str     r0, [sp, #0x70]
        str     r1, [sp, #0x84]
        mov     r3, r7
        mov     r1, r5
        mov     r0, r8
        mov     r2, r11
        bl      __adddf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x74]
        str     r1, [sp, #0x8C]
        ldr     r1, [sp, #0x78]
        bl      __muldf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x68]
        ldr     r6, [r2, +r3, lsl #3]
        ldr     r3, [sp, #0x4C]
        mov     r2, r6
        ldr     r5, [r3, #0x10]
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #0x6C]
        mov     r10, r0
        mov     r11, r1
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x80]
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        ldr     r7, [r12, #0xC]
        ldr     r4, [r12, #0x10]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x38]
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x88]
        str     r1, [sp, #0x94]
        ldr     r1, [sp, #0x8C]
        bl      __muldf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x38]
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x70]
        str     r1, [sp, #0x88]
        ldr     r1, [sp, #0x84]
        bl      __muldf3
        mov     r8, r0
        mov     r4, r1
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0x78]
        mov     r3, r5
        mov     r2, r6
        bl      __adddf3
        ldr     lr, [sp, #0x68]
        ldr     r12, [sp, #0x34]
        str     r0, [r12, +lr, lsl #3]
        ldr     r12, [sp, #0x50]
        str     r1, [r12, #0x10]
        ldr     r12, [sp, #0x6C]
        ldr     r2, [sp, #0x7C]
        ldr     r3, [sp, #0x80]
        ldr     r0, [r12, #0xC]
        ldr     r1, [r12, #0x10]
        bl      __adddf3
        ldr     r12, [sp, #0x64]
        str     r0, [r12, #0xC]
        ldr     r12, [sp, #0x64]
        mov     r0, r10
        str     r1, [r12, #0x10]
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x88]
        mov     r1, r11
        bl      __adddf3
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x90]
        mov     r5, r1
        ldr     r1, [sp, #0x94]
        mov     r2, r8
        mov     r3, r4
        bl      __subdf3
        ldr     r2, [sp, #0x8C]
        ldr     r3, [sp, #0x88]
        mov     r7, r0
        mov     r6, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        mov     r10, r0
        mov     r11, r1
        ldr     r1, [sp, #0x94]
        ldr     r0, [sp, #0x90]
        mov     r2, r8
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r8, r0
        ldr     r0, [sp, #0x84]
        mov     r4, r1
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        str     r0, [sp, #0x94]
        str     r1, [sp, #0x90]
        mov     r1, r6
        mov     r0, r7
        bl      __muldf3
        ldr     r2, [sp, #0x94]
        ldr     r3, [sp, #0x90]
        bl      __adddf3
        ldr     r2, [sp, #0x54]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        mov     r6, r0
        ldr     r0, [sp, #0x84]
        mov     r7, r1
        mov     r1, r5
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r7
        mov     r0, r6
        bl      __subdf3
        ldr     r2, [sp, #0x14]
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]
        ldr     r2, [r9, #0x10]
        ldr     r3, [r9, #0x14]
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        ldr     r2, [r9, #0x18]
        ldr     r3, [r9, #0x1C]
        mov     r6, r1
        mov     r5, r0
        mov     r0, r8
        mov     r1, r4
        bl      __muldf3
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        str     r1, [r2, #0x10]
        str     r0, [r2, #0xC]
        ldr     r2, [r9, #0x10]
        ldr     r3, [r9, #0x14]
        mov     r1, r4
        mov     r0, r8
        bl      __muldf3
        ldr     r2, [r9, #0x18]
        ldr     r3, [r9, #0x1C]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [sp, #0xC]
        add     r9, r9, #0x20
        str     r0, [r2, #0xC]
        str     r1, [r2, #0x10]!
        ldr     r0, [sp]
        str     r2, [sp, #0xC]
        subs    r0, r0, #1
        str     r0, [sp]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #0x10
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #0x10
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #0x10
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #0x10
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #0x10
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #0x10
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #0x10
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #2
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x5C]
        sub     r0, r0, #0x10
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #8]
        sub     r0, r0, #0x10
        str     r0, [sp, #8]
        ldr     r0, [sp, #4]
        sub     r0, r0, #2
        str     r0, [sp, #4]
        ldr     r0, [sp]
        bne     LCNQ1
        ldr     r7, [sp, #0x1C]
        ldr     r8, [sp, #0x34]
        ldr     r9, [sp, #0x3C]
LCNQ2:
        ldr     r3, [sp, #0x20]
        ldr     r12, [sp, #0x30]
        subs    r3, r3, #1
        str     r3, [sp, #0x20]
        add     r9, r9, r12, lsl #3
        add     r8, r8, r12, lsl #3
        bne     LCNQ0
LCNQ3:
        add     sp, sp, #0x98
        ldmia   sp!, {r4 - r11, pc}
        .long   LCNQ_C_1_3
        .long   LCNQ_S_1_3


        .data
        .align  4


LCNQ_C_1_3:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0xBF
LCNQ_S_1_3:
        .byte   0xAA,0x4C,0x58,0xE8,0x7A,0xB6,0xEB,0xBF


