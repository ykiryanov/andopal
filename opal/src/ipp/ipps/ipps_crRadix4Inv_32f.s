        .text
        .align  4
        .globl  _ipps_crRadix4Inv_32f


_ipps_crRadix4Inv_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        mov     r6, r2, asr #2
        cmp     r6, #1
        add     r12, r2, r2, lsl #1
        mov     r5, r0
        mov     r4, r1
        blt     LBYV1
        str     r12, [sp, #8]
        str     r3, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LBYV0:
        ldr     r8, [r5, #4]
        ldr     r7, [r5]
        mov     r0, r8
        mov     r1, r7
        bl      __addsf3
        mov     r9, r0
        mov     r0, r7
        mov     r1, r8
        bl      __subsf3
        ldr     r11, [r5, #0xC]
        ldr     r7, [r5, #8]
        mov     r8, r0
        mov     r0, r7
        mov     r1, r11
        bl      __addsf3
        mov     r10, r0
        mov     r0, r7
        mov     r1, r11
        bl      __subsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r9
        bl      __addsf3
        str     r0, [r5]
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        str     r0, [r5, #8]
        ldr     r10, [r4, #8]
        ldr     r11, [r4, #0xC]
        mov     r0, r10
        mov     r1, r11
        bl      __addsf3
        mov     r9, r0
        mov     r0, r10
        mov     r1, r11
        bl      __subsf3
        mov     r10, r0
        mov     r1, r10
        mov     r0, r8
        bl      __subsf3
        str     r0, [r5, #4]
        mov     r0, r8
        mov     r1, r10
        bl      __addsf3
        str     r0, [r5, #0xC]
        ldr     r8, [r4, #4]
        ldr     r11, [r4]
        add     r5, r5, #0x10
        mov     r0, r8
        mov     r1, r11
        bl      __addsf3
        mov     r10, r0
        mov     r1, r8
        mov     r0, r11
        bl      __subsf3
        mov     r8, r0
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        str     r0, [r4, #8]
        mov     r0, r7
        mov     r1, r8
        bl      __addsf3
        str     r0, [r4, #4]
        mov     r0, r8
        mov     r1, r7
        bl      __subsf3
        str     r0, [r4, #0xC]
        subs    r6, r6, #1
        add     r4, r4, #0x10
        bne     LBYV0
        ldr     r12, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LBYV1:
        movs    lr, r2, asr #4
        mov     r11, r12, asr #2
        mov     r10, r2, asr #3
        moveq   r4, #4
        beq     LBYV13
        cmp     lr, #1
        mov     r8, r12, asr #3
        mov     r7, r0
        mov     r6, r1
        blt     LBYV3
        add     r5, r3, r8, lsl #2
        add     r4, r5, r8, lsl #2
        str     r8, [sp, #0x1C]
        str     lr, [sp, #4]
        str     r12, [sp, #8]
        str     r3, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LBYV2:
        ldr     r10, [r7, #0x10]
        ldr     r11, [r7]
        ldr     r2, [sp, #0x1C]
        mov     r0, r10
        add     r8, r4, r2, lsl #2
        mov     r1, r11
        bl      __addsf3
        mov     r9, r0
        mov     r1, r10
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [r7, #0x20]
        str     r1, [sp, #0x44]
        ldr     r11, [r7, #0x30]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        mov     r1, r11
        bl      __addsf3
        mov     r10, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r11
        bl      __subsf3
        str     r0, [sp, #0x44]
        mov     r1, r10
        mov     r0, r9
        bl      __addsf3
        str     r0, [r7]
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        str     r0, [r7, #0x20]
        ldr     r11, [r6, #0x30]
        ldr     r10, [r6, #0x20]
        mov     r1, r11
        mov     r0, r10
        bl      __addsf3
        mov     r9, r0
        mov     r1, r11
        mov     r0, r10
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x40]
        mov     r1, r10
        bl      __subsf3
        str     r0, [r7, #0x10]
        ldr     r0, [sp, #0x40]
        mov     r1, r10
        bl      __addsf3
        str     r0, [r7, #0x30]
        ldr     r11, [r6, #0x10]
        ldr     r1, [r6]
        mov     r0, r11
        str     r1, [sp, #0x40]
        bl      __addsf3
        mov     r10, r0
        ldr     r0, [sp, #0x40]
        mov     r1, r11
        bl      __subsf3
        mov     r11, r0
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        str     r0, [r6]
        mov     r1, r9
        mov     r0, r10
        bl      __subsf3
        str     r0, [r6, #0x20]
        ldr     r0, [sp, #0x44]
        mov     r1, r11
        bl      __addsf3
        str     r0, [r6, #0x10]
        ldr     r1, [sp, #0x44]
        mov     r0, r11
        bl      __subsf3
        str     r0, [r6, #0x30]
        ldr     r11, [r5, #4]
        ldr     r0, [r7, #0x24]
        ldr     r2, [sp, #0xC]
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x1C]
        ldr     r0, [r2, +r0, lsl #2]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        ldr     r10, [r6, #0x24]
        ldr     r1, [sp, #0x40]
        bl      __mulsf3
        mov     r9, r0
        mov     r0, r10
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x40]
        mov     r9, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r11, [r7, #0x14]
        ldr     r1, [r5, #8]
        str     r0, [sp, #0x44]
        mov     r0, r11
        bl      __mulsf3
        ldr     r2, [r6, #0x14]
        ldr     r1, [r5, #0xC]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [r7, #0x34]
        str     r2, [sp, #0x40]
        ldr     r1, [r5, #0x10]
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        bl      __mulsf3
        ldr     r2, [r6, #0x34]
        ldr     r1, [r5, #0x14]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp, #0x38]
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        mov     r10, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r2, [r7, #4]
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x3C]
        str     r2, [sp, #0x38]
        ldr     r1, [sp, #0x38]
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        bl      __subsf3
        str     r0, [sp, #0x3C]
        mov     r1, r10
        mov     r0, r9
        bl      __addsf3
        str     r0, [r7, #4]
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        str     r0, [r7, #0x24]
        ldr     r0, [r6, #0x14]
        ldr     r1, [r5, #8]
        bl      __mulsf3
        ldr     r1, [r5, #0xC]
        mov     r9, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r2, [r6, #0x34]
        ldr     r1, [r5, #0x10]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r5, #0x14]
        mov     r9, r0
        ldr     r0, [sp, #0x40]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [sp, #0x44]
        mov     r9, r0
        bl      __addsf3
        mov     r11, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r9
        bl      __subsf3
        ldr     r2, [r6, #4]
        str     r0, [sp, #0x40]
        str     r2, [sp, #0x44]
        ldr     r1, [sp, #0x44]
        mov     r0, r10
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r10
        bl      __subsf3
        mov     r10, r0
        ldr     r1, [sp, #0x40]
        ldr     r0, [sp, #0x3C]
        bl      __subsf3
        str     r0, [r7, #0x14]
        ldr     r1, [sp, #0x40]
        ldr     r0, [sp, #0x3C]
        bl      __addsf3
        str     r0, [r7, #0x34]
        mov     r0, r11
        mov     r1, r9
        bl      __addsf3
        str     r0, [r6, #4]
        mov     r1, r11
        mov     r0, r9
        bl      __subsf3
        str     r0, [r6, #0x24]
        ldr     r0, [sp, #0x34]
        mov     r1, r10
        bl      __addsf3
        str     r0, [r6, #0x14]
        ldr     r1, [sp, #0x34]
        mov     r0, r10
        bl      __subsf3
        str     r0, [r6, #0x34]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [r5, +r0, lsl #2]
        str     r1, [sp, #0x44]
        ldr     r0, [r7, #0x28]
        str     r0, [sp, #0x40]
        ldr     r11, [r6, #0x28]
        ldr     r10, [r4, #4]
        bl      __mulsf3
        mov     r9, r0
        mov     r0, r11
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x44]
        mov     r9, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [sp, #0x40]
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        str     r0, [sp, #0x44]
        ldr     r11, [r7, #0x18]
        ldr     r1, [r4, #8]
        mov     r0, r11
        bl      __mulsf3
        ldr     r2, [r6, #0x18]
        ldr     r1, [r4, #0xC]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [r7, #0x38]
        str     r2, [sp, #0x40]
        ldr     r1, [r4, #0x10]
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        bl      __mulsf3
        ldr     r2, [r6, #0x38]
        ldr     r1, [r4, #0x14]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp, #0x38]
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        mov     r10, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r2, [r7, #8]
        str     r0, [sp, #0x34]
        ldr     r0, [sp, #0x3C]
        str     r2, [sp, #0x38]
        ldr     r1, [sp, #0x38]
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        mov     r9, r0
        ldr     r0, [sp, #0x38]
        bl      __subsf3
        str     r0, [sp, #0x3C]
        mov     r1, r10
        mov     r0, r9
        bl      __addsf3
        str     r0, [r7, #8]
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        str     r0, [r7, #0x28]
        ldr     r0, [r6, #0x18]
        ldr     r1, [r4, #8]
        bl      __mulsf3
        ldr     r1, [r4, #0xC]
        mov     r9, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r2, [r6, #0x38]
        ldr     r1, [r4, #0x10]
        mov     r9, r0
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r4, #0x14]
        mov     r10, r0
        ldr     r0, [sp, #0x40]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x44]
        mov     r11, r0
        bl      __addsf3
        mov     r10, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r11
        bl      __subsf3
        ldr     r11, [r6, #8]
        str     r0, [sp, #0x44]
        mov     r0, r9
        mov     r1, r11
        bl      __addsf3
        str     r0, [sp, #0x40]
        mov     r1, r9
        mov     r0, r11
        bl      __subsf3
        mov     r9, r0
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x44]
        bl      __subsf3
        str     r0, [r7, #0x18]
        ldr     r0, [sp, #0x3C]
        ldr     r1, [sp, #0x44]
        bl      __addsf3
        str     r0, [r7, #0x38]
        ldr     r1, [sp, #0x40]
        mov     r0, r10
        bl      __addsf3
        str     r0, [r6, #8]
        ldr     r0, [sp, #0x40]
        mov     r1, r10
        bl      __subsf3
        str     r0, [r6, #0x28]
        ldr     r0, [sp, #0x34]
        mov     r1, r9
        bl      __addsf3
        str     r0, [r6, #0x18]
        ldr     r1, [sp, #0x34]
        mov     r0, r9
        bl      __subsf3
        str     r0, [r6, #0x38]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [r4, +r0, lsl #2]
        str     r1, [sp, #0x44]
        ldr     r0, [r7, #0x2C]
        str     r0, [sp, #0x40]
        ldr     r10, [r6, #0x2C]
        ldr     r11, [r8, #4]
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r11
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x44]
        mov     r9, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x40]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        str     r0, [sp, #0x44]
        ldr     r11, [r7, #0x1C]
        ldr     r1, [r8, #8]
        mov     r0, r11
        bl      __mulsf3
        ldr     r2, [r6, #0x1C]
        ldr     r1, [r8, #0xC]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [r7, #0x3C]
        str     r2, [sp, #0x40]
        ldr     r1, [r8, #0x10]
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        bl      __mulsf3
        ldr     r1, [r8, #0x14]
        ldr     r2, [r6, #0x3C]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp, #0x38]
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        mov     r10, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r9, [r7, #0xC]
        str     r0, [sp, #0x38]
        ldr     r0, [sp, #0x3C]
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x3C]
        str     r0, [sp, #0x34]
        mov     r0, r9
        bl      __subsf3
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x34]
        mov     r1, r10
        bl      __addsf3
        str     r0, [r7, #0xC]
        ldr     r0, [sp, #0x34]
        mov     r1, r10
        bl      __subsf3
        str     r0, [r7, #0x2C]
        ldr     r1, [r8, #8]
        ldr     r0, [r6, #0x1C]
        bl      __mulsf3
        ldr     r1, [r8, #0xC]
        mov     r9, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [r8, #0x10]
        ldr     r2, [r6, #0x3C]
        str     r0, [sp, #0x34]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r8, #0x14]
        mov     r8, r0
        ldr     r0, [sp, #0x40]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r1, [sp, #0x44]
        mov     r9, r0
        bl      __addsf3
        mov     r8, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r9
        bl      __subsf3
        ldr     r11, [r6, #0xC]
        mov     r9, r0
        ldr     r0, [sp, #0x34]
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x34]
        mov     r10, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x3C]
        mov     r1, r9
        bl      __subsf3
        str     r0, [r7, #0x1C]
        ldr     r0, [sp, #0x3C]
        mov     r1, r9
        bl      __addsf3
        str     r0, [r7, #0x3C]
        mov     r0, r8
        mov     r1, r10
        bl      __addsf3
        str     r0, [r6, #0xC]
        mov     r0, r10
        mov     r1, r8
        bl      __subsf3
        str     r0, [r6, #0x2C]
        ldr     r0, [sp, #0x38]
        mov     r1, r11
        add     r7, r7, #0x40
        bl      __addsf3
        str     r0, [r6, #0x1C]
        ldr     r1, [sp, #0x38]
        mov     r0, r11
        bl      __subsf3
        str     r0, [r6, #0x3C]
        ldr     r0, [sp, #4]
        add     r6, r6, #0x40
        subs    r0, r0, #1
        str     r0, [sp, #4]
        bne     LBYV2
        ldr     r12, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LBYV3:
        movs    lr, r2, asr #6
        mov     r11, r12, asr #4
        mov     r10, r2, asr #5
        moveq   r4, #0x10
        beq     LBYV13
        cmp     lr, #1
        mov     r6, r12, asr #5
        mov     r5, r0
        mov     r4, r1
        blt     LBYV6
        str     r6, [sp, #0x3C]
        str     lr, [sp, #0x40]
        str     r12, [sp, #8]
        str     r3, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LBYV4:
        ldr     r6, [r5]
        ldr     r7, [r5, #0x40]
        ldr     r9, [sp, #0xC]
        mov     r1, r6
        mov     r2, #0xF
        str     r2, [sp, #0x44]
        mov     r0, r7
        bl      __addsf3
        mov     r8, r0
        mov     r0, r6
        mov     r1, r7
        bl      __subsf3
        ldr     r6, [r5, #0xC0]
        ldr     r11, [r5, #0x80]
        mov     r7, r0
        mov     r1, r6
        mov     r0, r11
        bl      __addsf3
        mov     r10, r0
        mov     r1, r6
        mov     r0, r11
        bl      __subsf3
        mov     r6, r0
        mov     r1, r10
        mov     r0, r8
        bl      __addsf3
        str     r0, [r5]
        mov     r0, r8
        mov     r1, r10
        bl      __subsf3
        str     r0, [r5, #0x80]
        ldr     r10, [r4, #0xC0]
        ldr     r11, [r4, #0x80]
        mov     r1, r10
        mov     r0, r11
        bl      __addsf3
        mov     r8, r0
        mov     r0, r11
        mov     r1, r10
        bl      __subsf3
        mov     r10, r0
        mov     r0, r7
        mov     r1, r10
        bl      __subsf3
        str     r0, [r5, #0x40]
        mov     r0, r7
        mov     r1, r10
        bl      __addsf3
        str     r0, [r5, #0xC0]
        ldr     r7, [r4, #0x40]
        ldr     r11, [r4]
        mov     r0, r7
        mov     r1, r11
        bl      __addsf3
        mov     r10, r0
        mov     r1, r7
        mov     r0, r11
        bl      __subsf3
        mov     r7, r0
        mov     r0, r8
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r10
        mov     r1, r8
        bl      __subsf3
        str     r0, [r4, #0x80]
        mov     r0, r6
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #0x40]
        mov     r0, r7
        mov     r1, r6
        bl      __subsf3
        str     r0, [r4, #0xC0]
LBYV5:
        ldr     r0, [sp, #0x3C]
        add     r5, r5, #4
        ldr     r10, [r5, #0x80]
        add     r9, r9, r0, lsl #2
        ldr     r11, [r9]
        ldr     r8, [r9, #4]
        add     r4, r4, #4
        ldr     r6, [r4, #0x80]
        mov     r0, r10
        mov     r1, r11
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r6
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        mov     r1, r11
        mov     r0, r6
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r8
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r11, [r5, #0x40]
        ldr     r1, [r9, #8]
        mov     r6, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r8, r0
        ldr     r1, [r9, #0xC]
        ldr     r0, [r4, #0x40]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [sp, #0x38]
        ldr     r1, [r9, #0x10]
        ldr     r8, [r5, #0xC0]
        mov     r0, r8
        bl      __mulsf3
        ldr     r2, [r9, #0x14]
        ldr     r1, [r4, #0xC0]
        mov     r10, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp, #0x34]
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [sp, #0x34]
        mov     r10, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r2, [r5]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x38]
        str     r2, [sp, #0x34]
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        mov     r7, r0
        ldr     r1, [sp, #0x38]
        ldr     r0, [sp, #0x34]
        bl      __subsf3
        str     r0, [sp, #0x38]
        mov     r0, r7
        mov     r1, r10
        bl      __addsf3
        str     r0, [r5]
        mov     r1, r10
        mov     r0, r7
        bl      __subsf3
        str     r0, [r5, #0x80]
        ldr     r1, [r9, #8]
        ldr     r0, [r4, #0x40]
        bl      __mulsf3
        ldr     r1, [r9, #0xC]
        mov     r7, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r1, [r9, #0x10]
        ldr     r2, [r4, #0xC0]
        mov     r7, r0
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r9, #0x14]
        mov     r10, r0
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        mov     r10, r0
        mov     r1, r6
        bl      __addsf3
        mov     r8, r0
        mov     r0, r6
        mov     r1, r10
        bl      __subsf3
        ldr     r11, [r4]
        mov     r6, r0
        mov     r1, r7
        mov     r0, r11
        bl      __addsf3
        mov     r10, r0
        mov     r1, r7
        mov     r0, r11
        bl      __subsf3
        mov     r7, r0
        ldr     r0, [sp, #0x38]
        mov     r1, r6
        bl      __subsf3
        str     r0, [r5, #0x40]
        ldr     r0, [sp, #0x38]
        mov     r1, r6
        bl      __addsf3
        str     r0, [r5, #0xC0]
        mov     r0, r8
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r10
        mov     r1, r8
        bl      __subsf3
        str     r0, [r4, #0x80]
        ldr     r0, [sp, #0x30]
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #0x40]
        ldr     r1, [sp, #0x30]
        mov     r0, r7
        bl      __subsf3
        ldr     r1, [sp, #0x44]
        subs    r1, r1, #1
        str     r1, [sp, #0x44]
        str     r0, [r4, #0xC0]
        ldr     r0, [sp, #0x44]
        bne     LBYV5
        ldr     r0, [sp, #0x40]
        add     r5, r5, #0xC4
        add     r4, r4, #0xC4
        subs    r0, r0, #1
        str     r0, [sp, #0x40]
        bne     LBYV4
        ldr     r12, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LBYV6:
        movs    lr, r2, asr #8
        mov     r11, r12, asr #6
        mov     r10, r2, asr #7
        moveq   r4, #0x40
        beq     LBYV13
        cmp     lr, #1
        mov     r6, r12, asr #7
        mov     r5, r0
        mov     r4, r1
        blt     LBYV9
        str     r6, [sp]
        str     lr, [sp, #4]
        str     r12, [sp, #8]
        str     r3, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LBYV7:
        ldr     r8, [r5]
        ldr     r6, [r5, #0x100]
        ldr     r7, [sp, #0xC]
        mov     r2, #0x3F
        str     r2, [sp, #0x1C]
        mov     r0, r6
        mov     r1, r8
        bl      __addsf3
        mov     r10, r0
        mov     r1, r6
        mov     r0, r8
        bl      __subsf3
        ldr     r11, [r5, #0x300]
        ldr     r6, [r5, #0x200]
        mov     r8, r0
        mov     r1, r11
        mov     r0, r6
        bl      __addsf3
        mov     r9, r0
        mov     r1, r11
        mov     r0, r6
        bl      __subsf3
        mov     r6, r0
        mov     r1, r9
        mov     r0, r10
        bl      __addsf3
        str     r0, [r5]
        mov     r1, r9
        mov     r0, r10
        bl      __subsf3
        str     r0, [r5, #0x200]
        ldr     r11, [r4, #0x300]
        ldr     r10, [r4, #0x200]
        mov     r1, r11
        mov     r0, r10
        bl      __addsf3
        mov     r9, r0
        mov     r0, r10
        mov     r1, r11
        bl      __subsf3
        mov     r10, r0
        mov     r0, r8
        mov     r1, r10
        bl      __subsf3
        str     r0, [r5, #0x100]
        mov     r0, r8
        mov     r1, r10
        bl      __addsf3
        str     r0, [r5, #0x300]
        ldr     r8, [r4]
        ldr     r11, [r4, #0x100]
        mov     r1, r8
        mov     r0, r11
        bl      __addsf3
        mov     r10, r0
        mov     r0, r8
        mov     r1, r11
        bl      __subsf3
        mov     r8, r0
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        str     r0, [r4, #0x200]
        mov     r0, r6
        mov     r1, r8
        bl      __addsf3
        str     r0, [r4, #0x100]
        mov     r0, r8
        mov     r1, r6
        bl      __subsf3
        str     r0, [r4, #0x300]
LBYV8:
        ldr     r0, [sp]
        add     r5, r5, #4
        ldr     r9, [r5, #0x200]
        add     r7, r7, r0, lsl #2
        ldr     r11, [r7]
        ldr     r8, [r7, #4]
        add     r4, r4, #4
        ldr     r10, [r4, #0x200]
        mov     r0, r9
        mov     r1, r11
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r8
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r6, r0
        mov     r0, r10
        mov     r1, r11
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r9
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [r7, #8]
        str     r0, [sp, #0x44]
        ldr     r10, [r5, #0x100]
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [r7, #0xC]
        mov     r8, r0
        ldr     r0, [r4, #0x100]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r8, r0
        ldr     r0, [r5, #0x300]
        str     r0, [sp, #0x40]
        ldr     r1, [r7, #0x10]
        bl      __mulsf3
        ldr     r1, [r7, #0x14]
        ldr     r2, [r4, #0x300]
        mov     r9, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r11, r0
        mov     r1, r6
        bl      __addsf3
        mov     r9, r0
        mov     r0, r6
        mov     r1, r11
        bl      __subsf3
        ldr     r11, [r5]
        str     r0, [sp, #0x3C]
        mov     r0, r11
        mov     r1, r8
        bl      __addsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r8
        bl      __subsf3
        str     r0, [sp, #0x38]
        mov     r1, r9
        mov     r0, r6
        bl      __addsf3
        str     r0, [r5]
        mov     r0, r6
        mov     r1, r9
        bl      __subsf3
        str     r0, [r5, #0x200]
        ldr     r1, [r7, #8]
        ldr     r0, [r4, #0x100]
        bl      __mulsf3
        ldr     r1, [r7, #0xC]
        mov     r6, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [r4, #0x300]
        ldr     r1, [r7, #0x10]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r7, #0x14]
        mov     r6, r0
        ldr     r0, [sp, #0x40]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [sp, #0x44]
        mov     r6, r0
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r6
        bl      __subsf3
        ldr     r11, [r4]
        mov     r6, r0
        mov     r1, r10
        mov     r0, r11
        bl      __addsf3
        mov     r8, r0
        mov     r1, r10
        mov     r0, r11
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x38]
        mov     r1, r6
        bl      __subsf3
        str     r0, [r5, #0x100]
        ldr     r0, [sp, #0x38]
        mov     r1, r6
        bl      __addsf3
        str     r0, [r5, #0x300]
        mov     r0, r9
        mov     r1, r8
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r8
        mov     r1, r9
        bl      __subsf3
        str     r0, [r4, #0x200]
        ldr     r0, [sp, #0x3C]
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4, #0x100]
        ldr     r1, [sp, #0x3C]
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x1C]
        subs    r1, r1, #1
        str     r1, [sp, #0x1C]
        str     r0, [r4, #0x300]
        ldr     r0, [sp, #0x1C]
        bne     LBYV8
        ldr     r0, [sp, #4]
        add     r5, r5, #0xC1, 30
        add     r4, r4, #0xC1, 30
        subs    r0, r0, #1
        str     r0, [sp, #4]
        bne     LBYV7
        ldr     r12, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LBYV9:
        movs    lr, r2, asr #10
        mov     r11, r12, asr #8
        mov     r10, r2, asr #9
        moveq   r4, #1, 24
        beq     LBYV13
        cmp     lr, #1
        mov     r6, r12, asr #9
        mov     r5, r0
        mov     r4, r1
        blt     LBYV12
        str     r6, [sp, #0x3C]
        str     lr, [sp, #0x40]
        str     r12, [sp, #8]
        str     r3, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LBYV10:
        ldr     r6, [r5]
        ldr     r8, [r5, #0x400]
        ldr     r7, [sp, #0xC]
        mov     r1, r6
        mov     r2, #0xFF
        str     r2, [sp, #0x44]
        mov     r0, r8
        bl      __addsf3
        mov     r9, r0
        mov     r0, r6
        mov     r1, r8
        bl      __subsf3
        ldr     r6, [r5, #0xC00]
        ldr     r11, [r5, #0x800]
        mov     r8, r0
        mov     r1, r6
        mov     r0, r11
        bl      __addsf3
        mov     r10, r0
        mov     r1, r6
        mov     r0, r11
        bl      __subsf3
        mov     r6, r0
        mov     r1, r10
        mov     r0, r9
        bl      __addsf3
        str     r0, [r5]
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        str     r0, [r5, #0x800]
        ldr     r10, [r4, #0xC00]
        ldr     r11, [r4, #0x800]
        mov     r1, r10
        mov     r0, r11
        bl      __addsf3
        mov     r9, r0
        mov     r0, r11
        mov     r1, r10
        bl      __subsf3
        mov     r10, r0
        mov     r0, r8
        mov     r1, r10
        bl      __subsf3
        str     r0, [r5, #0x400]
        mov     r0, r8
        mov     r1, r10
        bl      __addsf3
        str     r0, [r5, #0xC00]
        ldr     r8, [r4, #0x400]
        ldr     r11, [r4]
        mov     r0, r8
        mov     r1, r11
        bl      __addsf3
        mov     r10, r0
        mov     r1, r8
        mov     r0, r11
        bl      __subsf3
        mov     r8, r0
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        str     r0, [r4, #0x800]
        mov     r0, r6
        mov     r1, r8
        bl      __addsf3
        str     r0, [r4, #0x400]
        mov     r0, r8
        mov     r1, r6
        bl      __subsf3
        str     r0, [r4, #0xC00]
LBYV11:
        ldr     r0, [sp, #0x3C]
        add     r5, r5, #4
        ldr     r9, [r5, #0x800]
        add     r7, r7, r0, lsl #2
        ldr     r11, [r7]
        ldr     r8, [r7, #4]
        add     r4, r4, #4
        ldr     r10, [r4, #0x800]
        mov     r0, r9
        mov     r1, r11
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r8
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r6, r0
        mov     r0, r10
        mov     r1, r11
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r9
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [r7, #8]
        str     r0, [sp, #0x38]
        ldr     r10, [r5, #0x400]
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [r7, #0xC]
        mov     r8, r0
        ldr     r0, [r4, #0x400]
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r8, r0
        ldr     r0, [r5, #0xC00]
        str     r0, [sp, #0x34]
        ldr     r1, [r7, #0x10]
        bl      __mulsf3
        ldr     r1, [r7, #0x14]
        ldr     r2, [r4, #0xC00]
        mov     r9, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r11, r0
        mov     r1, r6
        bl      __addsf3
        mov     r9, r0
        mov     r0, r6
        mov     r1, r11
        bl      __subsf3
        ldr     r11, [r5]
        str     r0, [sp, #0x30]
        mov     r0, r11
        mov     r1, r8
        bl      __addsf3
        mov     r6, r0
        mov     r0, r11
        mov     r1, r8
        bl      __subsf3
        str     r0, [sp, #0x2C]
        mov     r1, r9
        mov     r0, r6
        bl      __addsf3
        str     r0, [r5]
        mov     r0, r6
        mov     r1, r9
        bl      __subsf3
        str     r0, [r5, #0x800]
        ldr     r1, [r7, #8]
        ldr     r0, [r4, #0x400]
        bl      __mulsf3
        ldr     r1, [r7, #0xC]
        mov     r6, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [r4, #0xC00]
        ldr     r1, [r7, #0x10]
        mov     r10, r0
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [r7, #0x14]
        mov     r6, r0
        ldr     r0, [sp, #0x34]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r1, [sp, #0x38]
        mov     r6, r0
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x38]
        mov     r1, r6
        bl      __subsf3
        ldr     r11, [r4]
        mov     r6, r0
        mov     r1, r10
        mov     r0, r11
        bl      __addsf3
        mov     r8, r0
        mov     r1, r10
        mov     r0, r11
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x2C]
        mov     r1, r6
        bl      __subsf3
        str     r0, [r5, #0x400]
        ldr     r0, [sp, #0x2C]
        mov     r1, r6
        bl      __addsf3
        str     r0, [r5, #0xC00]
        mov     r0, r9
        mov     r1, r8
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r8
        mov     r1, r9
        bl      __subsf3
        str     r0, [r4, #0x800]
        ldr     r0, [sp, #0x30]
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4, #0x400]
        ldr     r1, [sp, #0x30]
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x44]
        subs    r1, r1, #1
        str     r1, [sp, #0x44]
        str     r0, [r4, #0xC00]
        ldr     r0, [sp, #0x44]
        bne     LBYV11
        ldr     r1, [sp, #0x40]
        mov     r0, #4
        add     r0, r0, #3, 22
        subs    r1, r1, #1
        str     r1, [sp, #0x40]
        add     r5, r5, r0
        add     r4, r4, r0
        bne     LBYV10
        ldr     r12, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LBYV12:
        mov     r11, r12, asr #10
        mov     r10, r2, asr #11
        mov     r4, #1, 22
LBYV13:
        cmp     r10, #0
        ble     LBYV21
        str     r3, [sp, #0xC]
LBYV14:
        cmp     r10, #1
        mov     r7, r0
        mov     r6, r1
        movlt   lr, r4, lsl #1
        blt     LBYV20
        ldr     r2, [sp, #0xC]
        mov     r3, r11, lsl #2
        mov     lr, r4, lsl #1
        mov     r8, r4, lsl #3
        mov     r9, r4, asr #1
        mov     r12, #1
        mov     r5, r4, lsl #2
        add     r2, r3, r2
        bic     r4, r4, #1
        str     lr, [sp, #0x3C]
        str     r9, [sp, #0x44]
        str     r2, [sp, #0x38]
        str     r3, [sp, #0x40]
        str     r8, [sp, #0x34]
        str     r12, [sp, #0x30]
        str     r10, [sp, #0x2C]
        str     r11, [sp, #0x28]
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x18]
LBYV15:
        ldr     r8, [r7]
        ldr     r9, [r7, +r5]
        add     r2, r7, r5
        str     r2, [sp, #0x24]
        add     r2, r6, r5
        str     r2, [sp, #0x20]
        mov     r0, r8
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x48]
        mov     r0, r8
        mov     r1, r9
        bl      __subsf3
        ldr     r2, [sp, #0x38]
        ldr     r8, [r6]
        ldr     r9, [r6, +r5]
        str     r2, [sp, #0x1C]
        mov     r11, r0
        mov     r0, r8
        mov     r1, r9
        bl      __addsf3
        mov     r10, r0
        mov     r0, r8
        mov     r1, r9
        bl      __subsf3
        ldr     r1, [sp, #0x48]
        str     r1, [r7]
        str     r11, [r7, +r5]
        str     r10, [r6]
        ldr     r1, [sp, #0x44]
        str     r0, [r6, +r5]
        cmp     r1, #1
        ble     LBYV17
        ldr     r0, [sp, #0x24]
        ldr     r11, [sp, #0x1C]
        mov     r10, #1
        add     r9, r0, #4
        ldr     r0, [sp, #0x20]
        str     r4, [sp, #0x10]
        str     r5, [sp, #8]
        str     r7, [sp]
        add     r8, r0, #4
LBYV16:
        ldr     r0, [r9]
        str     r0, [sp, #0x48]
        ldr     r7, [r11, #4]
        ldr     r2, [r11]
        str     r2, [sp, #0x24]
        ldr     r1, [sp, #0x24]
        ldr     r5, [r8]
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r7
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x24]
        mov     r4, r0
        mov     r0, r5
        bl      __mulsf3
        mov     r5, r0
        ldr     r0, [sp, #0x48]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r2, [sp]
        mov     r5, r0
        mov     r1, r4
        ldr     r7, [r2, +r10, lsl #2]
        ldr     r2, [sp, #0x40]
        mov     r0, r7
        add     r11, r11, r2
        bl      __addsf3
        str     r0, [sp, #0x48]
        mov     r1, r4
        mov     r0, r7
        bl      __subsf3
        ldr     r3, [sp]
        ldr     r2, [sp, #0x48]
        mov     r1, r5
        str     r2, [r3, +r10, lsl #2]
        str     r0, [r9], #4
        ldr     r4, [r6, +r10, lsl #2]
        mov     r0, r4
        bl      __addsf3
        mov     r7, r0
        mov     r0, r4
        mov     r1, r5
        bl      __subsf3
        str     r7, [r6, +r10, lsl #2]
        str     r0, [r8], #4
        ldr     r0, [sp, #0x44]
        add     r10, r10, #1
        cmp     r10, r0
        blt     LBYV16
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #8]
        ldr     r7, [sp]
LBYV17:
        ldr     r9, [r7, +r4, lsl #1]
        add     r10, r6, r4, lsl #1
        ldr     r8, [r10, +r5]
        mov     r0, r9
        add     r11, r7, r4, lsl #1
        add     r2, r5, r11
        str     r2, [sp, #0x1C]
        mov     r1, r8
        bl      __subsf3
        str     r0, [sp, #0x48]
        mov     r0, r9
        mov     r1, r8
        bl      __addsf3
        ldr     r8, [r11, +r5]
        ldr     r9, [r6, +r4, lsl #1]
        str     r0, [sp, #0x24]
        add     r2, r5, r10
        str     r2, [sp, #0x20]
        mov     r0, r8
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x4C]
        mov     r0, r9
        mov     r1, r8
        bl      __subsf3
        ldr     r1, [sp, #0x48]
        str     r1, [r7, +r4, lsl #1]
        ldr     r1, [sp, #0x24]
        str     r1, [r11, +r5]
        ldr     r1, [sp, #0x4C]
        str     r1, [r6, +r4, lsl #1]
        ldr     r1, [sp, #0x44]
        str     r0, [r10, +r5]
        ldr     r0, [sp, #0x38]
        cmp     r1, #1
        ble     LBYV19
        ldr     r1, [sp, #0x1C]
        add     r11, r11, #4
        add     r10, r10, #4
        add     r9, r1, #4
        ldr     r1, [sp, #0x20]
        str     r4, [sp, #0x10]
        str     r5, [sp, #8]
        str     r6, [sp, #4]
        add     r8, r1, #4
        ldr     r1, [sp, #0x44]
        str     r7, [sp]
        mov     r7, r10
        sub     r1, r1, #1
        str     r1, [sp, #0x1C]
        mov     r10, r0
LBYV18:
        ldr     r0, [r9]
        str     r0, [sp, #0x4C]
        ldr     r1, [r10, #4]
        str     r1, [sp, #0x48]
        ldr     r6, [r10]
        ldr     r1, [sp, #0x48]
        ldr     r5, [r8]
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x48]
        mov     r4, r0
        mov     r0, r5
        bl      __mulsf3
        mov     r5, r0
        ldr     r0, [sp, #0x4C]
        mov     r1, r6
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x40]
        ldr     r6, [r11]
        mov     r5, r0
        mov     r1, r4
        add     r10, r10, r2
        mov     r0, r6
        bl      __addsf3
        str     r0, [sp, #0x4C]
        mov     r1, r4
        mov     r0, r6
        bl      __subsf3
        ldr     r2, [sp, #0x4C]
        mov     r1, r5
        str     r2, [r11], #4
        str     r0, [r9], #4
        ldr     r4, [r7]
        mov     r0, r4
        bl      __addsf3
        mov     r6, r0
        mov     r0, r4
        mov     r1, r5
        bl      __subsf3
        str     r6, [r7], #4
        str     r0, [r8], #4
        ldr     r1, [sp, #0x1C]
        subs    r1, r1, #1
        str     r1, [sp, #0x1C]
        bne     LBYV18
        ldr     r4, [sp, #0x10]
        ldr     r5, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r7, [sp]
LBYV19:
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x2C]
        add     r0, r0, #1
        str     r0, [sp, #0x30]
        cmp     r0, r1
        ldr     r0, [sp, #0x34]
        add     r7, r7, r0
        add     r6, r6, r0
        ble     LBYV15
        ldr     lr, [sp, #0x3C]
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x28]
        ldr     r1, [sp, #0x14]
        ldr     r0, [sp, #0x18]
LBYV20:
        mov     r10, r10, asr #1
        cmp     r10, #0
        mov     r4, lr
        mov     r11, r11, asr #1
        bgt     LBYV14
LBYV21:
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}


