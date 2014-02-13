        .text
        .align  4
        .globl  _ipps_cDftFwd_Prime5_32fc


_ipps_cDftFwd_Prime5_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x90
        ldr     lr, [sp, #0xB4]
        ldr     r12, [sp, #0xB8]
        cmp     lr, #0
        ble     LCLI3
        ldr     r7, [pc, #0x42C]
        ldr     r6, [pc, #0x42C]
        ldr     r5, [pc, #0x42C]
        ldr     r8, [r7]
        ldr     r4, [pc, #0x428]
        ldr     r7, [r6]
        ldr     r6, [r5]
        ldr     r4, [r4]
        add     r5, r1, r1, lsl #2
        add     r5, r1, r5
        mul     r9, r5, r3
        mov     r10, r3, lsl #2
        mul     r10, r1, r10
        mov     r5, r3, lsl #1
        mul     r5, r1, r5
        mov     r3, r3, lsl #3
        mul     r3, r1, r3
        str     r4, [sp]
        str     r6, [sp, #4]
        str     r7, [sp, #8]
        str     r8, [sp, #0xC]
        str     r3, [sp, #0x24]
        str     r9, [sp, #0x20]
        str     r10, [sp, #0x1C]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x34]
        str     r0, [sp, #0x14]
LCLI0:
        ldr     r0, [r12], #4
        ldr     r1, [sp, #0x14]
        ldr     r3, [sp, #0x24]
        cmp     r5, #0
        add     r2, r1, r0, lsl #3
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        add     r3, r2, r3, lsl #2
        add     r6, r2, r5, lsl #2
        add     r0, r2, r0, lsl #2
        add     r1, r2, r1, lsl #2
        ble     LCLI2
        add     r8, r6, #4
        add     r10, r0, #4
        add     r7, r2, #4
        str     r7, [sp, #0x58]
        str     r10, [sp, #0x30]
        str     r8, [sp, #0x40]
        str     r6, [sp, #0x48]
        str     r5, [sp, #0x38]
        ldr     r7, [sp]
        ldr     r8, [sp, #4]
        ldr     r6, [sp, #8]
        ldr     r5, [sp, #0xC]
        ldr     r10, [sp, #0x10]
        add     r9, r3, #4
        add     r11, r1, #4
        mov     r4, #0
        str     r11, [sp, #0x2C]
        str     r9, [sp, #0x3C]
        str     r3, [sp, #0x44]
        str     r1, [sp, #0x54]
        str     r0, [sp, #0x4C]
        str     r2, [sp, #0x50]
        str     r12, [sp, #0x28]
        str     lr, [sp, #0x18]
LCLI1:
        ldr     r0, [sp, #0x44]
        ldr     r0, [r0, +r4, lsl #2]
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x5C]
        ldr     r0, [r0, +r4, lsl #2]
        str     r0, [sp, #0x60]
        bl      __addsf3
        ldr     r2, [sp, #0x40]
        ldr     r11, [r2, +r4, lsl #2]
        ldr     r2, [sp, #0x3C]
        ldr     r9, [r2, +r4, lsl #2]
        str     r0, [sp, #0x64]
        mov     r0, r11
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x68]
        ldr     r1, [sp, #0x5C]
        ldr     r0, [sp, #0x60]
        bl      __subsf3
        str     r0, [sp, #0x60]
        mov     r0, r11
        mov     r1, r9
        bl      __subsf3
        ldr     r2, [sp, #0x4C]
        ldr     r2, [r2, +r4, lsl #2]
        str     r2, [sp, #0x5C]
        ldr     r2, [sp, #0x54]
        ldr     r2, [r2, +r4, lsl #2]
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x5C]
        str     r2, [sp, #0x6C]
        ldr     r1, [sp, #0x6C]
        bl      __addsf3
        ldr     r2, [sp, #0x2C]
        mov     r9, r0
        ldr     r11, [r2, +r4, lsl #2]
        ldr     r2, [sp, #0x30]
        ldr     r2, [r2, +r4, lsl #2]
        mov     r1, r11
        str     r2, [sp, #0x74]
        ldr     r0, [sp, #0x74]
        bl      __addsf3
        ldr     r1, [sp, #0x6C]
        str     r0, [sp, #0x78]
        ldr     r0, [sp, #0x5C]
        bl      __subsf3
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x74]
        mov     r1, r11
        bl      __subsf3
        ldr     r2, [sp, #0x50]
        mov     r1, r5
        ldr     r11, [r2, +r4, lsl #2]
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x64]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [sp, #0x5C]
        mov     r0, r9
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        ldr     r2, [sp, #0x58]
        mov     r1, r5
        ldr     r2, [r2, +r4, lsl #2]
        str     r0, [sp, #0x7C]
        ldr     r0, [sp, #0x68]
        str     r2, [sp, #0x5C]
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x78]
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        bl      __addsf3
        str     r0, [sp, #0x80]
        ldr     r0, [sp, #0x70]
        mov     r1, r8
        bl      __mulsf3
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x74]
        mov     r1, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        bl      __addsf3
        str     r0, [sp, #0x84]
        ldr     r0, [sp, #0x60]
        mov     r1, r8
        bl      __mulsf3
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x6C]
        mov     r1, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x88]
        bl      __addsf3
        str     r0, [sp, #0x88]
        ldr     r0, [sp, #0x64]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [sp, #0x8C]
        mov     r0, r9
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x8C]
        bl      __addsf3
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x68]
        mov     r1, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x78]
        mov     r1, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x5C]
        bl      __addsf3
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x70]
        mov     r1, r7
        bl      __mulsf3
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x74]
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x70]
        bl      __subsf3
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x60]
        mov     r1, r7
        bl      __mulsf3
        str     r0, [sp, #0x70]
        ldr     r0, [sp, #0x6C]
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x70]
        bl      __subsf3
        ldr     r1, [sp, #0x64]
        str     r0, [sp, #0x70]
        mov     r0, r11
        bl      __addsf3
        mov     r1, r9
        bl      __addsf3
        str     r0, [r10]
        ldr     r0, [sp, #0x58]
        ldr     r2, [sp, #0x34]
        ldr     r1, [sp, #0x68]
        ldr     r0, [r0, +r4, lsl #2]
        add     r4, r4, r2, lsl #1
        bl      __addsf3
        ldr     r1, [sp, #0x78]
        bl      __addsf3
        str     r0, [r10, #4]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x84]
        bl      __subsf3
        str     r0, [r10, #8]
        ldr     r1, [sp, #0x88]
        ldr     r0, [sp, #0x80]
        bl      __addsf3
        str     r0, [r10, #0xC]
        ldr     r0, [sp, #0x8C]
        ldr     r1, [sp, #0x74]
        bl      __subsf3
        str     r0, [r10, #0x10]
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x70]
        bl      __addsf3
        str     r0, [r10, #0x14]
        ldr     r0, [sp, #0x8C]
        ldr     r1, [sp, #0x74]
        bl      __addsf3
        str     r0, [r10, #0x18]
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x70]
        bl      __subsf3
        str     r0, [r10, #0x1C]
        ldr     r0, [sp, #0x7C]
        ldr     r1, [sp, #0x84]
        bl      __addsf3
        str     r0, [r10, #0x20]
        ldr     r0, [sp, #0x80]
        ldr     r1, [sp, #0x88]
        bl      __subsf3
        str     r0, [r10, #0x24]
        ldr     r0, [sp, #0x38]
        add     r10, r10, #0x28
        cmp     r4, r0
        blt     LCLI1
        ldr     r12, [sp, #0x28]
        ldr     r5, [sp, #0x38]
        ldr     lr, [sp, #0x18]
        str     r10, [sp, #0x10]
LCLI2:
        subs    lr, lr, #1
        bne     LCLI0
LCLI3:
        add     sp, sp, #0x90
        ldmia   sp!, {r4 - r11, pc}
        .long   LCLI_C_1_5
        .long   LCLI_C_2_5
        .long   LCLI_S_1_5
        .long   LCLI_S_2_5


        .data
        .align  4


LCLI_C_1_5:
        .byte   0x7A,0x37,0x9E,0x3E
LCLI_C_2_5:
        .byte   0xBD,0x1B,0x4F,0xBF
LCLI_S_1_5:
        .byte   0x71,0x78,0x73,0xBF
LCLI_S_2_5:
        .byte   0x18,0x79,0x16,0xBF


