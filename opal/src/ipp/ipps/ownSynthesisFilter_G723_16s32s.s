        .text
        .align  4
        .globl  ownSynthesisFilter_G723_16s32s


ownSynthesisFilter_G723_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB4
        ldrsh   r12, [r3]
        ldrsh   r5, [r3, #2]
        ldrsh   r6, [r3, #6]
        add     r4, sp, #0x28
        ldrsh   lr, [r3, #8]
        ldrsh   r7, [r3, #4]
        strh    r12, [r4]
        ldrsh   r12, [r3, #0xA]
        strh    r5, [r4, #2]
        ldrsh   r5, [r3, #0xC]
        strh    r6, [r4, #6]
        ldrsh   r6, [r3, #0x10]
        strh    lr, [r4, #8]
        strh    r7, [r4, #4]
        ldrsh   lr, [r3, #0x12]
        ldrsh   r7, [r3, #0xE]
        strh    r12, [r4, #0xA]
        strh    r5, [r4, #0xC]
        strh    r6, [r4, #0x10]
        strh    lr, [r4, #0x12]
        mvn     r12, #0xFF
        strh    r7, [r4, #0xE]
        bic     r5, r12, #0x7F, 24
        mvn     r6, r5
        mov     lr, #0
        mov     r12, #0x3C
        str     r1, [sp, #0x10]
        str     r2, [sp, #8]
        str     r6, [sp, #0xC]
        str     r5, [sp, #4]
        str     r3, [sp]
LDUI0:
        ldr     r1, [sp, #0x10]
        add     r2, sp, #0x28
        ldrsh   r6, [r1], #2
        str     r1, [sp, #0x10]
        ldrsh   r7, [r0]
        add     r1, r2, lr
        ldrsh   r2, [r2, +lr]
        str     r2, [sp, #0x14]
        ldrsh   r3, [r0, #2]
        ldrsh   r4, [r1, #0x12]
        ldrsh   r8, [r1, #0x10]
        ldrsh   r9, [r0, #4]
        mul     r10, r3, r4
        ldrsh   r11, [r1, #0xA]
        ldrsh   r2, [r1, #0xE]
        ldrsh   r3, [r0, #6]
        ldrsh   r4, [r1, #0xC]
        ldrsh   r5, [r0, #8]
        mla     r10, r7, r6, r10
        str     r11, [sp, #0x18]
        ldrsh   r6, [r0, #0xA]
        str     r6, [sp, #0x1C]
        ldrsh   r6, [r1, #8]
        ldrsh   r7, [r0, #0xC]
        mla     r11, r9, r8, r10
        str     r7, [sp, #0x20]
        ldrsh   r7, [r1, #6]
        ldrsh   r8, [r0, #0xE]
        ldrsh   r9, [r1, #4]
        mla     r11, r3, r2, r11
        str     r9, [sp, #0x24]
        ldrsh   r9, [r0, #0x10]
        ldrsh   r10, [r1, #2]
        ldrsh   r2, [r0, #0x12]
        mla     r11, r5, r4, r11
        ldr     r4, [sp, #0x1C]
        ldr     r5, [sp, #0x18]
        ldrsh   r3, [r0, #0x14]
        mla     r11, r4, r5, r11
        ldr     r4, [sp, #0x20]
        mla     r11, r4, r6, r11
        ldr     r4, [sp, #0x24]
        mla     r11, r8, r7, r11
        mla     r11, r9, r4, r11
        ldr     r4, [sp, #0xC]
        mla     r11, r2, r10, r11
        ldr     r2, [sp, #0x14]
        mla     r3, r3, r2, r11
        add     r2, r3, #1, 20
        mov     r2, r2, asr #13
        cmp     r4, r2
        ldr     r4, [sp, #8]
        str     r3, [r4], #4
        str     r4, [sp, #8]
        ldrlt   r2, [sp, #0xC]
        strlth  r2, [r1, #0x14]
        blt     LDUI1
        cmn     r2, #2, 18
        strgeh  r2, [r1, #0x14]
        ldrlt   r2, [sp, #4]
        strlth  r2, [r1, #0x14]
LDUI1:
        subs    r12, r12, #1
        add     lr, lr, #2
        bne     LDUI0
        add     r4, sp, #0x28
        ldr     r3, [sp]
        ldrsh   r7, [r4, #0x78]
        ldrsh   r6, [r4, #0x7A]
        ldrsh   r5, [r4, #0x7C]
        ldrsh   lr, [r4, #0x7E]
        ldrsh   r12, [r4, #0x80]
        ldrsh   r2, [r4, #0x82]
        ldrsh   r1, [r4, #0x84]
        ldrsh   r0, [r4, #0x86]
        strh    r7, [r3]
        ldrsh   r7, [r4, #0x88]
        ldrsh   r4, [r4, #0x8A]
        strh    r6, [r3, #2]
        strh    r5, [r3, #4]
        strh    lr, [r3, #6]
        strh    r12, [r3, #8]
        strh    r2, [r3, #0xA]
        strh    r1, [r3, #0xC]
        strh    r0, [r3, #0xE]
        strh    r7, [r3, #0x10]
        strh    r4, [r3, #0x12]
        add     sp, sp, #0xB4
        ldmia   sp!, {r4 - r11, pc}


