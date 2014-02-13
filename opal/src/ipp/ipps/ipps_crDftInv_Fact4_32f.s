        .text
        .align  4
        .globl  _ipps_crDftInv_Fact4_32f


_ipps_crDftInv_Fact4_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        ldr     r9, [sp, #0x68]
        mov     r7, r0
        ldr     r0, [r7]
        mov     r4, r3
        add     r9, r9, #0x18
        add     r8, r7, r4, lsl #4
        str     r0, [sp, #0x30]
        ldr     r10, [r7, +r4, lsl #4]
        mov     r6, r1
        mov     r5, r2
        str     r8, [sp, #8]
        mov     r1, r10
        bl      __addsf3
        ldr     r8, [r8, #4]
        ldr     r11, [r7, #4]
        str     r0, [sp, #0x2C]
        str     r9, [sp, #0x14]
        add     r12, r7, r4, lsl #3
        str     r12, [sp, #4]
        mov     r1, r8
        mov     r0, r11
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r10
        bl      __subsf3
        str     r0, [sp, #0x30]
        mov     r1, r8
        mov     r0, r11
        bl      __subsf3
        str     r0, [sp, #0x28]
        ldr     r0, [r7, +r4, lsl #3]
        rsb     r8, r4, r4, lsl #2
        str     r0, [sp, #0x24]
        ldr     r12, [r7, +r8, lsl #3]
        add     r10, r7, r8, lsl #3
        str     r10, [sp]
        str     r12, [sp, #0x20]
        ldr     r1, [sp, #0x20]
        add     r12, r6, r4, lsl #2
        str     r12, [sp, #0xC]
        bl      __addsf3
        ldr     r11, [r10, #4]
        ldr     r12, [sp, #4]
        mov     r1, r11
        ldr     r12, [r12, #4]
        str     r0, [sp, #0x18]
        str     r12, [sp, #0x1C]
        ldr     r0, [sp, #0x1C]
        add     r12, r5, r4, lsl #2
        str     r12, [sp, #0x10]
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        mov     r10, r0
        ldr     r0, [sp, #0x24]
        bl      __subsf3
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x1C]
        mov     r1, r11
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x18]
        bl      __addsf3
        str     r0, [r6]
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        str     r0, [r5]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x18]
        bl      __subsf3
        str     r0, [r6, +r4, lsl #3]
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        str     r0, [r5, +r4, lsl #3]
        ldr     r0, [sp, #0x30]
        mov     r1, r11
        add     r9, r5, r4, lsl #3
        bl      __subsf3
        str     r0, [r6, +r4, lsl #2]
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x24]
        bl      __addsf3
        str     r0, [r5, +r4, lsl #2]
        ldr     r0, [sp, #0x30]
        mov     r1, r11
        bl      __addsf3
        str     r0, [r6, +r8, lsl #2]
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x24]
        bl      __subsf3
        str     r0, [r5, +r8, lsl #2]
        add     lr, r6, r8, lsl #2
        cmp     r4, #1
        add     r12, r6, r4, lsl #3
        add     r8, r5, r8, lsl #2
        ble     LCJU1
        ldr     r0, [sp]
        ldr     r1, [sp, #0xC]
        add     r7, r7, #4
        add     r11, r0, #0xC
        ldr     r0, [sp, #8]
        add     r2, r1, #4
        ldr     r1, [sp, #0x10]
        add     r6, r6, #4
        add     r10, r0, #0xC
        ldr     r0, [sp, #4]
        add     r9, r9, #4
        str     r9, [sp, #0x20]
        ldr     r9, [sp, #0x14]
        add     r0, r0, #0xC
        add     r5, r5, #4
        add     r12, r12, #4
        add     r1, r1, #4
        add     lr, lr, #4
        add     r8, r8, #4
        sub     r4, r4, #1
        str     r4, [sp, #0xC]
        str     r8, [sp, #0x10]
        str     lr, [sp, #8]
        str     r1, [sp, #4]
        str     r2, [sp, #0x1C]
        str     r12, [sp, #0x24]
        str     r5, [sp, #0x18]
        str     r6, [sp]
        str     r0, [sp, #0x2C]
        str     r10, [sp, #0x30]
        str     r11, [sp, #0x28]
LCJU0:
        ldr     r5, [r9]
        ldr     r2, [sp, #0x2C]
        ldr     r8, [r9, #4]
        mov     r1, r5
        ldr     r6, [r2, #-4]
        ldr     r4, [r2]
        mov     r0, r6
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r4
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp, #0x34]
        mov     r0, r4
        mov     r1, r5
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r8
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r2, [sp, #0x30]
        ldr     r6, [r9, #8]
        ldr     r10, [r9, #0xC]
        ldr     r8, [r2]
        ldr     r4, [r2, #-4]
        str     r0, [sp, #0x38]
        mov     r0, r4
        mov     r1, r6
        bl      __mulsf3
        mov     r5, r0
        mov     r0, r8
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        mov     r1, r6
        mov     r0, r8
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r4
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r6, [r9, #0x10]
        ldr     r2, [sp, #0x28]
        ldr     r8, [r9, #0x14]
        mov     r10, r0
        mov     r1, r6
        ldr     r11, [r2, #-4]
        ldr     r4, [r2]
        add     r9, r9, #0x18
        mov     r0, r11
        bl      __mulsf3
        str     r0, [sp, #0x3C]
        mov     r0, r4
        mov     r1, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x3C]
        bl      __addsf3
        str     r0, [sp, #0x3C]
        mov     r0, r4
        mov     r1, r6
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r8
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r8, [r7, #4]
        mov     r4, r0
        mov     r1, r5
        mov     r0, r8
        bl      __addsf3
        mov     r6, r0
        mov     r1, r5
        mov     r0, r8
        bl      __subsf3
        ldr     r11, [r7, #8]!
        mov     r8, r0
        mov     r1, r10
        mov     r0, r11
        bl      __addsf3
        mov     r5, r0
        mov     r1, r10
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x3C]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x34]
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        mov     r10, r0
        ldr     r0, [sp, #0x34]
        bl      __subsf3
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x38]
        mov     r1, r4
        bl      __addsf3
        mov     r11, r0
        ldr     r0, [sp, #0x38]
        mov     r1, r4
        bl      __subsf3
        mov     r4, r0
        mov     r1, r10
        mov     r0, r6
        bl      __addsf3
        ldr     r2, [sp]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r5
        bl      __addsf3
        ldr     r2, [sp, #0x18]
        mov     r1, r10
        str     r0, [r2]
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [sp, #0x24]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x20]
        mov     r1, r4
        str     r0, [r2]
        mov     r0, r8
        bl      __subsf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2]
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x3C]
        bl      __addsf3
        ldr     r2, [sp, #4]
        mov     r1, r4
        str     r0, [r2]
        mov     r0, r8
        bl      __addsf3
        ldr     r1, [sp, #8]
        str     r0, [r1]
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x3C]
        bl      __subsf3
        ldr     r1, [sp]
        add     r1, r1, #4
        str     r1, [sp]
        ldr     r1, [sp, #0x18]
        add     r1, r1, #4
        str     r1, [sp, #0x18]
        ldr     r1, [sp, #0x24]
        add     r1, r1, #4
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        add     r1, r1, #4
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x10]
        str     r0, [r1], #4
        ldr     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        subs    r0, r0, #1
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x1C]
        add     r0, r0, #4
        str     r0, [sp, #0x1C]
        ldr     r0, [sp, #4]
        add     r0, r0, #4
        str     r0, [sp, #4]
        ldr     r0, [sp, #8]
        add     r0, r0, #4
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x28]
        add     r0, r0, #8
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x30]
        add     r0, r0, #8
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x2C]
        add     r0, r0, #8
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0xC]
        bne     LCJU0
LCJU1:
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}


