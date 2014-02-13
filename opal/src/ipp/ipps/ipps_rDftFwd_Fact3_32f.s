        .text
        .align  4
        .globl  _ipps_rDftFwd_Fact3_32f


_ipps_rDftFwd_Fact3_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x60
        ldr     r12, [sp, #0x84]
        cmp     r3, #0
        mov     r8, r0
        mov     r7, r1
        mov     r6, r2
        ble     LCJM3
        ldr     lr, [pc, #0x3DC]
        ldr     r4, [pc, #0x3DC]
        add     r12, r12, #0x10
        ldr     lr, [lr]
        mov     r5, r6, lsl #1
        ldr     r4, [r4]
        sub     r5, r5, #3
        mov     r10, r6, asr #1
        rsb     r9, r6, r6, lsl #2
        str     r9, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     r4, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r3, [sp, #0xC]
LCJM0:
        ldr     r5, [r8, +r6, lsl #2]
        ldr     r3, [sp, #0x10]
        ldr     r10, [r8, +r6, lsl #3]
        ldr     r9, [sp, #0x14]
        mov     r0, r5
        str     r3, [sp, #4]
        mov     r1, r10
        bl      __addsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r10
        bl      __subsf3
        ldr     r1, [sp, #0x30]
        ldr     r5, [r8]
        mov     r11, r0
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        mov     r10, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r5
        mov     r1, r4
        bl      __addsf3
        str     r0, [r7]
        str     r11, [r7, +r6, lsl #3]
        ldr     r3, [sp, #0x18]
        add     r12, r8, r6, lsl #2
        cmp     r3, #1
        add     r3, r7, r6, lsl #3
        str     r10, [r3, #-4]
        sub     r1, r3, #4
        add     r3, r8, r6, lsl #3
        blt     LCJM2
        add     r2, r1, #8
        str     r2, [sp]
        ldr     r2, [sp, #0x18]
        add     lr, r7, #4
        add     r10, r7, #8
        str     r7, [sp, #0x34]
        ldr     r7, [sp, #4]
        add     r0, r12, #4
        add     r11, r3, #4
        add     lr, lr, r9, lsl #2
        add     r12, r12, #8
        add     r3, r3, #8
        add     r1, r1, #0xC
        mov     r5, #1
        add     r4, r8, #8
        str     r2, [sp, #0x28]
        str     r1, [sp, #0x48]
        str     r10, [sp, #0x44]
        str     r3, [sp, #0x4C]
        str     r11, [sp, #0x50]
        str     r12, [sp, #0x40]
        str     r0, [sp, #0x3C]
        str     lr, [sp, #0x24]
        str     r9, [sp, #0x38]
        str     r6, [sp, #8]
        str     r8, [sp, #0x20]
LCJM1:
        ldr     r0, [sp, #0x3C]
        ldr     r11, [r7]
        ldr     r2, [sp, #0x40]
        ldr     r9, [r0]
        ldr     r10, [r7, #4]
        ldr     r8, [r2]
        mov     r1, r11
        mov     r0, r9
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r10
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        mov     r6, r0
        mov     r1, r11
        mov     r0, r8
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r9
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x50]
        ldr     r2, [sp, #0x4C]
        mov     r9, r0
        ldr     r10, [r1]
        ldr     r1, [r7, #8]
        str     r1, [sp, #0x54]
        ldr     r1, [sp, #0x54]
        ldr     r11, [r7, #0xC]
        ldr     r2, [r2]
        mov     r0, r10
        str     r2, [sp, #0x58]
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp, #0x58]
        mov     r1, r11
        add     r7, r7, #0x10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r1, [sp, #0x54]
        mov     r8, r0
        ldr     r0, [sp, #0x58]
        bl      __mulsf3
        str     r0, [sp, #0x58]
        mov     r1, r11
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x58]
        bl      __addsf3
        mov     r10, r0
        mov     r1, r8
        mov     r0, r6
        bl      __addsf3
        str     r0, [sp, #0x58]
        mov     r1, r10
        mov     r0, r9
        bl      __addsf3
        str     r0, [sp, #0x54]
        mov     r1, r8
        mov     r0, r6
        bl      __subsf3
        str     r0, [sp, #0x5C]
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        mov     r10, r0
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x58]
        bl      __mulsf3
        ldr     r1, [sp, #0x20]
        ldr     r2, [sp, #0x3C]
        ldr     r9, [r1, +r5, lsl #2]
        add     r2, r2, #8
        str     r2, [sp, #0x3C]
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        ldr     r8, [r4]
        mov     r6, r0
        ldr     r0, [sp, #0x54]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        mov     r8, r0
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x2C]
        mov     r11, r0
        ldr     r0, [sp, #0x5C]
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x58]
        mov     r1, r9
        bl      __addsf3
        ldr     r2, [sp, #0x34]
        str     r0, [r2, +r5, lsl #2]
        ldr     r0, [r4], #8
        ldr     r2, [sp, #0x40]
        ldr     r1, [sp, #0x54]
        add     r2, r2, #8
        str     r2, [sp, #0x40]
        bl      __addsf3
        ldr     r2, [sp, #0x44]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [sp]
        mov     r1, r8
        str     r0, [r2]
        mov     r0, r10
        bl      __addsf3
        ldr     r2, [sp, #0x48]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r6
        bl      __addsf3
        ldr     r3, [sp, #0x38]
        ldr     r2, [sp, #0x34]
        mov     r1, r8
        add     r5, r5, #2
        str     r0, [r2, +r3, lsl #2]
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x24]
        str     r0, [r1], #-8
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x24]
        subs    r0, r0, #1
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #8
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #8
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #8
        str     r0, [sp, #0x44]
        ldr     r0, [sp]
        add     r0, r0, #8
        str     r0, [sp]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #8
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x38]
        sub     r0, r0, #2
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x28]
        bne     LCJM1
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #0x34]
        ldr     r8, [sp, #0x20]
LCJM2:
        ldr     r3, [sp, #0xC]
        ldr     r12, [sp, #0x1C]
        subs    r3, r3, #1
        str     r3, [sp, #0xC]
        add     r8, r8, r12, lsl #2
        add     r7, r7, r12, lsl #2
        bne     LCJM0
LCJM3:
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
        .long   LCJM_C_1_3
        .long   LCJM_S_1_3


        .data
        .align  4


LCJM_C_1_3:
        .byte   0x00,0x00,0x00,0xBF
LCJM_S_1_3:
        .byte   0xD7,0xB3,0x5D,0xBF


