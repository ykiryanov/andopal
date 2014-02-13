        .text
        .align  4
        .globl  _ippsIIR16s_G723_16s32s


_ippsIIR16s_G723_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x59, 30
        mov     r6, r0
        cmp     r6, #0
        mov     r4, r1
        mov     r5, r2
        mov     r8, r3
        beq     LDUO4
        cmp     r4, #0
        beq     LDUO4
        cmp     r5, #0
        beq     LDUO4
        cmp     r8, #0
        beq     LDUO4
        ldrsh   lr, [r8, #0x14]
        add     r10, sp, #0xD8
        ldrsh   r11, [r8]
        ldrsh   r7, [r8, #2]
        ldrsh   r12, [r8, #0x16]
        strh    lr, [r10]
        ldrsh   lr, [r8, #4]
        add     r9, sp, #0x4C
        strh    r7, [r9, #2]
        ldrsh   r7, [r8, #6]
        strh    lr, [r9, #4]
        ldrsh   lr, [r8, #0x1A]
        strh    r12, [r10, #2]
        ldrsh   r12, [r8, #8]
        strh    lr, [r10, #6]
        ldrsh   lr, [r8, #0xA]
        strh    r7, [r9, #6]
        ldrsh   r7, [r8, #0x1C]
        strh    r12, [r9, #8]
        strh    lr, [r9, #0xA]
        ldrsh   r12, [r8, #0x1E]
        ldrsh   lr, [r8, #0x20]
        strh    r7, [r10, #8]
        ldrsh   r7, [r8, #0xC]
        strh    r12, [r10, #0xA]
        strh    lr, [r10, #0xC]
        ldrsh   r12, [r8, #0xE]
        ldrsh   lr, [r8, #0x10]
        strh    r7, [r9, #0xC]
        ldrsh   r7, [r8, #0x22]
        strh    r12, [r9, #0xE]
        strh    lr, [r9, #0x10]
        strh    r11, [r9]
        strh    r7, [r10, #0xE]
        ldrsh   r12, [r8, #0x24]
        ldrsh   lr, [r8, #0x26]
        ldrsh   r11, [r8, #0x18]
        ldrsh   r7, [r8, #0x12]
        add     r1, sp, #0x60
        strh    r12, [r10, #0x10]
        strh    lr, [r10, #0x12]
        strh    r11, [r10, #4]
        strh    r7, [r9, #0x12]
        mov     r2, #0x3C
        mov     r0, r4
        bl      _ippsCopy_16s
        mvn     r12, #0xFF
        bic     lr, r12, #0x7F, 24
        mvn     r12, #2, 2
        mvn     r11, lr
        mov     r7, #0
        mov     r1, r12, lsl #15
        mov     lr, r7
        mov     r0, #2, 2
        str     r1, [sp, #4]
        str     r12, [sp, #0xC]
        str     r11, [sp, #8]
        str     r8, [sp]
LDUO0:
        ldrsh   r10, [r4], #2
        mov     r11, lr, lsl #1
        ldrsh   r8, [r6, #2]
        add     r3, sp, #0x4C
        add     r0, r3, r11
        ldrsh   r12, [r0, #0x12]
        ldrsh   r3, [r6]
        ldrsh   r9, [r0, #0x10]
        mul     r3, r3, r12
        ldrsh   r12, [r0, #0xE]
        mul     r9, r8, r9
        rsb     r10, r3, r10, lsl #13
        str     r9, [sp, #0x10]
        ldrsh   r2, [r6, #4]
        ldrsh   r8, [r0, #0xC]
        ldrsh   r9, [r6, #6]
        mul     r12, r2, r12
        ldrsh   r2, [r6, #8]
        mul     r8, r9, r8
        ldrsh   r1, [r0, #0xA]
        ldr     r3, [sp, #0x10]
        mul     r1, r2, r1
        str     r8, [sp, #0x14]
        ldrsh   r9, [r6, #0xA]
        ldrsh   r8, [r0, #8]
        str     r1, [sp, #0x18]
        ldrsh   r2, [r6, #0xC]
        ldrsh   r1, [r0, #6]
        mul     r8, r9, r8
        sub     r10, r10, r3
        mul     r1, r2, r1
        ldr     r3, [sp, #0x14]
        sub     r10, r10, r12
        str     r8, [sp, #0x1C]
        ldrsh   r9, [r0, #4]
        ldrsh   r8, [r6, #0xE]
        str     r1, [sp, #0x20]
        ldrsh   r0, [r0, #2]
        sub     r10, r10, r3
        mul     r9, r8, r9
        ldr     r3, [sp, #0x18]
        add     r8, sp, #0x4C
        add     r12, sp, #0xD8
        sub     r10, r10, r3
        str     r9, [sp, #0x24]
        ldrsh   r8, [r8, +r11]
        ldrsh   r9, [r6, #0x12]
        ldrsh   r2, [r6, #0x10]
        ldrsh   r1, [r6, #0x14]
        ldr     r3, [sp, #0x1C]
        mul     r8, r9, r8
        mul     r0, r2, r0
        ldrsh   r9, [r6, #0x18]
        ldrsh   r2, [r6, #0x16]
        sub     r3, r10, r3
        str     r9, [sp, #0x28]
        ldrsh   r9, [r6, #0x1A]
        str     r9, [sp, #0x2C]
        ldrsh   r9, [r6, #0x1C]
        str     r9, [sp, #0x30]
        ldrsh   r9, [r6, #0x1E]
        str     r9, [sp, #0x34]
        ldrsh   r9, [r6, #0x20]
        str     r9, [sp, #0x38]
        ldrsh   r9, [r6, #0x22]
        str     r9, [sp, #0x3C]
        ldrsh   r9, [r6, #0x24]
        str     r9, [sp, #0x40]
        add     r9, sp, #0xD8
        ldrsh   r9, [r9, +r11]
        add     r11, r12, r11
        ldr     r12, [sp, #0x20]
        str     r9, [sp, #0x44]
        ldrsh   r9, [r6, #0x26]
        sub     r12, r3, r12
        str     r9, [sp, #0x48]
        ldr     r9, [sp, #0x24]
        ldrsh   r3, [r11, #0x12]
        ldrsh   r10, [r11, #6]
        sub     r12, r12, r9
        sub     r12, r12, r0
        sub     r12, r12, r8
        mla     r1, r1, r3, r12
        ldrsh   r9, [r11, #0x10]
        ldrsh   r3, [r11, #0xE]
        ldrsh   r8, [r11, #0xC]
        mla     r2, r2, r9, r1
        ldr     r1, [sp, #0x28]
        ldrsh   r12, [r11, #0xA]
        ldrsh   r9, [r11, #8]
        ldrsh   r0, [r11, #4]
        mla     r2, r1, r3, r2
        ldr     r3, [sp, #0x2C]
        ldrsh   r11, [r11, #2]
        mla     r2, r3, r8, r2
        ldr     r3, [sp, #0x30]
        mla     r2, r3, r12, r2
        ldr     r3, [sp, #0x34]
        ldr     r12, [sp, #0x44]
        mla     r2, r3, r9, r2
        ldr     r3, [sp, #0x38]
        mla     r2, r3, r10, r2
        ldr     r3, [sp, #0x3C]
        mla     r2, r3, r0, r2
        ldr     r3, [sp, #0x40]
        mla     r2, r3, r11, r2
        ldr     r3, [sp, #0x48]
        mla     r12, r3, r12, r2
        cmn     r12, #0x1F, 4
        ble     LDUO1
        ldr     r3, [sp, #0xC]
        str     r3, [r5]
        ldr     r12, [sp, #8]
        add     r3, sp, #0xD8
        add     r3, r3, r7
        strh    r12, [r3, #0x14]
        b       LDUO3
LDUO1:
        cmp     r12, #0xF, 4
        add     r3, sp, #0xD8
        bge     LDUO2
        mov     r12, #2, 2
        str     r12, [r5]
        ldr     r12, [sp, #4]
        add     r3, r3, r7
        strh    r12, [r3, #0x14]
        b       LDUO3
LDUO2:
        add     r8, r12, #1, 20
        add     r3, r3, r7
        mov     r8, r8, asr #13
        mov     r12, r12, lsl #3
        strh    r8, [r3, #0x14]
        str     r12, [r5]
LDUO3:
        add     lr, lr, #1
        cmp     lr, #0x3C
        add     r7, r7, #2
        add     r5, r5, #4
        blt     LDUO0
        ldr     r8, [sp]
        add     r9, sp, #0x4C
        add     r10, sp, #0xD8
        ldrsh   r0, [r10, #0x78]
        ldrsh   lr, [r9, #0x78]
        ldrsh   r2, [r9, #0x7A]
        ldrsh   r12, [r10, #0x7A]
        ldrsh   r1, [r9, #0x7C]
        ldrsh   r4, [r10, #0x7C]
        ldrsh   r5, [r9, #0x7E]
        strh    r0, [r8, #0x14]
        ldrsh   r0, [r9, #0x80]
        strh    lr, [r8]
        ldrsh   lr, [r10, #0x7E]
        strh    r2, [r8, #2]
        ldrsh   r2, [r10, #0x80]
        strh    r12, [r8, #0x16]
        ldrsh   r12, [r9, #0x82]
        strh    r0, [r8, #8]
        ldrsh   r0, [r10, #0x86]
        strh    r1, [r8, #4]
        ldrsh   r1, [r10, #0x82]
        strh    r4, [r8, #0x18]
        ldrsh   r4, [r9, #0x84]
        strh    r5, [r8, #6]
        ldrsh   r5, [r10, #0x84]
        strh    lr, [r8, #0x1A]
        ldrsh   lr, [r9, #0x86]
        strh    r2, [r8, #0x1C]
        ldrsh   r2, [r9, #0x88]
        ldrsh   r9, [r9, #0x8A]
        strh    r12, [r8, #0xA]
        ldrsh   r12, [r10, #0x88]
        ldrsh   r10, [r10, #0x8A]
        strh    r0, [r8, #0x22]
        mov     r0, #0
        strh    r1, [r8, #0x1E]
        strh    r4, [r8, #0xC]
        strh    r5, [r8, #0x20]
        strh    lr, [r8, #0xE]
        strh    r2, [r8, #0x10]
        strh    r12, [r8, #0x24]
        strh    r9, [r8, #0x12]
        strh    r10, [r8, #0x26]
        add     sp, sp, #0x59, 30
        ldmia   sp!, {r4 - r11, pc}
LDUO4:
        mvn     r0, #7
        add     sp, sp, #0x59, 30
        ldmia   sp!, {r4 - r11, pc}


