        .text
        .align  4
        .globl  _ipps_rDftInv_Fact5_32f


_ipps_rDftInv_Fact5_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB8
        ldr     r12, [sp, #0xDC]
        cmp     r3, #0
        mov     r9, r0
        mov     r8, r1
        mov     r7, r2
        ble     LCJE3
        ldr     r4, [pc, #0x854]
        ldr     r5, [pc, #0x854]
        ldr     r6, [pc, #0x854]
        ldr     lr, [pc, #0x854]
        ldr     r4, [r4]
        ldr     r5, [r5]
        ldr     r6, [r6]
        ldr     lr, [lr]
        mov     r10, r7, lsl #1
        add     r12, r12, #0x20
        sub     r10, r10, #3
        rsb     r0, r7, r7, lsl #2
        mov     r1, r7, asr #1
        add     r11, r7, r7, lsl #2
        str     r11, [sp, #0x58]
        str     r1, [sp, #0x54]
        str     r10, [sp, #0x50]
        str     r12, [sp, #0x4C]
        str     lr, [sp]
        str     r6, [sp, #0x84]
        str     r5, [sp, #0x80]
        str     r4, [sp, #4]
        str     r0, [sp, #0x48]
        str     r3, [sp, #0x44]
LCJE0:
        ldr     r3, [sp, #0x4C]
        add     r4, r9, r7, lsl #4
        str     r3, [sp, #0x3C]
        ldr     r3, [sp, #0x50]
        str     r3, [sp, #0x20]
        add     r3, r9, r7, lsl #3
        ldr     r1, [r3, #-4]
        sub     r10, r3, #4
        mov     r0, r1
        bl      __addsf3
        ldr     r1, [r9, +r7, lsl #3]
        sub     r3, r4, #4
        mov     r5, r0
        str     r3, [sp, #0x1C]
        mov     r0, r1
        add     r3, r8, r7, lsl #2
        str     r3, [sp, #0x18]
        bl      __addsf3
        ldr     r1, [r4, #-4]
        add     r3, r8, r7, lsl #3
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #0x48]
        str     r0, [sp, #0x7C]
        mov     r0, r1
        add     r3, r8, r3, lsl #2
        str     r3, [sp, #8]
        bl      __addsf3
        ldr     r1, [r9, +r7, lsl #4]
        mov     r4, r0
        add     r3, r8, r7, lsl #4
        str     r3, [sp, #0x10]
        add     r3, r10, #4
        str     r3, [sp, #0x14]
        mov     r0, r1
        bl      __addsf3
        ldr     r1, [sp, #4]
        ldr     r6, [r9]
        mov     r11, r0
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0x78]
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0x74]
        mov     r0, r6
        bl      __addsf3
        ldr     r1, [sp, #0x74]
        bl      __addsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x7C]
        bl      __mulsf3
        ldr     r1, [sp]
        str     r0, [sp, #0x74]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x74]
        bl      __addsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x74]
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0x70]
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x70]
        bl      __addsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0x70]
        mov     r0, r11
        bl      __mulsf3
        mov     r11, r0
        ldr     r1, [sp]
        ldr     r0, [sp, #0x7C]
        bl      __mulsf3
        mov     r1, r11
        bl      __subsf3
        mov     r11, r0
        mov     r1, r5
        mov     r0, r6
        bl      __addsf3
        mov     r1, r4
        bl      __addsf3
        str     r0, [r8]
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x74]
        bl      __addsf3
        str     r0, [r8, +r7, lsl #2]
        ldr     r0, [sp, #0x70]
        mov     r1, r11
        bl      __addsf3
        str     r0, [r8, +r7, lsl #3]
        ldr     r0, [sp, #0x70]
        mov     r1, r11
        bl      __subsf3
        ldr     r3, [sp, #0x48]
        str     r0, [r8, +r3, lsl #2]
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x74]
        bl      __subsf3
        ldr     r3, [sp, #0x54]
        str     r0, [r8, +r7, lsl #4]
        cmp     r3, #1
        blt     LCJE2
        mov     r12, #1
        ldr     r2, [sp, #0x54]
        add     lr, r9, #4
        str     r12, [sp, #0x38]
        ldr     r12, [sp, #0x20]
        add     r3, r10, #8
        add     r10, r10, #0xC
        add     lr, lr, r12, lsl #2
        str     lr, [sp, #0x34]
        ldr     lr, [sp, #0x14]
        str     r10, [sp, #0x24]
        add     r1, r9, #8
        add     lr, lr, r12, lsl #2
        add     r12, r3, r12, lsl #2
        str     r12, [sp, #0x30]
        ldr     r12, [sp, #0x1C]
        str     lr, [sp, #0x2C]
        add     lr, r12, #8
        add     r6, r12, #0xC
        add     r12, r8, #8
        str     r12, [sp, #0x1C]
        ldr     r12, [sp, #0x18]
        str     lr, [sp, #0x28]
        str     r1, [sp, #0x7C]
        add     lr, r12, #4
        add     r5, r12, #8
        ldr     r12, [sp, #0xC]
        str     lr, [sp, #0x14]
        str     r5, [sp, #0x74]
        add     r4, r12, #8
        add     r0, r12, #4
        ldr     r12, [sp, #8]
        str     r2, [sp, #8]
        str     r4, [sp, #0xC]
        add     r11, r12, #4
        add     lr, r12, #8
        ldr     r12, [sp, #0x10]
        str     r11, [sp, #0x6C]
        str     r6, [sp, #0x78]
        ldr     r11, [sp, #0x3C]
        ldr     r6, [sp]
        ldr     r4, [sp, #4]
        add     r10, r12, #4
        add     r12, r12, #8
        str     r12, [sp, #0x10]
        str     r10, [sp, #0x68]
        str     lr, [sp, #0x18]
        str     r0, [sp, #0x70]
        str     r3, [sp, #0x60]
        str     r7, [sp, #0x40]
        str     r8, [sp, #0x5C]
        str     r9, [sp, #0x64]
LCJE1:
        ldr     r0, [sp, #0x64]
        ldr     r2, [sp, #0x20]
        ldr     r8, [r0, +r2, lsl #2]
        ldr     r2, [sp, #0x60]
        mov     r1, r8
        ldr     r9, [r2], #8
        str     r2, [sp, #0x60]
        ldr     r2, [sp, #0x20]
        mov     r0, r9
        sub     r2, r2, #2
        str     r2, [sp, #0x20]
        bl      __addsf3
        ldr     r2, [sp, #0x34]
        ldr     r5, [r2]
        ldr     r2, [sp, #0x24]
        ldr     r7, [r2]
        ldr     r2, [sp, #0x24]
        str     r0, [sp, #0x88]
        mov     r1, r5
        mov     r0, r7
        add     r2, r2, #8
        str     r2, [sp, #0x24]
        bl      __subsf3
        str     r0, [sp, #0x8C]
        mov     r1, r8
        mov     r0, r9
        bl      __subsf3
        str     r0, [sp, #0x90]
        mov     r1, r5
        mov     r0, r7
        bl      __addsf3
        ldr     r2, [sp, #0x2C]
        ldr     r8, [r2]
        ldr     r2, [sp, #0x28]
        ldr     r10, [r2]
        ldr     r2, [sp, #0x34]
        str     r0, [sp, #0x94]
        mov     r1, r8
        mov     r0, r10
        sub     r2, r2, #8
        str     r2, [sp, #0x34]
        bl      __addsf3
        ldr     r2, [sp, #0x30]
        ldr     r7, [r2]
        ldr     r2, [sp, #0x78]
        ldr     r9, [r2]
        ldr     r2, [sp, #0x28]
        str     r0, [sp, #0x98]
        mov     r1, r7
        mov     r0, r9
        add     r2, r2, #8
        str     r2, [sp, #0x28]
        bl      __subsf3
        mov     r5, r0
        mov     r0, r10
        mov     r1, r8
        bl      __subsf3
        mov     r8, r0
        mov     r0, r9
        mov     r1, r7
        bl      __addsf3
        mov     r10, r0
        ldr     r0, [sp, #0x88]
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        mov     r9, r0
        ldr     r0, [sp, #0x98]
        bl      __mulsf3
        ldr     r2, [sp, #0x64]
        ldr     r3, [sp, #0x38]
        mov     r1, r9
        ldr     r7, [r2, +r3, lsl #2]
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [sp, #0x7C]
        mov     r1, r4
        ldr     r9, [r2]
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x8C]
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0xA0]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0xA0]
        bl      __addsf3
        str     r0, [sp, #0xA0]
        ldr     r0, [sp, #0x94]
        ldr     r1, [sp, #0x84]
        bl      __mulsf3
        str     r0, [sp, #0xA4]
        mov     r1, r6
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0xA4]
        bl      __addsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0xA4]
        ldr     r0, [sp, #0x90]
        bl      __mulsf3
        str     r0, [sp, #0xA8]
        mov     r0, r8
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0xA8]
        bl      __addsf3
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0x98]
        mov     r1, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0xAC]
        ldr     r0, [sp, #0x88]
        bl      __mulsf3
        ldr     r1, [sp, #0xAC]
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0xAC]
        ldr     r0, [sp, #0x8C]
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
        mov     r0, r5
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x84]
        mov     r9, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x94]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r10
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x90]
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0x94]
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x94]
        bl      __subsf3
        ldr     r1, [sp, #0xA4]
        mov     r8, r0
        ldr     r0, [sp, #0x9C]
        bl      __addsf3
        str     r0, [sp, #0x94]
        ldr     r1, [sp, #0xA8]
        ldr     r0, [sp, #0xA0]
        bl      __subsf3
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0xAC]
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp, #0xB0]
        mov     r1, r8
        mov     r0, r9
        bl      __subsf3
        str     r0, [sp, #0xB4]
        ldr     r0, [sp, #0xAC]
        mov     r1, r10
        bl      __subsf3
        mov     r10, r0
        mov     r1, r8
        mov     r0, r9
        bl      __addsf3
        ldr     r1, [sp, #0xA4]
        mov     r8, r0
        ldr     r0, [sp, #0x9C]
        bl      __subsf3
        ldr     r1, [sp, #0xA8]
        str     r0, [sp, #0xAC]
        ldr     r0, [sp, #0xA0]
        bl      __addsf3
        ldr     r1, [sp, #0x98]
        mov     r9, r0
        ldr     r0, [sp, #0x88]
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [sp, #0x5C]
        ldr     r3, [sp, #0x38]
        str     r0, [r2, +r3, lsl #2]
        ldr     r2, [sp, #0x7C]
        ldr     r1, [sp, #0x8C]
        ldr     r0, [r2]
        ldr     r2, [sp, #0x2C]
        sub     r2, r2, #8
        str     r2, [sp, #0x2C]
        bl      __addsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2]
        ldr     r0, [sp, #0x94]
        ldr     r2, [sp, #0x78]
        ldr     r1, [r11]
        add     r2, r2, #8
        str     r2, [sp, #0x78]
        bl      __mulsf3
        ldr     r1, [r11, #4]
        ldr     r2, [sp, #0x30]
        mov     r5, r0
        ldr     r0, [sp, #0x90]
        sub     r2, r2, #8
        str     r2, [sp, #0x30]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        str     r0, [r2]
        ldr     r0, [sp, #0x90]
        ldr     r2, [sp, #0x7C]
        ldr     r1, [r11]
        add     r2, r2, #8
        str     r2, [sp, #0x7C]
        bl      __mulsf3
        ldr     r2, [sp, #0x1C]
        ldr     r1, [r11, #4]
        mov     r5, r0
        ldr     r0, [sp, #0x94]
        add     r2, r2, #8
        str     r2, [sp, #0x1C]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x74]
        str     r0, [r2]
        ldr     r0, [sp, #0xB0]
        ldr     r1, [r11, #8]
        ldr     r2, [sp, #0x14]
        add     r2, r2, #8
        str     r2, [sp, #0x14]
        bl      __mulsf3
        ldr     r1, [r11, #0xC]
        ldr     r2, [sp, #0x74]
        mov     r5, r0
        ldr     r0, [sp, #0xB4]
        add     r2, r2, #8
        str     r2, [sp, #0x74]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x70]
        str     r0, [r2]
        ldr     r2, [sp, #0x70]
        ldr     r0, [sp, #0xB4]
        ldr     r1, [r11, #8]
        add     r2, r2, #8
        str     r2, [sp, #0x70]
        bl      __mulsf3
        ldr     r2, [sp, #0x38]
        ldr     r1, [r11, #0xC]
        mov     r5, r0
        ldr     r0, [sp, #0xB0]
        add     r2, r2, #2
        str     r2, [sp, #0x38]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0xC]
        str     r0, [r2], #8
        ldr     r1, [r11, #0x10]
        mov     r0, r10
        str     r2, [sp, #0xC]
        bl      __mulsf3
        ldr     r1, [r11, #0x14]
        mov     r5, r0
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x6C]
        str     r0, [r2]
        ldr     r1, [r11, #0x10]
        ldr     r2, [sp, #0x6C]
        mov     r0, r8
        add     r2, r2, #8
        str     r2, [sp, #0x6C]
        bl      __mulsf3
        ldr     r1, [r11, #0x14]
        mov     r5, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x18]
        str     r0, [r2], #8
        ldr     r1, [r11, #0x18]
        ldr     r0, [sp, #0xAC]
        str     r2, [sp, #0x18]
        bl      __mulsf3
        ldr     r1, [r11, #0x1C]
        mov     r5, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x68]
        str     r0, [r2]
        ldr     r2, [sp, #0x68]
        ldr     r1, [r11, #0x18]
        mov     r0, r9
        add     r2, r2, #8
        str     r2, [sp, #0x68]
        bl      __mulsf3
        ldr     r1, [r11, #0x1C]
        mov     r5, r0
        ldr     r0, [sp, #0xAC]
        add     r11, r11, #0x20
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x10]
        str     r0, [r2], #8
        ldr     r0, [sp, #8]
        str     r2, [sp, #0x10]
        subs    r0, r0, #1
        str     r0, [sp, #8]
        ldr     r0, [sp, #8]
        bne     LCJE1
        ldr     r7, [sp, #0x40]
        ldr     r8, [sp, #0x5C]
        ldr     r9, [sp, #0x64]
LCJE2:
        ldr     r3, [sp, #0x44]
        ldr     r12, [sp, #0x58]
        subs    r3, r3, #1
        str     r3, [sp, #0x44]
        add     r9, r9, r12, lsl #2
        add     r8, r8, r12, lsl #2
        bne     LCJE0
LCJE3:
        add     sp, sp, #0xB8
        ldmia   sp!, {r4 - r11, pc}
        .long   LCJE_C_1_5
        .long   LCJE_C_2_5
        .long   LCJE_S_1_5
        .long   LCJE_S_2_5


        .data
        .align  4


LCJE_C_1_5:
        .byte   0x7A,0x37,0x9E,0x3E
LCJE_C_2_5:
        .byte   0xBD,0x1B,0x4F,0xBF
LCJE_S_1_5:
        .byte   0x71,0x78,0x73,0xBF
LCJE_S_2_5:
        .byte   0x18,0x79,0x16,0xBF


