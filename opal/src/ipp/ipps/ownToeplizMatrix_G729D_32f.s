        .text
        .align  4
        .globl  ownToeplizMatrix_G729D_32f


ownToeplizMatrix_G729D_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA0
        ldr     r2, [pc, #0x9F8]
        mov     r8, r0
        ldr     r2, [r2]
        mov     r10, #0
        add     r5, r8, #4
        add     r4, r8, #8
        str     r2, [sp, #0x64]
        str     r2, [sp, #0x60]
        add     r2, r1, #0x9C
        str     r2, [sp, #0x5C]
        add     r2, r1, #0x7C
        str     r2, [sp, #0x6C]
        add     r2, r1, #0x5C
        str     r2, [sp, #0x74]
        add     r2, r1, #0x3C
        add     r9, r8, #0x10
        str     r2, [sp, #0x7C]
        add     r7, r8, #0xC
        add     r2, r8, #0x14
        add     lr, r8, #0x18
        add     r12, r8, #0x1C
        add     r3, r8, #0x20
        str     r10, [sp, #0x24]
        sub     r11, r1, #8
        str     r8, [sp, #0x70]
        str     r8, [sp, #0x4C]
        ldr     r8, [sp, #0x24]
        str     r9, [sp, #0x68]
        str     r11, [sp, #0x54]
        add     r0, r1, #0x1C
        mov     r11, r7
        sub     r6, r1, #4
        str     r5, [sp, #0x78]
        str     r4, [sp, #0x80]
        str     r9, [sp, #0x58]
        str     r10, [sp, #0x3C]
        str     r11, [sp, #0x40]
        str     r3, [sp, #0x38]
        str     r12, [sp, #0x2C]
        str     lr, [sp, #0x14]
        str     r2, [sp]
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x48]
LDGX0:
        ldr     r0, [sp, #0x70]
        ldr     r10, [sp, #0x64]
        rsb     r9, r8, #0
        ldr     r1, [r0]
        str     r10, [sp, #4]
        mov     r0, r1
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        bl      __addsf3
        ldr     r2, [sp, #0x5C]
        mov     r11, r0
        str     r11, [r2, +r9, lsl #2]
        ldr     r2, [sp, #0x78]
        ldr     r1, [r2]
        str     r10, [sp, #8]
        str     r10, [sp, #0xC]
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp, #0x6C]
        mov     r11, r0
        str     r11, [r2, +r9, lsl #2]
        ldr     r2, [sp, #0x80]
        ldr     r1, [r2]
        ldr     r2, [sp, #0x70]
        str     r10, [sp, #0x50]
        mov     r0, r1
        add     r2, r2, #0x14
        str     r2, [sp, #0x70]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp, #0x74]
        mov     r11, r0
        str     r11, [r2, +r9, lsl #2]
        ldr     r10, [sp, #0x40]
        ldr     r2, [sp, #0x78]
        ldr     r1, [r10], #0x14
        add     r2, r2, #0x14
        str     r2, [sp, #0x78]
        ldr     r2, [sp, #0x80]
        mov     r0, r1
        add     r2, r2, #0x14
        str     r2, [sp, #0x80]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp, #0x7C]
        mov     r11, r0
        str     r11, [r2, +r9, lsl #2]
        ldr     r2, [sp, #0x58]
        ldr     r1, [r2], #0x14
        str     r10, [sp, #0x40]
        str     r2, [sp, #0x58]
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp, #0x44]
        rsb     r1, r8, #7
        str     r0, [sp, #0x60]
        cmp     r1, #0
        str     r0, [r2, +r9, lsl #2]
        movle   r9, #0
        ble     LDGX2
        ldr     r0, [sp, #0x4C]
        ldr     r2, [sp, #0x3C]
        ldr     r12, [sp, #0x68]
        mov     r10, r7
        str     r7, [sp, #0x18]
        ldr     r7, [sp, #0x54]
        mov     r3, r4
        str     r4, [sp, #0x28]
        mov     r9, #0
        mov     r11, r5
        str     r12, [sp, #0x1C]
        str     r3, [sp, #0x20]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x30]
        str     r5, [sp, #0x34]
        str     r8, [sp, #0x24]
        mov     r4, r2
LDGX1:
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x34]
        ldr     r12, [sp, #0x24]
        ldr     r0, [r0]
        rsb     r3, r9, #0
        ldr     r1, [r1, +r4, lsl #2]
        sub     r5, r3, r12
        add     r5, r5, #5
        bl      __mulsf3
        ldr     r1, [sp, #4]
        rsb     r5, r9, r5, lsl #3
        bl      __addsf3
        str     r0, [sp, #4]
        mov     r5, r5, lsl #2
        add     r1, r5, #1, 22
        str     r0, [r6, +r1]
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x28]
        add     r3, r5, #6, 24
        ldr     r8, [r0]
        ldr     r1, [r1, +r4, lsl #2]
        str     r3, [sp, #0x84]
        add     r3, r5, #2, 22
        str     r3, [sp, #0x88]
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        ldr     r1, [sp, #0x18]
        ldr     r1, [r1, +r4, lsl #2]
        str     r0, [sp, #8]
        mov     r0, r8
        rsb     r8, r9, #5
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        str     r0, [sp, #0xC]
        add     r1, r5, #7, 24
        str     r0, [r6, +r1]
        ldr     r3, [sp, #0x10]
        ldr     r1, [sp, #0x68]
        ldr     r0, [r3], #0x14
        ldr     r1, [r1, +r4, lsl #2]
        str     r3, [sp, #0x10]
        add     r3, r5, #3, 24
        str     r3, [sp, #0x8C]
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        bl      __addsf3
        ldr     r3, [sp, #0x28]
        ldr     r1, [r11]
        ldr     r2, [r3, +r4, lsl #2]
        ldr     r3, [sp, #0x24]
        str     r0, [sp, #0x50]
        mov     r0, r1
        mov     r1, r2
        rsb     r8, r3, r8, lsl #3
        bl      __mulsf3
        ldr     r1, [sp, #4]
        sub     r8, r8, r9
        bl      __addsf3
        ldr     r1, [sp, #0x88]
        str     r0, [sp, #4]
        mov     r8, r8, lsl #2
        str     r0, [r6, +r1]
        ldr     r0, [sp, #0x18]
        add     r9, r9, #1
        ldr     r1, [r0, +r4, lsl #2]
        ldr     r0, [r11]
        bl      __mulsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        ldr     r1, [sp, #0x84]
        str     r0, [sp, #0x88]
        str     r0, [r6, +r1]
        ldr     r0, [r11]
        ldr     r1, [sp, #0x68]
        add     r3, r8, #7, 24
        ldr     r1, [r1, +r4, lsl #2]
        str     r3, [sp, #0x84]
        add     r3, r8, #5, 24
        str     r3, [sp, #8]
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        ldr     r1, [sp, #0x8C]
        str     r0, [sp, #0xC]
        str     r0, [r6, +r1]
        ldr     r0, [r11], #0x14
        ldr     r1, [sp]
        add     r3, r8, #2, 22
        ldr     r1, [r1, +r4, lsl #2]
        str     r3, [sp, #0x8C]
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        bl      __addsf3
        str     r0, [sp, #0x50]
        add     r1, r8, #1, 22
        str     r0, [r7, +r1]
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x18]
        add     r3, r5, #5, 24
        ldr     r0, [r0]
        add     r5, r5, #1, 24
        ldr     r1, [r1, +r4, lsl #2]
        str     r5, [sp, #0x94]
        str     r3, [sp, #0x90]
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        ldr     r1, [sp, #0x90]
        str     r0, [sp, #4]
        str     r0, [r6, +r1]
        ldr     r0, [sp, #0x68]
        ldr     r3, [sp, #0x20]
        ldr     r1, [r0, +r4, lsl #2]
        ldr     r5, [r3], #0x14
        str     r3, [sp, #0x20]
        add     r3, r8, #6, 24
        str     r3, [sp, #0x90]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x88]
        bl      __addsf3
        ldr     r1, [sp]
        add     r3, r8, #3, 24
        ldr     r1, [r1, +r4, lsl #2]
        str     r0, [sp, #0x88]
        str     r3, [sp, #0x98]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        add     r8, r8, #1, 24
        ldr     r1, [r1, +r4, lsl #2]
        str     r0, [sp, #0xC]
        mov     r0, r5
        str     r8, [sp, #0x9C]
        bl      __mulsf3
        ldr     r1, [sp, #0x50]
        bl      __addsf3
        ldr     r3, [sp, #0x8C]
        mov     r5, r0
        str     r5, [r7, +r3]
        ldr     r3, [sp, #0x68]
        ldr     r0, [r10]
        ldr     r1, [r3, +r4, lsl #2]
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        ldr     r3, [sp, #0x94]
        str     r0, [sp, #0x8C]
        str     r0, [r6, +r3]
        ldr     r3, [sp]
        ldr     r0, [r10]
        ldr     r1, [r3, +r4, lsl #2]
        bl      __mulsf3
        ldr     r1, [sp, #0x88]
        bl      __addsf3
        ldr     r3, [sp, #0x84]
        str     r0, [sp, #0x94]
        str     r0, [r7, +r3]
        ldr     r3, [sp, #0x14]
        ldr     r0, [r10]
        ldr     r1, [r3, +r4, lsl #2]
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        ldr     r3, [sp, #0x90]
        str     r0, [sp, #0x88]
        str     r0, [r7, +r3]
        ldr     r3, [sp, #0x2C]
        ldr     r0, [r10], #0x14
        ldr     r1, [r3, +r4, lsl #2]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r1, [sp, #8]
        str     r0, [sp, #0x90]
        str     r0, [r7, +r1]
        ldr     r0, [sp]
        ldr     r1, [r0, +r4, lsl #2]
        ldr     r0, [sp, #0x1C]
        ldr     r5, [r0]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x8C]
        bl      __addsf3
        ldr     r1, [sp, #0x14]
        ldr     r1, [r1, +r4, lsl #2]
        str     r0, [sp, #4]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x94]
        bl      __addsf3
        ldr     r1, [sp, #0x98]
        str     r0, [sp, #8]
        str     r0, [r7, +r1]
        ldr     r1, [sp, #0x2C]
        ldr     r0, [sp, #0x1C]
        ldr     r3, [sp, #0x1C]
        ldr     r1, [r1, +r4, lsl #2]
        ldr     r5, [r0]
        add     r3, r3, #0x14
        str     r3, [sp, #0x1C]
        mov     r0, r5
        bl      __mulsf3
        ldr     r1, [sp, #0x88]
        bl      __addsf3
        ldr     r1, [sp, #0x38]
        ldr     r1, [r1, +r4, lsl #2]
        str     r0, [sp, #0xC]
        mov     r0, r5
        add     r4, r4, #5
        bl      __mulsf3
        ldr     r1, [sp, #0x90]
        bl      __addsf3
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x50]
        cmp     r9, r0
        ldr     r0, [sp, #0x9C]
        str     r1, [r7, +r0]
        blt     LDGX1
        ldr     r7, [sp, #0x18]
        ldr     r4, [sp, #0x28]
        ldr     r5, [sp, #0x34]
        ldr     r8, [sp, #0x24]
LDGX2:
        ldr     r0, [sp, #0x3C]
        add     r11, r9, r9, lsl #2
        rsb     r2, r9, #0
        add     r10, r0, r11
        ldr     r0, [sp, #0x4C]
        ldr     r1, [r5, +r10, lsl #2]
        sub     r2, r2, r8
        add     r8, r8, #1
        ldr     r0, [r0, +r11, lsl #2]
        str     r2, [sp, #0x9C]
        bl      __mulsf3
        ldr     r1, [sp, #0x9C]
        add     r1, r1, #5
        str     r1, [sp, #0x9C]
        ldr     r1, [sp, #4]
        bl      __addsf3
        str     r0, [sp, #0x98]
        ldr     r0, [sp, #0x9C]
        rsb     r9, r9, r0, lsl #3
        ldr     r0, [sp, #0x3C]
        mov     r9, r9, lsl #2
        add     r1, r9, #1, 22
        add     r2, r9, #6, 24
        add     r0, r0, #5
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x98]
        str     r0, [r6, +r1]
        ldr     r0, [sp, #0x4C]
        ldr     r0, [r0, +r11, lsl #2]
        str     r0, [sp, #0x9C]
        ldr     r1, [r4, +r10, lsl #2]
        add     r0, r9, #7, 24
        str     r0, [sp, #0x94]
        ldr     r0, [sp, #0x9C]
        str     r2, [sp, #0x90]
        bl      __mulsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        ldr     r1, [r7, +r10, lsl #2]
        str     r0, [sp, #0x8C]
        ldr     r0, [sp, #0x9C]
        add     r2, r9, #2, 22
        str     r2, [sp, #0x9C]
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        ldr     r1, [sp, #0x94]
        str     r0, [sp, #0x88]
        str     r0, [r6, +r1]
        ldr     r1, [r4, +r10, lsl #2]
        ldr     r0, [r5, +r11, lsl #2]
        add     r2, r9, #3, 24
        str     r2, [sp, #0x94]
        add     r2, r9, #5, 24
        str     r2, [sp, #0x84]
        bl      __mulsf3
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        ldr     r1, [sp, #0x9C]
        str     r0, [sp, #0x98]
        str     r0, [r6, +r1]
        ldr     r0, [r5, +r11, lsl #2]
        ldr     r1, [r7, +r10, lsl #2]
        add     r9, r9, #1, 24
        str     r9, [sp, #0x9C]
        bl      __mulsf3
        ldr     r1, [sp, #0x8C]
        bl      __addsf3
        ldr     r1, [sp, #0x90]
        str     r0, [r6, +r1]
        ldr     r1, [sp, #0x68]
        ldr     r0, [r5, +r11, lsl #2]
        ldr     r1, [r1, +r10, lsl #2]
        bl      __mulsf3
        ldr     r1, [sp, #0x88]
        bl      __addsf3
        ldr     r1, [sp, #0x94]
        str     r0, [r6, +r1]
        ldr     r0, [r4, +r11, lsl #2]
        ldr     r1, [r7, +r10, lsl #2]
        bl      __mulsf3
        ldr     r1, [sp, #0x98]
        bl      __addsf3
        ldr     r2, [sp, #0x84]
        mov     r9, r0
        str     r9, [r6, +r2]
        ldr     r2, [sp, #0x68]
        ldr     r0, [r7, +r11, lsl #2]
        ldr     r1, [r2, +r10, lsl #2]
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x9C]
        cmp     r8, #8
        str     r0, [r6, +r1]
        blt     LDGX0
        ldr     r1, [sp, #0x48]
        ldr     r3, [sp, #0x38]
        ldr     r12, [sp, #0x2C]
        ldr     lr, [sp, #0x14]
        ldr     r2, [sp]
        ldr     r8, [sp, #0x4C]
        add     r5, r1, #0x7F, 30
        str     r5, [sp, #0x58]
        add     r5, r1, #0xA6, 30
        str     r5, [sp, #0x5C]
        add     r4, r1, #0x20
        add     r5, r8, #0x24
        add     r9, r8, #0x34
        str     r5, [sp, #0x60]
        mov     r0, #0
        add     r7, r8, #0x28
        add     r6, r8, #0x2C
        add     r5, r8, #0x30
        str     r9, [sp, #4]
        mov     r11, r0
        str     r2, [sp, #0xC]
        mov     r9, lr
        mov     r10, r12
        str     r3, [sp, #8]
        str     r4, [sp, #0x10]
        str     r0, [sp, #0x28]
        str     r5, [sp, #0x30]
        str     r6, [sp, #0x3C]
        str     r7, [sp, #0x50]
        str     r4, [sp, #0x1C]
        str     r3, [sp, #0x38]
        str     r12, [sp, #0x2C]
        str     lr, [sp, #0x14]
        str     r2, [sp]
        str     r1, [sp, #0x48]
LDGX3:
        ldr     r3, [sp, #0x10]
        add     r2, r11, #5
        rsb     r4, r11, #4
        ldr     r1, [r3], #4
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x48]
        mov     r2, r2, lsl #3
        add     r2, r2, #0x40
        rsb     r5, r11, #0
        add     r2, r3, r2, lsl #2
        str     r1, [r2, +r11, lsl #2]
        ldr     r2, [sp, #0xC]
        ldr     r0, [r8]
        rsb     r7, r11, #6
        ldr     r1, [r2], #0x14
        str     r2, [sp, #0xC]
        bl      __mulsf3
        ldr     r1, [sp, #0x64]
        bl      __addsf3
        ldr     r1, [r9], #0x14
        ldr     r2, [r8, #4]
        mov     r6, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [r8, #8]
        ldr     r2, [r10], #0x14
        mov     r6, r0
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r3, [sp, #8]
        ldr     r1, [r8, #0xC]
        mov     r6, r0
        ldr     r2, [r3], #0x14
        mov     r0, r1
        str     r3, [sp, #8]
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x18]
        str     r0, [r1, +r4, lsl #5]
        ldr     r1, [sp, #0x5C]
        cmp     r7, #0
        str     r0, [r1, +r5, lsl #2]
        ble     LDGX5
        ldr     r1, [sp, #0x48]
        ldr     r3, [sp, #0x28]
        ldr     r2, [sp, #0x68]
        add     r12, r1, r5, lsl #2
        ldr     r1, [sp]
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x2C]
        ldr     r6, [sp, #0x38]
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x18]
        mov     r0, #0
        str     r7, [sp, #0x44]
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x20]
        str     r8, [sp, #0x4C]
        str     r12, [sp, #0x34]
        mov     r10, r0
        mov     r7, r1
        mov     r8, r2
        mov     r9, r3
LDGX4:
        ldr     r12, [sp, #0x60]
        ldr     r0, [r8], #0x14
        ldr     r1, [r12, +r9, lsl #2]
        rsb     r12, r10, #0
        str     r12, [sp, #0x9C]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [r7], #0x14
        ldr     r12, [sp, #0x50]
        mov     r11, r0
        mov     r0, r2
        ldr     r1, [r12, +r9, lsl #2]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [r4], #0x14
        ldr     r12, [sp, #0x3C]
        mov     r11, r0
        mov     r0, r2
        ldr     r1, [r12, +r9, lsl #2]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r12, [sp, #0x30]
        ldr     r1, [r5], #0x14
        mov     r11, r0
        ldr     r2, [r12, +r9, lsl #2]
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r12, [sp, #4]
        ldr     r1, [r6], #0x14
        mov     r11, r0
        ldr     r2, [r12, +r9, lsl #2]
        mov     r0, r1
        add     r9, r9, #5
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r12, [sp, #0x9C]
        ldr     lr, [sp, #0x40]
        mov     r11, r0
        ldr     r0, [sp, #0x54]
        sub     r12, r12, lr
        add     lr, r12, #3
        rsb     r12, r10, #4
        rsb     lr, r10, lr, lsl #3
        mov     lr, lr, lsl #2
        add     lr, lr, #2, 24
        str     r11, [r0, +lr]
        ldr     lr, [sp, #0x44]
        rsb     r12, r10, r12, lsl #3
        add     r10, r10, #1
        cmp     r10, lr
        ldr     lr, [sp, #0x34]
        mov     r12, r12, lsl #2
        add     r12, r12, #0x7D, 30
        str     r11, [lr, +r12]
        blt     LDGX4
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x20]
        ldr     r11, [sp, #0x40]
        ldr     r8, [sp, #0x4C]
LDGX5:
        ldr     r1, [sp, #0x28]
        add     r11, r11, #1
        cmp     r11, #7
        add     r1, r1, #5
        str     r1, [sp, #0x28]
        blt     LDGX3
        ldr     r4, [sp, #0x1C]
        ldr     r1, [sp, #0x48]
        add     r0, r11, #5
        ldr     r4, [r4, +r11, lsl #2]
        mov     r0, r0, lsl #3
        add     r0, r0, #0x40
        add     r0, r1, r0, lsl #2
        str     r4, [r0, +r11, lsl #2]
        add     sp, sp, #0xA0
        ldmia   sp!, {r4 - r11, pc}
        .long   LDGX__2il0floatpacket.1


        .data
        .align  4


LDGX__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


