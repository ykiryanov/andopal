        .text
        .align  4
        .globl  _ippsIIR16s_G723_16s_I


_ippsIIR16s_G723_16s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x46, 30
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        beq     LDUN1
        cmp     r4, #0
        beq     LDUN1
        cmp     r6, #0
        beq     LDUN1
        ldrsh   r3, [r6]
        ldrsh   r9, [r6, #0x14]
        ldrsh   lr, [r6, #2]
        ldrsh   r12, [r6, #0x16]
        mov     r8, sp
        add     r7, sp, #0x8C
        strh    r3, [r8]
        strh    lr, [r8, #2]
        strh    r12, [r7, #2]
        ldrsh   r3, [r6, #4]
        ldrsh   lr, [r6, #6]
        ldrsh   r12, [r6, #0x1A]
        strh    r9, [r7]
        ldrsh   r9, [r6, #0x18]
        strh    r3, [r8, #4]
        strh    lr, [r8, #6]
        strh    r12, [r7, #6]
        ldrsh   r3, [r6, #8]
        ldrsh   lr, [r6, #0xA]
        ldrsh   r12, [r6, #0x1E]
        strh    r9, [r7, #4]
        ldrsh   r9, [r6, #0x1C]
        strh    r3, [r8, #8]
        strh    lr, [r8, #0xA]
        strh    r12, [r7, #0xA]
        ldrsh   r3, [r6, #0xC]
        ldrsh   lr, [r6, #0xE]
        ldrsh   r12, [r6, #0x22]
        strh    r9, [r7, #8]
        ldrsh   r9, [r6, #0x20]
        strh    r3, [r8, #0xC]
        strh    lr, [r8, #0xE]
        strh    r12, [r7, #0xE]
        strh    r9, [r7, #0xC]
        ldrsh   r3, [r6, #0x10]
        ldrsh   lr, [r6, #0x12]
        ldrsh   r12, [r6, #0x26]
        ldrsh   r9, [r6, #0x24]
        add     r1, sp, #0x14
        strh    r3, [r8, #0x10]
        strh    lr, [r8, #0x12]
        strh    r12, [r7, #0x12]
        strh    r9, [r7, #0x10]
        mov     r2, #0x3C
        mov     r0, r4
        bl      _ippsCopy_16s
        mov     lr, #0
        mov     r12, lr
LDUN0:
        ldrsh   r0, [r5]
        ldrsh   r11, [r4]
        mov     r3, sp
        mov     r9, r12, lsl #1
        add     r10, r3, r9
        ldrsh   r2, [r10, #0x12]
        ldrsh   r1, [r10, #0x10]
        ldrsh   r3, [r3, +r9]
        add     r12, r12, #1
        mul     r0, r0, r2
        ldrsh   r2, [r5, #2]
        cmp     r12, #0x3C
        mul     r1, r2, r1
        ldrsh   r2, [r5, #4]
        rsb     r11, r0, r11, lsl #13
        ldrsh   r0, [r10, #0xE]
        sub     r11, r11, r1
        ldrsh   r1, [r10, #0xC]
        mul     r0, r2, r0
        ldrsh   r2, [r5, #6]
        sub     r11, r11, r0
        ldrsh   r0, [r10, #0xA]
        mul     r1, r2, r1
        ldrsh   r2, [r5, #8]
        sub     r1, r11, r1
        ldrsh   r11, [r10, #8]
        mul     r2, r2, r0
        ldrsh   r0, [r5, #0xA]
        mul     r0, r0, r11
        ldrsh   r11, [r5, #0xC]
        sub     r1, r1, r2
        ldrsh   r2, [r10, #6]
        sub     r1, r1, r0
        ldrsh   r0, [r10, #4]
        ldrsh   r10, [r10, #2]
        mul     r2, r11, r2
        ldrsh   r11, [r5, #0xE]
        mul     r0, r11, r0
        ldrsh   r11, [r5, #0x12]
        sub     r1, r1, r2
        ldrsh   r2, [r5, #0x10]
        sub     r1, r1, r0
        mul     r3, r11, r3
        add     r0, sp, #0x8C
        mul     r10, r2, r10
        add     r11, r0, r9
        ldrsh   r9, [r0, +r9]
        ldrsh   r0, [r11, #4]
        sub     r1, r1, r10
        ldrsh   r10, [r5, #0x14]
        sub     r1, r1, r3
        ldrsh   r3, [r11, #0x12]
        mla     r1, r10, r3, r1
        ldrsh   r10, [r11, #0x10]
        ldrsh   r3, [r5, #0x16]
        mla     r1, r3, r10, r1
        ldrsh   r10, [r11, #0xE]
        ldrsh   r3, [r5, #0x18]
        mla     r1, r3, r10, r1
        ldrsh   r3, [r5, #0x1A]
        ldrsh   r10, [r11, #0xC]
        mla     r1, r3, r10, r1
        ldrsh   r3, [r5, #0x1C]
        ldrsh   r10, [r11, #0xA]
        mla     r1, r3, r10, r1
        ldrsh   r3, [r5, #0x1E]
        ldrsh   r10, [r11, #8]
        mla     r1, r3, r10, r1
        ldrsh   r3, [r5, #0x20]
        ldrsh   r10, [r11, #6]
        ldrsh   r11, [r11, #2]
        mla     r3, r3, r10, r1
        ldrsh   r10, [r5, #0x22]
        mla     r0, r10, r0, r3
        ldrsh   r10, [r5, #0x24]
        ldrsh   r3, [r5, #0x26]
        mla     r0, r10, r11, r0
        add     r10, sp, #0x8C
        add     r10, r10, lr
        add     lr, lr, #2
        mla     r0, r3, r9, r0
        add     r0, r0, #1, 20
        mov     r0, r0, asr #13
        strh    r0, [r4], #2
        strh    r0, [r10, #0x14]
        blt     LDUN0
        ldrsh   r0, [r7, #0x78]
        ldrsh   lr, [r8, #0x78]
        ldrsh   r3, [r8, #0x7A]
        ldrsh   r12, [r7, #0x7A]
        ldrsh   r1, [r8, #0x7C]
        ldrsh   r4, [r7, #0x7C]
        ldrsh   r5, [r8, #0x7E]
        strh    r0, [r6, #0x14]
        ldrsh   r0, [r8, #0x80]
        strh    lr, [r6]
        ldrsh   lr, [r7, #0x7E]
        strh    r3, [r6, #2]
        ldrsh   r3, [r7, #0x80]
        strh    r12, [r6, #0x16]
        ldrsh   r12, [r8, #0x82]
        strh    r0, [r6, #8]
        ldrsh   r0, [r7, #0x86]
        strh    r1, [r6, #4]
        ldrsh   r1, [r7, #0x82]
        strh    r4, [r6, #0x18]
        ldrsh   r4, [r8, #0x84]
        strh    r5, [r6, #6]
        ldrsh   r5, [r7, #0x84]
        strh    lr, [r6, #0x1A]
        ldrsh   lr, [r8, #0x86]
        strh    r3, [r6, #0x1C]
        ldrsh   r3, [r8, #0x88]
        ldrsh   r8, [r8, #0x8A]
        strh    r12, [r6, #0xA]
        ldrsh   r12, [r7, #0x88]
        ldrsh   r7, [r7, #0x8A]
        strh    r0, [r6, #0x22]
        mov     r0, #0
        strh    r1, [r6, #0x1E]
        strh    r4, [r6, #0xC]
        strh    r5, [r6, #0x20]
        strh    lr, [r6, #0xE]
        strh    r3, [r6, #0x10]
        strh    r12, [r6, #0x24]
        strh    r8, [r6, #0x12]
        strh    r7, [r6, #0x26]
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}
LDUN1:
        mvn     r0, #7
        add     sp, sp, #0x46, 30
        ldmia   sp!, {r4 - r11, pc}


