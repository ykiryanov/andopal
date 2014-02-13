        .text
        .align  4
        .globl  _ippsIIR16s_G729_16s


_ippsIIR16s_G729_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB4
        cmp     r0, #0
        beq     LDUB4
        cmp     r1, #0
        beq     LDUB4
        cmp     r2, #0
        beq     LDUB4
        cmp     r3, #0
        beq     LDUB4
        ldrsh   r4, [r3]
        ldrsh   r12, [r3, #8]
        ldrsh   r6, [r3, #2]
        ldrsh   r7, [r3, #4]
        ldrsh   r5, [r3, #6]
        add     lr, sp, #0x50
        strh    r4, [lr]
        ldrsh   r4, [r3, #0xA]
        strh    r12, [lr, #8]
        strh    r6, [lr, #2]
        strh    r7, [lr, #4]
        strh    r5, [lr, #6]
        ldrsh   r12, [r3, #0x12]
        ldrsh   r6, [r3, #0xC]
        ldrsh   r7, [r3, #0xE]
        ldrsh   r5, [r3, #0x10]
        strh    r4, [lr, #0xA]
        strh    r12, [lr, #0x12]
        mvn     r4, #0xFF
        strh    r6, [lr, #0xC]
        strh    r7, [lr, #0xE]
        strh    r5, [lr, #0x10]
        mov     r12, #0
        bic     r4, r4, #0x7F, 24
        mvn     r4, r4
        mov     r6, r12
        add     r5, r1, #0x14
        sub     r7, r12, #2, 18
        str     r2, [sp, #4]
        str     r5, [sp, #8]
        str     r7, [sp, #0x14]
        str     r4, [sp, #0xC]
        str     r6, [sp]
        str     r3, [sp, #0x18]
        str     r1, [sp, #0x10]
LDUB0:
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x10]
        ldrsh   r1, [r2], #2
        str     r2, [sp, #8]
        ldr     r2, [sp]
        ldrsh   r4, [r0, #2]
        ldrsh   lr, [r0]
        ldrsh   r9, [r0, #6]
        ldrsh   r6, [r0, #8]
        add     r2, r2, #0xA
        add     r5, r3, r2, lsl #1
        ldrsh   r2, [r5, #-2]
        ldrsh   r3, [r5, #-4]
        ldrsh   r7, [r5, #-8]
        ldrsh   r8, [r5, #-6]
        mul     r4, r4, r2
        ldrsh   r2, [r0, #4]
        mla     r10, lr, r1, r4
        ldrsh   lr, [r5, #-0xA]
        ldrsh   r4, [r0, #0xA]
        ldrsh   r1, [r5, #-0xC]
        mla     r10, r2, r3, r10
        ldrsh   r2, [r0, #0xC]
        ldrsh   r3, [r5, #-0xE]
        str     r3, [sp, #0x1C]
        ldrsh   r3, [r0, #0xE]
        mla     r10, r9, r8, r10
        ldrsh   r11, [r5, #-0x10]
        str     r11, [sp, #0x20]
        ldrsh   r8, [r0, #0x10]
        mla     r10, r6, r7, r10
        str     r8, [sp, #0x24]
        ldrsh   r8, [r5, #-0x12]
        ldr     r11, [sp, #0x24]
        str     r8, [sp, #0x28]
        ldrsh   r8, [r0, #0x12]
        mla     r7, r4, lr, r10
        ldr     r10, [sp, #0x20]
        str     r8, [sp, #0x2C]
        ldrsh   r5, [r5, #-0x14]
        mla     r1, r2, r1, r7
        ldr     r7, [sp, #0x1C]
        str     r5, [sp, #0x30]
        ldrsh   r5, [r0, #0x14]
        mla     r3, r3, r7, r1
        add     r1, sp, #0x50
        add     r1, r1, r12
        str     r5, [sp, #0x34]
        ldrsh   r5, [r0, #0x16]
        mla     r3, r11, r10, r3
        ldr     r10, [sp, #0x34]
        str     r5, [sp, #0x38]
        ldrsh   r8, [r0, #0x20]
        ldrsh   r6, [r0, #0x18]
        ldrsh   r5, [r0, #0x1A]
        ldrsh   r4, [r0, #0x1C]
        ldrsh   lr, [r0, #0x1E]
        str     r8, [sp, #0x3C]
        ldrsh   r8, [r0, #0x22]
        str     r8, [sp, #0x40]
        ldrsh   r2, [r0, #0x24]
        str     r2, [sp, #0x44]
        ldrsh   r2, [r0, #0x26]
        str     r2, [sp, #0x48]
        ldrsh   r2, [r0, #0x28]
        str     r2, [sp, #0x4C]
        add     r2, sp, #0x50
        ldrsh   r2, [r2, +r12]
        ldrsh   r9, [r0, #0x2A]
        ldrsh   r8, [r1, #0x12]
        ldrsh   r7, [r1, #0x10]
        ldr     r11, [sp, #0x4C]
        mul     r2, r9, r2
        ldr     r9, [sp, #0x30]
        mul     r5, r5, r7
        str     r2, [sp, #0x24]
        mul     r2, r6, r8
        ldr     r6, [sp, #0x28]
        ldr     r8, [sp, #0x2C]
        ldrsh   r7, [r1, #0xE]
        mla     r3, r8, r6, r3
        ldrsh   r6, [r1, #0xC]
        ldrsh   r8, [r1, #8]
        mul     r4, r4, r7
        ldrsh   r7, [r1, #0xA]
        mla     r3, r10, r9, r3
        mul     r6, lr, r6
        ldr     lr, [sp, #0x3C]
        ldrsh   r9, [r1, #4]
        mul     r7, lr, r7
        ldr     lr, [sp, #0x40]
        add     r3, r3, #2, 22
        mov     r10, r3, asr #12
        ldr     r3, [sp, #0x44]
        mul     lr, lr, r8
        ldrsh   r8, [r1, #6]
        mul     r3, r3, r8
        mov     r8, r10, lsl #16
        ldr     r10, [sp, #0x48]
        mov     r8, r8, asr #16
        mul     r10, r10, r9
        ldr     r9, [sp, #0x38]
        mul     r9, r9, r8
        ldrsh   r8, [r1, #2]
        sub     r9, r9, r2
        sub     r9, r9, r5
        sub     r9, r9, r4
        mul     r8, r11, r8
        sub     r9, r9, r6
        sub     r9, r9, r7
        sub     r9, r9, lr
        ldr     r2, [sp, #0x24]
        sub     r9, r9, r3
        sub     r9, r9, r10
        sub     r8, r9, r8
        ldr     r3, [sp, #0xC]
        sub     r8, r8, r2
        add     r2, r8, #2, 22
        mov     r2, r2, asr #12
        cmp     r3, r2
        mov     r3, r2, lsl #16
        mov     r3, r3, asr #16
        bge     LDUB1
        ldr     r2, [sp, #0xC]
        strh    r2, [r1, #0x14]
        ldr     r1, [sp, #4]
        strh    r2, [r1]
        b       LDUB3
LDUB1:
        cmn     r2, #2, 18
        bge     LDUB2
        ldr     r2, [sp, #0x14]
        strh    r2, [r1, #0x14]
        ldr     r1, [sp, #4]
        strh    r2, [r1]
        b       LDUB3
LDUB2:
        strh    r3, [r1, #0x14]
        ldr     r1, [sp, #4]
        strh    r3, [r1]
LDUB3:
        ldr     r1, [sp]
        add     r12, r12, #2
        add     r1, r1, #1
        cmp     r1, #0x28
        str     r1, [sp]
        ldr     r1, [sp, #4]
        add     r1, r1, #2
        str     r1, [sp, #4]
        blt     LDUB0
        add     lr, sp, #0x50
        ldr     r3, [sp, #0x18]
        ldrsh   r7, [lr, #0x50]
        ldrsh   r0, [lr, #0x52]
        ldrsh   r1, [lr, #0x54]
        ldrsh   r2, [lr, #0x56]
        ldrsh   r12, [lr, #0x58]
        ldrsh   r4, [lr, #0x5A]
        ldrsh   r5, [lr, #0x5C]
        ldrsh   r6, [lr, #0x5E]
        strh    r7, [r3]
        ldrsh   r7, [lr, #0x60]
        ldrsh   lr, [lr, #0x62]
        strh    r0, [r3, #2]
        mov     r0, #0
        strh    r1, [r3, #4]
        strh    r2, [r3, #6]
        strh    r12, [r3, #8]
        strh    r4, [r3, #0xA]
        strh    r5, [r3, #0xC]
        strh    r6, [r3, #0xE]
        strh    r7, [r3, #0x10]
        strh    lr, [r3, #0x12]
        add     sp, sp, #0xB4
        ldmia   sp!, {r4 - r11, pc}
LDUB4:
        mvn     r0, #7
        add     sp, sp, #0xB4
        ldmia   sp!, {r4 - r11, pc}


