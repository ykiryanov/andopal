        .text
        .align  4
        .globl  _ippsSyntesisFilterZeroInput_G728_16s


_ippsSyntesisFilterZeroInput_G728_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        ldr     r6, [sp, #0x68]
        ldr     r12, [sp, #0x6C]
        cmp     r0, #0
        beq     LDFX60
        cmp     r1, #0
        beq     LDFX60
        cmp     r3, #0
        beq     LDFX60
        cmp     r6, #0
        beq     LDFX60
        cmp     r12, #0
        beq     LDFX60
        ldrsh   lr, [r12, #0x70]
        ldrsh   r4, [r12, #0x72]
        mov     r9, lr
        cmp     r4, r9
        movlt   r9, r4
        ldrsh   r4, [r12, #0x74]
        cmp     r4, r9
        movlt   r9, r4
        ldrsh   r4, [r12, #0x76]
        cmp     r4, r9
        movlt   r9, r4
        ldrsh   r4, [r12, #0x78]
        cmp     r4, r9
        movlt   r9, r4
        ldrsh   r4, [r12, #0x7A]
        cmp     r4, r9
        movlt   r9, r4
        ldrsh   r4, [r12, #0x7C]
        cmp     r4, r9
        movlt   r9, r4
        ldrsh   r4, [r12, #0x7E]
        cmp     r4, r9
        movlt   r9, r4
        ldrsh   r4, [r12, #0x80]
        cmp     r4, r9
        movlt   r9, r4
        ldrsh   r4, [r12, #0x82]
        cmp     r4, r9
        strgeh  r9, [r12, #0x84]
        strlth  r4, [r12, #0x84]
        movlt   r9, r4
        sub     r4, r9, #2
        mvn     r5, #0xFF
        mov     r4, r4, lsl #16
        bic     r7, r5, #0x7F, 24
        mov     r5, r4, asr #16
        sub     r4, lr, r9
        mov     r8, #0
        mvn     lr, r7
        mov     r7, r8
        str     r9, [sp, #0x14]
        str     r6, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
        str     r1, [sp]
        str     r0, [sp, #0x24]
LDFX0:
        cmp     r7, #0
        ble     LDFX59
        cmp     r7, #5
        add     r1, sp, #0x2C
        blt     LDFX58
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x24]
        mov     r9, #0
        mov     r3, r9
        rsb     r6, r7, #0
        mov     r0, r3
        sub     r2, r7, #5
        add     r1, r1, r6, lsl #1
        str     r5, [sp, #0x20]
        str     r7, [sp, #0x1C]
        str     r8, [sp, #0x18]
LDFX1:
        add     r7, r3, #1
        mov     r5, r3, lsl #1
        ldrsh   r5, [r12, +r5]
        add     r3, r1, r3, lsl #1
        ldrsh   r8, [r3, #0xA]
        mov     r7, r7, lsl #16
        add     r9, r9, #4
        mov     r3, r7, asr #16
        mul     r8, r8, r5
        add     r7, r3, #1
        mov     r10, r3, lsl #1
        ldrsh   r5, [r12, +r10]
        add     r3, r1, r3, lsl #1
        ldrsh   r10, [r3, #0xA]
        mov     r7, r7, lsl #16
        sub     r0, r0, r8
        mov     r3, r7, asr #16
        mul     r5, r10, r5
        add     r7, r3, #1
        cmp     r9, r2
        mov     r8, r7, lsl #16
        mov     r7, r3, lsl #1
        ldrsh   r7, [r12, +r7]
        add     r3, r1, r3, lsl #1
        ldrsh   r11, [r3, #0xA]
        mov     r8, r8, asr #16
        sub     r0, r0, r5
        mov     r3, r8, lsl #1
        mul     r7, r11, r7
        ldrsh   r3, [r12, +r3]
        add     r10, r1, r8, lsl #1
        ldrsh   r10, [r10, #0xA]
        add     r8, r8, #1
        sub     r0, r0, r7
        mov     r8, r8, lsl #16
        mul     r3, r10, r3
        sub     r0, r0, r3
        mov     r3, r8, asr #16
        ble     LDFX1
        str     r12, [sp, #0x24]
        ldr     r5, [sp, #0x20]
        ldr     r7, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r12, [sp, #0x10]
LDFX2:
        ldr     r11, [sp, #0x24]
LDFX3:
        mov     r2, r3, lsl #1
        ldrsh   r10, [r11, +r2]
        add     r2, r1, r3, lsl #1
        ldrsh   r2, [r2, #0xA]
        add     r3, r3, #1
        add     r9, r9, #1
        mul     r10, r2, r10
        mov     r3, r3, lsl #16
        cmp     r9, r7
        mov     r3, r3, asr #16
        sub     r0, r0, r10
        blt     LDFX3
        str     r11, [sp, #0x24]
LDFX4:
        str     r4, [sp, #0x28]
        str     r5, [sp, #0x20]
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x24]
        mov     r2, #9
        add     r9, r12, r6, lsl #1
        add     r1, r12, #0x82
        str     r7, [sp, #0x1C]
        str     r8, [sp, #0x18]
        str     r12, [sp, #0x10]
LDFX5:
        ldrsh   r12, [r1], #-2
        mov     r8, r3, lsl #1
        add     r7, r3, #1
        ldrsh   r3, [r5, +r8]
        ldrsh   r8, [r9, +r8]
        mov     r7, r7, lsl #16
        sub     r2, r2, #1
        mul     r8, r8, r3
        mov     r10, r7, asr #16
        add     r7, r10, #1
        mov     r3, r10, lsl #1
        ldrsh   r10, [r5, +r3]
        ldrsh   r3, [r9, +r3]
        mov     r11, r7, lsl #16
        rsb     r7, r8, #0
        sub     r12, r12, r4
        mov     r8, r11, asr #16
        mul     r11, r3, r10
        add     r3, r8, #1
        mov     r8, r8, lsl #1
        ldrsh   r10, [r5, +r8]
        ldrsh   r8, [r9, +r8]
        mov     r3, r3, lsl #16
        sub     r7, r7, r11
        mul     r10, r8, r10
        mov     r3, r3, asr #16
        add     r8, r3, #1
        mov     r3, r3, lsl #1
        ldrsh   r11, [r5, +r3]
        ldrsh   r3, [r9, +r3]
        mov     r8, r8, lsl #16
        sub     r7, r7, r10
        mul     r11, r3, r11
        mov     r3, r8, asr #16
        add     r8, r3, #1
        mov     r3, r3, lsl #1
        ldrsh   r10, [r9, +r3]
        ldrsh   r3, [r5, +r3]
        sub     r7, r7, r11
        mov     r8, r8, lsl #16
        mul     r10, r10, r3
        cmp     r2, #0
        mov     r3, r8, asr #16
        sub     r7, r7, r10
        add     r0, r0, r7, asr r12
        bgt     LDFX5
        ldr     r7, [sp, #0x1C]
        ldr     r4, [sp, #0x28]
        ldr     r5, [sp, #0x20]
        ldr     r8, [sp, #0x18]
        ldr     r12, [sp, #0x10]
        rsb     r11, r7, #5
        cmp     r11, #0
        movle   r1, #0
        ble     LDFX9
        add     r1, r6, #5
        cmp     r1, #5
        movlt   r10, #0
        movlt   r1, r10
        blt     LDFX7
        str     r12, [sp, #0x10]
        ldr     r12, [sp, #0x24]
        mov     r10, #0
        mov     r1, r10
        rsb     r2, r7, #0
        str     r5, [sp, #0x20]
        str     r7, [sp, #0x1C]
        str     r8, [sp, #0x18]
LDFX6:
        add     r5, r3, #1
        mov     r3, r3, lsl #1
        ldrsh   r7, [r12, +r3]
        ldrsh   r3, [r9, +r3]
        mov     r5, r5, lsl #16
        add     r10, r10, #4
        mov     r5, r5, asr #16
        mul     r8, r3, r7
        add     r3, r5, #1
        mov     r5, r5, lsl #1
        ldrsh   r7, [r12, +r5]
        ldrsh   r5, [r9, +r5]
        mov     r3, r3, lsl #16
        sub     r1, r1, r8
        mul     r7, r5, r7
        mov     r3, r3, asr #16
        add     r5, r3, #1
        mov     r3, r3, lsl #1
        ldrsh   r8, [r12, +r3]
        ldrsh   r3, [r9, +r3]
        mov     r5, r5, lsl #16
        sub     r1, r1, r7
        mul     r8, r3, r8
        mov     r3, r5, asr #16
        add     r5, r3, #1
        mov     r3, r3, lsl #1
        ldrsh   r7, [r9, +r3]
        ldrsh   r3, [r12, +r3]
        sub     r1, r1, r8
        mov     r5, r5, lsl #16
        mul     r7, r7, r3
        cmp     r10, r2
        mov     r3, r5, asr #16
        sub     r1, r1, r7
        ble     LDFX6
        str     r12, [sp, #0x24]
        ldr     r5, [sp, #0x20]
        ldr     r7, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r12, [sp, #0x10]
LDFX7:
        str     r8, [sp, #0x18]
        ldr     r8, [sp, #0x24]
        str     r12, [sp, #0x10]
LDFX8:
        mov     r2, r3, lsl #1
        ldrsh   r12, [r9, +r2]
        ldrsh   r2, [r8, +r2]
        add     r3, r3, #1
        add     r10, r10, #1
        mov     r3, r3, lsl #16
        mul     r2, r12, r2
        cmp     r10, r11
        mov     r3, r3, asr #16
        sub     r1, r1, r2
        blt     LDFX8
        ldr     r8, [sp, #0x18]
        ldr     r12, [sp, #0x10]
LDFX9:
        add     r1, r0, r1, asr r4
        mov     r0, r1, asr #14
        cmp     lr, r0
        blt     LDFX10
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        movlt   r0, #0
        sublt   r0, r0, #2, 18
        b       LDFX11
LDFX10:
        mvn     r0, #0xFF
        bic     r0, r0, #0x7F, 24
        mvn     r0, r0
LDFX11:
        add     r1, sp, #0x2C
        add     r6, r1, r6, lsl #1
        cmp     r5, #0
        strh    r0, [r6, #8]
        rsblt   r1, r5, #0
        movlt   r0, r0, lsl r1
        movge   r0, r0, asr r5
        add     r1, sp, #0x38
        add     r7, r7, #1
        strh    r0, [r1, +r8]
        cmp     r7, #5
        add     r8, r8, #2
        blt     LDFX0
        ldr     r6, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r1, [sp]
        ldr     r0, [sp, #0x24]
        sub     r5, r12, #0xA
        mov     r7, #0x31
        add     r4, r5, #0x62
        add     lr, r12, #0x62
LDFX12:
        ldrsh   r8, [r4], #-6
        sub     r10, r7, #2
        strh    r8, [lr], #-6
        sub     r8, r7, #1
        mov     r8, r8, lsl #16
        sub     r7, r7, #3
        mov     r8, r8, asr #15
        ldrsh   r9, [r5, +r8]
        mov     r10, r10, lsl #16
        cmp     r7, #4
        strh    r9, [r12, +r8]
        mov     r8, r10, asr #15
        ldrsh   r9, [r5, +r8]
        strh    r9, [r12, +r8]
        bgt     LDFX12
        add     lr, sp, #0x2C
        ldrsh   r4, [lr]
        add     r5, sp, #0x2C
        ldrsh   r8, [r5, #4]
        add     r5, sp, #0x2C
        ldrsh   r10, [r5, #8]
        strh    r4, [r12]
        add     r7, sp, #0x2C
        ldrsh   r9, [r7, #2]
        mov     r4, r4, lsl #16
        add     lr, sp, #0x2C
        ldrsh   lr, [lr, #6]
        mov     r4, r4, asr #16
        mov     r5, r4
        mov     r7, r5
        cmp     r4, r7
        strh    r9, [r12, #2]
        strh    r8, [r12, #4]
        strh    lr, [r12, #6]
        strh    r10, [r12, #8]
        movgt   r5, r4
        cmp     r4, r7
        movlt   r7, r4
        cmp     r9, r5
        movgt   r5, r9
        cmp     r9, r7
        movlt   r7, r9
        cmp     r8, r5
        movgt   r5, r8
        cmp     r8, r7
        movlt   r7, r8
        cmp     lr, r5
        movgt   r5, lr
        cmp     lr, r7
        movlt   r7, lr
        cmp     r10, r5
        movgt   r5, r10
        cmp     r10, r7
        movlt   r7, r10
        orrs    r8, r5, r7
        mov     lr, #0
        bne     LDFX13
        strh    lr, [r12]
        strh    lr, [r12, #2]
        strh    lr, [r12, #4]
        strh    lr, [r12, #6]
        strh    lr, [r12, #8]
        mov     r8, #0xE
        b       LDFX26
LDFX13:
        cmp     r5, #0
        blt     LDFX14
        rsb     r8, r5, #0
        cmp     r7, r8
        bge     LDFX20
LDFX14:
        cmn     r7, #1, 18
        bge     LDFX17
        cmn     r7, #1, 18
        movge   r5, lr
        bge     LDFX16
        mov     r5, lr
LDFX15:
        mov     r7, r7, asr #1
        add     r5, r5, #1
        mov     r7, r7, lsl #16
        mov     r5, r5, lsl #16
        mov     r7, r7, asr #16
        cmn     r7, #1, 18
        mov     r5, r5, asr #16
        blt     LDFX15
LDFX16:
        ldrsh   r7, [r12, #4]
        ldrsh   r9, [r12, #2]
        ldrsh   r8, [r12, #6]
        mov     r4, r4, asr r5
        strh    r4, [r12]
        ldrsh   r4, [r12, #8]
        mov     r7, r7, asr r5
        strh    r7, [r12, #4]
        rsb     r7, r5, #0
        mov     r8, r8, asr r5
        mov     r9, r9, asr r5
        strh    r8, [r12, #6]
        mov     r5, r4, asr r5
        mov     r7, r7, lsl #16
        strh    r9, [r12, #2]
        strh    r5, [r12, #8]
        mov     r8, r7, asr #16
        b       LDFX26
LDFX17:
        cmn     r7, #2, 20
        movlt   r8, lr
        blt     LDFX19
        mov     r8, lr
LDFX18:
        mov     r7, r7, lsl #1
        add     r8, r8, #1
        mov     r5, r7, lsl #16
        mov     r8, r8, lsl #16
        mov     r7, r5, asr #16
        cmn     r7, #2, 20
        mov     r8, r8, asr #16
        bge     LDFX18
LDFX19:
        ldrsh   r9, [r12, #2]
        ldrsh   r5, [r12, #4]
        ldrsh   r7, [r12, #6]
        mov     r4, r4, lsl r8
        strh    r4, [r12]
        ldrsh   r4, [r12, #8]
        mov     r9, r9, lsl r8
        mov     r5, r5, lsl r8
        mov     r7, r7, lsl r8
        mov     r4, r4, lsl r8
        strh    r9, [r12, #2]
        strh    r5, [r12, #4]
        strh    r7, [r12, #6]
        strh    r4, [r12, #8]
        b       LDFX26
LDFX20:
        mov     r7, #0xFF
        orr     r7, r7, #0x7F, 24
        sub     r8, r7, #1, 18
        cmp     r8, r5
        bge     LDFX23
        sub     r8, r7, #1, 18
        cmp     r8, r5
        movge   r7, lr
        bge     LDFX22
        sub     r8, r7, #1, 18
        mov     r7, lr
LDFX21:
        mov     r5, r5, asr #1
        add     r7, r7, #1
        mov     r5, r5, lsl #16
        mov     r7, r7, lsl #16
        mov     r5, r5, asr #16
        cmp     r8, r5
        mov     r7, r7, asr #16
        blt     LDFX21
LDFX22:
        ldrsh   r5, [r12, #4]
        ldrsh   r9, [r12, #2]
        ldrsh   r8, [r12, #6]
        mov     r4, r4, asr r7
        strh    r4, [r12]
        ldrsh   r4, [r12, #8]
        mov     r5, r5, asr r7
        strh    r5, [r12, #4]
        rsb     r5, r7, #0
        mov     r8, r8, asr r7
        mov     r9, r9, asr r7
        strh    r8, [r12, #6]
        mov     r7, r4, asr r7
        mov     r5, r5, lsl #16
        strh    r9, [r12, #2]
        strh    r7, [r12, #8]
        mov     r8, r5, asr #16
        b       LDFX26
LDFX23:
        cmp     r5, #2, 20
        movge   r8, lr
        bge     LDFX25
        mov     r8, lr
LDFX24:
        mov     r5, r5, lsl #1
        add     r8, r8, #1
        mov     r5, r5, lsl #16
        mov     r8, r8, lsl #16
        mov     r5, r5, asr #16
        cmp     r5, #2, 20
        mov     r8, r8, asr #16
        blt     LDFX24
LDFX25:
        ldrsh   r9, [r12, #2]
        ldrsh   r5, [r12, #4]
        ldrsh   r7, [r12, #6]
        mov     r4, r4, lsl r8
        strh    r4, [r12]
        ldrsh   r4, [r12, #8]
        mov     r9, r9, lsl r8
        mov     r5, r5, lsl r8
        mov     r7, r7, lsl r8
        mov     r4, r4, lsl r8
        strh    r9, [r12, #2]
        strh    r5, [r12, #4]
        strh    r7, [r12, #6]
        strh    r4, [r12, #8]
LDFX26:
        ldrsh   r5, [r12, #0x72]
        ldrsh   r7, [r12, #0x74]
        ldrsh   r4, [r12, #0x84]
        strh    r5, [r12, #0x70]
        ldrsh   r5, [r12, #0x76]
        strh    r7, [r12, #0x72]
        ldrsh   r7, [r12, #0x78]
        add     r8, r4, r8
        strh    r5, [r12, #0x74]
        ldrsh   r5, [r12, #0x7A]
        strh    r7, [r12, #0x76]
        ldrsh   r7, [r12, #0x7C]
        strh    r5, [r12, #0x78]
        ldrsh   r5, [r12, #0x7E]
        strh    r7, [r12, #0x7A]
        ldrsh   r7, [r12, #0x80]
        strh    r5, [r12, #0x7C]
        ldrsh   r5, [r12, #0x82]
        mov     r4, r8, lsl #16
        strh    r7, [r12, #0x7E]
        strh    r5, [r12, #0x80]
        mov     r4, r4, asr #16
        strh    r4, [r12, #0x84]
        mov     r5, r4, lsl #16
        add     r4, sp, #0x36
        mov     r5, r5, asr #16
        strh    r5, [r12, #0x82]
        ldrsh   r5, [r1]
        sub     r7, r0, #2
        mvn     r10, #2, 2
        mvn     r9, #0
        str     r12, [sp, #0x10]
        str     r6, [sp, #0xC]
        str     r3, [sp, #8]
        str     r2, [sp, #4]
LDFX27:
        mov     r0, lr, lsl #16
        mov     r3, #1
        mov     r0, r0, asr #16
        mov     r2, r5, asr r0
        str     r5, [sp, #0x1C]
        mov     r2, r2, lsl #16
        str     lr, [sp, #0x20]
        mov     r8, r2, asr #16
        add     r2, r1, #2
        str     r1, [sp]
LDFX28:
        ldrsh   r1, [r2], #2
        cmp     r3, #0
        mov     r1, r1, asr r0
        mov     r5, r3
        mov     r1, r1, lsl #14
        ble     LDFX31
        add     r6, sp, #0x38
        strh    r8, [r6]
        mov     lr, r5, lsl #1
        add     r12, r4, r5, lsl #1
        add     r6, r7, r5, lsl #1
        str     r7, [sp, #0x18]
LDFX29:
        ldrsh   r8, [r6], #-2
        ldrsh   r4, [r12], #-2
        add     r7, sp, #0x38
        mul     r8, r8, r4
        mov     r11, r1, asr #31
        strh    r4, [r7, +lr]
        subs    r1, r1, r8
        sbc     r8, r11, r8, asr #31
        subs    r7, r1, r10
        sbcs    r4, r8, #0
        movlt   r7, #0
        movlt   r4, #0
        orrs    r4, r7, r4
        mvnne   r1, #2, 2
        bne     LDFX30
        cmp     r1, #2, 2
        sbcs    r8, r8, r9
        movlt   r1, #2, 2
LDFX30:
        sub     r5, r5, #1
        cmp     r5, #0
        sub     lr, lr, #2
        bgt     LDFX29
        ldr     r7, [sp, #0x18]
        add     r4, sp, #0x36
LDFX31:
        cmn     r1, #0x1F, 4
        bgt     LDFX57
        cmp     r1, #0xF, 4
        blt     LDFX55
        mov     r1, r1, asr #14
        add     r3, r3, #1
        mov     r1, r1, lsl #16
        cmp     r3, #5
        mov     r8, r1, asr #16
        blt     LDFX28
        ldr     r1, [sp]
        ldr     r2, [sp, #4]
        ldr     r12, [sp, #0x10]
        ldr     r6, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldrsh   r5, [r1, #4]
        ldrsh   r4, [r1, #8]
        ldrsh   r9, [r1]
        ldrsh   r7, [r1, #2]
        ldrsh   lr, [r1, #6]
        mov     r5, r5, asr r0
        mov     r4, r4, asr r0
        strh    r5, [r1, #4]
        mov     r9, r9, asr r0
        mov     r7, r7, asr r0
        mov     lr, lr, asr r0
        strh    r4, [r1, #8]
        strh    r9, [r1]
        strh    r7, [r1, #2]
        strh    lr, [r1, #6]
        ldrsh   r5, [r12, #0x82]
        sub     r2, r2, r0
        add     r0, sp, #0x38
        strh    r8, [r0]
        mov     r1, r2, lsl #16
        mov     r4, r1, asr #16
        cmp     r4, r5
        beq     LDFX33
        cmp     r4, r5
        add     r1, sp, #0x38
        mov     r2, #0xF
        bge     LDFX32
        ldrsh   lr, [r12]
        ldrsh   r9, [r12, #2]
        ldrsh   r0, [r12, #4]
        ldrsh   r7, [r12, #6]
        ldrsh   r1, [r1, #8]
        ldrsh   r8, [r12, #8]
        sub     r5, r5, r4
        cmp     r5, #0xF
        movgt   r5, r2
        mov     lr, lr, asr r5
        mov     r0, r0, asr r5
        mov     r9, r9, asr r5
        mov     r7, r7, asr r5
        mov     r5, r8, asr r5
        strh    lr, [r12]
        strh    r0, [r12, #4]
        strh    r5, [r12, #8]
        strh    r4, [r12, #0x82]
        add     lr, sp, #0x3A
        strh    r9, [r12, #2]
        add     r2, sp, #0x3C
        add     r0, sp, #0x3E
        strh    r7, [r12, #6]
        mov     r5, r4
        b       LDFX34
LDFX32:
        ldrsh   r0, [r1]
        sub     r4, r4, r5
        cmp     r4, #0xF
        movgt   r4, r2
        mov     r0, r0, asr r4
        strh    r0, [r1]
        add     r2, sp, #0x38
        ldrsh   lr, [r2, #2]
        add     r1, sp, #0x38
        add     r0, sp, #0x38
        mov     lr, lr, asr r4
        strh    lr, [r2, #2]
        ldrsh   r8, [r1, #4]
        add     r7, sp, #0x38
        add     lr, r2, #2
        mov     r8, r8, asr r4
        strh    r8, [r1, #4]
        ldrsh   r8, [r0, #6]
        add     r2, r1, #4
        mov     r8, r8, asr r4
        strh    r8, [r0, #6]!
        ldrsh   r1, [r7, #8]
        mov     r4, r1, asr r4
        mov     r1, r4, lsl #16
        mov     r1, r1, asr #16
        strh    r1, [r7, #8]
        b       LDFX34
LDFX33:
        add     r0, sp, #0x38
        ldrsh   r1, [r0, #8]
        add     lr, sp, #0x3A
        add     r2, sp, #0x3C
        add     r0, sp, #0x3E
LDFX34:
        mov     r4, #0xFF
        orr     r7, r4, #0x7F, 24
        cmp     r5, #0
        sub     r4, r7, #7, 20
        rsble   r5, r5, #0
        movle   r4, r4, asr r5
        ble     LDFX35
        bic     r5, r5, #0xFF, 8
        bic     r5, r5, #0xFF, 16
        mvn     r8, #2, 2
        cmp     r4, r8, asr r5
        mov     r4, #2, 2
        movgt   r4, r8
        bgt     LDFX35
        sub     r8, r7, #7, 20
        cmp     r8, r4, asr r5
        subge   r7, r7, #7, 20
        movge   r4, r7, lsl r5
LDFX35:
        add     r7, sp, #0x38
        ldrsh   r5, [r12]
        ldrsh   r7, [r7]
        add     r8, r5, r7
        cmp     r8, r4
        movgt   r8, r4
        rsb     r7, r4, #0
        cmp     r8, r7
        movlt   r8, r7
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r9, r5
        cmp     r9, r8
        mvnlt   r8, r5
        blt     LDFX36
        cmn     r8, #2, 18
        movge   r8, r8, lsl #16
        movge   r8, r8, asr #16
        movlt   r8, #0
        sublt   r8, r8, #2, 18
LDFX36:
        ldrsh   lr, [lr]
        strh    r8, [r12]
        ldrsh   r8, [r12, #2]
        add     lr, r8, lr
        cmp     lr, r4
        movgt   lr, r4
        cmp     lr, r7
        movlt   lr, r7
        mvn     r8, r5
        cmp     r8, lr
        mov     r8, #0
        mvnlt   lr, r5
        blt     LDFX37
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        sublt   lr, r8, #2, 18
LDFX37:
        ldrsh   r2, [r2]
        ldrsh   r9, [r12, #4]
        strh    lr, [r12, #2]
        add     r2, r9, r2
        cmp     r2, r4
        movgt   r2, r4
        cmp     r2, r7
        movlt   r2, r7
        mvn     r9, r5
        cmp     r9, r2
        mvnlt   r2, r5
        blt     LDFX38
        cmn     r2, #2, 18
        movge   r2, r2, lsl #16
        movge   r2, r2, asr #16
        sublt   r2, r8, #2, 18
LDFX38:
        ldrsh   r0, [r0]
        ldrsh   r9, [r12, #6]
        strh    r2, [r12, #4]
        add     r0, r9, r0
        cmp     r0, r4
        movgt   r0, r4
        cmp     r0, r7
        movlt   r0, r7
        mvn     r9, r5
        cmp     r9, r0
        mvnlt   r0, r5
        blt     LDFX39
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r0, r0, asr #16
        sublt   r0, r8, #2, 18
LDFX39:
        ldrsh   r8, [r12, #8]
        strh    r0, [r12, #6]
        add     r1, r8, r1
        cmp     r1, r4
        movgt   r1, r4
        cmp     r1, r7
        movlt   r1, r7
        mvn     r4, r5
        cmp     r4, r1
        movlt   r1, #0xFF
        orrlt   r5, r1, #0x7F, 24
        blt     LDFX40
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r5, r1, asr #16
LDFX40:
        ldrsh   r7, [r12]
        ldrsh   r1, [r12]
        strh    r5, [r12, #8]
        mov     r4, r7
        cmp     r1, r4
        movgt   r7, r1
        cmp     r1, r4
        movlt   r4, r1
        cmp     lr, r7
        movgt   r7, lr
        cmp     lr, r4
        movlt   r4, lr
        cmp     r2, r7
        movgt   r7, r2
        cmp     r2, r4
        movlt   r4, r2
        cmp     r0, r7
        movgt   r7, r0
        cmp     r0, r4
        movlt   r4, r0
        cmp     r5, r7
        movgt   r7, r5
        cmp     r5, r4
        movlt   r4, r5
        orrs    r2, r7, r4
        mov     r0, #0
        bne     LDFX41
        strh    r0, [r12]
        strh    r0, [r12, #2]
        strh    r0, [r12, #4]
        strh    r0, [r12, #6]
        strh    r0, [r12, #8]
        mov     r0, #0xD
        b       LDFX54
LDFX41:
        cmp     r7, #0
        blt     LDFX42
        rsb     r2, r7, #0
        cmp     r4, r2
        bge     LDFX48
LDFX42:
        cmn     r4, #2, 20
        bge     LDFX45
        cmn     r4, #2, 20
        bge     LDFX44
LDFX43:
        add     r0, r0, #1
        mov     r4, r4, asr #1
        mov     r0, r0, lsl #16
        cmn     r4, #2, 20
        mov     r0, r0, asr #16
        blt     LDFX43
LDFX44:
        ldrsh   r7, [r12, #2]
        ldrsh   r5, [r12, #4]
        ldrsh   r4, [r12, #6]
        ldrsh   lr, [r12, #8]
        mov     r1, r1, asr r0
        rsb     r2, r0, #0
        strh    r1, [r12]
        mov     r1, r7, asr r0
        mov     r5, r5, asr r0
        mov     r4, r4, asr r0
        mov     r0, lr, asr r0
        mov     r2, r2, lsl #16
        strh    r0, [r12, #8]
        strh    r1, [r12, #2]
        strh    r5, [r12, #4]
        strh    r4, [r12, #6]
        mov     r0, r2, asr #16
        b       LDFX54
LDFX45:
        cmn     r4, #1, 20
        blt     LDFX47
LDFX46:
        mov     r4, r4, lsl #1
        add     r0, r0, #1
        mov     r2, r4, lsl #16
        mov     r0, r0, lsl #16
        mov     r4, r2, asr #16
        cmn     r4, #1, 20
        mov     r0, r0, asr #16
        bge     LDFX46
LDFX47:
        ldrsh   lr, [r12, #2]
        ldrsh   r5, [r12, #4]
        ldrsh   r4, [r12, #6]
        ldrsh   r2, [r12, #8]
        mov     r1, r1, lsl r0
        mov     lr, lr, lsl r0
        mov     r5, r5, lsl r0
        mov     r4, r4, lsl r0
        mov     r2, r2, lsl r0
        strh    r1, [r12]
        strh    lr, [r12, #2]
        strh    r5, [r12, #4]
        strh    r4, [r12, #6]
        strh    r2, [r12, #8]
        b       LDFX54
LDFX48:
        mov     r2, #0xFF
        orr     r2, r2, #0x7F, 24
        sub     lr, r2, #6, 20
        cmp     lr, r7
        bge     LDFX51
        sub     r2, r2, #6, 20
        cmp     r2, r7
        bge     LDFX50
        sub     r2, r0, #2, 18
        mvn     r2, r2
        sub     r2, r2, #6, 20
LDFX49:
        add     r0, r0, #1
        mov     r7, r7, asr #1
        mov     r0, r0, lsl #16
        cmp     r2, r7
        mov     r0, r0, asr #16
        blt     LDFX49
LDFX50:
        ldrsh   r7, [r12, #2]
        ldrsh   r5, [r12, #4]
        ldrsh   r4, [r12, #6]
        ldrsh   lr, [r12, #8]
        mov     r1, r1, asr r0
        rsb     r2, r0, #0
        strh    r1, [r12]
        mov     r1, r7, asr r0
        mov     r5, r5, asr r0
        mov     r4, r4, asr r0
        mov     r0, lr, asr r0
        mov     r2, r2, lsl #16
        strh    r0, [r12, #8]
        strh    r1, [r12, #2]
        strh    r5, [r12, #4]
        strh    r4, [r12, #6]
        mov     r0, r2, asr #16
        b       LDFX54
LDFX51:
        cmp     r7, #1, 20
        bge     LDFX53
LDFX52:
        mov     r7, r7, lsl #1
        add     r0, r0, #1
        mov     r2, r7, lsl #16
        mov     r0, r0, lsl #16
        mov     r7, r2, asr #16
        cmp     r7, #1, 20
        mov     r0, r0, asr #16
        blt     LDFX52
LDFX53:
        ldrsh   lr, [r12, #2]
        ldrsh   r5, [r12, #4]
        ldrsh   r4, [r12, #6]
        ldrsh   r2, [r12, #8]
        mov     r1, r1, lsl r0
        mov     lr, lr, lsl r0
        mov     r5, r5, lsl r0
        mov     r4, r4, lsl r0
        mov     r2, r2, lsl r0
        strh    r1, [r12]
        strh    lr, [r12, #2]
        strh    r5, [r12, #4]
        strh    r4, [r12, #6]
        strh    r2, [r12, #8]
LDFX54:
        ldrsh   r2, [r12, #0x82]
        ldrsh   r1, [r12, #8]
        add     r2, r0, r2
        strh    r2, [r12, #0x82]
        mov     r0, #0
        strh    r1, [r3]
        ldrsh   r1, [r12, #6]
        strh    r1, [r3, #2]
        ldrsh   r1, [r12, #4]
        strh    r1, [r3, #4]
        ldrsh   r1, [r12, #2]
        strh    r1, [r3, #6]
        ldrsh   r1, [r12]
        strh    r1, [r3, #8]
        ldrsh   r12, [r12, #0x82]
        strh    r12, [r6]
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LDFX55:
        ldr     r5, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        ldr     r1, [sp]
LDFX56:
        add     lr, lr, #1
        b       LDFX27
LDFX57:
        ldr     r5, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        ldr     r1, [sp]
        b       LDFX56
LDFX58:
        mov     r9, #0
        mov     r3, r9
        rsb     r6, r7, #0
        mov     r0, r3
        add     r1, r1, r6, lsl #1
        b       LDFX2
LDFX59:
        mov     r0, #0
        mov     r3, r0
        rsb     r6, r7, #0
        b       LDFX4
LDFX60:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}


