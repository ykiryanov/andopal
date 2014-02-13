        .text
        .align  4
        .globl  _ipps_cRadix4Inv_32fc


_ipps_cRadix4Inv_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r6, r0
        mov     r12, r1, asr #2
        add     r3, r1, r1, lsl #1
        cmp     r12, #1
        mov     lr, r3, asr #2
        mov     r4, r6
        blt     LBYX1
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x18]
        str     r3, [sp]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x1C]
        str     r6, [sp, #0x20]
LBYX0:
        ldr     r10, [r4]
        ldr     r9, [r4, #8]
        mov     r1, r10
        mov     r0, r9
        bl      __addsf3
        ldr     r7, [r4, #0xC]
        ldr     r5, [r4, #4]
        mov     r6, r0
        mov     r1, r7
        mov     r0, r5
        bl      __addsf3
        mov     r8, r0
        mov     r1, r9
        mov     r0, r10
        bl      __subsf3
        str     r0, [sp, #0xC]
        mov     r1, r7
        mov     r0, r5
        bl      __subsf3
        ldr     r10, [r4, #0x18]
        mov     r9, r0
        ldr     r0, [r4, #0x10]
        mov     r1, r10
        str     r0, [sp, #8]
        bl      __addsf3
        ldr     r11, [r4, #0x1C]
        ldr     r2, [r4, #0x14]
        mov     r5, r0
        mov     r1, r11
        str     r2, [sp, #4]
        ldr     r0, [sp, #4]
        bl      __addsf3
        mov     r7, r0
        ldr     r0, [sp, #8]
        mov     r1, r10
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #4]
        mov     r1, r11
        bl      __subsf3
        mov     r11, r0
        mov     r1, r5
        mov     r0, r6
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r8
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #4]
        mov     r0, r6
        mov     r1, r5
        bl      __subsf3
        str     r0, [r4, #0x10]
        mov     r0, r8
        mov     r1, r7
        bl      __subsf3
        str     r0, [r4, #0x14]
        ldr     r0, [sp, #0xC]
        mov     r1, r11
        bl      __subsf3
        str     r0, [r4, #8]
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4, #0xC]
        ldr     r0, [sp, #0xC]
        mov     r1, r11
        bl      __addsf3
        str     r0, [r4, #0x18]
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        str     r0, [r4, #0x1C]
        ldr     r0, [sp, #0x14]
        add     r4, r4, #0x20
        subs    r0, r0, #1
        str     r0, [sp, #0x14]
        bne     LBYX0
        ldr     lr, [sp, #0x18]
        ldr     r3, [sp]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
LBYX1:
        ldr     r4, [pc, #0xE04]
        mov     r12, #8
        orr     r12, r12, #6, 22
        bics    r4, r1, r4
        beq     LBYX12
        mov     r5, r1, asr #3
        cmp     r5, #1
        mov     r4, r6
        add     r7, r2, lr, lsl #2
        blt     LBYX3
        str     r7, [sp, #0x14]
        str     r12, [sp, #0xC]
        str     lr, [sp, #0x18]
        str     r3, [sp]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x1C]
        str     r6, [sp, #0x20]
LBYX2:
        ldr     r11, [r4, #0x20]
        ldr     r10, [r4]
        mov     r1, r11
        mov     r0, r10
        bl      __addsf3
        ldr     r6, [r4, #0x24]
        ldr     r7, [r4, #4]
        mov     r9, r0
        mov     r1, r6
        mov     r0, r7
        bl      __addsf3
        mov     r8, r0
        mov     r1, r11
        mov     r0, r10
        bl      __subsf3
        mov     r10, r0
        mov     r0, r7
        mov     r1, r6
        bl      __subsf3
        str     r8, [r4, #4]
        str     r0, [r4, #0x24]
        ldr     r7, [r4, #0x2C]
        str     r10, [r4, #0x20]
        str     r9, [r4]
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x10]
        ldr     r9, [r4, #0x28]
        mov     r1, r7
        ldr     r8, [r3, +r2, lsl #2]
        mov     r0, r9
        bl      __subsf3
        mov     r1, r8
        bl      __mulsf3
        mov     r6, r0
        mov     r1, r9
        mov     r0, r7
        bl      __addsf3
        mov     r1, r8
        bl      __mulsf3
        ldr     r11, [r4, #8]
        mov     r7, r0
        mov     r1, r6
        mov     r0, r11
        bl      __addsf3
        ldr     r8, [r4, #0xC]
        mov     r10, r0
        mov     r1, r7
        mov     r0, r8
        bl      __addsf3
        mov     r9, r0
        mov     r1, r6
        mov     r0, r11
        bl      __subsf3
        mov     r6, r0
        mov     r0, r8
        mov     r1, r7
        bl      __subsf3
        str     r6, [r4, #0x28]
        ldr     r6, [r4, #0x34]
        ldr     r11, [r4, #0x10]
        str     r0, [r4, #0x2C]
        str     r10, [r4, #8]
        str     r9, [r4, #0xC]
        mov     r0, r11
        mov     r1, r6
        bl      __subsf3
        ldr     r7, [r4, #0x14]
        ldr     r8, [r4, #0x30]
        mov     r10, r0
        mov     r0, r7
        mov     r1, r8
        bl      __addsf3
        mov     r9, r0
        mov     r0, r11
        mov     r1, r6
        bl      __addsf3
        mov     r6, r0
        mov     r0, r7
        mov     r1, r8
        bl      __subsf3
        str     r6, [r4, #0x30]
        str     r9, [r4, #0x14]
        str     r0, [r4, #0x34]
        str     r10, [r4, #0x10]
        ldr     r2, [sp, #0x14]
        ldr     r8, [r4, #0x38]
        ldr     r9, [r4, #0x3C]
        ldr     r6, [r2, #4]
        mov     r0, r8
        mov     r1, r9
        bl      __addsf3
        mov     r1, r6
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r8
        mov     r0, r9
        bl      __subsf3
        mov     r1, r6
        bl      __mulsf3
        ldr     r11, [r4, #0x18]
        mov     r6, r0
        mov     r1, r7
        mov     r0, r11
        bl      __addsf3
        ldr     r8, [r4, #0x1C]
        mov     r10, r0
        mov     r1, r6
        mov     r0, r8
        bl      __addsf3
        mov     r9, r0
        mov     r1, r7
        mov     r0, r11
        bl      __subsf3
        mov     r7, r0
        mov     r0, r8
        mov     r1, r6
        bl      __subsf3
        str     r10, [r4, #0x18]
        str     r9, [r4, #0x1C]
        str     r7, [r4, #0x38]
        str     r0, [r4, #0x3C]
        subs    r5, r5, #1
        add     r4, r4, #0x40
        bne     LBYX2
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
LBYX3:
        movs    lr, r1, asr #5
        beq     LBYX23
        cmp     lr, #1
        mov     r5, r3, asr #4
        mov     r4, r6
        blt     LBYX6
        str     r5, [sp, #0x18]
        str     lr, [sp, #8]
        str     r12, [sp, #0xC]
        str     r3, [sp]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x1C]
        str     r6, [sp, #0x20]
LBYX4:
        ldr     r8, [r4]
        ldr     r5, [r4, #0x40]
        ldr     r2, [sp, #0x10]
        mov     r1, r8
        str     r2, [sp, #4]
        mov     r2, #2
        mov     r0, r5
        str     r2, [sp, #0x14]
        bl      __addsf3
        ldr     r9, [r4, #0x44]
        ldr     r10, [r4, #4]
        mov     r7, r0
        mov     r1, r9
        mov     r0, r10
        bl      __addsf3
        mov     r6, r0
        mov     r0, r8
        mov     r1, r5
        bl      __subsf3
        str     r0, [sp, #0x24]
        mov     r1, r9
        mov     r0, r10
        bl      __subsf3
        ldr     r5, [r4, #0x80]
        ldr     r1, [r4, #0xC0]
        str     r0, [sp, #0x2C]
        mov     r0, r5
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x28]
        bl      __addsf3
        ldr     r11, [r4, #0xC4]
        ldr     r10, [r4, #0x84]
        mov     r8, r0
        mov     r1, r11
        mov     r0, r10
        bl      __addsf3
        ldr     r1, [sp, #0x28]
        mov     r9, r0
        mov     r0, r5
        bl      __subsf3
        mov     r5, r0
        mov     r1, r11
        mov     r0, r10
        bl      __subsf3
        mov     r10, r0
        mov     r0, r7
        mov     r1, r8
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r6
        mov     r1, r9
        bl      __addsf3
        str     r0, [r4, #4]
        mov     r1, r8
        mov     r0, r7
        bl      __subsf3
        str     r0, [r4, #0x80]
        mov     r0, r6
        mov     r1, r9
        bl      __subsf3
        str     r0, [r4, #0x84]
        ldr     r0, [sp, #0x24]
        mov     r1, r10
        bl      __subsf3
        str     r0, [r4, #0x40]
        ldr     r0, [sp, #0x2C]
        mov     r1, r5
        bl      __addsf3
        str     r0, [r4, #0x44]
        ldr     r0, [sp, #0x24]
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4, #0xC0]
        ldr     r0, [sp, #0x2C]
        mov     r1, r5
        bl      __subsf3
        str     r0, [r4, #0xC4]
        ldr     r6, [sp, #4]
LBYX5:
        ldr     r0, [sp, #0x18]
        add     r4, r4, #8
        add     r6, r6, r0, lsl #2
        ldr     r0, [sp, #0x14]
        ldr     r5, [r6]
        ldr     r9, [r6, #4]
        add     r0, r0, #2
        str     r0, [sp, #0x14]
        ldr     r10, [r4, #0x80]
        ldr     r8, [r4, #0x84]
        mov     r1, r5
        mov     r0, r10
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r8
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        mov     r0, r8
        mov     r1, r5
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r9
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r11, [r4, #0x40]
        ldr     r9, [r6, #8]
        ldr     r10, [r6, #0xC]
        ldr     r8, [r4, #0x44]
        mov     r5, r0
        mov     r1, r9
        mov     r0, r11
        bl      __mulsf3
        str     r0, [sp, #0x2C]
        mov     r1, r10
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        str     r0, [sp, #0x2C]
        mov     r0, r8
        mov     r1, r9
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r10
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r11, [r4, #0xC0]
        str     r0, [sp, #0x28]
        ldr     r1, [r6, #0x10]
        mov     r0, r11
        str     r1, [sp, #0x24]
        ldr     r9, [r4, #0xC4]
        ldr     r10, [r6, #0x14]
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r9
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x24]
        mov     r8, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r9, r0
        mov     r0, r11
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        mov     r9, r0
        mov     r1, r8
        mov     r0, r7
        bl      __addsf3
        str     r0, [sp, #0x24]
        mov     r1, r8
        mov     r0, r7
        bl      __subsf3
        mov     r7, r0
        mov     r1, r9
        mov     r0, r5
        bl      __addsf3
        mov     r8, r0
        mov     r0, r5
        mov     r1, r9
        bl      __subsf3
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x2C]
        ldr     r9, [r4]
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        mov     r5, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r11, [r4, #4]
        ldr     r1, [sp, #0x28]
        mov     r9, r0
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x28]
        mov     r10, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x24]
        mov     r11, r0
        mov     r0, r5
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r10
        mov     r1, r8
        bl      __addsf3
        str     r0, [r4, #4]
        ldr     r1, [sp, #0x24]
        mov     r0, r5
        bl      __subsf3
        str     r0, [r4, #0x80]
        mov     r1, r8
        mov     r0, r10
        bl      __subsf3
        str     r0, [r4, #0x84]
        ldr     r1, [sp, #0x30]
        mov     r0, r9
        bl      __subsf3
        str     r0, [r4, #0x40]
        mov     r0, r11
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #0x44]
        ldr     r1, [sp, #0x30]
        mov     r0, r9
        bl      __addsf3
        str     r0, [r4, #0xC0]
        mov     r0, r11
        mov     r1, r7
        bl      __subsf3
        str     r0, [r4, #0xC4]
        ldr     r0, [sp, #0x14]
        cmp     r0, #0x10
        blt     LBYX5
        ldr     r0, [sp, #8]
        add     r4, r4, #0xC8
        subs    r0, r0, #1
        str     r0, [sp, #8]
        bne     LBYX4
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
LBYX6:
        movs    lr, r1, asr #7
        beq     LBYX23
        cmp     lr, #1
        mov     r5, r3, asr #6
        mov     r4, r6
        blt     LBYX9
        str     r5, [sp, #4]
        str     lr, [sp, #0x14]
        str     r12, [sp, #0xC]
        str     r3, [sp]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x1C]
        str     r6, [sp, #0x20]
LBYX7:
        ldr     r8, [r4]
        ldr     r2, [sp, #0x10]
        ldr     r5, [r4, #0x100]
        mov     r1, r8
        str     r2, [sp, #0x18]
        mov     r2, #2
        str     r2, [sp, #8]
        mov     r0, r5
        bl      __addsf3
        ldr     r9, [r4, #4]
        ldr     r10, [r4, #0x104]
        mov     r7, r0
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        mov     r6, r0
        mov     r1, r5
        mov     r0, r8
        bl      __subsf3
        str     r0, [sp, #0x30]
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        ldr     r5, [r4, #0x200]
        ldr     r1, [r4, #0x300]
        str     r0, [sp, #0x28]
        mov     r0, r5
        str     r1, [sp, #0x2C]
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        ldr     r11, [r4, #0x304]
        ldr     r10, [r4, #0x204]
        mov     r8, r0
        mov     r1, r11
        mov     r0, r10
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        mov     r9, r0
        mov     r0, r5
        bl      __subsf3
        mov     r5, r0
        mov     r1, r11
        mov     r0, r10
        bl      __subsf3
        mov     r10, r0
        mov     r0, r7
        mov     r1, r8
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r6
        mov     r1, r9
        bl      __addsf3
        str     r0, [r4, #4]
        mov     r1, r8
        mov     r0, r7
        bl      __subsf3
        str     r0, [r4, #0x200]
        mov     r0, r6
        mov     r1, r9
        bl      __subsf3
        str     r0, [r4, #0x204]
        ldr     r0, [sp, #0x30]
        mov     r1, r10
        bl      __subsf3
        str     r0, [r4, #0x100]
        ldr     r0, [sp, #0x28]
        mov     r1, r5
        bl      __addsf3
        str     r0, [r4, #0x104]
        ldr     r0, [sp, #0x30]
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4, #0x300]
        ldr     r0, [sp, #0x28]
        mov     r1, r5
        bl      __subsf3
        str     r0, [r4, #0x304]
        ldr     r6, [sp, #0x18]
LBYX8:
        ldr     r0, [sp, #4]
        add     r4, r4, #8
        add     r6, r6, r0, lsl #2
        ldr     r0, [sp, #8]
        ldr     r5, [r6]
        ldr     r9, [r6, #4]
        add     r0, r0, #2
        str     r0, [sp, #8]
        ldr     r10, [r4, #0x200]
        ldr     r8, [r4, #0x204]
        mov     r1, r5
        mov     r0, r10
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r8
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        mov     r0, r8
        mov     r1, r5
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r9
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r11, [r4, #0x100]
        ldr     r9, [r6, #8]
        ldr     r10, [r6, #0xC]
        ldr     r8, [r4, #0x104]
        mov     r5, r0
        mov     r1, r9
        mov     r0, r11
        bl      __mulsf3
        str     r0, [sp, #0x30]
        mov     r1, r10
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        str     r0, [sp, #0x30]
        mov     r0, r8
        mov     r1, r9
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r10
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r11, [r4, #0x300]
        str     r0, [sp, #0x2C]
        ldr     r1, [r6, #0x10]
        mov     r0, r11
        str     r1, [sp, #0x28]
        ldr     r9, [r4, #0x304]
        ldr     r10, [r6, #0x14]
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r9
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x28]
        mov     r8, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r9, r0
        mov     r0, r11
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        mov     r9, r0
        mov     r1, r8
        mov     r0, r7
        bl      __addsf3
        str     r0, [sp, #0x28]
        mov     r1, r8
        mov     r0, r7
        bl      __subsf3
        mov     r7, r0
        mov     r1, r9
        mov     r0, r5
        bl      __addsf3
        mov     r8, r0
        mov     r0, r5
        mov     r1, r9
        bl      __subsf3
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x30]
        ldr     r9, [r4]
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        mov     r5, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r11, [r4, #4]
        ldr     r1, [sp, #0x2C]
        mov     r9, r0
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        mov     r10, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        mov     r11, r0
        mov     r0, r5
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r10
        mov     r1, r8
        bl      __addsf3
        str     r0, [r4, #4]
        ldr     r1, [sp, #0x28]
        mov     r0, r5
        bl      __subsf3
        str     r0, [r4, #0x200]
        mov     r1, r8
        mov     r0, r10
        bl      __subsf3
        str     r0, [r4, #0x204]
        ldr     r1, [sp, #0x24]
        mov     r0, r9
        bl      __subsf3
        str     r0, [r4, #0x100]
        mov     r0, r11
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #0x104]
        ldr     r1, [sp, #0x24]
        mov     r0, r9
        bl      __addsf3
        str     r0, [r4, #0x300]
        mov     r0, r11
        mov     r1, r7
        bl      __subsf3
        str     r0, [r4, #0x304]
        ldr     r0, [sp, #8]
        cmp     r0, #0x40
        blt     LBYX8
        ldr     r0, [sp, #0x14]
        add     r4, r4, #0xC2, 30
        subs    r0, r0, #1
        str     r0, [sp, #0x14]
        bne     LBYX7
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
LBYX9:
        movs    r1, r1, asr #9
        beq     LBYX23
        cmp     r1, #1
        mov     r3, r3, asr #8
        blt     LBYX23
        mov     lr, #1
        str     lr, [sp, #4]
        str     r3, [sp]
        str     r1, [sp, #8]
        str     r12, [sp, #0xC]
        str     r2, [sp, #0x10]
LBYX10:
        ldr     r7, [r6]
        ldr     r5, [r6, #0x400]
        ldr     r2, [sp, #0x10]
        mov     r1, r7
        str     r2, [sp, #0x14]
        mov     r0, r5
        mov     r2, #2
        str     r2, [sp, #0x18]
        bl      __addsf3
        ldr     r9, [r6, #0x404]
        ldr     r10, [r6, #4]
        mov     r4, r0
        mov     r1, r9
        mov     r0, r10
        bl      __addsf3
        mov     r8, r0
        mov     r0, r7
        mov     r1, r5
        bl      __subsf3
        str     r0, [sp, #0x30]
        mov     r1, r9
        mov     r0, r10
        bl      __subsf3
        ldr     r10, [r6, #0x800]
        ldr     r1, [r6, #0xC00]
        mov     r9, r0
        mov     r0, r10
        str     r1, [sp, #0x2C]
        bl      __addsf3
        ldr     r11, [r6, #0x804]
        ldr     r2, [r6, #0xC04]
        mov     r5, r0
        mov     r0, r11
        str     r2, [sp, #0x28]
        ldr     r1, [sp, #0x28]
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        mov     r7, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        mov     r10, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r0, r4
        mov     r1, r5
        bl      __addsf3
        str     r0, [r6]
        mov     r0, r8
        mov     r1, r7
        bl      __addsf3
        str     r0, [r6, #4]
        mov     r1, r5
        mov     r0, r4
        bl      __subsf3
        str     r0, [r6, #0x800]
        mov     r0, r8
        mov     r1, r7
        bl      __subsf3
        str     r0, [r6, #0x804]
        ldr     r0, [sp, #0x30]
        mov     r1, r11
        bl      __subsf3
        str     r0, [r6, #0x400]
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        str     r0, [r6, #0x404]
        ldr     r0, [sp, #0x30]
        mov     r1, r11
        bl      __addsf3
        str     r0, [r6, #0xC00]
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        str     r0, [r6, #0xC04]
        ldr     r8, [sp, #0x14]
LBYX11:
        ldr     r1, [sp]
        ldr     r2, [sp, #0x18]
        add     r6, r6, #8
        ldr     r7, [r6, #0x804]
        add     r8, r8, r1, lsl #2
        ldr     r9, [r8, #4]
        ldr     r10, [r6, #0x800]
        ldr     r4, [r8]
        add     r2, r2, #2
        str     r2, [sp, #0x18]
        mov     r0, r10
        mov     r1, r4
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r9
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        mov     r1, r4
        mov     r0, r7
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r9
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r9, [r8, #8]
        ldr     r10, [r8, #0xC]
        ldr     r11, [r6, #0x400]
        ldr     r7, [r6, #0x404]
        str     r0, [sp, #0x30]
        mov     r1, r9
        mov     r0, r11
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r7
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        str     r0, [sp, #0x2C]
        mov     r1, r9
        mov     r0, r7
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r10
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r9, [r8, #0x10]
        ldr     r10, [r6, #0xC00]
        str     r0, [sp, #0x28]
        ldr     r4, [r6, #0xC04]
        ldr     r11, [r8, #0x14]
        mov     r1, r9
        mov     r0, r10
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r11
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        mov     r0, r4
        mov     r1, r9
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r11
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        mov     r11, r0
        mov     r1, r7
        mov     r0, r5
        bl      __addsf3
        mov     r4, r0
        mov     r0, r5
        mov     r1, r7
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r11
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r11
        bl      __subsf3
        ldr     r5, [r6]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x2C]
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        str     r0, [sp, #0x24]
        mov     r0, r5
        bl      __subsf3
        ldr     r11, [r6, #4]
        ldr     r1, [sp, #0x28]
        mov     r5, r0
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x28]
        mov     r7, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x24]
        mov     r1, r4
        bl      __addsf3
        str     r0, [r6]
        mov     r0, r7
        mov     r1, r9
        bl      __addsf3
        str     r0, [r6, #4]
        ldr     r0, [sp, #0x24]
        mov     r1, r4
        bl      __subsf3
        str     r0, [r6, #0x800]
        mov     r1, r9
        mov     r0, r7
        bl      __subsf3
        str     r0, [r6, #0x804]
        ldr     r1, [sp, #0x30]
        mov     r0, r5
        bl      __subsf3
        str     r0, [r6, #0x400]
        mov     r0, r11
        mov     r1, r10
        bl      __addsf3
        str     r0, [r6, #0x404]
        ldr     r1, [sp, #0x30]
        mov     r0, r5
        bl      __addsf3
        str     r0, [r6, #0xC00]
        mov     r0, r11
        mov     r1, r10
        bl      __subsf3
        str     r0, [r6, #0xC04]
        ldr     r1, [sp, #0x18]
        cmp     r1, #1, 24
        blt     LBYX11
        ldr     r1, [sp, #4]
        ldr     r2, [sp, #8]
        add     r1, r1, #1
        str     r1, [sp, #4]
        cmp     r1, r2
        ldr     r1, [sp, #0xC]
        sub     r1, r1, #3, 22
        add     r6, r6, r1
        ble     LBYX10
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   0xea000000
        .long   0x55555555
LBYX12:
        movs    lr, r1, asr #4
        beq     LBYX23
        mov     r7, r3, asr #3
        cmp     lr, #1
        mov     r5, r6
        add     r4, r2, r7, lsl #2
        blt     LBYX14
        str     r7, [sp, #0x14]
        str     lr, [sp, #0x18]
        str     r12, [sp, #0xC]
        str     r3, [sp]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x1C]
        str     r6, [sp, #0x20]
LBYX13:
        ldr     r10, [r5]
        ldr     r8, [r5, #0x20]
        mov     r0, r10
        mov     r1, r8
        bl      __addsf3
        str     r0, [sp, #0x30]
        ldr     r6, [r5, #4]
        ldr     r9, [r5, #0x24]
        mov     r0, r6
        mov     r1, r9
        bl      __addsf3
        mov     r7, r0
        mov     r1, r8
        mov     r0, r10
        bl      __subsf3
        mov     r8, r0
        mov     r0, r6
        mov     r1, r9
        bl      __subsf3
        ldr     r9, [r5, #0x40]
        ldr     r1, [r5, #0x60]
        mov     r10, r0
        mov     r0, r9
        str     r1, [sp, #0x2C]
        bl      __addsf3
        ldr     r1, [r5, #0x64]
        str     r1, [sp, #0x28]
        ldr     r11, [r5, #0x44]
        ldr     r1, [sp, #0x28]
        str     r0, [sp, #0x24]
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        mov     r6, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        mov     r9, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x24]
        mov     r11, r0
        ldr     r0, [sp, #0x30]
        bl      __addsf3
        str     r0, [r5]
        mov     r1, r6
        mov     r0, r7
        bl      __addsf3
        str     r0, [r5, #4]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x24]
        bl      __subsf3
        str     r0, [r5, #0x40]
        mov     r1, r6
        mov     r0, r7
        bl      __subsf3
        str     r0, [r5, #0x44]
        mov     r0, r8
        mov     r1, r11
        bl      __subsf3
        str     r0, [r5, #0x20]
        mov     r1, r9
        mov     r0, r10
        bl      __addsf3
        str     r0, [r5, #0x24]
        mov     r0, r8
        mov     r1, r11
        bl      __addsf3
        str     r0, [r5, #0x60]
        mov     r1, r9
        mov     r0, r10
        bl      __subsf3
        ldr     r9, [r5, #0x48]
        str     r0, [r5, #0x64]
        ldr     r1, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        ldr     r10, [r4, #4]
        ldr     r8, [r5, #0x4C]
        ldr     r7, [r1, +r0, lsl #2]
        mov     r0, r9
        mov     r1, r7
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r8
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        mov     r6, r0
        mov     r1, r7
        mov     r0, r8
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r10, [r5, #0x68]
        ldr     r1, [r4, #0x10]
        ldr     r9, [r5, #0x6C]
        mov     r8, r0
        mov     r0, r10
        bl      __mulsf3
        ldr     r1, [r4, #0x14]
        mov     r7, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [r5, #0x28]
        mov     r7, r0
        str     r2, [sp, #0x30]
        ldr     r1, [r5, #0x2C]
        ldr     r0, [sp, #0x30]
        str     r1, [sp, #0x2C]
        bl      __subsf3
        ldr     r1, [r4, #8]
        bl      __mulsf3
        mov     r11, r0
        mov     r0, r6
        mov     r1, r7
        bl      __addsf3
        str     r0, [sp, #0x28]
        mov     r0, r6
        mov     r1, r7
        bl      __subsf3
        ldr     r2, [r5, #8]
        mov     r7, r0
        mov     r1, r11
        str     r2, [sp, #0x24]
        ldr     r0, [sp, #0x24]
        bl      __addsf3
        mov     r6, r0
        ldr     r0, [sp, #0x24]
        mov     r1, r11
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        mov     r11, r0
        mov     r0, r6
        bl      __addsf3
        str     r0, [r5, #8]
        ldr     r1, [sp, #0x28]
        mov     r0, r6
        bl      __subsf3
        str     r0, [r5, #0x48]
        ldr     r1, [r4, #0x10]
        mov     r0, r9
        bl      __mulsf3
        ldr     r1, [r4, #0x14]
        mov     r6, r0
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        mov     r9, r0
        mov     r1, r8
        bl      __addsf3
        mov     r6, r0
        mov     r0, r8
        mov     r1, r9
        bl      __subsf3
        mov     r8, r0
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r1, [r4, #8]
        bl      __mulsf3
        str     r0, [sp, #0x30]
        ldr     r10, [r5, #0xC]
        mov     r1, r10
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        mov     r9, r0
        mov     r0, r10
        bl      __subsf3
        mov     r10, r0
        mov     r0, r9
        mov     r1, r6
        bl      __addsf3
        str     r0, [r5, #0xC]
        mov     r0, r9
        mov     r1, r6
        bl      __subsf3
        str     r0, [r5, #0x4C]
        mov     r0, r11
        mov     r1, r8
        bl      __subsf3
        str     r0, [r5, #0x28]
        mov     r1, r7
        mov     r0, r10
        bl      __addsf3
        str     r0, [r5, #0x2C]
        mov     r0, r11
        mov     r1, r8
        bl      __addsf3
        str     r0, [r5, #0x68]
        mov     r0, r10
        mov     r1, r7
        bl      __subsf3
        ldr     r8, [r5, #0x54]
        str     r0, [r5, #0x6C]
        ldr     r9, [r5, #0x50]
        ldr     r7, [r4, #8]
        mov     r1, r8
        mov     r0, r9
        bl      __subsf3
        mov     r1, r7
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r8
        mov     r1, r9
        bl      __addsf3
        mov     r1, r7
        bl      __mulsf3
        ldr     r11, [r5, #0x74]
        ldr     r10, [r5, #0x70]
        ldr     r9, [r4, #0xC]
        mov     r8, r0
        mov     r1, r11
        mov     r0, r10
        bl      __addsf3
        mov     r1, r9
        bl      __mulsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r11
        bl      __subsf3
        mov     r1, r9
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r7
        mov     r0, r6
        bl      __addsf3
        str     r0, [sp, #0x30]
        mov     r1, r7
        mov     r0, r6
        bl      __subsf3
        mov     r6, r0
        mov     r1, r9
        mov     r0, r8
        bl      __addsf3
        mov     r7, r0
        mov     r0, r8
        mov     r1, r9
        bl      __subsf3
        ldr     r9, [r5, #0x10]
        ldr     r10, [r5, #0x34]
        mov     r8, r0
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        str     r0, [sp, #0x2C]
        mov     r1, r10
        mov     r0, r9
        bl      __addsf3
        ldr     r2, [r5, #0x30]
        mov     r9, r0
        str     r2, [sp, #0x28]
        ldr     r1, [sp, #0x28]
        ldr     r11, [r5, #0x14]
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x28]
        mov     r10, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        str     r0, [r5, #0x10]
        mov     r1, r7
        mov     r0, r10
        bl      __addsf3
        str     r0, [r5, #0x14]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        bl      __subsf3
        str     r0, [r5, #0x50]
        mov     r0, r10
        mov     r1, r7
        bl      __subsf3
        str     r0, [r5, #0x54]
        mov     r1, r8
        mov     r0, r9
        bl      __subsf3
        str     r0, [r5, #0x30]
        mov     r1, r6
        mov     r0, r11
        bl      __addsf3
        str     r0, [r5, #0x34]
        mov     r1, r8
        mov     r0, r9
        bl      __addsf3
        str     r0, [r5, #0x70]
        mov     r1, r6
        mov     r0, r11
        bl      __subsf3
        ldr     r10, [r5, #0x58]
        ldr     r7, [r5, #0x5C]
        str     r0, [r5, #0x74]
        ldr     r6, [r4, #0x10]
        ldr     r8, [r4, #0x14]
        mov     r0, r10
        mov     r1, r6
        bl      __mulsf3
        mov     r9, r0
        mov     r0, r7
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
        mov     r0, r7
        mov     r1, r6
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r10
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r2, [r5, #0x78]
        mov     r7, r0
        mov     r1, r8
        str     r2, [sp, #0x30]
        ldr     r0, [sp, #0x30]
        ldr     r8, [r5, #0x7C]
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r6
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [r5, #0x38]
        mov     r11, r0
        str     r2, [sp, #0x2C]
        ldr     r1, [r5, #0x3C]
        ldr     r0, [sp, #0x2C]
        str     r1, [sp, #0x28]
        bl      __addsf3
        ldr     r1, [r4, #0xC]
        bl      __mulsf3
        mov     r10, r0
        mov     r0, r9
        mov     r1, r11
        bl      __addsf3
        mov     r6, r0
        mov     r0, r9
        mov     r1, r11
        bl      __subsf3
        ldr     r11, [r5, #0x18]
        str     r0, [sp, #0x24]
        mov     r1, r10
        mov     r0, r11
        bl      __addsf3
        mov     r9, r0
        mov     r0, r11
        mov     r1, r10
        bl      __subsf3
        mov     r10, r0
        mov     r1, r6
        mov     r0, r9
        bl      __addsf3
        str     r0, [r5, #0x18]
        mov     r0, r9
        mov     r1, r6
        bl      __subsf3
        str     r0, [r5, #0x58]
        ldr     r1, [r4, #0x14]
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [r4, #0x10]
        mov     r6, r0
        ldr     r0, [sp, #0x30]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        mov     r8, r0
        mov     r1, r7
        bl      __addsf3
        mov     r6, r0
        mov     r0, r7
        mov     r1, r8
        bl      __subsf3
        mov     r8, r0
        ldr     r1, [sp, #0x2C]
        ldr     r0, [sp, #0x28]
        bl      __subsf3
        ldr     r1, [r4, #0xC]
        bl      __mulsf3
        ldr     r11, [r5, #0x1C]
        mov     r7, r0
        mov     r1, r11
        bl      __addsf3
        mov     r9, r0
        mov     r1, r7
        mov     r0, r11
        bl      __subsf3
        mov     r7, r0
        mov     r0, r9
        mov     r1, r6
        bl      __addsf3
        str     r0, [r5, #0x1C]
        mov     r0, r9
        mov     r1, r6
        bl      __subsf3
        str     r0, [r5, #0x5C]
        mov     r0, r10
        mov     r1, r8
        bl      __subsf3
        str     r0, [r5, #0x38]
        ldr     r1, [sp, #0x24]
        mov     r0, r7
        bl      __addsf3
        str     r0, [r5, #0x3C]
        mov     r0, r10
        mov     r1, r8
        bl      __addsf3
        str     r0, [r5, #0x78]
        ldr     r1, [sp, #0x24]
        mov     r0, r7
        bl      __subsf3
        str     r0, [r5, #0x7C]
        ldr     r0, [sp, #0x18]
        add     r5, r5, #0x80
        subs    r0, r0, #1
        str     r0, [sp, #0x18]
        bne     LBYX13
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
LBYX14:
        movs    lr, r1, asr #6
        beq     LBYX23
        cmp     lr, #1
        mov     r5, r3, asr #5
        mov     r4, r6
        blt     LBYX17
        str     r5, [sp, #4]
        str     lr, [sp, #8]
        str     r12, [sp, #0xC]
        str     r3, [sp]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x1C]
        str     r6, [sp, #0x20]
LBYX15:
        ldr     r6, [r4, #0x80]
        ldr     r8, [r4]
        ldr     r2, [sp, #0x10]
        mov     r0, r6
        str     r2, [sp, #0x14]
        mov     r2, #2
        str     r2, [sp, #0x18]
        mov     r1, r8
        bl      __addsf3
        ldr     r9, [r4, #4]
        ldr     r10, [r4, #0x84]
        mov     r5, r0
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        mov     r7, r0
        mov     r1, r6
        mov     r0, r8
        bl      __subsf3
        mov     r8, r0
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        ldr     r10, [r4, #0x100]
        ldr     r1, [r4, #0x180]
        mov     r9, r0
        mov     r0, r10
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r11, [r4, #0x104]
        ldr     r1, [r4, #0x184]
        str     r0, [sp, #0x28]
        mov     r0, r11
        str     r1, [sp, #0x2C]
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        mov     r6, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x2C]
        mov     r10, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        mov     r11, r0
        mov     r0, r5
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r7
        mov     r1, r6
        bl      __addsf3
        str     r0, [r4, #4]
        ldr     r1, [sp, #0x28]
        mov     r0, r5
        bl      __subsf3
        str     r0, [r4, #0x100]
        mov     r0, r7
        mov     r1, r6
        bl      __subsf3
        str     r0, [r4, #0x104]
        mov     r0, r8
        mov     r1, r11
        bl      __subsf3
        str     r0, [r4, #0x80]
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4, #0x84]
        mov     r0, r8
        mov     r1, r11
        bl      __addsf3
        str     r0, [r4, #0x180]
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        str     r0, [r4, #0x184]
        ldr     r8, [sp, #0x14]
LBYX16:
        ldr     r0, [sp, #4]
        add     r4, r4, #8
        add     r8, r8, r0, lsl #2
        ldr     r6, [r8]
        ldr     r0, [sp, #0x18]
        ldr     r7, [r8, #4]
        add     r0, r0, #2
        str     r0, [sp, #0x18]
        ldr     r10, [r4, #0x100]
        ldr     r5, [r4, #0x104]
        mov     r1, r6
        mov     r0, r10
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r7
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
        mov     r1, r6
        mov     r0, r5
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r7
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r7, [r8, #8]
        ldr     r10, [r4, #0x80]
        ldr     r6, [r4, #0x84]
        ldr     r11, [r8, #0xC]
        mov     r5, r0
        mov     r0, r10
        mov     r1, r7
        bl      __mulsf3
        str     r0, [sp, #0x30]
        mov     r1, r11
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        str     r0, [sp, #0x30]
        mov     r1, r7
        mov     r0, r6
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r10
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        str     r0, [sp, #0x2C]
        ldr     r0, [r4, #0x180]
        ldr     r11, [r8, #0x10]
        ldr     r7, [r8, #0x14]
        str     r0, [sp, #0x28]
        ldr     r6, [r4, #0x184]
        mov     r1, r11
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r7
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        mov     r10, r0
        mov     r0, r6
        mov     r1, r11
        bl      __mulsf3
        mov     r6, r0
        ldr     r0, [sp, #0x28]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        mov     r6, r0
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        mov     r10, r0
        mov     r1, r6
        mov     r0, r5
        bl      __addsf3
        mov     r9, r0
        mov     r1, r6
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x30]
        str     r0, [sp, #0x28]
        ldr     r6, [r4]
        mov     r0, r6
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        mov     r5, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r11, [r4, #4]
        ldr     r1, [sp, #0x2C]
        str     r0, [sp, #0x30]
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        mov     r6, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r1, r7
        mov     r0, r5
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r6
        mov     r1, r9
        bl      __addsf3
        str     r0, [r4, #4]
        mov     r0, r5
        mov     r1, r7
        bl      __subsf3
        str     r0, [r4, #0x100]
        mov     r1, r9
        mov     r0, r6
        bl      __subsf3
        str     r0, [r4, #0x104]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x28]
        bl      __subsf3
        str     r0, [r4, #0x80]
        mov     r0, r11
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4, #0x84]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x28]
        bl      __addsf3
        str     r0, [r4, #0x180]
        mov     r0, r11
        mov     r1, r10
        bl      __subsf3
        str     r0, [r4, #0x184]
        ldr     r0, [sp, #0x18]
        cmp     r0, #0x20
        blt     LBYX16
        ldr     r0, [sp, #8]
        add     r4, r4, #0x62, 30
        subs    r0, r0, #1
        str     r0, [sp, #8]
        bne     LBYX15
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
LBYX17:
        movs    lr, r1, asr #8
        beq     LBYX23
        cmp     lr, #1
        mov     r5, r3, asr #7
        mov     r4, r6
        blt     LBYX20
        str     r5, [sp, #4]
        str     lr, [sp, #8]
        str     r12, [sp, #0xC]
        str     r3, [sp]
        str     r2, [sp, #0x10]
        str     r1, [sp, #0x1C]
        str     r6, [sp, #0x20]
LBYX18:
        ldr     r6, [r4, #0x200]
        ldr     r8, [r4]
        ldr     r2, [sp, #0x10]
        mov     r0, r6
        str     r2, [sp, #0x14]
        mov     r2, #2
        str     r2, [sp, #0x18]
        mov     r1, r8
        bl      __addsf3
        ldr     r9, [r4, #4]
        ldr     r10, [r4, #0x204]
        mov     r5, r0
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        mov     r7, r0
        mov     r1, r6
        mov     r0, r8
        bl      __subsf3
        mov     r8, r0
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        ldr     r10, [r4, #0x400]
        ldr     r1, [r4, #0x600]
        mov     r9, r0
        mov     r0, r10
        str     r1, [sp, #0x30]
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        ldr     r11, [r4, #0x404]
        ldr     r1, [r4, #0x604]
        str     r0, [sp, #0x28]
        mov     r0, r11
        str     r1, [sp, #0x2C]
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        mov     r6, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x2C]
        mov     r10, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        mov     r11, r0
        mov     r0, r5
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r7
        mov     r1, r6
        bl      __addsf3
        str     r0, [r4, #4]
        ldr     r1, [sp, #0x28]
        mov     r0, r5
        bl      __subsf3
        str     r0, [r4, #0x400]
        mov     r0, r7
        mov     r1, r6
        bl      __subsf3
        str     r0, [r4, #0x404]
        mov     r0, r8
        mov     r1, r11
        bl      __subsf3
        str     r0, [r4, #0x200]
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4, #0x204]
        mov     r0, r8
        mov     r1, r11
        bl      __addsf3
        str     r0, [r4, #0x600]
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        str     r0, [r4, #0x604]
        ldr     r8, [sp, #0x14]
LBYX19:
        ldr     r0, [sp, #4]
        add     r4, r4, #8
        add     r8, r8, r0, lsl #2
        ldr     r6, [r8]
        ldr     r0, [sp, #0x18]
        ldr     r7, [r8, #4]
        add     r0, r0, #2
        str     r0, [sp, #0x18]
        ldr     r10, [r4, #0x400]
        ldr     r5, [r4, #0x404]
        mov     r1, r6
        mov     r0, r10
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r7
        mov     r0, r5
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
        mov     r1, r6
        mov     r0, r5
        bl      __mulsf3
        mov     r5, r0
        mov     r1, r7
        mov     r0, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r7, [r8, #8]
        ldr     r10, [r4, #0x200]
        ldr     r6, [r4, #0x204]
        ldr     r11, [r8, #0xC]
        mov     r5, r0
        mov     r0, r10
        mov     r1, r7
        bl      __mulsf3
        str     r0, [sp, #0x30]
        mov     r1, r11
        mov     r0, r6
        bl      __mulsf3
        ldr     r1, [sp, #0x30]
        bl      __addsf3
        str     r0, [sp, #0x30]
        mov     r1, r7
        mov     r0, r6
        bl      __mulsf3
        mov     r6, r0
        mov     r0, r10
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        str     r0, [sp, #0x2C]
        ldr     r0, [r4, #0x600]
        ldr     r11, [r8, #0x10]
        ldr     r7, [r8, #0x14]
        str     r0, [sp, #0x28]
        ldr     r6, [r4, #0x604]
        mov     r1, r11
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r7
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        mov     r10, r0
        mov     r0, r6
        mov     r1, r11
        bl      __mulsf3
        mov     r6, r0
        ldr     r0, [sp, #0x28]
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r6
        bl      __subsf3
        mov     r6, r0
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        mov     r10, r0
        mov     r1, r6
        mov     r0, r5
        bl      __addsf3
        mov     r9, r0
        mov     r1, r6
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x30]
        str     r0, [sp, #0x28]
        ldr     r6, [r4]
        mov     r0, r6
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        mov     r5, r0
        mov     r0, r6
        bl      __subsf3
        ldr     r11, [r4, #4]
        ldr     r1, [sp, #0x2C]
        str     r0, [sp, #0x30]
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        mov     r6, r0
        mov     r0, r11
        bl      __subsf3
        mov     r11, r0
        mov     r1, r7
        mov     r0, r5
        bl      __addsf3
        str     r0, [r4]
        mov     r0, r6
        mov     r1, r9
        bl      __addsf3
        str     r0, [r4, #4]
        mov     r0, r5
        mov     r1, r7
        bl      __subsf3
        str     r0, [r4, #0x400]
        mov     r1, r9
        mov     r0, r6
        bl      __subsf3
        str     r0, [r4, #0x404]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x28]
        bl      __subsf3
        str     r0, [r4, #0x200]
        mov     r0, r11
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4, #0x204]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x28]
        bl      __addsf3
        str     r0, [r4, #0x600]
        mov     r0, r11
        mov     r1, r10
        bl      __subsf3
        str     r0, [r4, #0x604]
        ldr     r0, [sp, #0x18]
        cmp     r0, #0x80
        blt     LBYX19
        ldr     r0, [sp, #0xC]
        sub     r0, r0, #0x12, 24
        add     r4, r4, r0
        ldr     r0, [sp, #8]
        subs    r0, r0, #1
        str     r0, [sp, #8]
        bne     LBYX18
        ldr     r3, [sp]
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
LBYX20:
        movs    r1, r1, asr #10
        beq     LBYX23
        cmp     r1, #1
        mov     r3, r3, asr #9
        blt     LBYX23
        mov     r12, #4
        orr     r12, r12, #6, 22
        mov     lr, #1
        str     lr, [sp, #0xC]
        str     r12, [sp, #4]
        str     r3, [sp, #8]
        str     r1, [sp, #0x14]
        str     r2, [sp, #0x10]
LBYX21:
        ldr     r5, [r6, #0x800]
        ldr     r4, [r6]
        ldr     r11, [sp, #4]
        mov     r1, r5
        add     r8, r6, #1, 20
        sub     r9, r11, #2, 22
        mov     r0, r4
        bl      __addsf3
        ldr     r7, [r6, #0x804]
        str     r0, [sp, #0x30]
        ldr     r2, [r6, #4]
        add     r10, r6, #6, 22
        mov     r1, r7
        str     r2, [sp, #0x2C]
        ldr     r2, [sp, #0x10]
        ldr     r0, [sp, #0x2C]
        str     r2, [sp, #0x18]
        bl      __addsf3
        str     r0, [sp, #0x28]
        mov     r1, r5
        mov     r0, r4
        bl      __subsf3
        str     r0, [sp, #0x24]
        ldr     r0, [sp, #0x2C]
        mov     r1, r7
        bl      __subsf3
        ldr     r5, [r8]
        ldr     r1, [r10]
        str     r0, [sp]
        mov     r0, r5
        str     r1, [sp, #0x2C]
        mov     r1, #2
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        ldr     r7, [r9, +r6]
        ldr     r1, [r11, +r6]
        str     r0, [sp, #0x38]
        mov     r0, r7
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        mov     r4, r0
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x34]
        mov     r5, r0
        mov     r0, r7
        bl      __subsf3
        mov     r7, r0
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x38]
        bl      __addsf3
        str     r0, [r6]
        ldr     r0, [sp, #0x28]
        mov     r1, r4
        bl      __addsf3
        str     r0, [r6, #4]
        ldr     r1, [sp, #0x38]
        ldr     r0, [sp, #0x30]
        bl      __subsf3
        str     r0, [r8]
        ldr     r0, [sp, #0x28]
        mov     r1, r4
        bl      __subsf3
        str     r0, [r9, +r6]
        ldr     r0, [sp, #0x24]
        mov     r1, r7
        bl      __subsf3
        str     r0, [r6, #0x800]
        ldr     r0, [sp]
        mov     r1, r5
        bl      __addsf3
        str     r0, [r6, #0x804]
        ldr     r0, [sp, #0x24]
        mov     r1, r7
        bl      __addsf3
        str     r0, [r10]
        ldr     r0, [sp]
        mov     r1, r5
        bl      __subsf3
        str     r0, [r11, +r6]
        ldr     r5, [sp, #0x18]
LBYX22:
        ldr     r1, [sp, #8]
        ldr     r2, [sp, #0x1C]
        add     r6, r6, #8
        add     r5, r5, r1, lsl #2
        ldr     r9, [r5]
        ldr     r10, [r5, #4]
        add     r2, r2, #2
        str     r2, [sp, #0x1C]
        add     r2, r6, #1, 20
        str     r2, [sp, #0x38]
        ldr     r7, [r2]
        ldr     r2, [sp, #4]
        mov     r1, r9
        mov     r0, r7
        sub     r2, r2, #2, 22
        str     r2, [sp, #0x34]
        ldr     r4, [r2, +r6]
        bl      __mulsf3
        mov     r8, r0
        mov     r1, r10
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        mov     r8, r0
        mov     r0, r4
        mov     r1, r9
        bl      __mulsf3
        mov     r4, r0
        mov     r0, r7
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r11, [r6, #0x800]
        ldr     r9, [r6, #0x804]
        ldr     r7, [r5, #8]
        ldr     r10, [r5, #0xC]
        mov     r4, r0
        add     r2, r6, #6, 22
        mov     r0, r11
        str     r2, [sp, #0x30]
        mov     r1, r7
        bl      __mulsf3
        str     r0, [sp, #0x2C]
        mov     r0, r9
        mov     r1, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        str     r0, [sp, #0x2C]
        mov     r0, r9
        mov     r1, r7
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r11
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     r1, [sp, #0x30]
        str     r0, [sp, #0x28]
        ldr     r0, [r1]
        ldr     r1, [sp, #4]
        str     r0, [sp, #0x24]
        ldr     r11, [r5, #0x10]
        ldr     r10, [r5, #0x14]
        ldr     r9, [r1, +r6]
        mov     r1, r11
        bl      __mulsf3
        mov     r7, r0
        mov     r0, r9
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        mov     r7, r0
        mov     r0, r9
        mov     r1, r11
        bl      __mulsf3
        mov     r9, r0
        ldr     r0, [sp, #0x24]
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        mov     r9, r0
        mov     r0, r8
        mov     r1, r7
        bl      __addsf3
        str     r0, [sp, #0x24]
        mov     r0, r8
        mov     r1, r7
        bl      __subsf3
        mov     r7, r0
        mov     r0, r4
        mov     r1, r9
        bl      __addsf3
        mov     r8, r0
        mov     r0, r4
        mov     r1, r9
        bl      __subsf3
        ldr     r9, [r6]
        ldr     r1, [sp, #0x2C]
        str     r0, [sp]
        mov     r0, r9
        bl      __addsf3
        ldr     r1, [sp, #0x2C]
        mov     r4, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r11, [r6, #4]
        ldr     r1, [sp, #0x28]
        mov     r9, r0
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x28]
        mov     r10, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x24]
        mov     r11, r0
        mov     r0, r4
        bl      __addsf3
        str     r0, [r6]
        mov     r0, r10
        mov     r1, r8
        bl      __addsf3
        str     r0, [r6, #4]
        ldr     r1, [sp, #0x24]
        mov     r0, r4
        bl      __subsf3
        ldr     r2, [sp, #0x38]
        mov     r1, r8
        str     r0, [r2]
        mov     r0, r10
        bl      __subsf3
        ldr     r2, [sp, #0x34]
        str     r0, [r2, +r6]
        ldr     r1, [sp]
        mov     r0, r9
        bl      __subsf3
        str     r0, [r6, #0x800]
        mov     r0, r11
        mov     r1, r7
        bl      __addsf3
        str     r0, [r6, #0x804]
        ldr     r1, [sp]
        mov     r0, r9
        bl      __addsf3
        ldr     r2, [sp, #0x30]
        mov     r1, r7
        str     r0, [r2]
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #4]
        str     r0, [r1, +r6]
        ldr     r1, [sp, #0x1C]
        cmp     r1, #2, 24
        blt     LBYX22
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x14]
        add     r1, r1, #1
        str     r1, [sp, #0xC]
        cmp     r1, r2
        ldr     r1, [sp, #4]
        add     r1, r1, #4
        add     r6, r6, r1
        ble     LBYX21
LBYX23:
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}


