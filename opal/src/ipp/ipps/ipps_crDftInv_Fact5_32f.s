        .text
        .align  4
        .globl  _ipps_crDftInv_Fact5_32f


_ipps_crDftInv_Fact5_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        ldr     r12, [sp, #0xA8]
        mov     r4, r3
        mov     r5, r0
        ldr     r10, [r5, +r4, lsl #3]
        ldr     r9, [r5, +r4, lsl #5]
        add     lr, r5, r4, lsl #4
        mov     r6, r1
        mov     r7, r2
        add     r11, r5, r4, lsl #5
        str     lr, [sp, #0xC]
        add     r12, r12, #0x20
        str     r12, [sp, #0x44]
        str     r11, [sp, #0x10]
        mov     r1, r9
        mov     r0, r10
        bl      __addsf3
        str     r0, [sp, #0x54]
        ldr     r11, [r11, #4]
        add     r12, r5, r4, lsl #3
        str     r12, [sp, #0x1C]
        ldr     r12, [r12, #4]
        rsb     r8, r4, r4, lsl #2
        mov     r1, r11
        str     r12, [sp, #0x5C]
        ldr     r0, [sp, #0x5C]
        add     r12, r5, r8, lsl #3
        str     r12, [sp, #8]
        add     r12, r6, r4, lsl #2
        str     r12, [sp, #0x38]
        bl      __addsf3
        str     r0, [sp, #0x50]
        mov     r1, r9
        mov     r0, r10
        bl      __subsf3
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x5C]
        mov     r1, r11
        bl      __subsf3
        ldr     r12, [r5, +r4, lsl #4]
        ldr     r11, [r5, +r8, lsl #3]
        str     r12, [sp, #0x5C]
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x5C]
        add     r12, r7, r4, lsl #2
        str     r12, [sp, #0x2C]
        mov     r1, r11
        bl      __addsf3
        ldr     r12, [sp, #0xC]
        ldr     r10, [r12, #4]
        ldr     r12, [sp, #8]
        ldr     r9, [r12, #4]
        str     r0, [sp, #0x40]
        add     r12, r6, r4, lsl #3
        str     r12, [sp, #0x34]
        mov     r1, r9
        mov     r0, r10
        bl      __addsf3
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x5C]
        mov     r1, r11
        bl      __subsf3
        str     r0, [sp, #0x14]
        mov     r1, r9
        mov     r0, r10
        bl      __subsf3
        ldr     lr, [r5]
        ldr     r12, [pc, #0x85C]
        str     lr, [sp, #0x60]
        add     lr, r7, r4, lsl #3
        str     lr, [sp, #0x18]
        add     lr, r6, r8, lsl #2
        str     lr, [sp, #0x24]
        ldr     r10, [r12]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x54]
        add     r12, r7, r8, lsl #2
        str     r12, [sp, #0x20]
        mov     r1, r10
        bl      __mulsf3
        ldr     r12, [pc, #0x82C]
        add     lr, r6, r4, lsl #4
        str     lr, [sp, #0x28]
        add     lr, r7, r4, lsl #4
        str     lr, [sp, #0x30]
        mov     r11, r0
        ldr     r0, [sp, #0x40]
        ldr     r9, [r12]
        mov     r1, r9
        bl      __mulsf3
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x60]
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x50]
        mov     r1, r10
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [sp, #0x3C]
        mov     r1, r9
        bl      __mulsf3
        ldr     r12, [r5, #4]
        str     r0, [sp, #4]
        str     r12, [sp, #0x6C]
        ldr     r0, [sp, #0x6C]
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        ldr     r12, [pc, #0x7B0]
        str     r0, [sp, #0x70]
        ldr     r11, [r12]
        ldr     r0, [sp, #0x48]
        mov     r1, r11
        str     r11, [sp]
        bl      __mulsf3
        ldr     r12, [pc, #0x798]
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x64]
        ldr     r1, [r12]
        str     r1, [sp, #4]
        bl      __mulsf3
        ldr     r1, [sp, #0x74]
        bl      __addsf3
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x4C]
        mov     r1, r11
        bl      __mulsf3
        str     r0, [sp, #0x78]
        ldr     r1, [sp, #4]
        ldr     r0, [sp, #0x14]
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        bl      __addsf3
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x40]
        mov     r1, r10
        bl      __mulsf3
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x54]
        mov     r1, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        bl      __addsf3
        ldr     r1, [sp, #0x7C]
        bl      __addsf3
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x3C]
        mov     r1, r10
        bl      __mulsf3
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x50]
        mov     r1, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x6C]
        bl      __addsf3
        ldr     r1, [sp, #0x80]
        bl      __addsf3
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x64]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x48]
        bl      __mulsf3
        ldr     r1, [sp, #0x6C]
        bl      __subsf3
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x14]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x4C]
        bl      __mulsf3
        ldr     r1, [sp, #0x64]
        bl      __subsf3
        ldr     r1, [sp, #0x54]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x60]
        bl      __addsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        str     r0, [r6]
        ldr     r1, [sp, #0x50]
        ldr     r0, [r5, #4]
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        bl      __addsf3
        str     r0, [r7]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x74]
        bl      __addsf3
        str     r0, [r6, +r4, lsl #2]
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0x78]
        bl      __subsf3
        str     r0, [r7, +r4, lsl #2]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x6C]
        bl      __addsf3
        str     r0, [r6, +r4, lsl #3]
        ldr     r1, [sp, #0x64]
        ldr     r0, [sp, #0x80]
        bl      __subsf3
        str     r0, [r7, +r4, lsl #3]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x6C]
        bl      __subsf3
        str     r0, [r6, +r8, lsl #2]
        ldr     r0, [sp, #0x80]
        ldr     r1, [sp, #0x64]
        bl      __addsf3
        str     r0, [r7, +r8, lsl #2]
        ldr     r0, [sp, #0x68]
        ldr     r1, [sp, #0x74]
        bl      __subsf3
        str     r0, [r6, +r4, lsl #4]
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0x78]
        bl      __addsf3
        cmp     r4, #1
        str     r0, [r7, +r4, lsl #4]
        ble     LCJT1
        ldr     r0, [sp, #0x10]
        ldr     r8, [sp, #0x28]
        ldr     r11, [sp, #0x30]
        add     r0, r0, #0xC
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #8]
        add     r5, r5, #4
        str     r5, [sp, #0x40]
        add     r0, r0, #0xC
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0xC]
        add     r6, r6, #4
        str     r6, [sp, #0x10]
        add     r0, r0, #0xC
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x1C]
        add     r7, r7, #4
        add     r8, r8, #4
        add     r0, r0, #0xC
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x38]
        add     r11, r11, #4
        sub     r4, r4, #1
        add     r6, r0, #4
        ldr     r0, [sp, #0x2C]
        str     r11, [sp, #0x38]
        str     r8, [sp, #0x2C]
        ldr     r8, [sp, #0x44]
        add     r5, r0, #4
        ldr     r0, [sp, #0x34]
        str     r4, [sp, #0x34]
        str     r5, [sp, #0x4C]
        str     r6, [sp, #0x50]
        add     lr, r0, #4
        ldr     r0, [sp, #0x18]
        str     lr, [sp, #0x48]
        str     r7, [sp, #0x54]
        add     r12, r0, #4
        ldr     r0, [sp, #0x24]
        str     r12, [sp, #0x18]
        str     r9, [sp, #0x58]
        add     r2, r0, #4
        ldr     r0, [sp, #0x20]
        ldr     r9, [sp, #0x40]
        str     r2, [sp, #0x1C]
        add     r0, r0, #4
        str     r0, [sp, #0x24]
        str     r10, [sp, #0x5C]
LCJT0:
        ldr     r2, [sp, #8]
        ldr     r4, [r8]
        ldr     r6, [r8, #4]
        ldr     r5, [r2]
        ldr     r7, [r2, #-4]
        add     r2, r2, #8
        str     r2, [sp, #8]
        mov     r1, r4
        mov     r0, r7
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r6
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp, #0x80]
        mov     r1, r4
        mov     r0, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r6
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0xC]
        ldr     r7, [r8, #8]
        ldr     r11, [r8, #0xC]
        ldr     r4, [r1, #-4]
        ldr     r10, [r1]
        mov     r6, r0
        mov     r1, r7
        mov     r0, r4
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r11
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [sp, #0x7C]
        mov     r1, r7
        mov     r0, r10
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r4
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x14]
        ldr     r7, [r8, #0x10]
        ldr     r11, [r8, #0x14]
        ldr     r10, [r2, #-4]
        ldr     r4, [r2]
        str     r0, [sp, #0x78]
        mov     r1, r7
        mov     r0, r10
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r11
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        str     r0, [sp, #0x74]
        mov     r1, r7
        mov     r0, r4
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r11
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x3C]
        ldr     r5, [r8, #0x1C]
        ldr     r11, [r8, #0x18]
        ldr     r10, [r1]
        ldr     r4, [r1, #-4]
        str     r0, [sp, #0x70]
        mov     r0, r4
        mov     r1, r11
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r5
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        mov     r0, r10
        mov     r1, r11
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r5
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x80]
        mov     r1, r7
        add     r8, r8, #0x20
        bl      __addsf3
        mov     r5, r0
        mov     r1, r10
        mov     r0, r6
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [sp, #0x80]
        mov     r1, r7
        bl      __subsf3
        str     r0, [sp, #0x80]
        mov     r0, r6
        mov     r1, r10
        bl      __subsf3
        ldr     r1, [sp, #0x74]
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x7C]
        bl      __addsf3
        ldr     r1, [sp, #0x70]
        mov     r7, r0
        ldr     r0, [sp, #0x78]
        bl      __addsf3
        ldr     r1, [sp, #0x74]
        mov     r6, r0
        ldr     r0, [sp, #0x7C]
        bl      __subsf3
        ldr     r1, [sp, #0x70]
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x78]
        bl      __subsf3
        ldr     r1, [sp, #0x5C]
        mov     r11, r0
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x78]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        ldr     r10, [r9, #4]
        bl      __addsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [sp, #0x78]
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x74]
        mov     r0, r6
        bl      __mulsf3
        ldr     r2, [r9, #8]
        ldr     r1, [sp, #0x74]
        str     r2, [sp, #0x70]
        bl      __addsf3
        ldr     r1, [sp, #0x70]
        bl      __addsf3
        ldr     r1, [sp]
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x6C]
        bl      __mulsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x68]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x68]
        bl      __addsf3
        ldr     r1, [sp]
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x80]
        bl      __mulsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x7C]
        bl      __mulsf3
        ldr     r1, [sp, #0x64]
        bl      __addsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [sp, #0x64]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x60]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        bl      __addsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x5C]
        str     r0, [sp, #0x60]
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x30]
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r1, [sp, #0x70]
        bl      __addsf3
        ldr     r1, [sp]
        str     r0, [sp, #0x70]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x6C]
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __subsf3
        ldr     r1, [sp]
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x7C]
        bl      __mulsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x80]
        bl      __mulsf3
        ldr     r1, [sp, #0x7C]
        bl      __subsf3
        mov     r11, r0
        mov     r1, r7
        mov     r0, r5
        bl      __addsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp, #0x10]
        mov     r1, r6
        str     r0, [r2]
        mov     r0, r4
        bl      __addsf3
        ldr     r1, [r9, #8]!
        bl      __addsf3
        ldr     r2, [sp, #0x54]
        str     r0, [r2]
        ldr     r1, [sp, #0x68]
        ldr     r0, [sp, #0x78]
        bl      __addsf3
        ldr     r2, [sp, #0x50]
        str     r0, [r2]
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0x64]
        bl      __subsf3
        ldr     r2, [sp, #0x4C]
        str     r0, [r2]
        ldr     r1, [sp, #0x6C]
        ldr     r0, [sp, #0x60]
        bl      __addsf3
        ldr     r2, [sp, #0x48]
        mov     r1, r11
        str     r0, [r2]
        ldr     r0, [sp, #0x70]
        bl      __subsf3
        ldr     r2, [sp, #0x18]
        str     r0, [r2]
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x6C]
        bl      __subsf3
        ldr     r2, [sp, #0x1C]
        mov     r1, r11
        str     r0, [r2]
        ldr     r0, [sp, #0x70]
        bl      __addsf3
        ldr     r1, [sp, #0x24]
        str     r0, [r1]
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x68]
        bl      __subsf3
        ldr     r1, [sp, #0x2C]
        str     r0, [r1]
        ldr     r0, [sp, #0x74]
        ldr     r1, [sp, #0x64]
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        str     r0, [r1], #4
        ldr     r0, [sp, #0x34]
        str     r1, [sp, #0x38]
        subs    r0, r0, #1
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #4
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #4
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #4
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #4
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #4
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #4
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #4
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x24]
        add     r0, r0, #4
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #4
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #8
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #8
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #8
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x34]
        bne     LCJT0
LCJT1:
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
        .long   LCJT_C_1_5
        .long   LCJT_C_2_5
        .long   LCJT_S_1_5
        .long   LCJT_S_2_5


        .data
        .align  4


LCJT_C_1_5:
        .byte   0x7A,0x37,0x9E,0x3E
LCJT_C_2_5:
        .byte   0xBD,0x1B,0x4F,0xBF
LCJT_S_1_5:
        .byte   0x71,0x78,0x73,0xBF
LCJT_S_2_5:
        .byte   0x18,0x79,0x16,0xBF


