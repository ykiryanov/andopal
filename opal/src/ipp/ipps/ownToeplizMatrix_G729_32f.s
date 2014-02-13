        .text
        .align  4
        .globl  ownToeplizMatrix_G729_32f


ownToeplizMatrix_G729_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xE0
        ldr     r2, [pc, #0x840]
        ldr     r3, [r2]
        add     r11, r1, #0x3C
        mov     r2, #0x7F, 30
        orr     lr, r2, #1, 22
        add     r4, lr, #1, 24
        str     r11, [sp, #0xB0]
        add     r11, r1, #0x1C
        add     r4, r1, r4
        str     r11, [sp, #0xB4]
        add     r11, r1, #0x7A, 28
        str     r4, [sp, #0x78]
        add     r4, lr, #2, 24
        str     r11, [sp, #0x5C]
        add     r11, r1, #0x8A, 28
        add     r4, r1, r4
        str     r11, [sp, #0x60]
        add     r11, r1, #0x4A, 28
        str     r4, [sp, #0x80]
        add     r4, lr, #3, 24
        str     r11, [sp, #0x64]
        add     r11, r1, #0x5A, 28
        add     r4, r1, r4
        str     r11, [sp, #0x68]
        add     r11, r1, #0xFC
        str     r4, [sp, #0x84]
        sub     r4, lr, #1, 24
        str     r11, [sp, #0x6C]
        add     r11, r1, #0x7F, 30
        str     r11, [sp, #0x70]
        add     r11, r1, #0xFF, 30
        add     r4, r1, r4
        add     lr, r1, lr
        str     r11, [sp, #0x74]
        str     r4, [sp, #0x90]
        str     lr, [sp, #0x94]
        add     r11, r1, #0xBF, 30
        add     r8, r1, #0x9C
        add     r4, r1, #0x7C
        add     lr, r1, #0x5C
        sub     r1, r1, #8
        str     r1, [sp, #0x98]
        add     r1, r0, #0x1C
        str     r11, [sp, #0x7C]
        str     r1, [sp, #0x9C]
        add     r2, r0, #8
        add     r11, r0, #0x14
        add     r1, r0, #0x20
        add     r7, r0, #4
        add     r6, r0, #0xC
        add     r5, r0, #0x10
        str     r11, [sp, #0x88]
        str     r1, [sp, #0xA0]
        mov     r12, #0
        mov     r9, r3
        add     r11, r0, #0x18
        mov     r1, r0
        mov     r10, r12
        str     r11, [sp, #0x8C]
        str     r7, [sp, #0xAC]
        str     r2, [sp, #0xA8]
        str     r6, [sp, #0xA4]
        str     r5, [sp, #0x58]
        str     r12, [sp, #0x34]
        str     r1, [sp, #0x38]
        str     lr, [sp, #0x3C]
        str     r2, [sp, #0x28]
        str     r4, [sp, #0x40]
        str     r8, [sp, #0x44]
        str     r9, [sp, #0x48]
        str     r3, [sp, #0x4C]
        str     r0, [sp, #0x50]
LDGV0:
        ldr     r9, [sp, #0x38]
        ldr     r4, [sp, #0x4C]
        rsb     r8, r10, #0
        ldr     r1, [r9], #0x14
        mov     r0, r1
        bl      __mulsf3
        ldr     r1, [sp, #0x48]
        bl      __addsf3
        ldr     r2, [sp, #0x44]
        mov     r11, r0
        mov     r0, r4
        str     r11, [r2, +r8, lsl #2]
        ldr     r2, [sp, #0xAC]
        ldr     r1, [r2]
        str     r0, [sp, #0x54]
        str     r0, [sp, #0xC]
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp, #0x40]
        mov     r11, r0
        str     r11, [r2, +r8, lsl #2]
        ldr     r2, [sp, #0xA8]
        ldr     r1, [r2]
        ldr     r2, [sp, #0xC]
        str     r9, [sp, #0x38]
        mov     r0, r1
        str     r2, [sp, #0x14]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp, #0x3C]
        mov     r11, r0
        str     r11, [r2, +r8, lsl #2]
        ldr     r9, [sp, #0xA4]
        ldr     r2, [sp, #0xAC]
        ldr     r1, [r9], #0x14
        add     r2, r2, #0x14
        str     r2, [sp, #0xAC]
        ldr     r2, [sp, #0xA8]
        mov     r0, r1
        add     r2, r2, #0x14
        str     r2, [sp, #0xA8]
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r2, [sp, #0xB0]
        mov     r11, r0
        str     r11, [r2, +r8, lsl #2]
        ldr     r2, [sp, #0x58]
        ldr     r1, [r2], #0x14
        str     r9, [sp, #0xA4]
        str     r2, [sp, #0x58]
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r3, [sp, #0xB4]
        rsb     r2, r10, #7
        str     r0, [sp, #0x48]
        cmp     r2, #0
        str     r0, [r3, +r8, lsl #2]
        movle   r9, #0
        ble     LDGV2
        ldr     r3, [sp, #0x50]
        ldr     lr, [sp, #0x28]
        ldr     r8, [sp, #0x34]
        mov     r12, r7
        str     r7, [sp, #0x2C]
        str     r10, [sp, #0x1C]
        ldr     r7, [sp, #0x54]
        ldr     r10, [sp, #0x98]
        mov     r11, r6
        mov     r0, r5
        mov     r9, #0
        str     r0, [sp, #0x18]
        str     r11, [sp, #8]
        str     lr, [sp, #4]
        str     r12, [sp]
        str     r3, [sp, #0x24]
        str     r2, [sp, #0x30]
        str     r5, [sp, #0x10]
        str     r6, [sp, #0x20]
LDGV1:
        ldr     r2, [sp, #0x24]
        ldr     r6, [r2]
        ldr     r2, [sp, #0x2C]
        ldr     r1, [r2, +r8, lsl #2]
        ldr     r2, [sp, #0x24]
        mov     r0, r6
        add     r2, r2, #0x14
        str     r2, [sp, #0x24]
        rsb     r2, r9, #5
        str     r2, [sp, #0xB8]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0x1C]
        mov     r5, r0
        ldr     r1, [r2]
        ldr     r2, [sp, #0x28]
        ldr     r4, [r2, +r8, lsl #2]
        ldr     r2, [sp, #0xB8]
        mov     r0, r1
        rsb     r2, r3, r2, lsl #3
        str     r2, [sp, #0xB8]
        mov     r1, r4
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        mov     r5, r0
        mov     r1, r4
        mov     r0, r6
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [sp, #0x20]
        ldr     r1, [r2, +r8, lsl #2]
        ldr     r2, [sp, #0xB8]
        str     r0, [sp, #0x54]
        mov     r0, r6
        sub     r7, r2, r9
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        ldr     r2, [sp, #0x10]
        mov     r4, r0
        mov     r0, r6
        mov     r6, r7, lsl #2
        ldr     r1, [r2, +r8, lsl #2]
        bl      __mulsf3
        ldr     r3, [sp, #0x1C]
        ldr     r1, [sp, #0x14]
        rsb     r2, r9, #0
        sub     r2, r2, r3
        add     r7, r2, #5
        bl      __addsf3
        add     r2, r6, #7, 24
        str     r2, [sp, #0xB8]
        ldr     r2, [sp, #0x80]
        rsb     r11, r9, r7, lsl #3
        str     r5, [r2, +r11, lsl #2]
        ldr     r3, [sp, #0x54]
        ldr     r2, [sp, #0x84]
        add     r9, r9, #1
        str     r3, [r2, +r11, lsl #2]
        ldr     r2, [sp, #0x78]
        str     r4, [r2, +r11, lsl #2]
        ldr     r2, [sp, #0x74]
        str     r0, [sp, #0x14]
        str     r0, [r2, +r11, lsl #2]
        ldr     r2, [sp, #0x20]
        ldr     r2, [r2, +r8, lsl #2]
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #4]
        ldr     r1, [sp, #0xC]
        ldr     r2, [r2]
        str     r2, [sp, #0xBC]
        ldr     r0, [sp, #0xBC]
        add     r2, r6, #9, 24
        str     r2, [sp, #0xC0]
        add     r2, r6, #1, 22
        str     r2, [sp, #0xC4]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp]
        ldr     r1, [sp, #0xC]
        mov     r5, r0
        ldr     r7, [r2]
        ldr     r2, [sp]
        add     r2, r2, #0x14
        str     r2, [sp]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x54]
        bl      __addsf3
        ldr     r2, [sp, #0x10]
        ldr     r1, [r2, +r8, lsl #2]
        str     r0, [sp, #0x54]
        add     r2, r6, #2, 22
        mov     r0, r7
        str     r2, [sp, #0xC]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0x88]
        ldr     r1, [r2, +r8, lsl #2]
        str     r0, [sp, #0xC8]
        add     r2, r6, #5, 24
        str     r2, [sp, #0xCC]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x14]
        bl      __addsf3
        ldr     r2, [sp, #0x8C]
        mov     r4, r0
        ldr     r0, [sp, #0xBC]
        ldr     r1, [r2, +r8, lsl #2]
        add     r2, r6, #6, 24
        str     r2, [sp, #0xBC]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r3, [sp, #0xC8]
        ldr     r2, [sp, #0x7C]
        str     r3, [r2, +r11, lsl #2]
        ldr     r2, [sp, #0x90]
        str     r5, [r2, +r11, lsl #2]
        ldr     r3, [sp, #0x54]
        ldr     r2, [sp, #0x94]
        str     r0, [sp, #0x14]
        str     r3, [r2, +r11, lsl #2]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x14]
        str     r3, [r10, +r2]
        ldr     r2, [sp, #0x10]
        ldr     r2, [r2, +r8, lsl #2]
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r2, [r2]
        str     r2, [sp, #0xD0]
        ldr     r0, [sp, #0xD0]
        add     r2, r6, #1, 24
        str     r2, [sp, #0xD4]
        add     r2, r6, #3, 24
        str     r2, [sp, #0xD8]
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #4]
        ldr     r1, [sp, #0xC]
        mov     r4, r0
        ldr     r7, [r2]
        ldr     r2, [sp, #4]
        add     r6, r6, #2, 24
        add     r2, r2, #0x14
        str     r2, [sp, #4]
        mov     r0, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x54]
        bl      __addsf3
        ldr     r2, [sp, #0x88]
        mov     r5, r0
        mov     r0, r7
        ldr     r1, [r2, +r8, lsl #2]
        str     r6, [sp, #0xDC]
        bl      __mulsf3
        ldr     r1, [sp, #0xC8]
        bl      __addsf3
        ldr     r2, [sp, #0x9C]
        mov     r6, r0
        ldr     r0, [sp, #0xD0]
        ldr     r1, [r2, +r8, lsl #2]
        bl      __mulsf3
        ldr     r1, [sp, #0x14]
        bl      __addsf3
        ldr     r2, [sp, #0x6C]
        mov     r7, r0
        str     r4, [r2, +r11, lsl #2]
        ldr     r2, [sp, #0x70]
        str     r5, [r2, +r11, lsl #2]
        ldr     r2, [sp, #0xCC]
        str     r7, [r10, +r2]
        ldr     r2, [sp, #0xC0]
        str     r6, [r10, +r2]
        ldr     r2, [sp, #0x18]
        ldr     r2, [r2]
        str     r2, [sp, #0xD0]
        ldr     r2, [sp, #0x88]
        ldr     r0, [sp, #0xD0]
        ldr     r2, [r2, +r8, lsl #2]
        str     r2, [sp, #0xCC]
        ldr     r1, [sp, #0xCC]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0xCC]
        mov     r4, r0
        ldr     r11, [r2]
        ldr     r2, [sp, #8]
        add     r2, r2, #0x14
        str     r2, [sp, #8]
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x8C]
        mov     r5, r0
        mov     r0, r11
        ldr     r1, [r2, +r8, lsl #2]
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #0xA0]
        mov     r6, r0
        ldr     r0, [sp, #0xD0]
        ldr     r1, [r2, +r8, lsl #2]
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r2, [sp, #0xC4]
        str     r4, [r10, +r2]
        ldr     r2, [sp, #0xB8]
        str     r5, [r10, +r2]
        ldr     r2, [sp, #0xBC]
        str     r6, [r10, +r2]
        ldr     r2, [sp, #0xD4]
        str     r0, [sp, #0x14]
        str     r0, [r10, +r2]
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x8C]
        ldr     r11, [r2], #0x14
        ldr     r1, [r3, +r8, lsl #2]
        str     r2, [sp, #0x18]
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [sp, #0x9C]
        mov     r7, r0
        mov     r0, r11
        ldr     r1, [r2, +r8, lsl #2]
        add     r8, r8, #5
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [sp, #0xD8]
        str     r7, [r10, +r2]
        ldr     r2, [sp, #0x30]
        str     r0, [sp, #0xC]
        ldr     r3, [sp, #0xC]
        cmp     r9, r2
        ldr     r2, [sp, #0xDC]
        str     r3, [r10, +r2]
        blt     LDGV1
        str     r7, [sp, #0x54]
        ldr     r5, [sp, #0x10]
        ldr     r6, [sp, #0x20]
        ldr     r7, [sp, #0x2C]
        ldr     r10, [sp, #0x1C]
LDGV2:
        ldr     r2, [sp, #0x50]
        add     r11, r9, r9, lsl #2
        ldr     r0, [r2, +r11, lsl #2]
        ldr     r2, [sp, #0x34]
        str     r0, [sp, #0xDC]
        add     r8, r2, r11
        ldr     r1, [r7, +r8, lsl #2]
        rsb     r2, r9, #0
        sub     r2, r2, r10
        str     r2, [sp, #0xD8]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0xD8]
        mov     r4, r0
        ldr     r2, [r2, +r8, lsl #2]
        add     r10, r10, #1
        add     r3, r3, #5
        str     r2, [sp, #0xD4]
        ldr     r1, [sp, #0xD4]
        ldr     r2, [r7, +r11, lsl #2]
        str     r3, [sp, #0xD8]
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        ldr     r1, [sp, #0xD4]
        ldr     r0, [sp, #0xDC]
        bl      __mulsf3
        ldr     r1, [sp, #0x54]
        bl      __addsf3
        ldr     r2, [sp, #0x5C]
        str     r4, [r2], #4
        ldr     r3, [sp, #0x60]
        str     r0, [sp, #0xDC]
        str     r0, [r3], #4
        ldr     r12, [r6, +r8, lsl #2]
        str     r12, [sp, #0xD4]
        ldr     r12, [sp, #0x28]
        ldr     r1, [sp, #0xD4]
        ldr     r0, [r12, +r11, lsl #2]
        str     r2, [sp, #0x5C]
        str     r3, [sp, #0x60]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r3, [sp, #0xD8]
        ldr     r1, [sp, #0xD4]
        ldr     r2, [r7, +r11, lsl #2]
        mov     r4, r0
        rsb     r9, r9, r3, lsl #3
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0xDC]
        bl      __addsf3
        ldr     r3, [sp, #0x64]
        str     r0, [sp, #0xDC]
        str     r4, [r3], #4
        ldr     r2, [sp, #0x68]
        str     r0, [r2], #4
        ldr     r12, [r5, +r8, lsl #2]
        str     r12, [sp, #0xD8]
        ldr     r0, [r6, +r11, lsl #2]
        ldr     r1, [sp, #0xD8]
        str     r3, [sp, #0x64]
        str     r2, [sp, #0x68]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x28]
        ldr     r3, [sp, #0x34]
        mov     r4, r0
        ldr     r2, [r1, +r11, lsl #2]
        ldr     r1, [sp, #0xD8]
        add     r3, r3, #5
        str     r3, [sp, #0x34]
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0xDC]
        bl      __addsf3
        ldr     r1, [sp, #0x6C]
        str     r4, [r1, +r9, lsl #2]
        ldr     r1, [sp, #0x70]
        str     r0, [r1, +r9, lsl #2]
        ldr     r0, [sp, #0x50]
        ldr     r0, [r0, +r11, lsl #2]
        str     r0, [sp, #0xDC]
        ldr     r1, [r6, +r8, lsl #2]
        bl      __mulsf3
        ldr     r1, [sp, #0xC]
        bl      __addsf3
        ldr     r1, [r5, +r8, lsl #2]
        mov     r4, r0
        ldr     r0, [sp, #0xDC]
        bl      __mulsf3
        ldr     r1, [sp, #0x14]
        bl      __addsf3
        ldr     r2, [sp, #0x74]
        str     r0, [r2, +r9, lsl #2]
        ldr     r2, [sp, #0x78]
        str     r4, [r2, +r9, lsl #2]
        ldr     r0, [r7, +r11, lsl #2]
        ldr     r1, [r5, +r8, lsl #2]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x7C]
        cmp     r10, #8
        str     r0, [r1, +r9, lsl #2]
        blt     LDGV0
        add     sp, sp, #0xE0
        ldmia   sp!, {r4 - r11, pc}
        .long   LDGV__2il0floatpacket.1


        .data
        .align  4


LDGV__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


