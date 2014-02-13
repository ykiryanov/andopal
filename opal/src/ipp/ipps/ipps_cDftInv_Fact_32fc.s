        .text
        .align  4
        .globl  _ipps_cDftInv_Fact_32fc


_ipps_cDftInv_Fact_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x6C
        ldr     r6, [sp, #0x90]
        ldr     r12, [sp, #0x94]
        ldr     r5, [sp, #0x98]
        mov     r4, r3
        add     lr, r2, #1
        cmp     r4, #0
        mov     lr, lr, asr #1
        ble     LCLB9
        ldr     r8, [pc, #0x590]
        rsb     r7, r4, #0
        mla     r7, r2, r4, r7
        ldr     r9, [r8]
        add     r11, r5, #8
        sub     r10, r2, #1
        mov     r8, #0
        str     r10, [sp, #0x60]
        str     r9, [sp, #0x5C]
        str     r11, [sp, #0x58]
        str     r7, [sp, #0x54]
        str     r5, [sp, #0x50]
        str     r6, [sp, #0x4C]
        str     r2, [sp, #0x48]
LCLB0:
        ldr     r5, [sp, #0x54]
        ldr     r9, [r0]
        ldr     r2, [r0, #4]
        add     r6, r0, r5, lsl #3
        str     r6, [sp, #0x30]
        add     r6, r1, r4, lsl #3
        str     r6, [sp, #0x44]
        cmp     r8, #0
        add     r7, r0, r4, lsl #3
        add     r5, r1, r5, lsl #3
        mov     r6, r9
        mov     r10, r2
        bne     LCLB2
        cmp     lr, #1
        ble     LCLB10
        ldr     r11, [sp, #0x50]
        str     r10, [sp, #4]
        str     r2, [sp, #0x18]
        sub     r3, r11, #4
        sub     r11, r11, #0xC
        str     r11, [sp, #0x38]
        sub     r11, lr, #1
        str     r3, [sp, #0x34]
        str     r11, [sp, #0x14]
        str     r9, [sp, #0x1C]
        ldr     r9, [sp, #0x38]
        ldr     r10, [sp, #0x34]
        ldr     r11, [sp, #0x30]
        str     r5, [sp, #0x20]
        str     r8, [sp, #0x24]
        str     lr, [sp, #0xC]
        str     r12, [sp, #0x10]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
LCLB1:
        ldr     r0, [r7]
        ldr     r1, [r11]
        bl      __addsf3
        ldr     r1, [r7, #4]
        ldr     r2, [r11, #4]
        mov     r8, r0
        mov     r0, r1
        mov     r1, r2
        bl      __addsf3
        mov     r5, r0
        mov     r0, r6
        mov     r1, r8
        bl      __addsf3
        mov     r6, r0
        ldr     r0, [sp, #4]
        mov     r1, r5
        bl      __addsf3
        str     r8, [r9, #0xC]
        str     r5, [r9, #0x10]!
        ldr     r1, [r7]
        ldr     r2, [r11]
        str     r0, [sp, #4]
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        str     r0, [r10, #0xC]
        ldr     r0, [r7, #4]
        ldr     r1, [r11, #4]
        add     r7, r7, r4, lsl #3
        bl      __subsf3
        str     r0, [r10, #0x10]!
        ldr     r1, [sp, #0x14]
        sub     r11, r11, r4, lsl #3
        subs    r1, r1, #1
        str     r1, [sp, #0x14]
        bne     LCLB1
        ldr     r7, [sp, #0x48]
        ldr     r12, [sp, #0x10]
        ldr     r10, [sp, #4]
        ldr     r2, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r8, [sp, #0x24]
        ldr     lr, [sp, #0xC]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
        add     r7, r12, r7, lsl #3
        str     r7, [sp, #0x14]
        b       LCLB4
LCLB2:
        cmp     lr, #1
        ble     LCLB11
        mov     r11, #1
        str     r11, [sp, #0x38]
        ldr     r11, [sp, #0x48]
        str     r10, [sp, #4]
        str     r6, [sp]
        add     r11, r12, r11, lsl #3
        str     r11, [sp, #0x14]
        ldr     r11, [sp, #0x50]
        ldr     r6, [sp, #0x38]
        str     r2, [sp, #0x18]
        sub     r3, r11, #4
        sub     r11, r11, #0xC
        str     r5, [sp, #0x20]
        ldr     r5, [sp, #0x30]
        str     r11, [sp, #0x40]
        add     r11, r12, #4
        str     r3, [sp, #0x3C]
        str     r11, [sp, #0x34]
        str     r9, [sp, #0x1C]
        str     r8, [sp, #0x24]
        str     lr, [sp, #0xC]
        str     r12, [sp, #0x10]
        str     r4, [sp, #8]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
LCLB3:
        ldr     r1, [sp, #0x34]
        ldr     r2, [sp, #0x10]
        ldr     r11, [r7]
        ldr     r8, [r1, #8]
        ldr     r10, [r7, #4]
        ldr     r4, [r2, +r6, lsl #3]
        mov     r0, r11
        mov     r1, r4
        bl      __mulsf3
        mov     r9, r0
        mov     r0, r10
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x64]
        mov     r1, r4
        mov     r0, r10
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r8
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        rsb     r8, r6, #0
        bl      __subsf3
        ldr     r2, [sp, #0x14]
        ldr     r9, [r5, #4]
        ldr     r11, [r5]
        ldr     r10, [r2, +r8, lsl #3]
        add     r8, r2, r8, lsl #3
        ldr     r8, [r8, #4]
        mov     r4, r0
        mov     r1, r10
        mov     r0, r11
        bl      __mulsf3
        str     r0, [sp, #0x68]
        mov     r1, r8
        mov     r0, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x68]
        bl      __addsf3
        str     r0, [sp, #0x68]
        mov     r1, r10
        mov     r0, r9
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r8
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [sp, #0x68]
        mov     r8, r0
        ldr     r0, [sp, #0x64]
        add     r6, r6, #1
        bl      __addsf3
        mov     r10, r0
        mov     r1, r8
        mov     r0, r4
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp]
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp]
        ldr     r0, [sp, #4]
        mov     r1, r9
        bl      __addsf3
        ldr     r2, [sp, #0x40]
        str     r0, [sp, #4]
        str     r10, [r2, #0xC]
        str     r9, [r2, #0x10]
        ldr     r0, [sp, #0x64]
        ldr     r1, [sp, #0x68]
        bl      __subsf3
        ldr     r2, [sp, #0x3C]
        mov     r1, r8
        str     r0, [r2, #0xC]
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x3C]
        str     r0, [r1, #0x10]
        ldr     r0, [sp, #0xC]
        cmp     r6, r0
        ldr     r0, [sp, #8]
        add     r7, r7, r0, lsl #3
        sub     r5, r5, r0, lsl #3
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x10
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #8
        str     r0, [sp, #0x34]
        blt     LCLB3
        ldr     r10, [sp, #4]
        ldr     r6, [sp]
        ldr     r2, [sp, #0x18]
        ldr     r9, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r8, [sp, #0x24]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
LCLB4:
        cmp     lr, #1
        str     r6, [r1]
        str     r10, [r1, #4]
        ble     LCLB8
        ldr     r11, [sp, #0x44]
        mov     r7, #1
        str     r2, [sp, #0x18]
        str     r9, [sp, #0x1C]
        str     r8, [sp, #0x24]
        str     lr, [sp, #0xC]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
LCLB5:
        ldr     r8, [sp, #0x5C]
        ldr     r0, [sp, #0x60]
        ldr     r10, [sp, #0x1C]
        ldr     r9, [sp, #0x18]
        cmp     r0, #0
        mov     r6, r8
        mov     r1, r7
        ble     LCLB7
        ldr     r2, [sp, #0x58]
        ldr     r3, [sp, #0x50]
        str     r4, [sp, #8]
        ldr     r4, [sp, #0x48]
        mov     r0, #0
        str     r8, [sp, #0x3C]
        str     r9, [sp, #0x38]
        str     r10, [sp, #0x34]
        str     r11, [sp, #0x44]
        str     r7, [sp, #0x40]
        str     r5, [sp, #0x20]
        mov     r10, r0
        mov     r11, r1
        mov     r9, r2
        mov     r8, r3
LCLB6:
        ldr     r12, [sp, #0x4C]
        ldr     r0, [r8]
        ldr     r5, [r12, +r11, lsl #3]
        add     r7, r12, r11, lsl #3
        ldr     r12, [sp, #0x40]
        mov     r1, r5
        add     r11, r12, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        ldr     r2, [r8, #4]
        str     r0, [sp, #0x34]
        mov     r1, r5
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x38]
        bl      __addsf3
        ldr     r1, [r9, #4]
        ldr     r7, [r7, #4]
        str     r0, [sp, #0x38]
        mov     r0, r1
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [r9], #0x10
        mov     r6, r0
        mov     r1, r7
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x3C]
        bl      __addsf3
        cmp     r11, r4
        str     r0, [sp, #0x3C]
        subge   r11, r11, r4
        ldr     r12, [sp, #0x60]
        add     r10, r10, #2
        add     r8, r8, #0x10
        cmp     r10, r12
        blt     LCLB6
        ldr     r8, [sp, #0x3C]
        ldr     r9, [sp, #0x38]
        ldr     r10, [sp, #0x34]
        ldr     r7, [sp, #0x40]
        ldr     r5, [sp, #0x20]
        ldr     r11, [sp, #0x44]
        ldr     r4, [sp, #8]
LCLB7:
        mov     r0, r10
        mov     r1, r6
        bl      __addsf3
        str     r0, [r11]
        mov     r0, r9
        mov     r1, r8
        bl      __subsf3
        str     r0, [r11, #4]
        mov     r0, r10
        mov     r1, r6
        bl      __subsf3
        str     r0, [r5]
        mov     r0, r9
        mov     r1, r8
        bl      __addsf3
        str     r0, [r5, #4]
        ldr     r0, [sp, #0xC]
        add     r7, r7, #1
        add     r11, r11, r4, lsl #3
        cmp     r7, r0
        sub     r5, r5, r4, lsl #3
        blt     LCLB5
        ldr     r8, [sp, #0x24]
        ldr     lr, [sp, #0xC]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
LCLB8:
        ldr     r12, [sp, #0x14]
        add     r8, r8, #1
        cmp     r8, r4
        add     r0, r0, #8
        add     r1, r1, #8
        blt     LCLB0
LCLB9:
        add     sp, sp, #0x6C
        ldmia   sp!, {r4 - r11, pc}
LCLB10:
        ldr     r7, [sp, #0x48]
        add     r7, r12, r7, lsl #3
        str     r7, [sp, #0x14]
        b       LCLB4
LCLB11:
        ldr     r7, [sp, #0x48]
        add     r7, r12, r7, lsl #3
        str     r7, [sp, #0x14]
        b       LCLB4
        .long   LCLB__2il0floatpacket.1


        .data
        .align  4


LCLB__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


