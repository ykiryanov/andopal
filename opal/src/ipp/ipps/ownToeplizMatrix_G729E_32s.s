        .text
        .align  4
        .globl  ownToeplizMatrix_G729E_32s


ownToeplizMatrix_G729E_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC0
        mov     r6, #2, 18
        str     r6, [sp, #0x74]
        add     r6, r1, #0x4E
        str     r6, [sp, #0x6C]
        add     r6, r1, #0x3E
        str     r6, [sp, #0x68]
        add     r6, r1, #0x2E
        str     r6, [sp, #0x70]
        add     r6, r1, #0x1E
        add     r1, r1, #0xE
        str     r1, [sp, #0x80]
        add     r1, r2, #2, 24
        str     r1, [sp, #0x88]
        add     r1, r2, #1, 24
        str     r1, [sp, #0x8C]
        add     r1, r2, #0x80
        str     r1, [sp, #0x90]
        sub     r1, r2, #2
        str     r1, [sp, #0x94]
        add     r1, r0, #0xA
        str     r1, [sp, #0x98]
        add     r3, r0, #2
        add     lr, r0, #8
        sub     r1, r2, #4
        add     r5, r0, #4
        add     r4, r0, #6
        add     r11, r0, #0xC
        add     r10, r0, #0xE
        add     r9, r0, #0x10
        str     r1, [sp, #0x9C]
        mov     r12, #0
        str     r6, [sp, #0x78]
        mov     r1, r5
        mov     r8, r4
        mov     r7, r12
        add     r6, r2, #6, 26
        str     r0, [sp, #0x7C]
        str     r3, [sp, #0x84]
        str     lr, [sp, #0x64]
        str     r1, [sp, #0x38]
        str     r8, [sp, #0x3C]
        str     r9, [sp, #0x2C]
        str     r10, [sp, #0x28]
        str     r11, [sp, #0x24]
        str     r2, [sp, #0x44]
LDHD0:
        ldr     r2, [sp, #0x7C]
        ldr     r10, [sp, #0x6C]
        rsb     r9, r7, #0
        ldrsh   r1, [r2], #0xA
        str     r2, [sp, #0x7C]
        ldr     r2, [sp, #0x74]
        rsb     r8, r7, #7
        cmp     r8, #0
        mla     r2, r1, r1, r2
        mov     r1, r9, lsl #1
        mov     r9, r2, asr #16
        strh    r9, [r10, +r1]
        ldr     r10, [sp, #0x84]
        ldrsh   r9, [r10], #0xA
        str     r10, [sp, #0x84]
        ldr     r10, [sp, #0x68]
        mla     r2, r9, r9, r2
        mov     r9, r2, asr #16
        strh    r9, [r10, +r1]
        ldr     r10, [sp, #0x38]
        ldrsh   r9, [r10], #0xA
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0x70]
        mla     r2, r9, r9, r2
        mov     r9, r2, asr #16
        strh    r9, [r10, +r1]
        ldr     r10, [sp, #0x3C]
        ldrsh   r9, [r10], #0xA
        str     r10, [sp, #0x3C]
        ldr     r10, [sp, #0x78]
        mla     r2, r9, r9, r2
        mov     r9, r2, asr #16
        strh    r9, [r10, +r1]
        ldr     r10, [sp, #0x64]
        ldrsh   r9, [r10], #0xA
        mla     r2, r9, r9, r2
        ldr     r9, [sp, #0x80]
        str     r10, [sp, #0x64]
        str     r2, [sp, #0x74]
        mov     r2, r2, asr #16
        strh    r2, [r9, +r1]
        ble     LDHD3
        mov     r1, #1, 18
        str     r1, [sp, #0x10]
        str     r3, [sp, #0x5C]
        str     r5, [sp, #0x60]
        str     r4, [sp, #0x58]
        str     r1, [sp, #8]
        str     r0, [sp, #0x50]
        str     r12, [sp, #0x54]
        mov     r10, r7
        add     r11, r7, #1
        mov     r1, lr
        str     r8, [sp, #0x30]
        str     r6, [sp, #0x40]
        str     lr, [sp, #0xC]
        str     r4, [sp, #0x14]
        str     r5, [sp, #0x18]
        str     r3, [sp, #0x1C]
        str     r7, [sp, #0x20]
        ldr     r3, [sp, #0x54]
        ldr     lr, [sp, #0x58]
        ldr     r4, [sp, #0x60]
        ldr     r5, [sp, #0x5C]
        ldr     r6, [sp, #0x50]
        ldr     r7, [sp, #0x9C]
        ldr     r8, [sp, #0x94]
        mov     r9, #0
        mov     r2, r9
        str     r11, [sp, #0x4C]
        str     r10, [sp]
        str     r9, [sp, #4]
        str     r12, [sp, #0x34]
        str     r0, [sp, #0x48]
LDHD1:
        ldrsh   r10, [r6]
        ldr     r0, [sp, #0x1C]
        ldr     r11, [sp, #4]
        mov     r12, r3, lsl #1
        rsb     r9, r2, #0
        ldrsh   r0, [r0, +r12]
        rsb     r11, r11, #0
        str     r11, [sp, #0xA0]
        ldr     r11, [sp]
        add     r3, r3, #5
        sub     r11, r9, r11, lsl #3
        str     r11, [sp, #0xA4]
        ldr     r11, [sp, #8]
        mla     r0, r10, r0, r11
        ldr     r10, [sp, #0x4C]
        sub     r9, r9, r10, lsl #3
        str     r9, [sp, #8]
        ldr     r9, [sp, #0xA4]
        mov     r10, r9, lsl #1
        str     r10, [sp, #0xA4]
        add     r9, r10, #2, 24
        add     r10, r10, #6, 26
        str     r10, [sp, #0xA8]
        mov     r10, r0, asr #15
        strh    r10, [r8, +r9]
        ldr     r9, [sp, #0x18]
        ldr     r11, [sp, #0xA4]
        ldrsh   r10, [r5]
        ldrsh   r9, [r9, +r12]
        add     r11, r11, #1, 24
        str     r11, [sp, #0xAC]
        ldr     r11, [sp, #0xA4]
        mla     r10, r10, r9, r0
        ldr     r9, [sp, #0x20]
        add     r11, r11, #0x80
        str     r11, [sp, #0xA4]
        ldr     r11, [sp, #8]
        mov     r11, r11, lsl #1
        str     r11, [sp, #8]
        ldr     r0, [sp, #8]
        mov     r11, r10, asr #15
        add     r0, r0, #0xA, 26
        str     r0, [sp, #0xB0]
        ldr     r0, [sp, #0xA0]
        sub     r0, r0, r9
        sub     r9, r0, r2
        ldr     r0, [sp, #0xA8]
        add     r2, r2, #1
        mov     r9, r9, lsl #1
        strh    r11, [r8, +r0]
        ldrsh   r0, [r4]
        add     r11, r9, #0xA, 26
        str     r0, [sp, #0xA8]
        ldr     r0, [sp, #0x14]
        ldrsh   r0, [r0, +r12]
        str     r11, [sp, #0xA0]
        add     r11, r9, #2, 24
        str     r11, [sp, #0xB4]
        ldr     r11, [sp, #0xA8]
        mla     r10, r11, r0, r10
        add     r0, r9, #6, 26
        str     r0, [sp, #0xA8]
        add     r0, r9, #1, 24
        str     r0, [sp, #0xB8]
        ldr     r0, [sp]
        add     r9, r9, #0x80
        str     r9, [sp, #0xBC]
        add     r0, r0, #1
        str     r0, [sp]
        ldr     r0, [sp, #0xAC]
        mov     r9, r10, asr #15
        strh    r9, [r8, +r0]
        ldr     r0, [sp, #0xC]
        ldrsh   r9, [lr]
        ldr     r11, [sp, #0x4C]
        ldrsh   r0, [r0, +r12]
        add     r11, r11, #1
        str     r11, [sp, #0x4C]
        ldr     r11, [sp, #4]
        mla     r10, r9, r0, r10
        ldr     r0, [sp, #0x30]
        add     r11, r11, #8
        str     r11, [sp, #4]
        cmp     r2, r0
        ldr     r0, [sp, #0xA4]
        mov     r9, r10, asr #15
        strh    r9, [r8, +r0]
        ldrsh   r0, [r1]
        ldr     r9, [sp, #0x98]
        ldrsh   r9, [r9, +r12]
        mla     r10, r0, r9, r10
        ldr     r9, [sp, #0xB0]
        str     r10, [sp, #8]
        mov     r0, r10, asr #15
        strh    r0, [r8, +r9]
        ldr     r9, [sp, #0xC]
        ldrsh   r0, [r6], #0xA
        ldr     r10, [sp, #0x10]
        ldrsh   r9, [r9, +r12]
        mla     r0, r0, r9, r10
        ldr     r9, [sp, #0xA0]
        mov     r10, r0, asr #15
        strh    r10, [r8, +r9]
        ldr     r10, [sp, #0x98]
        ldrsh   r9, [r5], #0xA
        ldrsh   r10, [r10, +r12]
        mla     r0, r9, r10, r0
        ldr     r9, [sp, #0xB4]
        mov     r10, r0, asr #15
        strh    r10, [r7, +r9]
        ldr     r10, [sp, #0x24]
        ldrsh   r9, [r4], #0xA
        ldrsh   r10, [r10, +r12]
        mla     r0, r9, r10, r0
        ldr     r9, [sp, #0xA8]
        mov     r10, r0, asr #15
        strh    r10, [r7, +r9]
        ldr     r10, [sp, #0x28]
        ldrsh   r9, [lr], #0xA
        ldrsh   r10, [r10, +r12]
        mla     r0, r9, r10, r0
        ldr     r9, [sp, #0xB8]
        mov     r10, r0, asr #15
        strh    r10, [r7, +r9]
        ldr     r10, [sp, #0x2C]
        ldrsh   r9, [r1], #0xA
        ldrsh   r12, [r10, +r12]
        mla     r0, r9, r12, r0
        ldr     r12, [sp, #0xBC]
        str     r0, [sp, #0x10]
        mov     r0, r0, asr #15
        strh    r0, [r7, +r12]
        blt     LDHD1
        ldr     r12, [sp, #0x34]
        ldr     r6, [sp, #0x40]
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     r0, [sp, #0x48]
LDHD2:
        add     r9, r2, r2, lsl #2
        add     r8, r2, r2, lsl #3
        add     r1, r12, r9
        add     r8, r2, r8
        ldrsh   r10, [r0, +r8]
        mov     r2, r9, lsl #1
        ldr     r9, [sp, #8]
        mov     r1, r1, lsl #1
        ldrsh   r11, [r3, +r1]
        add     r12, r12, #5
        add     r7, r7, #1
        cmp     r7, #8
        mla     r9, r10, r11, r9
        mov     r10, r9, asr #15
        strh    r10, [r6], #2
        ldr     r11, [sp, #0x10]
        ldrsh   r8, [r0, +r8]
        ldrsh   r10, [lr, +r1]
        mla     r11, r8, r10, r11
        ldr     r8, [sp, #0x88]
        mov     r10, r11, asr #15
        strh    r10, [r8], #0x10
        ldrsh   r10, [r3, +r2]
        ldrsh   r11, [r5, +r1]
        str     r8, [sp, #0x88]
        ldr     r8, [sp, #0x8C]
        mla     r9, r10, r11, r9
        mov     r10, r9, asr #15
        strh    r10, [r8], #2
        ldrsh   r10, [r5, +r2]
        ldrsh   r11, [r4, +r1]
        str     r8, [sp, #0x8C]
        mla     r9, r10, r11, r9
        ldr     r8, [sp, #0x90]
        mov     r10, r9, asr #15
        strh    r10, [r8], #2
        ldrsh   r2, [r4, +r2]
        ldrsh   r1, [lr, +r1]
        str     r8, [sp, #0x90]
        mla     r9, r2, r1, r9
        ldr     r2, [sp, #0x44]
        mov     r1, r9, asr #15
        strh    r1, [r2], #2
        str     r2, [sp, #0x44]
        blt     LDHD0
        add     sp, sp, #0xC0
        ldmia   sp!, {r4 - r11, pc}
LDHD3:
        mov     r1, #1, 18
        str     r1, [sp, #0x10]
        str     r1, [sp, #8]
        mov     r2, #0
        b       LDHD2


