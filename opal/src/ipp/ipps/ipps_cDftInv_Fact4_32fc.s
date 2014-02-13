        .text
        .align  4
        .globl  _ipps_cDftInv_Fact4_32fc


_ipps_cDftInv_Fact4_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        ldr     r12, [sp, #0x94]
        cmp     r3, #0
        mov     r10, r0
        mov     r9, r1
        mov     r8, r2
        ble     LCLD3
        add     r12, r12, #0x18
        mov     lr, r8, lsl #1
        rsb     r11, r8, r8, lsl #2
        str     lr, [sp, #0x38]
        str     r12, [sp, #0x34]
        str     r3, [sp, #0x2C]
LCLD0:
        ldr     r3, [sp, #0x34]
        ldr     r5, [r10, +r8, lsl #4]
        ldr     r6, [r10]
        str     r3, [sp, #0x24]
        add     r3, r10, r8, lsl #3
        str     r3, [sp, #0xC]
        mov     r0, r6
        mov     r1, r5
        bl      __addsf3
        str     r0, [sp, #0x5C]
        ldr     r7, [r10, #4]
        add     r3, r10, r8, lsl #4
        str     r3, [sp, #0x14]
        ldr     r4, [r3, #4]
        add     r3, r10, r11, lsl #3
        str     r3, [sp, #8]
        add     r3, r9, r8, lsl #3
        mov     r0, r7
        str     r3, [sp, #0x10]
        mov     r1, r4
        bl      __addsf3
        str     r0, [sp, #0x58]
        mov     r0, r6
        mov     r1, r5
        bl      __subsf3
        str     r0, [sp, #0x54]
        mov     r0, r7
        mov     r1, r4
        bl      __subsf3
        ldr     r3, [r10, +r8, lsl #3]
        str     r3, [sp, #0x50]
        ldr     r4, [r10, +r11, lsl #3]
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x50]
        add     r3, r9, r8, lsl #4
        str     r3, [sp, #4]
        mov     r1, r4
        bl      __addsf3
        ldr     r3, [sp, #0xC]
        mov     r5, r0
        ldr     r6, [r3, #4]
        ldr     r3, [sp, #8]
        ldr     r7, [r3, #4]
        add     r3, r9, r11, lsl #3
        str     r3, [sp]
        mov     r0, r6
        mov     r1, r7
        bl      __addsf3
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x50]
        mov     r1, r4
        bl      __subsf3
        mov     r4, r0
        mov     r1, r7
        mov     r0, r6
        bl      __subsf3
        mov     r6, r0
        ldr     r0, [sp, #0x5C]
        mov     r1, r5
        bl      __addsf3
        str     r0, [r9]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x58]
        bl      __addsf3
        str     r0, [r9, #4]
        ldr     r0, [sp, #0x5C]
        mov     r1, r5
        bl      __subsf3
        str     r0, [r9, +r8, lsl #4]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x58]
        bl      __subsf3
        ldr     r3, [sp, #4]
        mov     r1, r6
        str     r0, [r3, #4]
        ldr     r0, [sp, #0x54]
        bl      __subsf3
        str     r0, [r9, +r8, lsl #3]
        ldr     r0, [sp, #0x4C]
        mov     r1, r4
        bl      __addsf3
        ldr     r3, [sp, #0x10]
        mov     r1, r6
        str     r0, [r3, #4]
        ldr     r0, [sp, #0x54]
        bl      __addsf3
        str     r0, [r9, +r11, lsl #3]
        ldr     r0, [sp, #0x4C]
        mov     r1, r4
        bl      __subsf3
        ldr     r3, [sp]
        str     r0, [r3, #4]
        ldr     r3, [sp, #0x38]
        cmp     r3, #2
        ble     LCLD2
        mov     r3, #2
        str     r3, [sp, #0x1C]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp]
        add     r0, r10, #0xC
        add     r12, r3, #0xC
        add     r3, r3, #8
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #0x14]
        str     r12, [sp, #0x20]
        add     r7, r9, #0xC
        add     r12, r3, #0xC
        add     r4, r3, #8
        ldr     r3, [sp, #8]
        str     r12, [sp, #0x18]
        add     r1, r2, #8
        add     r12, r3, #0xC
        add     lr, r3, #8
        ldr     r3, [sp, #4]
        str     r12, [sp, #0x14]
        add     r2, r2, #0xC
        add     r6, r3, #8
        add     r12, r3, #0xC
        ldr     r3, [sp, #0x10]
        str     r6, [sp, #0x5C]
        str     r7, [sp, #0x4C]
        ldr     r7, [sp, #0x1C]
        ldr     r6, [sp, #0x24]
        add     r5, r3, #8
        add     r3, r3, #0xC
        str     r2, [sp, #0x10]
        str     r1, [sp, #8]
        str     r3, [sp, #4]
        str     r5, [sp, #0x54]
        str     r12, [sp, #0x58]
        str     r0, [sp, #0x48]
        str     lr, [sp, #0x44]
        str     r4, [sp, #0x50]
        str     r11, [sp, #0x30]
        str     r8, [sp, #0x28]
        str     r9, [sp, #0x3C]
        str     r10, [sp, #0x40]
LCLD1:
        ldr     r0, [sp, #0x20]
        ldr     r2, [sp, #0xC]
        ldr     r8, [r6]
        ldr     r4, [r0]
        ldr     r9, [r6, #4]
        ldr     r5, [r2]
        mov     r1, r8
        mov     r0, r5
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r9
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp]
        mov     r0, r4
        mov     r1, r8
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r2, [sp, #0x50]
        ldr     r10, [r6, #0xC]
        ldr     r9, [r6, #8]
        ldr     r5, [r2]
        ldr     r2, [sp, #0x18]
        mov     r1, r9
        ldr     r4, [r2]
        str     r0, [sp, #0x60]
        mov     r0, r5
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r4
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r8, r0
        mov     r0, r4
        mov     r1, r9
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r10
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r2, [sp, #0x44]
        ldr     r10, [r6, #0x10]
        ldr     r11, [r6, #0x14]
        ldr     r5, [r2]
        ldr     r2, [sp, #0x14]
        mov     r1, r10
        mov     r9, r0
        ldr     r4, [r2]
        mov     r0, r5
        bl      __mulsf3
        str     r0, [sp, #0x64]
        mov     r1, r11
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x64]
        bl      __addsf3
        str     r0, [sp, #0x64]
        mov     r0, r4
        mov     r1, r10
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r2, [sp, #0x40]
        mov     r4, r0
        mov     r1, r8
        ldr     r11, [r2, +r7, lsl #2]
        ldr     r2, [sp, #0x20]
        add     r6, r6, #0x18
        add     r2, r2, #8
        str     r2, [sp, #0x20]
        mov     r0, r11
        bl      __addsf3
        ldr     r2, [sp, #0x48]
        mov     r1, r9
        ldr     r10, [r2]
        ldr     r2, [sp, #0xC]
        str     r0, [sp, #0x68]
        add     r2, r2, #8
        str     r2, [sp, #0xC]
        mov     r0, r10
        bl      __addsf3
        mov     r5, r0
        mov     r1, r8
        mov     r0, r11
        bl      __subsf3
        str     r0, [sp, #0x6C]
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        mov     r10, r0
        ldr     r1, [sp, #0x64]
        ldr     r0, [sp]
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x60]
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x64]
        mov     r8, r0
        ldr     r0, [sp]
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x60]
        mov     r1, r4
        bl      __subsf3
        mov     r4, r0
        ldr     r0, [sp, #0x68]
        mov     r1, r9
        bl      __addsf3
        ldr     r2, [sp, #0x3C]
        mov     r1, r8
        str     r0, [r2, +r7, lsl #2]
        mov     r0, r5
        bl      __addsf3
        ldr     r2, [sp, #0x4C]
        mov     r1, r9
        str     r0, [r2]
        ldr     r0, [sp, #0x68]
        add     r7, r7, #2
        bl      __subsf3
        ldr     r2, [sp, #0x5C]
        mov     r1, r8
        str     r0, [r2]
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp, #0x58]
        mov     r1, r4
        str     r0, [r2]
        ldr     r0, [sp, #0x6C]
        bl      __subsf3
        ldr     r2, [sp, #0x54]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r10
        bl      __addsf3
        ldr     r2, [sp, #4]
        mov     r1, r4
        str     r0, [r2]
        ldr     r0, [sp, #0x6C]
        bl      __addsf3
        ldr     r2, [sp, #8]
        mov     r1, r11
        str     r0, [r2]
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x10]
        str     r0, [r1]
        ldr     r0, [sp, #0x38]
        cmp     r7, r0
        ldr     r0, [sp, #0x18]
        add     r0, r0, #8
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x50]
        add     r0, r0, #8
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #8
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #0x44]
        add     r0, r0, #8
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x48]
        add     r0, r0, #8
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #8
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x5C]
        add     r0, r0, #8
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x58]
        add     r0, r0, #8
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x54]
        add     r0, r0, #8
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #4]
        add     r0, r0, #8
        str     r0, [sp, #4]
        ldr     r0, [sp, #8]
        add     r0, r0, #8
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #8
        str     r0, [sp, #0x10]
        blt     LCLD1
        ldr     r11, [sp, #0x30]
        ldr     r8, [sp, #0x28]
        ldr     r9, [sp, #0x3C]
        ldr     r10, [sp, #0x40]
LCLD2:
        ldr     r3, [sp, #0x2C]
        add     r10, r10, r8, lsl #5
        add     r9, r9, r8, lsl #5
        subs    r3, r3, #1
        str     r3, [sp, #0x2C]
        bne     LCLD0
LCLD3:
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}


