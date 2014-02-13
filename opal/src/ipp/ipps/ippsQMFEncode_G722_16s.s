        .text
        .align  4
        .globl  _ippsQMFEncode_G722_16s


_ippsQMFEncode_G722_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        cmp     r0, #0
        beq     LDFQ5
        cmp     r1, #0
        beq     LDFQ5
        cmp     r3, #0
        beq     LDFQ5
        cmp     r2, #0
        ble     LDFQ4
        tst     r2, #1
        bne     LDFQ4
        cmp     r2, #0
        ble     LDFQ3
        ldr     r4, [pc, #0x330]
        mvn     r12, #0xFF
        mov     r5, #0
        bic     r12, r12, #0x3F, 24
        add     r7, r0, #2
        sub     r6, r5, #1, 18
        mvn     r12, r12
        add     lr, r1, #2
        str     r0, [sp, #8]
        str     r7, [sp, #0xC]
        str     r6, [sp]
        str     r5, [sp, #0x10]
        str     r2, [sp, #4]
LDFQ0:
        ldr     r2, [sp, #8]
        ldrsh   r0, [r2], #4
        str     r2, [sp, #8]
        strh    r0, [r3, #2]
        ldr     r5, [sp, #0xC]
        mov     r0, r0, lsl #16
        ldrsh   r2, [r5], #4
        str     r5, [sp, #0xC]
        mov     r0, r0, asr #16
        strh    r2, [r3]
        ldrsh   r5, [r4]
        mov     r6, r2, lsl #16
        ldrsh   r2, [r4, #2]
        mov     r6, r6, asr #16
        str     r6, [sp, #0x14]
        mul     r6, r5, r6
        mul     r5, r2, r0
        ldrsh   r9, [r3, #6]
        ldrsh   r10, [r4, #4]
        ldrsh   r8, [r4, #6]
        ldrsh   r11, [r3, #4]
        ldrsh   r7, [r4, #8]
        ldrsh   r2, [r4, #0xA]
        mla     r9, r8, r9, r5
        mla     r6, r10, r11, r6
        ldrsh   r10, [r3, #0xA]
        ldrsh   r8, [r3, #8]
        ldrsh   r5, [r4, #0xC]
        mla     r9, r2, r10, r9
        ldrsh   r11, [r3, #0xC]
        mla     r8, r7, r8, r6
        ldrsh   r6, [r4, #0xE]
        ldrsh   r10, [r3, #0xE]
        ldrsh   r7, [r4, #0x10]
        ldrsh   r2, [r4, #0x12]
        mla     r8, r5, r11, r8
        mla     r9, r6, r10, r9
        ldrsh   r6, [r3, #0x10]
        ldrsh   r10, [r3, #0x12]
        ldrsh   r11, [r3, #0x14]
        mla     r8, r7, r6, r8
        ldrsh   r7, [r4, #0x18]
        mla     r9, r2, r10, r9
        ldrsh   r6, [r4, #0x16]
        ldrsh   r10, [r3, #0x16]
        ldrsh   r5, [r4, #0x14]
        ldrsh   r2, [r4, #0x1A]
        mla     r9, r6, r10, r9
        ldrsh   r10, [r3, #0x1A]
        mla     r8, r5, r11, r8
        ldrsh   r6, [r3, #0x18]
        ldrsh   r5, [r4, #0x1C]
        mla     r9, r2, r10, r9
        ldrsh   r2, [r4, #0x22]
        mla     r8, r7, r6, r8
        ldrsh   r6, [r4, #0x1E]
        ldrsh   r10, [r3, #0x1E]
        ldrsh   r11, [r3, #0x1C]
        ldrsh   r7, [r4, #0x20]
        mla     r9, r6, r10, r9
        ldrsh   r6, [r3, #0x20]
        mla     r8, r5, r11, r8
        ldrsh   r10, [r3, #0x22]
        ldrsh   r5, [r4, #0x24]
        ldrsh   r11, [r3, #0x24]
        mla     r9, r2, r10, r9
        mla     r8, r7, r6, r8
        ldrsh   r6, [r4, #0x26]
        ldrsh   r10, [r3, #0x26]
        ldrsh   r7, [r4, #0x28]
        ldrsh   r2, [r4, #0x2A]
        mla     r8, r5, r11, r8
        mla     r9, r6, r10, r9
        ldrsh   r6, [r3, #0x28]
        ldrsh   r10, [r3, #0x2A]
        ldrsh   r5, [r4, #0x2C]
        mla     r7, r7, r6, r8
        ldrsh   r6, [r4, #0x2E]
        mla     r9, r2, r10, r9
        ldrsh   r10, [r3, #0x28]
        ldrsh   r2, [r3, #0x2A]
        ldrsh   r8, [r3, #0x2E]
        ldrsh   r11, [r3, #0x2C]
        str     r10, [sp, #0x18]
        mla     r10, r6, r8, r9
        ldrsh   r6, [r3, #0x26]
        mla     r5, r5, r11, r7
        str     r6, [sp, #0x1C]
        ldrsh   r6, [r3, #0x24]
        ldrsh   r7, [r3, #0x22]
        str     r7, [sp, #0x20]
        ldrsh   r7, [r3, #0x20]
        str     r7, [sp, #0x24]
        ldrsh   r7, [r3, #0x1E]
        str     r7, [sp, #0x28]
        ldrsh   r7, [r3, #0x1C]
        str     r7, [sp, #0x2C]
        ldrsh   r7, [r3, #0x1A]
        str     r7, [sp, #0x30]
        ldrsh   r7, [r3, #0x18]
        str     r7, [sp, #0x34]
        ldrsh   r7, [r3, #0x16]
        ldrsh   r8, [r3, #0x14]
        ldrsh   r9, [r3, #0x12]
        str     r9, [sp, #0x38]
        ldrsh   r9, [r3, #0x10]
        str     r9, [sp, #0x3C]
        ldrsh   r9, [r3, #0xE]
        str     r9, [sp, #0x40]
        ldrsh   r9, [r3, #0xC]
        str     r9, [sp, #0x44]
        ldrsh   r9, [r3, #0xA]
        str     r9, [sp, #0x48]
        ldrsh   r9, [r3, #8]
        str     r9, [sp, #0x4C]
        ldrsh   r11, [r3, #4]
        ldrsh   r9, [r3, #6]
        str     r11, [sp, #0x50]
        add     r11, r10, r5
        str     r11, [sp, #0x54]
        sub     r5, r5, r10
        strh    r2, [r3, #0x2E]
        ldr     r2, [sp, #0x54]
        ldr     r10, [sp, #0x18]
        mov     r5, r5, asr #15
        mov     r2, r2, asr #15
        cmp     r12, r2
        strh    r10, [r3, #0x2C]
        ldr     r10, [sp, #0x1C]
        strh    r6, [r3, #0x28]
        strh    r10, [r3, #0x2A]
        ldr     r6, [sp, #0x20]
        strh    r6, [r3, #0x26]
        ldr     r6, [sp, #0x24]
        strh    r6, [r3, #0x24]
        ldr     r6, [sp, #0x28]
        strh    r6, [r3, #0x22]
        ldr     r6, [sp, #0x2C]
        strh    r6, [r3, #0x20]
        ldr     r6, [sp, #0x30]
        strh    r6, [r3, #0x1E]
        ldr     r6, [sp, #0x34]
        strh    r7, [r3, #0x1A]
        strh    r8, [r3, #0x18]
        strh    r6, [r3, #0x1C]
        ldr     r6, [sp, #0x38]
        strh    r6, [r3, #0x16]
        ldr     r6, [sp, #0x3C]
        strh    r6, [r3, #0x14]
        ldr     r6, [sp, #0x40]
        strh    r6, [r3, #0x12]
        ldr     r6, [sp, #0x44]
        strh    r6, [r3, #0x10]
        ldr     r6, [sp, #0x48]
        strh    r6, [r3, #0xE]
        ldr     r6, [sp, #0x4C]
        strh    r9, [r3, #0xA]
        strh    r6, [r3, #0xC]
        ldr     r6, [sp, #0x50]
        strh    r0, [r3, #6]
        strh    r6, [r3, #8]
        ldr     r0, [sp, #0x14]
        strh    r0, [r3, #4]
        strlth  r12, [r1]
        blt     LDFQ1
        cmn     r2, #1, 18
        strgeh  r2, [r1]
        ldrlt   r0, [sp]
        strlth  r0, [r1]
LDFQ1:
        cmp     r12, r5
        strlth  r12, [lr]
        blt     LDFQ2
        cmn     r5, #1, 18
        strgeh  r5, [lr]
        ldrlt   r0, [sp]
        strlth  r0, [lr]
LDFQ2:
        ldr     r0, [sp, #0x10]
        ldr     r2, [sp, #4]
        add     r1, r1, #4
        add     r0, r0, #2
        str     r0, [sp, #0x10]
        cmp     r0, r2
        add     lr, lr, #4
        blt     LDFQ0
LDFQ3:
        mov     r0, #0
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LDFQ4:
        mvn     r0, #5
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LDFQ5:
        mvn     r0, #7
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
        .long   LDFQ_TableQMFCoeff


        .data
        .align  4


LDFQ_TableQMFCoeff:
        .byte   0x06,0x00,0xEA,0xFF,0xEA,0xFF,0x6A,0x00,0x18,0x00,0xC8,0xFE,0x40,0x00,0xD4,0x02
        .byte   0x5C,0xFE,0xB6,0xF9,0x6E,0x07,0x48,0x1E,0x48,0x1E,0x6E,0x07,0xB6,0xF9,0x5C,0xFE
        .byte   0xD4,0x02,0x40,0x00,0xC8,0xFE,0x18,0x00,0x6A,0x00,0xEA,0xFF,0xEA,0xFF,0x06,0x00


