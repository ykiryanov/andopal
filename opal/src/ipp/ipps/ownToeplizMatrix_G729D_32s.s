        .text
        .align  4
        .globl  ownToeplizMatrix_G729D_32s


ownToeplizMatrix_G729D_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xB4
        add     r6, r1, #0x9C
        str     r6, [sp, #0x68]
        add     r6, r1, #0x7C
        str     r6, [sp, #0x70]
        add     r6, r1, #0x5C
        str     r6, [sp, #0x78]
        add     r6, r1, #0x1C
        mov     r12, #0
        str     r6, [sp, #0x84]
        mov     r3, r12
        sub     r6, r1, #4
        add     r2, r0, #8
        add     r8, r0, #0xC
        str     r6, [sp, #0x80]
        add     r5, r0, #2
        add     r4, r0, #4
        add     lr, r0, #6
        str     r2, [sp, #0x64]
        str     r3, [sp, #0x18]
        add     r10, r1, #0x3C
        sub     r11, r1, #8
        add     r9, r0, #0xA
        add     r7, r0, #0xE
        add     r6, r0, #0x10
        str     r12, [sp, #0x30]
        str     r8, [sp, #0x10]
        str     r1, [sp, #0x3C]
        ldr     r12, [sp, #0x80]
        ldr     r1, [sp, #0x64]
        ldr     r8, [sp, #0x18]
        str     r11, [sp, #0x58]
        str     r0, [sp, #0x5C]
        str     r5, [sp, #0x6C]
        str     r4, [sp, #0x74]
        str     lr, [sp, #0x7C]
        str     r2, [sp, #0x60]
        str     r6, [sp, #0x28]
        str     r7, [sp, #0x20]
        str     r9, [sp, #0x44]
        str     r10, [sp, #0x34]
        str     r3, [sp, #0x38]
        str     r0, [sp, #0x40]
LDHE0:
        ldr     r0, [sp, #0x5C]
        ldr     r3, [sp, #0x38]
        rsb     r6, r8, #7
        ldrsh   r2, [r0], #0xA
        str     r0, [sp, #0x5C]
        rsb     r0, r8, #0
        mla     r2, r2, r2, r3
        ldr     r3, [sp, #0x68]
        cmp     r6, #0
        str     r2, [r3, +r0, lsl #2]
        ldr     r7, [sp, #0x6C]
        ldrsh   r3, [r7], #0xA
        str     r7, [sp, #0x6C]
        mla     r2, r3, r3, r2
        ldr     r3, [sp, #0x70]
        str     r2, [r3, +r0, lsl #2]
        ldr     r7, [sp, #0x74]
        ldrsh   r3, [r7], #0xA
        mla     r2, r3, r3, r2
        ldr     r3, [sp, #0x78]
        str     r7, [sp, #0x74]
        str     r2, [r3, +r0, lsl #2]
        ldr     r7, [sp, #0x7C]
        ldrsh   r3, [r7], #0xA
        str     r7, [sp, #0x7C]
        mla     r2, r3, r3, r2
        ldr     r3, [sp, #0x34]
        str     r2, [r3, +r0, lsl #2]
        ldr     r7, [sp, #0x60]
        ldrsh   r3, [r7], #0xA
        mla     r2, r3, r3, r2
        ldr     r3, [sp, #0x84]
        str     r7, [sp, #0x60]
        str     r2, [sp, #0x38]
        str     r2, [r3, +r0, lsl #2]
        ble     LDHE6
        mov     r3, #0
        mov     r2, r3
        mov     r0, r2
        mov     r7, r0
        ldr     r9, [sp, #0x40]
        ldr     r10, [sp, #0x30]
        str     r7, [sp, #4]
        str     r5, [sp, #0x54]
        str     lr, [sp, #0x4C]
        str     r4, [sp, #0x50]
        str     r7, [sp]
        str     r6, [sp, #0x2C]
        str     r4, [sp, #0x1C]
        str     r5, [sp, #0x24]
        ldr     r4, [sp, #0x4C]
        ldr     r5, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        ldr     r7, [sp, #0x44]
        str     r1, [sp, #0x48]
        str     r10, [sp, #0x14]
        str     r9, [sp, #8]
        str     lr, [sp, #0xC]
        str     r8, [sp, #0x18]
LDHE1:
        ldr     lr, [sp, #8]
        ldr     r11, [sp, #0x18]
        ldr     r8, [sp, #0x24]
        ldrsh   r10, [lr]
        ldr     lr, [sp, #0x14]
        mov     lr, lr, lsl #1
        ldrsh   r9, [r8, +lr]
        rsb     r8, r3, #0
        sub     r8, r8, r11
        add     r8, r8, #5
        mla     r2, r10, r9, r2
        ldr     r9, [sp, #0x18]
        rsb     r8, r3, r8, lsl #3
        str     r2, [sp, #0x88]
        ldr     r10, [sp, #0x88]
        rsb     r2, r3, #5
        rsb     r9, r9, r2, lsl #3
        mov     r2, r8, lsl #2
        add     r8, r2, #1, 22
        str     r10, [r12, +r8]
        ldr     r8, [sp, #8]
        ldr     r11, [sp, #4]
        ldr     r10, [sp, #0x1C]
        ldrsh   r8, [r8]
        sub     r9, r9, r3
        add     r3, r3, #1
        str     r8, [sp, #0x8C]
        ldr     r8, [sp, #0xC]
        ldrsh   r10, [r10, +lr]
        ldrsh   r8, [r8, +lr]
        str     r10, [sp, #0x90]
        add     r10, r2, #2, 22
        str     r10, [sp, #0x94]
        ldr     r10, [sp, #0x8C]
        mla     r8, r10, r8, r11
        ldr     r11, [sp, #0x90]
        mla     r0, r10, r11, r0
        add     r10, r2, #7, 24
        str     r0, [sp, #0x90]
        mov     r0, r9, lsl #2
        add     r9, r0, #1, 22
        str     r9, [sp, #0x8C]
        str     r8, [r12, +r10]
        ldrsh   r9, [r5]
        ldr     r10, [sp, #8]
        str     r9, [sp, #4]
        ldr     r9, [sp, #0x1C]
        ldrsh   r11, [r10], #0xA
        ldrsh   r9, [r9, +lr]
        str     r11, [sp, #0x98]
        ldrsh   r11, [r1, +lr]
        str     r10, [sp, #8]
        ldr     r10, [sp, #0x88]
        str     r11, [sp, #0x9C]
        ldr     r11, [sp, #4]
        mla     r10, r11, r9, r10
        add     r9, r2, #6, 24
        ldr     r11, [sp, #0x98]
        str     r9, [sp, #4]
        ldr     r9, [sp]
        str     r10, [sp, #0x88]
        ldr     r10, [sp, #0x9C]
        mla     r9, r11, r10, r9
        ldr     r10, [sp, #0x88]
        str     r9, [sp, #0x9C]
        add     r9, r2, #3, 24
        str     r9, [sp, #0x98]
        add     r9, r2, #5, 24
        str     r9, [sp]
        ldr     r9, [sp, #0x94]
        add     r2, r2, #1, 24
        str     r10, [r12, +r9]
        ldr     r10, [sp, #0xC]
        ldrsh   r9, [r5]
        ldrsh   r10, [r10, +lr]
        str     r2, [sp, #0xA4]
        add     r2, r0, #7, 24
        str     r2, [sp, #0xA8]
        ldr     r2, [sp, #0x90]
        str     r10, [sp, #0x94]
        add     r10, r0, #2, 22
        str     r10, [sp, #0xA0]
        ldr     r10, [sp, #0x94]
        mla     r2, r9, r10, r2
        add     r9, r0, #6, 24
        str     r9, [sp, #0x94]
        add     r9, r0, #5, 24
        str     r9, [sp, #0x90]
        add     r9, r0, #3, 24
        str     r9, [sp, #0xAC]
        add     r0, r0, #1, 24
        str     r0, [sp, #0xB0]
        ldr     r0, [sp, #4]
        str     r2, [r12, +r0]
        ldrsh   r0, [r1, +lr]
        ldrsh   r9, [r5]
        ldr     r10, [sp, #0x14]
        add     r10, r10, #5
        str     r10, [sp, #0x14]
        mla     r8, r9, r0, r8
        ldr     r10, [sp, #0x2C]
        ldr     r0, [sp, #0x98]
        str     r8, [sp, #4]
        cmp     r3, r10
        str     r8, [r12, +r0]
        ldrsh   r9, [r5], #0xA
        ldrsh   r8, [r7, +lr]
        ldr     r0, [sp, #0x9C]
        mla     r0, r9, r8, r0
        ldr     r8, [sp, #0x8C]
        str     r0, [sp, #0x9C]
        str     r0, [r6, +r8]
        ldr     r0, [sp, #0x50]
        ldr     r8, [sp, #0xC]
        ldr     r9, [sp, #0x88]
        ldrsh   r0, [r0]
        ldrsh   r8, [r8, +lr]
        mla     r8, r0, r8, r9
        ldr     r0, [sp]
        str     r8, [r12, +r0]
        ldr     r10, [sp, #0x50]
        ldrsh   r0, [r10], #0xA
        str     r0, [sp, #0x98]
        ldr     r0, [sp, #0x10]
        ldrsh   r11, [r7, +lr]
        ldrsh   r9, [r1, +lr]
        ldrsh   r0, [r0, +lr]
        str     r11, [sp, #0x8C]
        ldr     r11, [sp, #0x9C]
        str     r10, [sp, #0x50]
        ldr     r10, [sp, #0x98]
        mla     r0, r10, r0, r11
        mla     r11, r10, r9, r2
        ldr     r2, [sp, #4]
        ldr     r9, [sp, #0x8C]
        mla     r9, r10, r9, r2
        ldr     r2, [sp, #0xA0]
        str     r0, [r6, +r2]
        ldrsh   r10, [r4]
        ldrsh   r2, [r1, +lr]
        mla     r2, r10, r2, r8
        ldr     r8, [sp, #0xA4]
        str     r2, [r12, +r8]
        ldrsh   r8, [r7, +lr]
        ldrsh   r10, [r4]
        mla     r8, r10, r8, r11
        ldr     r10, [sp, #0xA8]
        str     r8, [r6, +r10]
        ldr     r11, [sp, #0x10]
        ldrsh   r10, [r4]
        ldrsh   r11, [r11, +lr]
        mla     r9, r10, r11, r9
        ldr     r10, [sp, #0x94]
        str     r9, [sp, #0xA8]
        str     r9, [r6, +r10]
        ldr     r10, [sp, #0x20]
        ldrsh   r9, [r4], #0xA
        ldrsh   r10, [r10, +lr]
        mla     r9, r9, r10, r0
        ldr     r0, [sp, #0x90]
        str     r9, [r6, +r0]
        ldr     r0, [sp, #0x48]
        ldrsh   r11, [r7, +lr]
        ldrsh   r10, [r0]
        ldr     r0, [sp, #0x10]
        mla     r2, r10, r11, r2
        ldrsh   r0, [r0, +lr]
        mla     r0, r10, r0, r8
        ldr     r8, [sp, #0xAC]
        str     r0, [r6, +r8]
        ldr     r8, [sp, #0x48]
        ldr     r11, [sp, #0x20]
        ldrsh   r10, [r8]
        ldr     r8, [sp, #0x28]
        ldrsh   r8, [r8, +lr]
        ldrsh   lr, [r11, +lr]
        ldr     r11, [sp, #0x48]
        mla     r9, r10, r8, r9
        ldr     r8, [sp, #0xA8]
        add     r11, r11, #0xA
        str     r11, [sp, #0x48]
        mla     r8, r10, lr, r8
        str     r9, [sp]
        ldr     lr, [sp, #0xB0]
        str     r8, [sp, #4]
        ldr     r8, [sp]
        str     r8, [r6, +lr]
        blt     LDHE1
        ldr     lr, [sp, #0xC]
        ldr     r4, [sp, #0x1C]
        ldr     r5, [sp, #0x24]
        ldr     r8, [sp, #0x18]
LDHE2:
        ldr     r10, [sp, #0x30]
        ldr     r7, [sp, #0x40]
        add     r6, r3, r3, lsl #2
        str     r6, [sp, #0xB0]
        add     r9, r3, r3, lsl #3
        add     r6, r10, r6
        add     r9, r3, r9
        mov     r6, r6, lsl #1
        str     r9, [sp, #0xAC]
        ldrsh   r11, [r5, +r6]
        add     r10, r10, #5
        str     r11, [sp, #0xA8]
        ldrsh   r9, [r7, +r9]
        rsb     r11, r3, #0
        str     r10, [sp, #0x30]
        sub     r11, r11, r8
        add     r11, r11, #5
        str     r11, [sp, #0xA4]
        ldr     r11, [sp, #0xA8]
        add     r8, r8, #1
        cmp     r8, #8
        mla     r9, r9, r11, r2
        ldr     r2, [sp, #0xB0]
        ldr     r11, [sp, #0xA4]
        mov     r2, r2, lsl #1
        rsb     r3, r3, r11, lsl #3
        mov     r3, r3, lsl #2
        add     r10, r3, #1, 22
        str     r9, [r12, +r10]
        ldr     r10, [sp, #0xAC]
        ldrsh   r11, [r4, +r6]
        ldrsh   r10, [r7, +r10]
        ldrsh   r7, [lr, +r6]
        str     r11, [sp, #0xB0]
        add     r11, r3, #7, 24
        str     r11, [sp, #0xAC]
        add     r11, r3, #2, 22
        str     r11, [sp, #0xA8]
        ldr     r11, [sp, #4]
        mla     r7, r10, r7, r11
        ldr     r11, [sp, #0xB0]
        mla     r0, r10, r11, r0
        str     r0, [sp, #0xB0]
        add     r0, r3, #6, 24
        str     r0, [sp, #0xA4]
        add     r0, r3, #3, 24
        str     r0, [sp, #0xA0]
        add     r0, r3, #5, 24
        str     r0, [sp, #0x9C]
        ldr     r0, [sp, #0xAC]
        add     r3, r3, #1, 24
        str     r7, [r12, +r0]
        ldrsh   r0, [r5, +r2]
        ldrsh   r10, [r4, +r6]
        mla     r9, r0, r10, r9
        ldr     r0, [sp, #0xA8]
        str     r9, [r12, +r0]
        ldr     r11, [sp, #0xB0]
        ldrsh   r0, [r5, +r2]
        ldrsh   r10, [lr, +r6]
        mla     r11, r0, r10, r11
        ldr     r0, [sp, #0xA4]
        str     r11, [r12, +r0]
        ldrsh   r0, [r5, +r2]
        ldrsh   r10, [r1, +r6]
        mla     r7, r0, r10, r7
        ldr     r0, [sp, #0xA0]
        str     r7, [r12, +r0]
        ldrsh   r0, [r4, +r2]
        ldrsh   r7, [lr, +r6]
        mla     r9, r0, r7, r9
        ldr     r0, [sp, #0x9C]
        str     r9, [r12, +r0]
        ldrsh   r6, [r1, +r6]
        ldrsh   r2, [lr, +r2]
        mla     r9, r2, r6, r9
        str     r9, [r12, +r3]
        blt     LDHE0
        ldr     r1, [sp, #0x3C]
        ldr     r6, [sp, #0x28]
        ldr     r7, [sp, #0x20]
        ldr     r8, [sp, #0x10]
        ldr     r9, [sp, #0x44]
        ldr     r0, [sp, #0x40]
        add     r2, r1, #0x7F, 30
        str     r2, [sp]
        add     r2, r1, #0xA6, 30
        str     r2, [sp, #0x5C]
        add     r2, r0, #0x12
        str     r2, [sp, #0x60]
        add     r2, r0, #0x16
        str     r2, [sp, #4]
        add     r2, r0, #0x18
        add     r5, r1, #0x20
        str     r2, [sp, #8]
        add     r2, r0, #0x1A
        mov     r10, #0
        add     r11, r0, #0x14
        str     r2, [sp, #0xC]
        mov     r4, r10
        mov     r2, r9
        mov     r3, r8
        mov     r12, r7
        mov     lr, r6
        str     r5, [sp, #0x14]
        str     r10, [sp, #0x48]
        str     r11, [sp, #0x54]
        str     r5, [sp, #0x24]
        str     r6, [sp, #0x28]
        str     r7, [sp, #0x20]
        str     r8, [sp, #0x10]
        str     r9, [sp, #0x44]
        str     r1, [sp, #0x3C]
        str     r0, [sp, #0x40]
LDHE3:
        ldr     r1, [sp, #0x14]
        ldr     r7, [sp, #0x3C]
        add     r0, r4, #5
        ldr     r5, [r1], #4
        str     r1, [sp, #0x14]
        rsb     r1, r4, #4
        str     r1, [sp, #0xB0]
        mov     r0, r0, lsl #3
        add     r6, r0, #0x40
        rsb     r1, r4, #6
        str     r1, [sp, #0x18]
        add     r6, r7, r6, lsl #2
        str     r5, [r6, +r4, lsl #2]
        ldr     r10, [sp, #0x40]
        ldrsh   r7, [r2], #0xA
        ldrsh   r6, [r3], #0xA
        ldrsh   r5, [r10]
        ldrsh   r9, [r10, #2]
        ldrsh   r8, [r12], #0xA
        ldrsh   r11, [lr], #0xA
        mul     r5, r5, r7
        ldrsh   r7, [r10, #4]
        str     r11, [sp, #0xAC]
        ldrsh   r10, [r10, #6]
        rsb     r0, r4, #0
        mla     r5, r9, r6, r5
        cmp     r1, #0
        ldr     r1, [sp, #0xAC]
        mla     r5, r7, r8, r5
        mla     r10, r10, r1, r5
        ldr     r1, [sp]
        ldr     r5, [sp, #0xB0]
        str     r10, [sp, #0x1C]
        str     r10, [r1, +r5, lsl #5]
        ldr     r1, [sp, #0x5C]
        str     r10, [r1, +r0, lsl #2]
        ble     LDHE5
        ldr     r1, [sp, #0x3C]
        ldr     r8, [sp, #0x48]
        ldr     r7, [sp, #0x64]
        add     r10, r1, r0, lsl #2
        ldr     r6, [sp, #0x44]
        ldr     r5, [sp, #0x10]
        ldr     r1, [sp, #0x20]
        ldr     r0, [sp, #0x28]
        str     r3, [sp, #0x34]
        ldr     r3, [sp, #0x1C]
        mov     r9, #0
        str     r10, [sp, #0x4C]
        str     r2, [sp, #0x38]
        str     r12, [sp, #0x30]
        str     lr, [sp, #0x2C]
        str     r4, [sp, #0x50]
LDHE4:
        ldr     r2, [sp, #0x60]
        mov     lr, r8, lsl #1
        ldrsh   r10, [r7], #0xA
        ldrsh   r4, [r2, +lr]
        ldr     r11, [sp, #4]
        ldr     r2, [sp, #0x54]
        mla     r4, r10, r4, r3
        ldrsh   r12, [r6], #0xA
        ldrsh   r11, [r11, +lr]
        ldrsh   r2, [r2, +lr]
        str     r11, [sp, #0xB0]
        ldrsh   r3, [r5], #0xA
        mla     r4, r12, r2, r4
        rsb     r12, r9, #0
        str     r3, [sp, #0xAC]
        ldr     r3, [sp, #8]
        ldrsh   r10, [r1], #0xA
        ldr     r11, [sp, #0xAC]
        ldrsh   r3, [r3, +lr]
        str     r10, [sp, #0xA8]
        ldr     r10, [sp, #0xC]
        add     r8, r8, #5
        ldrsh   lr, [r10, +lr]
        ldr     r10, [sp, #0x50]
        sub     r12, r12, r10
        ldr     r10, [sp, #0xB0]
        str     lr, [sp, #0xA4]
        ldrsh   r2, [r0], #0xA
        rsb     lr, r9, #4
        mla     r4, r11, r10, r4
        ldr     r10, [sp, #0xA8]
        add     r12, r12, #3
        rsb     lr, r9, lr, lsl #3
        mla     r4, r10, r3, r4
        ldr     r3, [sp, #0xA4]
        rsb     r12, r9, r12, lsl #3
        mov     lr, lr, lsl #2
        add     r9, r9, #1
        mla     r3, r2, r3, r4
        mov     r12, r12, lsl #2
        add     r2, r12, #2, 24
        ldr     r12, [sp, #0x58]
        str     r3, [r12, +r2]
        ldr     r12, [sp, #0x18]
        add     r2, lr, #0x7D, 30
        cmp     r9, r12
        ldr     r12, [sp, #0x4C]
        str     r3, [r12, +r2]
        blt     LDHE4
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x34]
        ldr     r12, [sp, #0x30]
        ldr     lr, [sp, #0x2C]
        ldr     r4, [sp, #0x50]
LDHE5:
        ldr     r0, [sp, #0x48]
        add     r4, r4, #1
        cmp     r4, #7
        add     r0, r0, #5
        str     r0, [sp, #0x48]
        blt     LDHE3
        ldr     r5, [sp, #0x24]
        ldr     r1, [sp, #0x3C]
        add     r0, r4, #5
        ldr     r5, [r5, +r4, lsl #2]
        mov     r0, r0, lsl #3
        add     r0, r0, #0x40
        add     r0, r1, r0, lsl #2
        str     r5, [r0, +r4, lsl #2]
        add     sp, sp, #0xB4
        ldmia   sp!, {r4 - r11, pc}
LDHE6:
        mov     r3, #0
        mov     r2, r3
        mov     r0, r2
        str     r0, [sp, #4]
        b       LDHE2


