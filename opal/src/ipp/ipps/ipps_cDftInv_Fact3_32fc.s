        .text
        .align  4
        .globl  _ipps_cDftInv_Fact3_32fc


_ipps_cDftInv_Fact3_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        ldr     r12, [sp, #0x7C]
        cmp     r3, #0
        mov     r8, r0
        mov     r7, r1
        mov     r6, r2
        ble     LCLE3
        ldr     lr, [pc, #0x484]
        ldr     r4, [pc, #0x484]
        add     r12, r12, #0x10
        ldr     lr, [lr]
        mov     r9, r6, lsl #1
        ldr     r4, [r4]
        rsb     r5, r6, r6, lsl #2
        str     r5, [sp, #0x20]
        str     r9, [sp, #0x24]
        str     r4, [sp, #0x30]
        str     lr, [sp, #0x34]
        str     r12, [sp, #0x1C]
        str     r3, [sp, #0x18]
LCLE0:
        ldr     r3, [r8, +r6, lsl #4]
        add     r4, r8, r6, lsl #3
        str     r3, [sp, #0x4C]
        ldr     r3, [sp, #0x1C]
        ldr     r1, [sp, #0x4C]
        ldr     r11, [r8, +r6, lsl #3]
        str     r4, [sp, #4]
        str     r3, [sp, #0x10]
        mov     r0, r11
        bl      __addsf3
        ldr     r4, [r4, #4]
        mov     r5, r0
        add     r3, r8, r6, lsl #4
        str     r3, [sp, #0xC]
        ldr     r10, [r3, #4]
        add     r3, r7, r6, lsl #3
        str     r3, [sp]
        mov     r0, r4
        add     r3, r7, r6, lsl #4
        str     r3, [sp, #8]
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x4C]
        mov     r9, r0
        mov     r0, r11
        bl      __subsf3
        str     r0, [sp, #0x4C]
        mov     r0, r4
        mov     r1, r10
        bl      __subsf3
        ldr     r10, [r8]
        ldr     r11, [sp, #0x34]
        str     r0, [sp, #0x48]
        mov     r0, r5
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        mov     r4, r0
        mov     r0, r9
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [r8, #4]
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x48]
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [sp, #0x4C]
        ldr     r1, [sp, #0x30]
        bl      __mulsf3
        str     r0, [sp, #0x4C]
        mov     r0, r10
        mov     r1, r5
        bl      __addsf3
        str     r0, [r7]
        ldr     r0, [r8, #4]
        mov     r1, r9
        bl      __addsf3
        str     r0, [r7, #4]
        mov     r0, r4
        mov     r1, r11
        bl      __addsf3
        str     r0, [r7, +r6, lsl #3]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x4C]
        bl      __subsf3
        ldr     r3, [sp]
        mov     r1, r11
        str     r0, [r3, #4]
        mov     r0, r4
        bl      __subsf3
        str     r0, [r7, +r6, lsl #4]
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x4C]
        bl      __addsf3
        ldr     r3, [sp, #0x24]
        cmp     r3, #2
        ldr     r3, [sp, #8]
        str     r0, [r3, #4]
        ble     LCLE2
        ldr     r3, [sp, #4]
        ldr     r2, [sp, #8]
        mov     r5, #2
        add     r0, r3, #0xC
        add     lr, r3, #8
        ldr     r3, [sp, #0xC]
        add     r4, r8, #0xC
        add     r10, r7, #0xC
        add     r1, r2, #8
        add     r11, r3, #0xC
        add     r12, r3, #8
        ldr     r3, [sp]
        str     r7, [sp, #0x28]
        ldr     r7, [sp, #0x10]
        add     r2, r2, #0xC
        add     r9, r3, #8
        add     r3, r3, #0xC
        str     r2, [sp, #0xC]
        str     r1, [sp, #0x44]
        str     r3, [sp]
        str     r9, [sp, #0x48]
        str     r10, [sp, #0x4C]
        str     r12, [sp, #0x3C]
        str     r11, [sp, #4]
        str     lr, [sp, #0x40]
        str     r0, [sp, #0x38]
        str     r6, [sp, #0x14]
        str     r8, [sp, #0x2C]
LCLE1:
        ldr     r2, [sp, #0x40]
        ldr     r11, [r7]
        ldr     r0, [sp, #0x38]
        ldr     r9, [r2]
        ldr     r10, [r7, #4]
        ldr     r8, [r0]
        mov     r1, r11
        mov     r0, r9
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r8
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r6, r0
        mov     r0, r8
        mov     r1, r11
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r10
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r1, [sp, #0x3C]
        mov     r9, r0
        ldr     r10, [r1]
        ldr     r1, [r7, #8]
        str     r1, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r0, r10
        ldr     r1, [r1]
        str     r1, [sp, #0x50]
        ldr     r1, [sp, #8]
        ldr     r11, [r7, #0xC]
        add     r7, r7, #0x10
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp, #0x50]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r8, r0
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #8]
        bl      __mulsf3
        str     r0, [sp, #0x50]
        mov     r0, r10
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x50]
        bl      __subsf3
        mov     r10, r0
        mov     r1, r8
        mov     r0, r6
        bl      __addsf3
        str     r0, [sp, #0x50]
        mov     r1, r10
        mov     r0, r9
        bl      __addsf3
        str     r0, [sp, #8]
        mov     r1, r8
        mov     r0, r6
        bl      __subsf3
        str     r0, [sp, #0x54]
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #0x34]
        bl      __mulsf3
        ldr     r1, [sp, #0x2C]
        ldr     r2, [sp, #0x38]
        ldr     r9, [r1, +r5, lsl #2]
        add     r2, r2, #8
        str     r2, [sp, #0x38]
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x34]
        mov     r6, r0
        ldr     r0, [sp, #8]
        bl      __mulsf3
        ldr     r2, [sp, #0x40]
        ldr     r1, [r4]
        add     r2, r2, #8
        str     r2, [sp, #0x40]
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        mov     r8, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r11, r0
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x54]
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x50]
        mov     r1, r9
        bl      __addsf3
        ldr     r2, [sp, #0x28]
        str     r0, [r2, +r5, lsl #2]
        ldr     r0, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r1, [r4], #8
        add     r5, r5, #2
        add     r2, r2, #8
        str     r2, [sp, #4]
        bl      __addsf3
        ldr     r2, [sp, #0x4C]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r6
        bl      __addsf3
        ldr     r2, [sp, #0x48]
        mov     r1, r10
        str     r0, [r2]
        mov     r0, r8
        bl      __subsf3
        ldr     r2, [sp]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [sp, #0x44]
        mov     r1, r10
        str     r0, [r2]
        mov     r0, r8
        bl      __addsf3
        ldr     r1, [sp, #0xC]
        str     r0, [r1]
        ldr     r0, [sp, #0x24]
        cmp     r5, r0
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #8
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #8
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #8
        str     r0, [sp, #0x48]
        ldr     r0, [sp]
        add     r0, r0, #8
        str     r0, [sp]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #8
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #8
        str     r0, [sp, #0xC]
        blt     LCLE1
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #0x28]
        ldr     r8, [sp, #0x2C]
LCLE2:
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0x20]
        subs    r3, r3, #1
        str     r3, [sp, #0x18]
        add     r8, r8, r12, lsl #3
        add     r7, r7, r12, lsl #3
        bne     LCLE0
LCLE3:
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
        .long   LCLE_C_1_3
        .long   LCLE_S_1_3


        .data
        .align  4


LCLE_C_1_3:
        .byte   0x00,0x00,0x00,0xBF
LCLE_S_1_3:
        .byte   0xD7,0xB3,0x5D,0xBF


