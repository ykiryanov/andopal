        .text
        .align  4
        .globl  _ippsQMFDecode_G722_16s


_ippsQMFDecode_G722_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        cmp     r0, #0
        beq     LDFU5
        cmp     r1, #0
        beq     LDFU5
        cmp     r3, #0
        beq     LDFU5
        cmp     r2, #0
        ble     LDFU4
        tst     r2, #1
        bne     LDFU4
        cmp     r2, #0
        ble     LDFU3
        ldr     r10, [pc, #0x350]
        mvn     r12, #0xFF
        mov     lr, #0
        bic     r12, r12, #0x7F, 24
        add     r5, r1, #2
        sub     r4, lr, #2, 18
        mvn     r12, r12
        add     r9, r0, #2
        str     r5, [sp, #0xC]
        str     r4, [sp]
        str     lr, [sp, #8]
        str     r2, [sp, #4]
LDFU0:
        ldrsh   r2, [r0]
        ldrsh   lr, [r9]
        add     lr, r2, lr
        mov     r2, lr, lsl #16
        mov     r2, r2, asr #16
        strh    r2, [r3, #2]
        ldrsh   lr, [r0], #4
        ldrsh   r4, [r9], #4
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        sub     lr, lr, r4
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r3]
        ldrsh   r4, [r10]
        mov     r5, lr, lsl #16
        ldrsh   lr, [r10, #2]
        mov     r5, r5, asr #16
        mul     r4, r4, r5
        str     r5, [sp, #0x14]
        ldrsh   r8, [r10, #4]
        mul     lr, lr, r2
        ldrsh   r11, [r3, #4]
        ldrsh   r7, [r10, #8]
        ldrsh   r6, [r3, #6]
        mla     r4, r8, r11, r4
        ldrsh   r8, [r3, #8]
        ldrsh   r5, [r10, #6]
        mla     lr, r5, r6, lr
        ldrsh   r6, [r3, #0xA]
        mla     r4, r7, r8, r4
        ldrsh   r7, [r10, #0xC]
        ldrsh   r5, [r10, #0xA]
        ldrsh   r8, [r3, #0xC]
        mla     lr, r5, r6, lr
        ldrsh   r5, [r10, #0xE]
        ldrsh   r6, [r3, #0xE]
        mla     r4, r7, r8, r4
        ldrsh   r8, [r3, #0x10]
        ldrsh   r7, [r10, #0x10]
        mla     lr, r5, r6, lr
        ldrsh   r6, [r3, #0x12]
        ldrsh   r5, [r10, #0x12]
        mla     r4, r7, r8, r4
        ldrsh   r7, [r10, #0x14]
        ldrsh   r8, [r3, #0x14]
        mla     lr, r5, r6, lr
        ldrsh   r6, [r3, #0x16]
        ldrsh   r5, [r10, #0x16]
        mla     r4, r7, r8, r4
        ldrsh   r7, [r10, #0x18]
        ldrsh   r8, [r3, #0x18]
        mla     lr, r5, r6, lr
        ldrsh   r5, [r10, #0x1A]
        ldrsh   r6, [r3, #0x1A]
        mla     r4, r7, r8, r4
        ldrsh   r8, [r10, #0x1C]
        ldrsh   r7, [r3, #0x1C]
        mla     lr, r5, r6, lr
        ldrsh   r6, [r3, #0x1E]
        ldrsh   r5, [r10, #0x1E]
        mla     r4, r8, r7, r4
        ldrsh   r8, [r10, #0x20]
        ldrsh   r7, [r3, #0x20]
        mla     lr, r5, r6, lr
        ldrsh   r5, [r10, #0x22]
        ldrsh   r6, [r3, #0x22]
        mla     r4, r8, r7, r4
        ldrsh   r8, [r10, #0x24]
        ldrsh   r7, [r3, #0x24]
        mla     lr, r5, r6, lr
        ldrsh   r5, [r10, #0x26]
        ldrsh   r6, [r3, #0x26]
        mla     r4, r8, r7, r4
        ldrsh   r7, [r3, #0x28]
        ldrsh   r8, [r10, #0x28]
        mla     lr, r5, r6, lr
        ldrsh   r6, [r3, #0x2A]
        ldrsh   r5, [r10, #0x2A]
        mla     r4, r8, r7, r4
        ldrsh   r8, [r10, #0x2C]
        ldrsh   r7, [r3, #0x2C]
        mla     lr, r5, r6, lr
        ldrsh   r6, [r3, #0x2E]
        ldrsh   r5, [r10, #0x2E]
        mla     r4, r8, r7, r4
        ldrsh   r7, [r3, #0x2A]
        mla     lr, r5, r6, lr
        str     r7, [sp, #0x18]
        ldrsh   r7, [r3, #0x28]
        mov     r4, r4, asr #12
        cmp     r12, r4
        str     r7, [sp, #0x1C]
        ldrsh   r5, [r3, #0x26]
        mov     lr, lr, asr #12
        str     r5, [sp, #0x20]
        ldrsh   r5, [r3, #0x24]
        str     r5, [sp, #0x24]
        ldrsh   r5, [r3, #0x22]
        str     r5, [sp, #0x28]
        ldrsh   r5, [r3, #0x20]
        str     r5, [sp, #0x2C]
        ldrsh   r5, [r3, #0x1E]
        str     r5, [sp, #0x30]
        ldrsh   r5, [r3, #0x1C]
        str     r5, [sp, #0x34]
        ldrsh   r5, [r3, #0x1A]
        str     r5, [sp, #0x38]
        ldrsh   r5, [r3, #0x18]
        str     r5, [sp, #0x3C]
        ldrsh   r5, [r3, #0x16]
        str     r5, [sp, #0x40]
        ldrsh   r5, [r3, #0x14]
        str     r5, [sp, #0x44]
        ldrsh   r5, [r3, #0x12]
        str     r5, [sp, #0x48]
        ldrsh   r5, [r3, #0x10]
        ldrsh   r6, [r3, #0xE]
        str     r6, [sp, #0x4C]
        ldrsh   r6, [r3, #0xC]
        str     r6, [sp, #0x50]
        ldrsh   r8, [r3, #6]
        ldrsh   r6, [r3, #0xA]
        ldrsh   r7, [r3, #8]
        ldrsh   r11, [r3, #4]
        str     r4, [sp, #0x10]
        ldr     r4, [sp, #0x18]
        strh    r4, [r3, #0x2E]
        ldr     r4, [sp, #0x1C]
        strh    r4, [r3, #0x2C]
        ldr     r4, [sp, #0x20]
        strh    r4, [r3, #0x2A]
        ldr     r4, [sp, #0x24]
        strh    r4, [r3, #0x28]
        ldr     r4, [sp, #0x28]
        strh    r4, [r3, #0x26]
        ldr     r4, [sp, #0x2C]
        strh    r4, [r3, #0x24]
        ldr     r4, [sp, #0x30]
        strh    r4, [r3, #0x22]
        ldr     r4, [sp, #0x34]
        strh    r4, [r3, #0x20]
        ldr     r4, [sp, #0x38]
        strh    r4, [r3, #0x1E]
        ldr     r4, [sp, #0x3C]
        strh    r4, [r3, #0x1C]
        ldr     r4, [sp, #0x40]
        strh    r4, [r3, #0x1A]
        ldr     r4, [sp, #0x44]
        strh    r4, [r3, #0x18]
        ldr     r4, [sp, #0x48]
        strh    r5, [r3, #0x14]
        strh    r4, [r3, #0x16]
        ldr     r4, [sp, #0x4C]
        strh    r4, [r3, #0x12]
        ldr     r4, [sp, #0x50]
        strh    r2, [r3, #6]
        strh    r6, [r3, #0xE]
        strh    r4, [r3, #0x10]
        strh    r7, [r3, #0xC]
        strh    r8, [r3, #0xA]
        strh    r11, [r3, #8]
        ldr     r2, [sp, #0x14]
        strh    r2, [r3, #4]
        strlth  r12, [r1]
        blt     LDFU1
        ldr     r2, [sp, #0x10]
        cmn     r2, #2, 18
        ldrge   r2, [sp, #0x10]
        strgeh  r2, [r1]
        ldrlt   r2, [sp]
        strlth  r2, [r1]
LDFU1:
        cmp     r12, lr
        ldrlt   r2, [sp, #0xC]
        strlth  r12, [r2]
        blt     LDFU2
        cmn     lr, #2, 18
        ldrge   r2, [sp, #0xC]
        strgeh  lr, [r2]
        bge     LDFU2
        ldr     r2, [sp]
        ldr     lr, [sp, #0xC]
        strh    r2, [lr]
LDFU2:
        ldr     r2, [sp, #8]
        ldr     lr, [sp, #4]
        add     r1, r1, #4
        add     r2, r2, #2
        str     r2, [sp, #8]
        cmp     r2, lr
        ldr     r2, [sp, #0xC]
        add     r2, r2, #4
        str     r2, [sp, #0xC]
        blt     LDFU0
LDFU3:
        mov     r0, #0
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LDFU4:
        mvn     r0, #5
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LDFU5:
        mvn     r0, #7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
        .long   LDFU_TableQMFCoeff


        .data
        .align  4


LDFU_TableQMFCoeff:
        .byte   0x06,0x00,0xEA,0xFF,0xEA,0xFF,0x6A,0x00,0x18,0x00,0xC8,0xFE,0x40,0x00,0xD4,0x02
        .byte   0x5C,0xFE,0xB6,0xF9,0x6E,0x07,0x48,0x1E,0x48,0x1E,0x6E,0x07,0xB6,0xF9,0x5C,0xFE
        .byte   0xD4,0x02,0x40,0x00,0xC8,0xFE,0x18,0x00,0x6A,0x00,0xEA,0xFF,0xEA,0xFF,0x06,0x00


