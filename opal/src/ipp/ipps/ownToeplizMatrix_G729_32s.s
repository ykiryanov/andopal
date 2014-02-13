        .text
        .align  4
        .globl  ownToeplizMatrix_G729_32s


ownToeplizMatrix_G729_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB4
        mov     r2, #0x7F, 30
        orr     r5, r2, #1, 22
        add     r6, r5, #1, 24
        add     r11, r1, #0x1C
        add     r6, r1, r6
        str     r11, [sp, #0xB0]
        add     r11, r1, #0x7A, 28
        str     r6, [sp, #0x78]
        add     r6, r5, #2, 24
        str     r11, [sp, #0x5C]
        add     r11, r1, #0x8A, 28
        add     r6, r1, r6
        str     r11, [sp, #0x60]
        add     r11, r1, #0x4A, 28
        str     r6, [sp, #0x80]
        add     r6, r5, #3, 24
        str     r11, [sp, #0x64]
        add     r11, r1, #0x5A, 28
        add     r6, r1, r6
        str     r11, [sp, #0x68]
        add     r11, r1, #0xFC
        str     r6, [sp, #0x84]
        sub     r6, r5, #1, 24
        str     r11, [sp, #0x6C]
        add     r11, r1, #0x7F, 30
        str     r11, [sp, #0x70]
        add     r11, r1, #0xFF, 30
        add     r6, r1, r6
        add     r5, r1, r5
        str     r11, [sp, #0x74]
        str     r6, [sp, #0x90]
        str     r5, [sp, #0x94]
        add     r11, r1, #0xBF, 30
        add     r10, r1, #0x9C
        add     r7, r1, #0x7C
        add     r6, r1, #0x5C
        add     r5, r1, #0x3C
        sub     r1, r1, #8
        str     r1, [sp, #0x98]
        add     r1, r0, #0xE
        str     r11, [sp, #0x7C]
        str     r1, [sp, #0x9C]
        add     r11, r0, #0xA
        add     r1, r0, #0x10
        add     r4, r0, #2
        add     lr, r0, #4
        add     r3, r0, #6
        add     r2, r0, #8
        mov     r8, #0
        str     r11, [sp, #0x88]
        str     r1, [sp, #0xA0]
        mov     r12, r8
        add     r11, r0, #0xC
        mov     r1, r0
        mov     r9, r12
        str     r11, [sp, #0x8C]
        str     r4, [sp, #0xAC]
        str     lr, [sp, #0xA8]
        str     r3, [sp, #0xA4]
        str     r2, [sp, #0x58]
        str     r1, [sp, #0x28]
        str     r5, [sp, #0x2C]
        str     r6, [sp, #0x30]
        str     r7, [sp, #0x34]
        str     r10, [sp, #0x38]
        str     r12, [sp, #0x3C]
        str     r0, [sp, #0x40]
LDHC0:
        ldr     r0, [sp, #0x28]
        ldr     r12, [sp, #0x3C]
        ldr     r5, [sp, #0x38]
        ldrsh   r1, [r0], #0xA
        str     r0, [sp, #0x28]
        rsb     r0, r9, #0
        mla     r12, r1, r1, r12
        rsb     r1, r9, #7
        cmp     r1, #0
        str     r12, [r5, +r0, lsl #2]
        ldr     r6, [sp, #0xAC]
        ldrsh   r5, [r6], #0xA
        str     r6, [sp, #0xAC]
        mla     r12, r5, r5, r12
        ldr     r5, [sp, #0x34]
        str     r12, [r5, +r0, lsl #2]
        ldr     r6, [sp, #0xA8]
        ldrsh   r5, [r6], #0xA
        mla     r12, r5, r5, r12
        ldr     r5, [sp, #0x30]
        str     r6, [sp, #0xA8]
        str     r12, [r5, +r0, lsl #2]
        ldr     r6, [sp, #0xA4]
        ldrsh   r5, [r6], #0xA
        str     r6, [sp, #0xA4]
        mla     r12, r5, r5, r12
        ldr     r5, [sp, #0x2C]
        str     r12, [r5, +r0, lsl #2]
        ldr     r6, [sp, #0x58]
        ldrsh   r5, [r6], #0xA
        mla     r12, r5, r5, r12
        ldr     r5, [sp, #0xB0]
        str     r6, [sp, #0x58]
        str     r12, [sp, #0x3C]
        str     r12, [r5, +r0, lsl #2]
        ble     LDHC3
        mov     r12, #0
        ldr     r7, [sp, #0x40]
        mov     r5, r12
        mov     r0, r5
        mov     r6, r0
        str     r6, [sp, #0x54]
        str     r7, [sp, #0x44]
        str     r6, [sp, #0x50]
        mov     r7, r4
        mov     r6, lr
        str     r3, [sp, #0x48]
        str     r7, [sp, #4]
        str     lr, [sp, #0x18]
        str     r4, [sp, #0x1C]
        str     r9, [sp, #0x14]
        ldr     r7, [sp, #0x54]
        ldr     r9, [sp, #0x50]
        ldr     r4, [sp, #0x48]
        ldr     lr, [sp, #0x98]
        mov     r10, r8
        str     r2, [sp, #0x4C]
        str     r10, [sp, #0xC]
        str     r6, [sp]
        str     r8, [sp, #0x24]
        str     r1, [sp, #0x20]
        str     r2, [sp, #8]
        str     r3, [sp, #0x10]
LDHC1:
        ldr     r1, [sp, #0x44]
        ldr     r2, [sp, #4]
        ldr     r8, [sp, #0x10]
        ldrsh   r1, [r1]
        ldr     r3, [sp, #0x1C]
        ldrsh   r6, [r2]
        ldr     r2, [sp, #0xC]
        mov     r2, r2, lsl #1
        ldrsh   r11, [r3, +r2]
        ldr     r3, [sp, #8]
        ldrsh   r8, [r8, +r2]
        ldrsh   r10, [r3, +r2]
        mla     r5, r1, r11, r5
        ldr     r3, [sp, #0x18]
        mla     r9, r1, r10, r9
        mla     r11, r1, r8, r7
        ldrsh   r3, [r3, +r2]
        mla     r10, r6, r3, r5
        mla     r1, r1, r3, r0
        ldr     r3, [sp, #0x14]
        rsb     r0, r12, #0
        sub     r0, r0, r3
        ldr     r3, [sp, #0x44]
        add     r0, r0, #5
        rsb     r0, r12, r0, lsl #3
        add     r3, r3, #0xA
        str     r3, [sp, #0x44]
        rsb     r3, r12, #5
        str     r3, [sp, #0x54]
        ldr     r3, [sp, #0x80]
        str     r10, [r3, +r0, lsl #2]
        ldr     r3, [sp, #0x84]
        str     r1, [r3, +r0, lsl #2]
        ldr     r3, [sp, #0x78]
        str     r11, [r3, +r0, lsl #2]
        ldr     r3, [sp, #0x74]
        str     r9, [r3, +r0, lsl #2]
        ldr     r3, [sp, #4]
        ldr     r7, [sp]
        ldr     r8, [sp, #0x88]
        ldrsh   r5, [r3]
        ldr     r3, [sp, #8]
        ldr     r6, [sp, #0x10]
        ldrsh   r8, [r8, +r2]
        ldrsh   r3, [r3, +r2]
        ldrsh   r7, [r7]
        mla     r9, r5, r8, r9
        ldrsh   r6, [r6, +r2]
        mla     r3, r5, r3, r11
        mla     r1, r5, r6, r1
        ldr     r5, [sp, #0x8C]
        mla     r10, r6, r7, r10
        ldr     r6, [sp, #0x7C]
        ldrsh   r5, [r5, +r2]
        mla     r7, r7, r5, r9
        str     r3, [r6, +r0, lsl #2]
        ldr     r5, [sp, #0x90]
        ldr     r6, [sp, #0x54]
        ldr     r8, [sp, #0x14]
        str     r10, [r5, +r0, lsl #2]
        ldr     r5, [sp, #0x94]
        rsb     r6, r8, r6, lsl #3
        sub     r6, r6, r12
        add     r12, r12, #1
        str     r1, [r5, +r0, lsl #2]
        mov     r6, r6, lsl #2
        add     r5, r6, #2, 22
        str     r7, [lr, +r5]
        ldr     r5, [sp, #8]
        ldrsh   r9, [r4]
        ldrsh   r11, [r5, +r2]
        ldr     r5, [sp]
        ldrsh   r8, [r5]
        ldr     r5, [sp, #0x9C]
        mla     r1, r8, r11, r1
        ldrsh   r5, [r5, +r2]
        str     r5, [sp, #0x54]
        ldr     r5, [sp, #0x88]
        ldrsh   r5, [r5, +r2]
        str     r5, [sp, #0x50]
        mla     r5, r11, r9, r10
        ldr     r10, [sp, #0x54]
        mla     r7, r9, r10, r7
        ldr     r9, [sp, #0x50]
        mla     r3, r8, r9, r3
        ldr     r8, [sp, #4]
        add     r8, r8, #0xA
        str     r8, [sp, #4]
        ldr     r8, [sp, #0x6C]
        str     r5, [r8, +r0, lsl #2]
        ldr     r8, [sp, #0x70]
        str     r1, [r8, +r0, lsl #2]
        add     r0, r6, #5, 24
        str     r7, [lr, +r0]
        add     r0, r6, #9, 24
        str     r3, [lr, +r0]
        ldr     r0, [sp, #0x88]
        ldr     r8, [sp, #0x4C]
        ldrsh   r11, [r4], #0xA
        ldrsh   r0, [r0, +r2]
        ldr     r9, [sp, #0xA0]
        ldrsh   r10, [r8]
        ldr     r8, [sp, #0x8C]
        mla     r1, r11, r0, r1
        ldrsh   r9, [r9, +r2]
        mla     r5, r0, r10, r5
        ldrsh   r8, [r8, +r2]
        mla     r9, r10, r9, r7
        add     r0, r6, #1, 22
        mla     r3, r11, r8, r3
        str     r5, [lr, +r0]
        add     r0, r6, #7, 24
        str     r1, [lr, +r0]
        add     r0, r6, #6, 24
        str     r3, [lr, +r0]
        add     r0, r6, #1, 24
        str     r9, [lr, +r0]
        ldr     r0, [sp, #0x4C]
        ldr     r8, [sp, #0x9C]
        ldrsh   r7, [r0]
        ldr     r0, [sp, #0x8C]
        ldrsh   r0, [r0, +r2]
        ldrsh   r2, [r8, +r2]
        ldr     r8, [sp]
        mla     r0, r7, r0, r1
        add     r1, r6, #3, 24
        mla     r7, r7, r2, r3
        add     r8, r8, #0xA
        str     r8, [sp]
        str     r0, [lr, +r1]
        ldr     r1, [sp, #0x20]
        add     r6, r6, #2, 24
        cmp     r12, r1
        ldr     r1, [sp, #0x4C]
        add     r1, r1, #0xA
        str     r1, [sp, #0x4C]
        str     r7, [lr, +r6]
        ldr     r1, [sp, #0xC]
        add     r1, r1, #5
        str     r1, [sp, #0xC]
        blt     LDHC1
        str     r9, [sp, #0x50]
        ldr     r8, [sp, #0x24]
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x10]
        ldr     lr, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        ldr     r9, [sp, #0x14]
        str     r7, [sp, #0x54]
LDHC2:
        ldr     r10, [sp, #0x40]
        add     r1, r12, r12, lsl #2
        add     r7, r12, r12, lsl #3
        add     r7, r12, r7
        str     r7, [sp, #0x4C]
        ldrsh   r7, [r10, +r7]
        add     r6, r8, r1
        mov     r1, r1, lsl #1
        str     r7, [sp, #0x48]
        ldrsh   r7, [r4, +r1]
        mov     r6, r6, lsl #1
        ldrsh   r10, [lr, +r6]
        ldrsh   r11, [r4, +r6]
        str     r7, [sp, #0x44]
        ldr     r7, [sp, #0x48]
        add     r8, r8, #5
        mla     r5, r7, r11, r5
        ldr     r11, [sp, #0x44]
        mla     r0, r7, r10, r0
        rsb     r7, r12, #0
        sub     r7, r7, r9
        mla     r5, r11, r10, r5
        add     r7, r7, #5
        add     r9, r9, #1
        cmp     r9, #8
        rsb     r12, r12, r7, lsl #3
        ldr     r7, [sp, #0x5C]
        str     r5, [r7], #4
        ldr     r10, [sp, #0x60]
        str     r0, [r10]
        ldrsh   r11, [lr, +r1]
        ldrsh   r10, [r3, +r6]
        str     r11, [sp, #0x48]
        ldrsh   r11, [r4, +r1]
        str     r7, [sp, #0x5C]
        ldr     r7, [sp, #0x60]
        str     r11, [sp, #0x44]
        add     r7, r7, #4
        str     r7, [sp, #0x60]
        ldr     r7, [sp, #0x48]
        mla     r5, r7, r10, r5
        ldr     r7, [sp, #0x64]
        str     r5, [sp, #0x48]
        ldr     r5, [sp, #0x44]
        mla     r0, r5, r10, r0
        ldr     r5, [sp, #0x48]
        str     r5, [r7], #4
        ldr     r11, [sp, #0x68]
        str     r7, [sp, #0x64]
        str     r0, [r11], #4
        ldrsh   r5, [r2, +r6]
        ldrsh   r10, [r3, +r1]
        ldrsh   r7, [lr, +r1]
        str     r11, [sp, #0x68]
        ldr     r11, [sp, #0x48]
        mla     r0, r7, r5, r0
        mla     r10, r10, r5, r11
        ldr     r5, [sp, #0x6C]
        str     r10, [r5, +r12, lsl #2]
        ldr     r5, [sp, #0x70]
        str     r0, [r5, +r12, lsl #2]
        ldr     r5, [sp, #0x4C]
        ldr     r0, [sp, #0x40]
        ldrsh   r7, [r3, +r6]
        ldr     r10, [sp, #0x50]
        ldrsh   r5, [r0, +r5]
        ldrsh   r0, [r2, +r6]
        mla     r0, r5, r0, r10
        ldr     r10, [sp, #0x54]
        mla     r7, r5, r7, r10
        ldr     r5, [sp, #0x74]
        str     r0, [r5, +r12, lsl #2]
        ldr     r0, [sp, #0x78]
        str     r7, [r0, +r12, lsl #2]
        ldrsh   r6, [r2, +r6]
        ldrsh   r1, [r4, +r1]
        ldr     r0, [sp, #0x7C]
        mla     r7, r1, r6, r7
        str     r7, [r0, +r12, lsl #2]
        blt     LDHC0
        add     sp, sp, #0xB4
        ldmia   sp!, {r4 - r11, pc}
LDHC3:
        mov     r12, #0
        mov     r5, r12
        mov     r0, r5
        mov     r6, r0
        str     r6, [sp, #0x54]
        str     r6, [sp, #0x50]
        b       LDHC2


