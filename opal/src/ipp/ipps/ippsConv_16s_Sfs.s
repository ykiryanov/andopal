        .text
        .align  4
        .globl  _ippsConv_16s_Sfs


_ippsConv_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r9, r3
        ldr     r7, [sp, #0x60]
        ldr     r6, [sp, #0x64]
        mov     r11, r1
        add     r12, r11, r9
        mov     r10, r0
        mov     r8, r2
        sub     r4, r12, #1
        cmp     r10, #0
        mov     lr, r9
        mov     r12, r8
        beq     LCXI18
        cmp     r8, #0
        beq     LCXI18
        cmp     r7, #0
        beq     LCXI18
        cmp     r11, #0
        ble     LCXI17
        cmp     r9, #0
        ble     LCXI17
        cmp     r11, r9
        bge     LCXI0
        mov     r9, r11
        mov     r8, r10
        mov     r11, lr
        mov     r10, r12
LCXI0:
        mov     r0, r4
        bl      _ippsMalloc_64s
        mov     r5, r0
        cmp     r5, #0
        beq     LCXI19
        mov     r1, r4
        mov     r0, r5
        bl      _ippsZero_64s
        cmp     r9, #0
        ble     LCXI5
        mov     r12, #0
        str     r10, [sp, #0x20]
LCXI1:
        cmp     r11, #0
        ble     LCXI16
        cmp     r11, #5
        blt     LCXI15
        add     r2, r5, r12, lsl #3
        mov     r0, r12, lsl #1
        str     r12, [sp, #0xC]
        ldr     r12, [sp, #0x20]
        mov     r1, #0
        sub     r3, r11, #5
        sub     r10, r2, #0x1C
        mov     lr, r1
        str     r7, [sp, #8]
        str     r3, [sp]
        str     r5, [sp, #4]
        str     r4, [sp, #0x10]
        str     r6, [sp, #0x14]
        str     r9, [sp, #0x18]
        str     r11, [sp, #0x1C]
LCXI2:
        ldrsh   r3, [r12, +lr]
        ldrsh   r5, [r8, +r0]
        ldr     r9, [r10, #0x1C]
        ldr     r4, [r10, #0x20]
        add     r6, r1, #2
        mul     r3, r5, r3
        add     r7, r1, #3
        str     r4, [sp, #0x24]
        add     r4, r1, #1
        add     lr, lr, #8
        adds    r9, r9, r3
        str     r9, [sp, #0x28]
        ldr     r9, [sp, #0x24]
        add     r5, r2, r4, lsl #3
        mov     r11, r4, lsl #1
        adc     r3, r9, r3, asr #31
        ldr     r9, [sp, #0x28]
        str     r3, [r10, #0x20]
        add     r1, r1, #4
        str     r9, [r10, #0x1C]
        ldrsh   r9, [r12, +r11]
        ldr     r3, [r2, +r4, lsl #3]
        ldrsh   r11, [r8, +r0]
        add     r10, r10, #0x20
        str     r3, [sp, #0x28]
        mul     r9, r11, r9
        ldr     r3, [r5, #4]
        ldr     r11, [sp, #0x28]
        str     r9, [sp, #0x2C]
        mov     r9, r6, lsl #1
        str     r9, [sp, #0x30]
        add     r9, r2, r7, lsl #3
        str     r9, [sp, #0x34]
        mov     r9, r7, lsl #1
        str     r9, [sp, #0x38]
        ldr     r9, [sp, #0x2C]
        str     r3, [sp, #0x24]
        add     r3, r2, r6, lsl #3
        adds    r9, r11, r9
        str     r9, [r2, +r4, lsl #3]
        ldr     r4, [sp, #0x2C]
        ldr     r9, [sp, #0x24]
        adc     r4, r9, r4, asr #31
        str     r4, [r5, #4]
        ldr     r4, [sp, #0x30]
        ldrsh   r9, [r8, +r0]
        ldrsh   r5, [r12, +r4]
        ldr     r4, [r2, +r6, lsl #3]
        mul     r5, r9, r5
        str     r4, [sp, #0x30]
        ldr     r9, [sp, #0x30]
        ldr     r4, [r3, #4]
        adds    r9, r9, r5
        str     r9, [r2, +r6, lsl #3]
        adc     r5, r4, r5, asr #31
        str     r5, [r3, #4]
        ldr     r3, [sp, #0x38]
        ldrsh   r6, [r8, +r0]
        ldr     r4, [r2, +r7, lsl #3]
        ldrsh   r5, [r12, +r3]
        ldr     r3, [sp, #0x34]
        mul     r5, r6, r5
        ldr     r3, [r3, #4]
        adds    r4, r4, r5
        str     r4, [r2, +r7, lsl #3]
        adc     r5, r3, r5, asr #31
        ldr     r3, [sp]
        cmp     r1, r3
        ldr     r3, [sp, #0x34]
        str     r5, [r3, #4]
        ble     LCXI2
        str     r12, [sp, #0x20]
        ldr     r7, [sp, #8]
        ldr     r12, [sp, #0xC]
        ldr     r5, [sp, #4]
        ldr     r4, [sp, #0x10]
        ldr     r6, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
LCXI3:
        ldr     r3, [sp, #0x20]
        mov     lr, r1, lsl #3
        sub     lr, lr, #4
        add     lr, lr, r2
        mov     r10, r1, lsl #1
        str     r5, [sp, #4]
        str     r4, [sp, #0x10]
        str     r6, [sp, #0x14]
        str     r9, [sp, #0x18]
LCXI4:
        ldrsh   r6, [r0, +r8]
        ldrsh   r9, [r3, +r10]
        ldr     r4, [r2, +r1, lsl #3]
        ldr     r5, [lr, #8]
        add     r10, r10, #2
        mul     r6, r6, r9
        adds    r4, r4, r6
        str     r4, [r2, +r1, lsl #3]
        add     r1, r1, #1
        adc     r6, r5, r6, asr #31
        str     r6, [lr, #8]!
        cmp     r1, r11
        blt     LCXI4
        ldr     r9, [sp, #0x18]
        ldr     r5, [sp, #4]
        ldr     r4, [sp, #0x10]
        ldr     r6, [sp, #0x14]
        add     r12, r12, #1
        cmp     r12, r9
        str     r3, [sp, #0x20]
        blt     LCXI1
LCXI5:
        mvn     r3, #0xFF
        cmp     r6, #0
        bic     r12, r3, #0x7F, 24
        mvn     r0, #0
        mov     r8, #0
        ble     LCXI9
        cmp     r4, #0
        ble     LCXI8
        mov     r11, r5
        str     r5, [sp, #4]
        mov     r9, r6, asr #31
        mvn     r10, r12
        str     r12, [sp, #0x20]
        mov     r5, r0
LCXI6:
        ldr     r0, [r11]
        ldr     r1, [r11, #4]
        mov     r3, r9
        mov     r2, r6
        bl      __ashrdi3
        subs    r12, r0, r10
        sbcs    lr, r1, #0
        movlt   r12, #0
        movlt   lr, #0
        orrs    lr, r12, lr
        ldrne   r12, [sp, #0x20]
        mvnne   r0, r12
        bne     LCXI7
        mov     r12, #0
        sub     lr, r12, #2, 18
        cmp     r0, lr
        sbcs    r1, r1, r5
        sublt   r0, r12, #2, 18
LCXI7:
        add     r8, r8, #1
        strh    r0, [r7], #2
        cmp     r8, r4
        add     r11, r11, #8
        blt     LCXI6
        ldr     r5, [sp, #4]
LCXI8:
        mov     r0, r5
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCXI9:
        cmp     r6, #0
        bne     LCXI12
        cmp     r4, #0
        ble     LCXI8
        mov     lr, r8
        mvn     r3, r12
        mov     r2, r5
LCXI10:
        ldr     r9, [r2]
        ldr     r6, [r2, #4]
        subs    r10, r9, r3
        sbcs    r11, r6, #0
        movlt   r10, #0
        movlt   r11, #0
        orrs    r11, r10, r11
        mvnne   r9, r12
        bne     LCXI11
        sub     r10, r8, #2, 18
        cmp     r9, r10
        sbcs    r6, r6, r0
        sublt   r9, r8, #2, 18
LCXI11:
        add     lr, lr, #1
        strh    r9, [r7], #2
        cmp     lr, r4
        add     r2, r2, #8
        blt     LCXI10
        b       LCXI8
LCXI12:
        cmp     r4, #0
        rsb     r2, r6, #0
        ble     LCXI8
        mov     r10, r5
        str     r5, [sp, #4]
        mvn     r6, r12
        mov     r11, r8
        sub     r9, r8, #2, 18
        str     r2, [sp]
        mov     r5, r0
LCXI13:
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        sub     r2, r8, #2, 18
        cmp     r0, r2
        sbcs    r2, r1, r5
        strlth  r9, [r7]
        blt     LCXI14
        subs    r3, r0, r6
        sbcs    r2, r1, #0
        movlt   r3, #0
        movlt   r2, #0
        orrs    r2, r3, r2
        strneh  r6, [r7]
        bne     LCXI14
        ldr     r2, [sp]
        mov     r3, #0
        bl      __ashldi3
        mov     r2, #0
        sub     r2, r2, #2, 18
        cmp     r0, r2
        sbcs    r2, r1, r5
        strlth  r9, [r7]
        blt     LCXI14
        subs    r2, r0, r6
        sbcs    r1, r1, #0
        movlt   r2, #0
        movlt   r1, #0
        orrs    r1, r2, r1
        streqh  r0, [r7]
        strneh  r6, [r7]
LCXI14:
        add     r11, r11, #1
        cmp     r11, r4
        add     r10, r10, #8
        add     r7, r7, #2
        blt     LCXI13
        ldr     r5, [sp, #4]
        b       LCXI8
LCXI15:
        mov     r1, #0
        add     r2, r5, r12, lsl #3
        mov     r0, r12, lsl #1
        b       LCXI3
LCXI16:
        add     r12, r12, #1
        cmp     r12, r9
        blt     LCXI1
        b       LCXI5
LCXI17:
        mvn     r0, #5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCXI18:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LCXI19:
        mvn     r0, #8
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}


