        .text
        .align  4
        .globl  _ipps_rDftInv_Fact3_32f


_ipps_rDftInv_Fact3_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x60
        ldr     r12, [sp, #0x84]
        cmp     r3, #0
        mov     r6, r0
        mov     r5, r1
        mov     r4, r2
        ble     LCJF3
        ldr     lr, [pc, #0x3D4]
        ldr     r7, [pc, #0x3D4]
        add     r12, r12, #0x10
        ldr     lr, [lr]
        mov     r8, r4, lsl #1
        ldr     r7, [r7]
        sub     r8, r8, #3
        mov     r10, r4, asr #1
        rsb     r9, r4, r4, lsl #2
        str     r9, [sp, #0x28]
        str     r10, [sp, #0x24]
        str     r8, [sp, #0x20]
        str     r12, [sp, #0x1C]
        str     r7, [sp, #0x38]
        str     lr, [sp, #0x34]
        str     r3, [sp, #0x18]
LCJF0:
        add     r3, r6, r4, lsl #3
        ldr     r1, [r3, #-4]!
        str     r3, [sp, #4]
        ldr     r3, [sp, #0x1C]
        mov     r0, r1
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x20]
        add     r7, r5, r4, lsl #3
        str     r3, [sp, #8]
        bl      __addsf3
        mov     r8, r0
        ldr     r0, [r6, +r4, lsl #3]
        add     r3, r5, r4, lsl #2
        str     r3, [sp]
        mov     r1, r0
        bl      __addsf3
        ldr     r1, [sp, #0x34]
        ldr     r10, [r6]
        mov     r11, r0
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        mov     r9, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r8
        bl      __addsf3
        str     r0, [r5]
        mov     r0, r9
        mov     r1, r11
        bl      __addsf3
        str     r0, [r5, +r4, lsl #2]
        mov     r0, r9
        mov     r1, r11
        bl      __subsf3
        ldr     r3, [sp, #0x24]
        str     r0, [r5, +r4, lsl #3]
        cmp     r3, #1
        blt     LCJF2
        ldr     r3, [sp, #8]
        add     r12, r6, #4
        ldr     r1, [sp, #0x24]
        add     lr, r12, r3, lsl #2
        ldr     r3, [sp, #4]
        mov     r9, #1
        add     r8, r6, #8
        add     r0, r5, #8
        add     r12, r3, #8
        str     r12, [sp, #0xC]
        add     r12, r3, #0xC
        ldr     r3, [sp]
        add     r10, r7, #4
        str     r10, [sp, #0x4C]
        ldr     r10, [sp, #0x10]
        add     r11, r3, #4
        add     r3, r3, #8
        add     r7, r7, #8
        str     r1, [sp, #0x30]
        str     r7, [sp]
        str     r3, [sp, #4]
        str     r11, [sp, #0x48]
        str     r0, [sp, #0x50]
        str     r12, [sp, #0x40]
        str     lr, [sp, #0x44]
        str     r4, [sp, #0x14]
        str     r5, [sp, #0x2C]
        str     r6, [sp, #0x3C]
LCJF1:
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #8]
        ldr     r2, [sp, #0xC]
        ldr     r11, [r2], #8
        ldr     r7, [r0, +r1, lsl #2]
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #8]
        mov     r0, r11
        mov     r1, r7
        sub     r2, r2, #2
        str     r2, [sp, #8]
        bl      __addsf3
        ldr     r2, [sp, #0x40]
        ldr     r4, [r2]
        ldr     r2, [sp, #0x44]
        ldr     r5, [r2]
        ldr     r2, [sp, #0x40]
        str     r0, [sp, #0x54]
        mov     r0, r4
        mov     r1, r5
        add     r2, r2, #8
        str     r2, [sp, #0x40]
        bl      __subsf3
        mov     r6, r0
        mov     r1, r7
        mov     r0, r11
        bl      __subsf3
        str     r0, [sp, #0x58]
        mov     r1, r5
        mov     r0, r4
        bl      __addsf3
        ldr     r1, [sp, #0x34]
        mov     r5, r0
        ldr     r0, [sp, #0x54]
        bl      __mulsf3
        ldr     r2, [sp, #0x3C]
        ldr     r7, [r2, +r9, lsl #2]
        ldr     r2, [sp, #0x44]
        mov     r1, r7
        sub     r2, r2, #8
        str     r2, [sp, #0x44]
        bl      __addsf3
        ldr     r4, [r8]
        ldr     r1, [sp, #0x34]
        str     r0, [sp, #0x5C]
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        mov     r4, r0
        mov     r0, r5
        bl      __mulsf3
        mov     r11, r0
        ldr     r1, [sp, #0x38]
        ldr     r0, [sp, #0x58]
        bl      __mulsf3
        mov     r5, r0
        ldr     r0, [sp, #0x54]
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [sp, #0x2C]
        mov     r1, r6
        str     r0, [r2, +r9, lsl #2]
        ldr     r0, [r8], #8
        add     r9, r9, #2
        bl      __addsf3
        ldr     r2, [sp, #0x50]
        mov     r1, r11
        str     r0, [r2]
        ldr     r0, [sp, #0x5C]
        bl      __addsf3
        mov     r6, r0
        mov     r0, r4
        mov     r1, r5
        bl      __subsf3
        mov     r7, r0
        ldr     r0, [sp, #0x5C]
        mov     r1, r11
        bl      __subsf3
        mov     r11, r0
        mov     r0, r4
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [r10]
        mov     r4, r0
        mov     r0, r6
        bl      __mulsf3
        ldr     r2, [sp, #0x50]
        ldr     r1, [r10, #4]
        mov     r5, r0
        mov     r0, r7
        add     r2, r2, #8
        str     r2, [sp, #0x50]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x48]
        str     r0, [r1]
        ldr     r2, [sp, #0x48]
        ldr     r1, [r10]
        mov     r0, r7
        add     r2, r2, #8
        str     r2, [sp, #0x48]
        bl      __mulsf3
        ldr     r1, [r10, #4]
        mov     r5, r0
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #4]
        str     r0, [r2], #8
        ldr     r1, [r10, #8]
        mov     r0, r11
        str     r2, [sp, #4]
        bl      __mulsf3
        ldr     r1, [r10, #0xC]
        mov     r5, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x4C]
        str     r0, [r1]
        ldr     r2, [sp, #0x4C]
        ldr     r1, [r10, #8]
        mov     r0, r4
        add     r2, r2, #8
        str     r2, [sp, #0x4C]
        bl      __mulsf3
        ldr     r1, [r10, #0xC]
        mov     r4, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp]
        add     r10, r10, #0x10
        str     r0, [r1], #8
        ldr     r0, [sp, #0x30]
        str     r1, [sp]
        subs    r0, r0, #1
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x30]
        bne     LCJF1
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x2C]
        ldr     r6, [sp, #0x3C]
LCJF2:
        ldr     r3, [sp, #0x18]
        ldr     r12, [sp, #0x28]
        subs    r3, r3, #1
        str     r3, [sp, #0x18]
        add     r6, r6, r12, lsl #2
        add     r5, r5, r12, lsl #2
        bne     LCJF0
LCJF3:
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
        .long   LCJF_C_1_3
        .long   LCJF_S_1_3


        .data
        .align  4


LCJF_C_1_3:
        .byte   0x00,0x00,0x00,0xBF
LCJF_S_1_3:
        .byte   0xD7,0xB3,0x5D,0xBF


