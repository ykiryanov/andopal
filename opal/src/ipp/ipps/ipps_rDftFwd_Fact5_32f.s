        .text
        .align  4
        .globl  _ipps_rDftFwd_Fact5_32f


_ipps_rDftFwd_Fact5_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA8
        ldr     r12, [sp, #0xCC]
        cmp     r3, #0
        mov     r6, r0
        mov     r5, r1
        mov     r4, r2
        ble     LCJL3
        ldr     r7, [pc, #0x858]
        ldr     r8, [pc, #0x858]
        ldr     r9, [pc, #0x858]
        ldr     lr, [pc, #0x858]
        ldr     r7, [r7]
        ldr     r8, [r8]
        ldr     r9, [r9]
        ldr     lr, [lr]
        mov     r10, r4, lsl #1
        add     r12, r12, #0x20
        sub     r10, r10, #3
        rsb     r0, r4, r4, lsl #2
        mov     r1, r4, asr #1
        add     r11, r4, r4, lsl #2
        str     r11, [sp, #0x48]
        str     r1, [sp, #0x44]
        str     r10, [sp, #0x40]
        str     r12, [sp, #0x3C]
        str     lr, [sp, #0x84]
        str     r9, [sp, #0x78]
        str     r8, [sp, #0x7C]
        str     r7, [sp, #0x80]
        str     r0, [sp, #0x38]
        str     r3, [sp, #0x34]
LCJL0:
        ldr     r3, [sp, #0x3C]
        str     r3, [sp, #0x2C]
        ldr     r3, [sp, #0x40]
        str     r3, [sp, #0xC]
        ldr     r7, [r6, +r4, lsl #2]
        ldr     r9, [r6, +r4, lsl #4]
        add     r3, r6, r4, lsl #2
        str     r3, [sp, #8]
        add     r3, r6, r4, lsl #3
        mov     r0, r7
        str     r3, [sp, #4]
        mov     r1, r9
        bl      __addsf3
        mov     r8, r0
        mov     r1, r9
        mov     r0, r7
        bl      __subsf3
        ldr     r3, [sp, #0x38]
        ldr     r9, [r6, +r4, lsl #3]
        mov     r10, r0
        ldr     r11, [r6, +r3, lsl #2]
        add     r3, r6, r3, lsl #2
        str     r3, [sp]
        mov     r0, r9
        mov     r1, r11
        bl      __addsf3
        mov     r7, r0
        mov     r0, r9
        mov     r1, r11
        bl      __subsf3
        ldr     r1, [sp, #0x80]
        ldr     r9, [r6]
        mov     r11, r0
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x7C]
        str     r0, [sp, #0x74]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x74]
        str     r0, [sp, #0x70]
        mov     r0, r9
        bl      __addsf3
        ldr     r1, [sp, #0x70]
        bl      __addsf3
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0x74]
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0x70]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x70]
        bl      __addsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0x70]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x7C]
        str     r0, [sp, #0x6C]
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x6C]
        bl      __addsf3
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0x6C]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        mov     r11, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __subsf3
        mov     r10, r0
        mov     r1, r8
        mov     r0, r9
        bl      __addsf3
        mov     r1, r7
        bl      __addsf3
        str     r0, [r5]
        ldr     r12, [sp, #0x74]
        add     r3, r5, r4, lsl #3
        sub     r8, r3, #4
        str     r12, [r3, #-4]
        ldr     r12, [sp, #0x70]
        add     r9, r6, r4, lsl #4
        str     r12, [r5, +r4, lsl #3]
        ldr     r3, [sp, #0x44]
        ldr     lr, [sp, #0x6C]
        add     r12, r5, r4, lsl #4
        cmp     r3, #1
        str     r10, [r5, +r4, lsl #4]
        sub     r3, r12, #4
        str     lr, [r12, #-4]
        add     r10, r8, #4
        blt     LCJL2
        mov     lr, #1
        str     lr, [sp, #0x18]
        ldr     lr, [sp, #0xC]
        ldr     r1, [sp, #0x44]
        add     r7, r8, #8
        add     r10, r10, lr, lsl #2
        add     r12, r5, #4
        str     r10, [sp, #0x1C]
        add     r10, r7, lr, lsl #2
        add     lr, r12, lr, lsl #2
        ldr     r12, [sp, #8]
        str     lr, [sp, #0x20]
        str     r10, [sp, #0x28]
        add     lr, r12, #4
        add     r12, r12, #8
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #4]
        str     lr, [sp, #0x24]
        add     r11, r6, #8
        add     lr, r12, #4
        add     r12, r12, #8
        str     r12, [sp, #8]
        ldr     r12, [sp]
        str     lr, [sp, #0x14]
        add     r10, r5, #8
        add     lr, r12, #4
        str     lr, [sp, #4]
        add     lr, r9, #4
        add     r9, r9, #8
        str     r9, [sp, #0x64]
        ldr     r9, [sp, #0x2C]
        add     r0, r3, #8
        add     r12, r12, #8
        add     r8, r8, #0xC
        add     r3, r3, #0xC
        str     r1, [sp]
        str     r3, [sp, #0x54]
        str     r0, [sp, #0x58]
        str     r8, [sp, #0x5C]
        str     r10, [sp, #0x60]
        str     r11, [sp, #0x74]
        str     lr, [sp, #0x68]
        str     r12, [sp, #0x6C]
        str     r7, [sp, #0x70]
        str     r4, [sp, #0x30]
        str     r5, [sp, #0x50]
        str     r6, [sp, #0x4C]
LCJL1:
        ldr     r0, [sp, #0x24]
        ldr     r2, [sp, #0x10]
        ldr     r5, [r9]
        ldr     r4, [r0]
        ldr     r7, [r9, #4]
        ldr     r8, [r2]
        mov     r1, r5
        mov     r0, r4
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r8
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        mov     r6, r0
        mov     r1, r5
        mov     r0, r8
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r7
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x14]
        ldr     r10, [r9, #8]
        ldr     r11, [r9, #0xC]
        ldr     r5, [r2]
        ldr     r2, [sp, #8]
        mov     r7, r0
        mov     r1, r10
        ldr     r4, [r2]
        mov     r0, r5
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r4
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        str     r0, [sp, #0x88]
        mov     r0, r4
        mov     r1, r10
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r11
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #4]
        ldr     r2, [sp, #0x6C]
        ldr     r10, [r9, #0x10]
        ldr     r5, [r1]
        ldr     r11, [r9, #0x14]
        ldr     r4, [r2]
        str     r0, [sp, #0x8C]
        mov     r0, r5
        mov     r1, r10
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r11
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        str     r0, [sp, #0x90]
        mov     r1, r10
        mov     r0, r4
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x68]
        ldr     r10, [r9, #0x18]
        ldr     r2, [sp, #0x64]
        ldr     r5, [r1]
        ldr     r11, [r9, #0x1C]
        ldr     r4, [r2]
        str     r0, [sp, #0x94]
        mov     r1, r10
        mov     r0, r5
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r11
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        mov     r8, r0
        mov     r1, r10
        mov     r0, r4
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r11
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r10, r0
        mov     r0, r6
        mov     r1, r8
        bl      __addsf3
        mov     r4, r0
        mov     r1, r10
        mov     r0, r7
        bl      __addsf3
        mov     r5, r0
        mov     r0, r6
        mov     r1, r8
        bl      __subsf3
        str     r0, [sp, #0x98]
        mov     r0, r7
        mov     r1, r10
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x90]
        add     r9, r9, #0x20
        bl      __addsf3
        ldr     r1, [sp, #0x94]
        mov     r7, r0
        ldr     r0, [sp, #0x8C]
        bl      __addsf3
        ldr     r1, [sp, #0x90]
        mov     r6, r0
        ldr     r0, [sp, #0x88]
        bl      __subsf3
        ldr     r1, [sp, #0x94]
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x8C]
        bl      __subsf3
        ldr     r1, [sp, #0x80]
        mov     r10, r0
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x7C]
        str     r0, [sp, #0x94]
        mov     r0, r7
        bl      __mulsf3
        ldr     r3, [sp, #0x18]
        ldr     r2, [sp, #0x4C]
        ldr     r1, [sp, #0x94]
        ldr     r8, [r2, +r3, lsl #2]
        bl      __addsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [sp, #0x74]
        ldr     r1, [sp, #0x80]
        ldr     r2, [r2]
        str     r0, [sp, #0x8C]
        mov     r0, r5
        str     r2, [sp, #0x94]
        bl      __mulsf3
        ldr     r1, [sp, #0x94]
        bl      __addsf3
        ldr     r1, [sp, #0x7C]
        str     r0, [sp, #0x88]
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x88]
        bl      __addsf3
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0x88]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0x9C]
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x9C]
        bl      __addsf3
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0x98]
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0xA0]
        ldr     r0, [sp, #0x90]
        bl      __mulsf3
        ldr     r1, [sp, #0xA0]
        bl      __addsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0xA0]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x7C]
        str     r0, [sp, #0xA4]
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0xA4]
        bl      __addsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x7C]
        str     r0, [sp, #0xA4]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x94]
        bl      __addsf3
        ldr     r1, [sp, #0x80]
        str     r0, [sp, #0x94]
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x94]
        bl      __addsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0x94]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        mov     r11, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x78]
        mov     r11, r0
        ldr     r0, [sp, #0x90]
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0x90]
        ldr     r0, [sp, #0x98]
        bl      __mulsf3
        ldr     r1, [sp, #0x90]
        bl      __subsf3
        mov     r10, r0
        mov     r1, r7
        mov     r0, r4
        bl      __addsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r2, [sp, #0x50]
        ldr     r3, [sp, #0x18]
        mov     r1, r5
        str     r0, [r2, +r3, lsl #2]
        ldr     r2, [sp, #0x74]
        ldr     r0, [r2]
        ldr     r2, [sp, #0x24]
        add     r2, r2, #8
        str     r2, [sp, #0x24]
        bl      __addsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #0x60]
        str     r0, [r2]
        ldr     r1, [sp, #0x9C]
        ldr     r0, [sp, #0x8C]
        bl      __subsf3
        ldr     r2, [sp, #0x70]
        str     r0, [r2]
        ldr     r0, [sp, #0xA0]
        ldr     r1, [sp, #0x88]
        bl      __addsf3
        ldr     r2, [sp, #0x5C]
        mov     r1, r11
        str     r0, [r2]
        ldr     r0, [sp, #0xA4]
        bl      __subsf3
        ldr     r2, [sp, #0x58]
        str     r0, [r2]
        ldr     r1, [sp, #0x94]
        mov     r0, r10
        bl      __addsf3
        ldr     r2, [sp, #0x54]
        mov     r1, r11
        str     r0, [r2]
        ldr     r0, [sp, #0xA4]
        bl      __addsf3
        ldr     r1, [sp, #0x1C]
        str     r0, [r1]
        ldr     r1, [sp, #0x94]
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        str     r0, [r1]
        ldr     r0, [sp, #0x8C]
        ldr     r1, [sp, #0x9C]
        bl      __addsf3
        ldr     r1, [sp, #0x50]
        ldr     r2, [sp, #0xC]
        str     r0, [r1, +r2, lsl #2]
        ldr     r0, [sp, #0xA0]
        ldr     r1, [sp, #0x88]
        bl      __subsf3
        ldr     r1, [sp, #0x20]
        str     r0, [r1], #-8
        ldr     r0, [sp]
        str     r1, [sp, #0x20]
        subs    r0, r0, #1
        str     r0, [sp]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #8
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #8
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #8]
        add     r0, r0, #8
        str     r0, [sp, #8]
        ldr     r0, [sp, #4]
        add     r0, r0, #8
        str     r0, [sp, #4]
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #8
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x68]
        add     r0, r0, #8
        str     r0, [sp, #0x68]
        ldr     r0, [sp, #0x64]
        add     r0, r0, #8
        str     r0, [sp, #0x64]
        ldr     r0, [sp, #0x74]
        add     r0, r0, #8
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x60]
        add     r0, r0, #8
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x70]
        add     r0, r0, #8
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #8
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #8
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #8
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x1C]
        sub     r0, r0, #8
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #0x28]
        sub     r0, r0, #8
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x18]
        add     r0, r0, #2
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0xC]
        sub     r0, r0, #2
        str     r0, [sp, #0xC]
        ldr     r0, [sp]
        bne     LCJL1
        ldr     r4, [sp, #0x30]
        ldr     r5, [sp, #0x50]
        ldr     r6, [sp, #0x4C]
LCJL2:
        ldr     r3, [sp, #0x34]
        ldr     r12, [sp, #0x48]
        subs    r3, r3, #1
        str     r3, [sp, #0x34]
        add     r6, r6, r12, lsl #2
        add     r5, r5, r12, lsl #2
        bne     LCJL0
LCJL3:
        add     sp, sp, #0xA8
        ldmia   sp!, {r4 - r11, pc}
        .long   LCJL_C_1_5
        .long   LCJL_C_2_5
        .long   LCJL_S_1_5
        .long   LCJL_S_2_5


        .data
        .align  4


LCJL_C_1_5:
        .byte   0x7A,0x37,0x9E,0x3E
LCJL_C_2_5:
        .byte   0xBD,0x1B,0x4F,0xBF
LCJL_S_1_5:
        .byte   0x71,0x78,0x73,0xBF
LCJL_S_2_5:
        .byte   0x18,0x79,0x16,0xBF


