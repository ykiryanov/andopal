        .text
        .align  4
        .globl  _ippsIIR16s_G723_32s16s_Sfs


_ippsIIR16s_G723_32s16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x59, 30
        ldr     r12, [sp, #0x188]
        cmp     r0, #0
        beq     LDUM4
        cmp     r1, #0
        beq     LDUM4
        cmp     r3, #0
        beq     LDUM4
        cmp     r12, #0
        beq     LDUM4
        cmp     r2, #0
        blt     LDUM5
        ldrsh   r7, [r12]
        ldrsh   r6, [r12, #0x14]
        add     r5, sp, #0xD8
        add     r4, sp, #0x4C
        strh    r7, [r5]
        strh    r6, [r4]
        ldrsh   lr, [r12, #2]
        ldrsh   r7, [r12, #0x16]
        ldrsh   r6, [r12, #4]
        strh    lr, [r5, #2]
        ldrsh   lr, [r12, #0x18]
        strh    r7, [r4, #2]
        strh    r6, [r5, #4]
        ldrsh   r7, [r12, #6]
        ldrsh   r6, [r12, #0x1A]
        strh    lr, [r4, #4]
        strh    r7, [r5, #6]
        ldrsh   lr, [r12, #8]
        strh    r6, [r4, #6]
        ldrsh   r7, [r12, #0x1C]
        ldrsh   r6, [r12, #0xA]
        strh    lr, [r5, #8]
        strh    r7, [r4, #8]
        ldrsh   lr, [r12, #0x1E]
        strh    r6, [r5, #0xA]
        ldrsh   r7, [r12, #0xC]
        ldrsh   r6, [r12, #0x20]
        strh    lr, [r4, #0xA]
        strh    r7, [r5, #0xC]
        ldrsh   lr, [r12, #0xE]
        strh    r6, [r4, #0xC]
        ldrsh   r7, [r12, #0x22]
        ldrsh   r6, [r12, #0x10]
        strh    lr, [r5, #0xE]
        strh    r7, [r4, #0xE]
        ldrsh   lr, [r12, #0x24]
        strh    r6, [r5, #0x10]
        ldrsh   r7, [r12, #0x12]
        ldrsh   r6, [r12, #0x26]
        strh    lr, [r4, #0x10]
        strh    r7, [r5, #0x12]
        mov     r8, #0
        strh    r6, [r4, #0x12]
        mov     lr, #0
        mov     r7, r8
        add     r6, r1, #4
        str     r0, [sp]
LDUM0:
        ldr     r10, [r6, #-4]
        ldr     r9, [r6]
        add     r0, sp, #0xD8
        add     r11, r10, #1, 20
        ldr     r10, [r6, #4]
        add     r0, r0, r7
        mov     r11, r11, asr #13
        strh    r11, [r0, #0x14]
        add     r11, r9, #1, 20
        add     r9, r10, #1, 20
        ldr     r10, [r6, #8]
        mov     r9, r9, asr #13
        strh    r9, [r0, #0x18]
        ldr     r9, [r6, #0xC]
        add     r10, r10, #1, 20
        add     r8, r8, #5
        add     r9, r9, #1, 20
        mov     r11, r11, asr #13
        mov     r10, r10, asr #13
        mov     r9, r9, asr #13
        cmp     r8, #0x3C
        add     r7, r7, #0xA
        strh    r11, [r0, #0x16]
        add     r6, r6, #0x14
        strh    r10, [r0, #0x1A]
        strh    r9, [r0, #0x1C]
        blt     LDUM0
        ldr     r0, [sp]
        mvn     r6, #0xFF
        bic     r6, r6, #0x7F, 24
        mvn     r8, r6
        mov     r7, #0
        mov     r6, r7
        str     r1, [sp, #0x10]
        str     r8, [sp, #8]
        str     r12, [sp, #4]
        str     r2, [sp, #0xC]
LDUM1:
        ldr     r2, [sp, #0x10]
        add     r1, sp, #0xD8
        mov     r9, r7, lsl #1
        ldr     r8, [r2], #4
        str     r2, [sp, #0x10]
        ldrsh   r11, [r0, #6]
        ldrsh   r12, [r0]
        add     r1, r1, r9
        ldrsh   lr, [r1, #0x12]
        ldrsh   r4, [r1, #0x10]
        ldrsh   r2, [r0, #2]
        ldrsh   r5, [r0, #4]
        mul     r12, r12, lr
        ldrsh   lr, [r1, #0xE]
        mul     r2, r2, r4
        ldrsh   r10, [r1, #0xC]
        mul     lr, r5, lr
        ldrsh   r4, [r1, #0xA]
        ldrsh   r5, [r0, #8]
        mul     r10, r11, r10
        sub     r8, r8, r12
        sub     r8, r8, r2
        mul     r4, r5, r4
        sub     r8, r8, lr
        str     r10, [sp, #0x14]
        ldrsh   r10, [r1, #8]
        ldrsh   r11, [r0, #0xA]
        str     r4, [sp, #0x18]
        ldrsh   r5, [r1, #6]
        ldrsh   r4, [r0, #0xC]
        mul     r10, r11, r10
        ldr     r2, [sp, #0x14]
        mul     r5, r4, r5
        add     r4, sp, #0xD8
        sub     r8, r8, r2
        str     r10, [sp, #0x1C]
        ldrsh   r10, [r0, #0xE]
        ldrsh   r11, [r1, #4]
        str     r5, [sp, #0x20]
        ldrsh   r1, [r1, #2]
        ldr     r2, [sp, #0x18]
        mul     r11, r10, r11
        add     r12, sp, #0x4C
        sub     r8, r8, r2
        ldr     r2, [sp, #0x1C]
        str     r11, [sp, #0x24]
        ldrsh   r4, [r4, +r9]
        ldrsh   r10, [r0, #0x12]
        ldrsh   r5, [r0, #0x10]
        ldrsh   r11, [r0, #0x14]
        mul     r10, r10, r4
        sub     r8, r8, r2
        mul     r1, r5, r1
        str     r11, [sp, #0x28]
        ldrsh   r4, [r0, #0x18]
        ldrsh   r5, [r0, #0x16]
        ldr     r2, [sp, #0x20]
        str     r4, [sp, #0x2C]
        ldrsh   r4, [r0, #0x1A]
        sub     r2, r8, r2
        str     r4, [sp, #0x30]
        ldrsh   r11, [r0, #0x1E]
        ldrsh   r4, [r0, #0x1C]
        str     r11, [sp, #0x34]
        ldrsh   r11, [r0, #0x20]
        str     r11, [sp, #0x38]
        ldrsh   r11, [r0, #0x22]
        str     r11, [sp, #0x3C]
        ldrsh   r11, [r0, #0x24]
        str     r11, [sp, #0x40]
        add     r11, sp, #0x4C
        ldrsh   r11, [r11, +r9]
        add     r9, r12, r9
        ldr     r12, [sp, #0x24]
        str     r11, [sp, #0x44]
        ldrsh   r11, [r0, #0x26]
        sub     r12, r2, r12
        sub     r12, r12, r1
        ldr     r1, [sp, #0xC]
        sub     r12, r12, r10
        str     r11, [sp, #0x48]
        ldrsh   r2, [r9, #0x12]
        mov     r12, r12, lsl r1
        ldr     r1, [sp, #0x28]
        ldrsh   r8, [r9, #0x10]
        ldrsh   r10, [r9, #4]
        ldr     r11, [sp, #0x2C]
        mla     lr, r1, r2, r12
        ldrsh   r1, [r9, #0xE]
        ldrsh   r2, [r9, #0xC]
        ldrsh   r12, [r9, #0xA]
        mla     r5, r5, r8, lr
        ldrsh   lr, [r9, #8]
        ldrsh   r8, [r9, #6]
        ldrsh   r9, [r9, #2]
        mla     r5, r11, r1, r5
        ldr     r1, [sp, #0x30]
        mla     r5, r1, r2, r5
        ldr     r1, [sp, #0x34]
        ldr     r2, [sp, #0x44]
        mla     r5, r4, r12, r5
        mla     r5, r1, lr, r5
        ldr     r1, [sp, #0x38]
        mla     r5, r1, r8, r5
        ldr     r1, [sp, #0x3C]
        mla     r5, r1, r10, r5
        ldr     r1, [sp, #0x40]
        mla     r5, r1, r9, r5
        ldr     r1, [sp, #0x48]
        mla     r5, r1, r2, r5
        ldr     r2, [sp, #8]
        add     r1, r5, #1, 20
        mov     r1, r1, asr #13
        cmp     r2, r1
        blt     LDUM2
        cmn     r1, #2, 18
        movge   r1, r1, lsl #16
        movge   r1, r1, asr #16
        mvnlt   r1, #0xFF
        biclt   r1, r1, #0x7F, 24
        b       LDUM3
LDUM2:
        mov     r1, #0
        sub     r1, r1, #2, 18
        mvn     r1, r1
LDUM3:
        add     r2, sp, #0x4C
        add     r7, r7, #1
        add     r2, r2, r6
        strh    r1, [r3], #2
        cmp     r7, #0x3C
        strh    r1, [r2, #0x14]
        add     r6, r6, #2
        blt     LDUM1
        ldr     r12, [sp, #4]
        add     r5, sp, #0xD8
        add     r4, sp, #0x4C
        ldrsh   r0, [r4, #0x78]
        ldrsh   lr, [r5, #0x78]
        ldrsh   r2, [r5, #0x7A]
        ldrsh   r3, [r4, #0x7A]
        ldrsh   r1, [r5, #0x7C]
        ldrsh   r6, [r4, #0x7C]
        ldrsh   r7, [r5, #0x7E]
        strh    r0, [r12, #0x14]
        ldrsh   r0, [r5, #0x80]
        strh    lr, [r12]
        ldrsh   lr, [r4, #0x7E]
        strh    r2, [r12, #2]
        ldrsh   r2, [r4, #0x80]
        strh    r3, [r12, #0x16]
        ldrsh   r3, [r5, #0x82]
        strh    r0, [r12, #8]
        ldrsh   r0, [r4, #0x86]
        strh    r1, [r12, #4]
        ldrsh   r1, [r4, #0x82]
        strh    r6, [r12, #0x18]
        ldrsh   r6, [r5, #0x84]
        strh    r7, [r12, #6]
        ldrsh   r7, [r4, #0x84]
        strh    lr, [r12, #0x1A]
        ldrsh   lr, [r5, #0x86]
        strh    r2, [r12, #0x1C]
        ldrsh   r2, [r5, #0x88]
        ldrsh   r5, [r5, #0x8A]
        strh    r3, [r12, #0xA]
        ldrsh   r3, [r4, #0x88]
        ldrsh   r4, [r4, #0x8A]
        strh    r0, [r12, #0x22]
        mov     r0, #0
        strh    r1, [r12, #0x1E]
        strh    r6, [r12, #0xC]
        strh    r7, [r12, #0x20]
        strh    lr, [r12, #0xE]
        strh    r2, [r12, #0x10]
        strh    r3, [r12, #0x24]
        strh    r5, [r12, #0x12]
        strh    r4, [r12, #0x26]
        add     sp, sp, #0x59, 30
        ldmia   sp!, {r4 - r11, pc}
LDUM4:
        mvn     r0, #7
        add     sp, sp, #0x59, 30
        ldmia   sp!, {r4 - r11, pc}
LDUM5:
        mvn     r0, #0xC
        add     sp, sp, #0x59, 30
        ldmia   sp!, {r4 - r11, pc}


