        .text
        .align  4
        .globl  _ipps_crDftInv_Fact3_32f


_ipps_crDftInv_Fact3_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r12, [sp, #0x5C]
        mov     r4, r0
        mov     r5, r3
        ldr     r9, [r4, +r5, lsl #3]
        ldr     r10, [r4, +r5, lsl #4]
        add     r11, r4, r5, lsl #4
        add     r12, r12, #0x10
        mov     r7, r1
        add     r8, r4, r5, lsl #3
        str     r8, [sp, #4]
        str     r12, [sp, #0x20]
        str     r11, [sp]
        mov     r1, r10
        mov     r0, r9
        mov     r6, r2
        bl      __addsf3
        ldr     r8, [r8, #4]
        ldr     r11, [r11, #4]
        str     r0, [sp, #0x2C]
        add     r12, r7, r5, lsl #2
        str     r12, [sp, #0x1C]
        mov     r0, r8
        mov     r1, r11
        bl      __addsf3
        str     r0, [sp, #0x28]
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        str     r0, [sp, #0x24]
        mov     r1, r11
        mov     r0, r8
        bl      __subsf3
        ldr     r10, [r4]
        ldr     r12, [pc, #0x394]
        add     lr, r6, r5, lsl #2
        str     lr, [sp, #0x10]
        mov     r11, r0
        ldr     r0, [sp, #0x2C]
        ldr     r8, [r12]
        add     r12, r7, r5, lsl #3
        str     r12, [sp, #0x14]
        add     r12, r6, r5, lsl #3
        str     r12, [sp, #0x18]
        str     r8, [sp, #0xC]
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x28]
        mov     r1, r8
        bl      __mulsf3
        ldr     r1, [r4, #4]
        bl      __addsf3
        ldr     r12, [pc, #0x344]
        str     r0, [sp, #0x30]
        mov     r0, r11
        ldr     r11, [r12]
        str     r11, [sp, #8]
        mov     r1, r11
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp, #0x24]
        mov     r1, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x2C]
        mov     r11, r0
        mov     r0, r10
        bl      __addsf3
        str     r0, [r7]
        ldr     r1, [sp, #0x28]
        ldr     r0, [r4, #4]
        bl      __addsf3
        str     r0, [r6]
        mov     r0, r9
        mov     r1, r8
        bl      __addsf3
        str     r0, [r7, +r5, lsl #2]
        ldr     r0, [sp, #0x30]
        mov     r1, r11
        bl      __subsf3
        str     r0, [r6, +r5, lsl #2]
        mov     r0, r9
        mov     r1, r8
        bl      __subsf3
        str     r0, [r7, +r5, lsl #3]
        ldr     r0, [sp, #0x30]
        mov     r1, r11
        bl      __addsf3
        cmp     r5, #1
        str     r0, [r6, +r5, lsl #3]
        ble     LCJV1
        ldr     r0, [sp]
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0x10]
        add     r12, r0, #0xC
        ldr     r0, [sp, #4]
        ldr     lr, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        add     r6, r6, #4
        str     r6, [sp, #4]
        ldr     r6, [sp, #0x20]
        add     r0, r0, #0xC
        add     r7, r7, #4
        add     r1, r1, #4
        add     r2, r2, #4
        add     lr, lr, #4
        add     r8, r8, #4
        sub     r5, r5, #1
        add     r4, r4, #4
        str     r5, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     lr, [sp]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x1C]
        str     r7, [sp, #0x24]
        str     r0, [sp, #0x2C]
        str     r12, [sp, #0x28]
LCJV0:
        ldr     r2, [sp, #0x2C]
        ldr     r8, [r6]
        ldr     r10, [r6, #4]
        ldr     r9, [r2, #-4]
        ldr     r5, [r2]
        mov     r1, r8
        mov     r0, r9
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        mov     r0, r5
        mov     r1, r8
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r9
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x28]
        mov     r5, r0
        ldr     r1, [r2]
        str     r1, [sp, #0x30]
        ldr     r9, [r2, #-4]
        ldr     r10, [r6, #8]
        ldr     r11, [r6, #0xC]
        add     r6, r6, #0x10
        mov     r1, r10
        mov     r0, r9
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r8, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r10
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r9
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        mov     r9, r0
        mov     r0, r7
        mov     r1, r8
        bl      __addsf3
        str     r0, [sp, #0x30]
        mov     r0, r7
        mov     r1, r8
        bl      __subsf3
        str     r0, [sp, #0x34]
        mov     r1, r9
        mov     r0, r5
        bl      __addsf3
        mov     r7, r0
        mov     r1, r9
        mov     r0, r5
        bl      __subsf3
        mov     r10, r0
        ldr     r1, [sp, #0xC]
        ldr     r0, [sp, #0x30]
        bl      __mulsf3
        ldr     r9, [r4, #4]
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0xC]
        mov     r5, r0
        mov     r0, r7
        bl      __mulsf3
        ldr     r2, [sp, #0x28]
        ldr     r1, [r4, #8]
        add     r2, r2, #8
        str     r2, [sp, #0x28]
        bl      __addsf3
        ldr     r1, [sp, #8]
        mov     r8, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [sp, #0x34]
        ldr     r1, [sp, #8]
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r9
        bl      __addsf3
        ldr     r2, [sp, #0x24]
        str     r0, [r2]
        ldr     r2, [sp, #0x24]
        ldr     r1, [r4, #8]!
        mov     r0, r7
        add     r2, r2, #4
        str     r2, [sp, #0x24]
        bl      __addsf3
        ldr     r2, [sp, #0x2C]
        mov     r1, r11
        add     r2, r2, #8
        str     r2, [sp, #0x2C]
        ldr     r2, [sp, #4]
        str     r0, [r2], #4
        str     r2, [sp, #4]
        mov     r0, r5
        bl      __addsf3
        ldr     r2, [sp, #0x1C]
        mov     r1, r10
        str     r0, [r2], #4
        str     r2, [sp, #0x1C]
        mov     r0, r8
        bl      __subsf3
        ldr     r2, [sp, #0x10]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp]
        mov     r1, r10
        str     r0, [r2]
        mov     r0, r8
        bl      __addsf3
        ldr     r1, [sp, #0x18]
        str     r0, [r1], #4
        ldr     r0, [sp, #0x14]
        str     r1, [sp, #0x18]
        subs    r0, r0, #1
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #4
        str     r0, [sp, #0x10]
        ldr     r0, [sp]
        add     r0, r0, #4
        str     r0, [sp]
        ldr     r0, [sp, #0x14]
        bne     LCJV0
LCJV1:
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   LCJV_C_1_3
        .long   LCJV_S_1_3


        .data
        .align  4


LCJV_C_1_3:
        .byte   0x00,0x00,0x00,0xBF
LCJV_S_1_3:
        .byte   0xD7,0xB3,0x5D,0xBF


