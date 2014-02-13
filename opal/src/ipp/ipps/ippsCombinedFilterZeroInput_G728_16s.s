        .text
        .align  4
        .globl  _ippsCombinedFilterZeroInput_G728_16s


_ippsCombinedFilterZeroInput_G728_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x60
        add     lr, sp, #0x34
        and     lr, lr, #0xF
        rsb     lr, lr, #0
        mov     r6, r0
        add     r12, sp, #0x34
        and     lr, lr, #0xF
        cmp     r6, #0
        add     r5, r12, lr
        mov     r0, r1
        beq     LDGF28
        cmp     r0, #0
        beq     LDGF28
        cmp     r2, #0
        beq     LDGF28
        cmp     r3, #0
        beq     LDGF28
        ldrsh   r12, [r3, #0x70]
        ldrsh   lr, [r3, #0x72]
        add     r9, r3, #0x90
        mov     r10, r12
        cmp     lr, r10
        movlt   r10, lr
        ldrsh   lr, [r3, #0x74]
        cmp     lr, r10
        movlt   r10, lr
        ldrsh   lr, [r3, #0x76]
        cmp     lr, r10
        movlt   r10, lr
        ldrsh   lr, [r3, #0x78]
        cmp     lr, r10
        movlt   r10, lr
        ldrsh   lr, [r3, #0x7A]
        cmp     lr, r10
        movlt   r10, lr
        ldrsh   lr, [r3, #0x7C]
        cmp     lr, r10
        movlt   r10, lr
        ldrsh   lr, [r3, #0x7E]
        cmp     lr, r10
        movlt   r10, lr
        ldrsh   lr, [r3, #0x80]
        cmp     lr, r10
        movlt   r10, lr
        ldrsh   lr, [r3, #0x82]
        cmp     lr, r10
        strgeh  r10, [r3, #0x84]
        strlth  lr, [r3, #0x84]
        movlt   r10, lr
        sub     lr, r10, #2
        mvn     r4, #0xFF
        mov     lr, lr, lsl #16
        bic     r7, r4, #0x7F, 24
        mov     r4, lr, asr #16
        sub     lr, r12, r10
        mvn     r12, r7
        mov     r8, #0
        mov     r7, r5
        str     r10, [sp, #0x1C]
        str     r9, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     r2, [sp, #0xC]
        str     r0, [sp, #8]
        str     r6, [sp, #0x2C]
LDGF0:
        cmp     r8, #0
        ble     LDGF27
        cmp     r8, #5
        add     r1, sp, #0x54
        blt     LDGF26
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x2C]
        mov     r9, #0
        mov     r5, r9
        rsb     r6, r8, #0
        mov     r0, r5
        sub     r2, r8, #5
        add     r1, r1, r6, lsl #1
        str     lr, [sp, #0x28]
        str     r4, [sp, #0x24]
        str     r8, [sp, #0x20]
LDGF1:
        add     lr, r5, #1
        mov     r4, r5, lsl #1
        ldrsh   r4, [r3, +r4]
        mov     lr, lr, lsl #16
        add     r5, r1, r5, lsl #1
        ldrsh   r8, [r5, #0xA]
        mov     lr, lr, asr #16
        add     r5, lr, #1
        mov     r10, lr, lsl #1
        mul     r8, r8, r4
        ldrsh   r4, [r3, +r10]
        add     lr, r1, lr, lsl #1
        ldrsh   r10, [lr, #0xA]
        mov     r5, r5, lsl #16
        sub     r0, r0, r8
        mov     lr, r5, asr #16
        mul     r4, r10, r4
        add     r5, lr, #1
        add     r9, r9, #4
        mov     r8, r5, lsl #16
        mov     r5, lr, lsl #1
        ldrsh   r5, [r3, +r5]
        add     lr, r1, lr, lsl #1
        ldrsh   r11, [lr, #0xA]
        mov     r8, r8, asr #16
        sub     r0, r0, r4
        mov     lr, r8, lsl #1
        mul     r5, r11, r5
        ldrsh   lr, [r3, +lr]
        add     r10, r1, r8, lsl #1
        ldrsh   r10, [r10, #0xA]
        add     r8, r8, #1
        sub     r0, r0, r5
        mov     r8, r8, lsl #16
        mul     lr, r10, lr
        cmp     r9, r2
        mov     r5, r8, asr #16
        sub     r0, r0, lr
        ble     LDGF1
        str     r3, [sp, #0x2C]
        ldr     lr, [sp, #0x28]
        ldr     r4, [sp, #0x24]
        ldr     r8, [sp, #0x20]
        ldr     r3, [sp, #0x10]
LDGF2:
        ldr     r11, [sp, #0x2C]
LDGF3:
        mov     r2, r5, lsl #1
        ldrsh   r10, [r11, +r2]
        add     r2, r1, r5, lsl #1
        ldrsh   r2, [r2, #0xA]
        add     r5, r5, #1
        add     r9, r9, #1
        mul     r10, r2, r10
        mov     r5, r5, lsl #16
        cmp     r9, r8
        mov     r5, r5, asr #16
        sub     r0, r0, r10
        blt     LDGF3
        str     r11, [sp, #0x2C]
LDGF4:
        str     r12, [sp, #0x30]
        str     lr, [sp, #0x28]
        ldr     r12, [sp, #0x1C]
        ldr     lr, [sp, #0x2C]
        mov     r2, #9
        add     r9, r3, r6, lsl #1
        add     r1, r3, #0x82
        str     r4, [sp, #0x24]
        str     r8, [sp, #0x20]
        str     r3, [sp, #0x10]
LDGF5:
        add     r4, r5, #1
        ldrsh   r3, [r1], #-2
        mov     r8, r4, lsl #16
        mov     r5, r5, lsl #1
        ldrsh   r4, [lr, +r5]
        ldrsh   r10, [r9, +r5]
        mov     r11, r8, asr #16
        add     r5, r11, #1
        mul     r8, r10, r4
        mov     r11, r11, lsl #1
        ldrsh   r4, [r9, +r11]
        ldrsh   r10, [lr, +r11]
        mov     r11, r5, lsl #16
        rsb     r5, r8, #0
        mov     r8, r11, asr #16
        mul     r11, r4, r10
        add     r4, r8, #1
        mov     r8, r8, lsl #1
        ldrsh   r10, [lr, +r8]
        ldrsh   r8, [r9, +r8]
        mov     r4, r4, lsl #16
        sub     r5, r5, r11
        mul     r10, r8, r10
        mov     r4, r4, asr #16
        add     r8, r4, #1
        mov     r4, r4, lsl #1
        ldrsh   r11, [lr, +r4]
        ldrsh   r4, [r9, +r4]
        mov     r8, r8, lsl #16
        sub     r5, r5, r10
        mul     r11, r4, r11
        mov     r4, r8, asr #16
        add     r8, r4, #1
        mov     r4, r4, lsl #1
        ldrsh   r10, [r9, +r4]
        ldrsh   r4, [lr, +r4]
        sub     r11, r5, r11
        mov     r8, r8, lsl #16
        mul     r4, r10, r4
        sub     r2, r2, #1
        sub     r3, r3, r12
        cmp     r2, #0
        mov     r5, r8, asr #16
        sub     r11, r11, r4
        add     r0, r0, r11, asr r3
        bgt     LDGF5
        ldr     r8, [sp, #0x20]
        ldr     r12, [sp, #0x30]
        ldr     lr, [sp, #0x28]
        ldr     r4, [sp, #0x24]
        ldr     r3, [sp, #0x10]
        rsb     r11, r8, #5
        cmp     r11, #0
        movle   r1, #0
        ble     LDGF9
        add     r1, r6, #5
        cmp     r1, #5
        movlt   r10, #0
        movlt   r1, r10
        blt     LDGF7
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x2C]
        mov     r10, #0
        mov     r1, r10
        rsb     r2, r8, #0
        str     lr, [sp, #0x28]
        str     r4, [sp, #0x24]
        str     r8, [sp, #0x20]
LDGF6:
        mov     lr, r5, lsl #1
        add     r4, r5, #1
        ldrsh   r5, [r3, +lr]
        ldrsh   lr, [r9, +lr]
        mov     r4, r4, lsl #16
        add     r10, r10, #4
        mov     r4, r4, asr #16
        mul     r8, lr, r5
        add     lr, r4, #1
        mov     r4, r4, lsl #1
        ldrsh   r5, [r3, +r4]
        ldrsh   r4, [r9, +r4]
        mov     lr, lr, lsl #16
        sub     r1, r1, r8
        mul     r5, r4, r5
        mov     lr, lr, asr #16
        add     r4, lr, #1
        mov     lr, lr, lsl #1
        ldrsh   r8, [r3, +lr]
        ldrsh   lr, [r9, +lr]
        mov     r4, r4, lsl #16
        sub     r1, r1, r5
        mul     r8, lr, r8
        mov     lr, r4, asr #16
        add     r4, lr, #1
        mov     lr, lr, lsl #1
        ldrsh   r5, [r9, +lr]
        ldrsh   lr, [r3, +lr]
        sub     r1, r1, r8
        mov     r4, r4, lsl #16
        mul     lr, r5, lr
        cmp     r10, r2
        mov     r5, r4, asr #16
        sub     r1, r1, lr
        ble     LDGF6
        str     r3, [sp, #0x2C]
        ldr     lr, [sp, #0x28]
        ldr     r4, [sp, #0x24]
        ldr     r8, [sp, #0x20]
        ldr     r3, [sp, #0x10]
LDGF7:
        str     r8, [sp, #0x20]
        ldr     r8, [sp, #0x2C]
        str     r3, [sp, #0x10]
LDGF8:
        mov     r2, r5, lsl #1
        ldrsh   r3, [r9, +r2]
        ldrsh   r2, [r8, +r2]
        add     r5, r5, #1
        add     r10, r10, #1
        mov     r5, r5, lsl #16
        mul     r2, r3, r2
        cmp     r10, r11
        mov     r5, r5, asr #16
        sub     r1, r1, r2
        blt     LDGF8
        ldr     r8, [sp, #0x20]
        ldr     r3, [sp, #0x10]
LDGF9:
        add     r1, r0, r1, asr lr
        mov     r0, r1, asr #14
        cmp     r12, r0
        movlt   r0, #0xFF
        orrlt   r0, r0, #0x7F, 24
        blt     LDGF10
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        mvnlt   r0, #0xFF
        biclt   r0, r0, #0x7F, 24
LDGF10:
        add     r1, sp, #0x54
        add     r6, r1, r6, lsl #1
        cmp     r4, #0
        strh    r0, [r6, #8]
        rsblt   r1, r4, #0
        movlt   r0, r0, lsl r1
        movge   r0, r0, asr r4
        add     r8, r8, #1
        strh    r0, [r7], #2
        cmp     r8, #5
        blt     LDGF0
        ldr     r9, [sp, #0x18]
        ldr     r5, [sp, #0x14]
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #8]
        sub     r4, r3, #0xA
        mov     r6, #0x31
        add     lr, r4, #0x62
        add     r12, r3, #0x62
LDGF11:
        ldrsh   r7, [lr], #-6
        sub     r8, r6, #1
        strh    r7, [r12], #-6
        mov     r8, r8, lsl #16
        mov     r7, r8, asr #15
        ldrsh   r8, [r4, +r7]
        sub     r10, r6, #2
        sub     r6, r6, #3
        strh    r8, [r3, +r7]
        mov     r10, r10, lsl #16
        cmp     r6, #4
        mov     r7, r10, asr #15
        ldrsh   r8, [r4, +r7]
        strh    r8, [r3, +r7]
        bgt     LDGF11
        add     r12, sp, #0x54
        ldrsh   r12, [r12]
        add     r4, sp, #0x54
        ldrsh   r7, [r4, #4]
        add     r6, sp, #0x54
        ldrsh   r8, [r6, #2]
        strh    r12, [r3]
        add     r4, sp, #0x54
        ldrsh   r10, [r4, #8]
        mov     r12, r12, lsl #16
        add     lr, sp, #0x54
        ldrsh   lr, [lr, #6]
        mov     r12, r12, asr #16
        mov     r6, r12
        mov     r4, r6
        cmp     r12, r4
        strh    r8, [r3, #2]
        strh    r7, [r3, #4]
        strh    lr, [r3, #6]
        strh    r10, [r3, #8]
        movgt   r6, r12
        cmp     r12, r4
        movlt   r4, r12
        cmp     r8, r6
        movgt   r6, r8
        cmp     r8, r4
        movlt   r4, r8
        cmp     r7, r6
        movgt   r6, r7
        cmp     r7, r4
        movlt   r4, r7
        cmp     lr, r6
        movgt   r6, lr
        cmp     lr, r4
        movlt   r4, lr
        cmp     r10, r6
        movgt   r6, r10
        cmp     r10, r4
        movlt   r4, r10
        orrs    r7, r6, r4
        mov     lr, #0
        bne     LDGF12
        strh    lr, [r3]
        strh    lr, [r3, #2]
        strh    lr, [r3, #4]
        strh    lr, [r3, #6]
        strh    lr, [r3, #8]
        mov     lr, #0xE
        b       LDGF25
LDGF12:
        cmp     r6, #0
        blt     LDGF13
        rsb     r7, r6, #0
        cmp     r4, r7
        bge     LDGF19
LDGF13:
        cmn     r4, #1, 18
        bge     LDGF16
        cmn     r4, #1, 18
        bge     LDGF15
LDGF14:
        mov     r4, r4, asr #1
        add     lr, lr, #1
        mov     r4, r4, lsl #16
        mov     lr, lr, lsl #16
        mov     r4, r4, asr #16
        cmn     r4, #1, 18
        mov     lr, lr, asr #16
        blt     LDGF14
LDGF15:
        ldrsh   r8, [r3, #2]
        ldrsh   r7, [r3, #4]
        ldrsh   r4, [r3, #6]
        ldrsh   r6, [r3, #8]
        mov     r12, r12, asr lr
        strh    r12, [r3]
        rsb     r12, lr, #0
        mov     r8, r8, asr lr
        mov     r7, r7, asr lr
        mov     r4, r4, asr lr
        mov     lr, r6, asr lr
        mov     r12, r12, lsl #16
        strh    lr, [r3, #8]
        strh    r8, [r3, #2]
        strh    r7, [r3, #4]
        strh    r4, [r3, #6]
        mov     lr, r12, asr #16
        b       LDGF25
LDGF16:
        cmn     r4, #2, 20
        blt     LDGF18
LDGF17:
        mov     r4, r4, lsl #1
        add     lr, lr, #1
        mov     r4, r4, lsl #16
        mov     lr, lr, lsl #16
        mov     r4, r4, asr #16
        cmn     r4, #2, 20
        mov     lr, lr, asr #16
        bge     LDGF17
LDGF18:
        ldrsh   r8, [r3, #2]
        ldrsh   r7, [r3, #4]
        ldrsh   r6, [r3, #6]
        ldrsh   r4, [r3, #8]
        mov     r12, r12, lsl lr
        mov     r8, r8, lsl lr
        mov     r7, r7, lsl lr
        mov     r6, r6, lsl lr
        mov     r4, r4, lsl lr
        strh    r12, [r3]
        strh    r8, [r3, #2]
        strh    r7, [r3, #4]
        strh    r6, [r3, #6]
        strh    r4, [r3, #8]
        b       LDGF25
LDGF19:
        mov     r4, #0xFF
        orr     r4, r4, #0x7F, 24
        sub     r7, r4, #1, 18
        cmp     r7, r6
        bge     LDGF22
        sub     r4, r4, #1, 18
        cmp     r4, r6
        bge     LDGF21
        sub     r4, lr, #2, 18
        mvn     r4, r4
        sub     r4, r4, #1, 18
LDGF20:
        mov     r6, r6, asr #1
        add     lr, lr, #1
        mov     r6, r6, lsl #16
        mov     lr, lr, lsl #16
        mov     r6, r6, asr #16
        cmp     r4, r6
        mov     lr, lr, asr #16
        blt     LDGF20
LDGF21:
        ldrsh   r8, [r3, #2]
        ldrsh   r7, [r3, #4]
        ldrsh   r4, [r3, #6]
        ldrsh   r6, [r3, #8]
        mov     r12, r12, asr lr
        strh    r12, [r3]
        rsb     r12, lr, #0
        mov     r8, r8, asr lr
        mov     r7, r7, asr lr
        mov     r4, r4, asr lr
        mov     lr, r6, asr lr
        mov     r12, r12, lsl #16
        strh    lr, [r3, #8]
        strh    r8, [r3, #2]
        strh    r7, [r3, #4]
        strh    r4, [r3, #6]
        mov     lr, r12, asr #16
        b       LDGF25
LDGF22:
        cmp     r6, #2, 20
        bge     LDGF24
LDGF23:
        mov     r6, r6, lsl #1
        add     lr, lr, #1
        mov     r4, r6, lsl #16
        mov     lr, lr, lsl #16
        mov     r6, r4, asr #16
        cmp     r6, #2, 20
        mov     lr, lr, asr #16
        blt     LDGF23
LDGF24:
        ldrsh   r8, [r3, #2]
        ldrsh   r7, [r3, #4]
        ldrsh   r6, [r3, #6]
        ldrsh   r4, [r3, #8]
        mov     r12, r12, lsl lr
        mov     r8, r8, lsl lr
        mov     r7, r7, lsl lr
        mov     r6, r6, lsl lr
        mov     r4, r4, lsl lr
        strh    r12, [r3]
        strh    r8, [r3, #2]
        strh    r7, [r3, #4]
        strh    r6, [r3, #6]
        strh    r4, [r3, #8]
LDGF25:
        ldrsh   r4, [r3, #0x72]
        ldrsh   r12, [r3, #0x74]
        ldrsh   r6, [r3, #0x84]
        strh    r4, [r3, #0x70]
        ldrsh   r4, [r3, #0x7A]
        strh    r12, [r3, #0x72]
        ldrsh   r12, [r3, #0x78]
        add     lr, r6, lr
        ldrsh   r6, [r3, #0x76]
        strh    r4, [r3, #0x78]
        strh    r12, [r3, #0x76]
        ldrsh   r12, [r3, #0x7C]
        ldrsh   r4, [r3, #0x7E]
        strh    r6, [r3, #0x74]
        strh    r12, [r3, #0x7A]
        ldrsh   r12, [r3, #0x80]
        strh    r4, [r3, #0x7C]
        ldrsh   r4, [r3, #0x82]
        mov     lr, lr, lsl #16
        strh    r12, [r3, #0x7E]
        strh    r4, [r3, #0x80]
        mov     lr, lr, asr #16
        strh    lr, [r3, #0x84]
        mov     r12, lr, lsl #16
        mov     r12, r12, asr #16
        strh    r12, [r3, #0x82]
        str     r9, [sp]
        mov     r1, r5
        mov     r3, #5
        bl      _ippsIIR16s_G728_16s
        mov     r0, #0
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}
LDGF26:
        mov     r9, #0
        mov     r5, r9
        rsb     r6, r8, #0
        mov     r0, r5
        add     r1, r1, r6, lsl #1
        b       LDGF2
LDGF27:
        mov     r0, #0
        mov     r5, r0
        rsb     r6, r8, #0
        b       LDGF4
LDGF28:
        mvn     r0, #7
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r11, pc}


