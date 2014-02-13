        .text
        .align  4
        .globl  ownToeplizMatrix_G729E_32f


ownToeplizMatrix_G729E_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xA8
        ldr     r3, [pc, #0x584]
        ldr     r12, [pc, #0x584]
        ldr     r3, [r3]
        add     r9, r1, #0x9C
        ldr     r4, [r12]
        str     r9, [sp, #0x60]
        add     r9, r1, #0x7C
        str     r9, [sp, #0x64]
        add     r9, r1, #0x5C
        str     r9, [sp, #0x6C]
        add     r9, r1, #0x3C
        str     r9, [sp, #0x70]
        add     r9, r2, #3, 24
        str     r9, [sp, #0x7C]
        add     r9, r2, #1, 22
        str     r9, [sp, #0x80]
        add     r9, r2, #2, 24
        str     r9, [sp, #0x84]
        add     r9, r2, #1, 24
        str     r9, [sp, #0x88]
        sub     r9, r2, #4
        mov     r5, r0
        str     r9, [sp, #0x8C]
        add     r9, r5, #0x14
        str     r9, [sp, #0x90]
        sub     r9, r2, #8
        str     r9, [sp, #0x94]
        add     r9, r5, #0x18
        add     r1, r1, #0x1C
        str     r9, [sp, #0x98]
        add     r12, r5, #0x10
        add     r9, r5, #0x1C
        add     r7, r5, #0xC
        str     r1, [sp, #0x78]
        add     r6, r5, #4
        add     r11, r5, #8
        add     r1, r5, #0x20
        str     r9, [sp, #0x9C]
        mov     lr, #0
        mov     r9, r6
        mov     r10, r11
        mov     r0, r7
        str     r3, [sp, #0x68]
        mov     r8, lr
        str     r5, [sp, #0x74]
        str     r12, [sp, #0x5C]
        str     lr, [sp, #0x34]
        str     r9, [sp, #0x38]
        str     r10, [sp, #0x3C]
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x2C]
        str     r12, [sp, #0x14]
        str     r7, [sp, #0x1C]
        str     r3, [sp, #0x48]
        str     r2, [sp, #0x4C]
LDGW0:
        ldr     r10, [sp, #0x74]
        ldr     r2, [sp, #0x48]
        rsb     r7, r8, #0
        ldr     r1, [r10], #0x14
        str     r2, [sp, #0x10]
        str     r2, [sp, #0x18]
        mov     r0, r1
        bl      __mulsf3
        ldr     r1, [sp, #0x68]
        bl      __addsf3
        mov     r9, r0
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [sp, #0x60]
        str     r0, [r2, +r7, lsl #2]
        ldr     r2, [sp, #0x38]
        ldr     r1, [r2], #0x14
        str     r10, [sp, #0x74]
        str     r2, [sp, #0x38]
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [sp, #0x64]
        rsb     r10, r8, #7
        str     r0, [r2, +r7, lsl #2]
        ldr     r2, [sp, #0x3C]
        ldr     r1, [r2], #0x14
        str     r2, [sp, #0x3C]
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [sp, #0x6C]
        str     r0, [r2, +r7, lsl #2]
        ldr     r2, [sp, #0x40]
        ldr     r0, [r2], #0x14
        str     r2, [sp, #0x40]
        mov     r1, r0
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        mov     r9, r0
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [sp, #0x70]
        str     r0, [r2, +r7, lsl #2]
        ldr     r2, [sp, #0x5C]
        ldr     r1, [r2], #0x14
        str     r2, [sp, #0x5C]
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x68]
        mov     r1, r4
        bl      __mulsf3
        ldr     r2, [sp, #0x78]
        cmp     r10, #0
        str     r0, [r2, +r7, lsl #2]
        movle   r9, #0
        ble     LDGW2
        mov     r3, r5
        ldr     lr, [sp, #0x14]
        ldr     r0, [sp, #0x34]
        ldr     r7, [sp, #0x1C]
        mov     r2, r11
        str     r10, [sp, #0x30]
        str     r11, [sp, #0x20]
        ldr     r10, [sp, #0x94]
        ldr     r11, [sp, #0x8C]
        str     lr, [sp, #0x58]
        mov     r12, #0
        mov     r1, r6
        add     lr, r8, #1
        str     r6, [sp, #0x24]
        str     r5, [sp, #0x50]
        mov     r9, r12
        str     r8, [sp, #0x54]
        str     lr, [sp, #0xC]
        str     r2, [sp]
        str     r3, [sp, #4]
        str     r12, [sp, #8]
        str     r4, [sp, #0x44]
        str     r8, [sp, #0x28]
        mov     r5, r0
        mov     r6, r1
LDGW1:
        ldr     r2, [sp, #4]
        rsb     r4, r9, #0
        ldr     r0, [r2]
        ldr     r2, [sp, #0x24]
        ldr     r1, [r2, +r5, lsl #2]
        ldr     r2, [sp, #0x54]
        sub     r8, r4, r2, lsl #3
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        mov     r8, r8, lsl #2
        bl      __addsf3
        str     r0, [sp, #0x10]
        add     r2, r8, #1, 22
        str     r0, [r11, +r2]
        ldr     r0, [r6]
        ldr     r2, [sp, #0x20]
        ldr     r1, [r2, +r5, lsl #2]
        add     r2, r8, #1, 24
        str     r2, [sp, #0xA0]
        ldr     r2, [sp, #0xC]
        sub     r4, r4, r2, lsl #3
        str     r4, [sp, #0xA4]
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        bl      __addsf3
        mov     r4, r0
        add     r2, r8, #3, 24
        str     r4, [r11, +r2]
        ldr     r2, [sp]
        add     r8, r8, #2, 24
        ldr     r0, [r2]
        ldr     r2, [sp, #0x1C]
        ldr     r1, [r2, +r5, lsl #2]
        ldr     r2, [sp, #0xA4]
        mov     r2, r2, lsl #2
        add     r2, r2, #5, 24
        str     r2, [sp, #0xA4]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        mov     r4, r0
        str     r4, [r11, +r8]
        ldr     r2, [sp, #0x14]
        ldr     r0, [r7]
        ldr     r3, [sp, #0x28]
        ldr     r1, [r2, +r5, lsl #2]
        ldr     r2, [sp, #8]
        rsb     r2, r2, #0
        sub     r8, r2, r3
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0xA0]
        mov     r4, r0
        sub     r8, r8, r9
        str     r4, [r11, +r2]
        ldr     r2, [sp, #0x90]
        mov     r8, r8, lsl #2
        add     r9, r9, #1
        ldr     r1, [r2, +r5, lsl #2]
        ldr     r2, [sp, #0x58]
        ldr     r0, [r2]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0xA4]
        str     r0, [sp, #0x10]
        str     r0, [r11, +r2]
        ldr     r2, [sp, #4]
        ldr     r0, [r2]
        ldr     r2, [sp, #0x14]
        ldr     r1, [r2, +r5, lsl #2]
        ldr     r2, [sp, #4]
        add     r2, r2, #0x14
        str     r2, [sp, #4]
        add     r2, r8, #1, 22
        str     r2, [sp, #0xA4]
        bl      __mulsf3
        ldr     r1, [sp, #0x18]
        bl      __addsf3
        add     r2, r8, #5, 24
        mov     r4, r0
        str     r4, [r11, +r2]
        ldr     r0, [r6], #0x14
        ldr     r2, [sp, #0x90]
        ldr     r1, [r2, +r5, lsl #2]
        add     r2, r8, #3, 24
        str     r2, [sp, #0xA0]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0xA4]
        mov     r4, r0
        str     r4, [r10, +r2]
        ldr     r2, [sp]
        ldr     r0, [r2]
        ldr     r2, [sp, #0x98]
        ldr     r1, [r2, +r5, lsl #2]
        ldr     r2, [sp]
        add     r2, r2, #0x14
        str     r2, [sp]
        add     r2, r8, #2, 24
        str     r2, [sp, #0xA4]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0xA0]
        mov     r4, r0
        add     r8, r8, #1, 24
        str     r4, [r10, +r2]
        ldr     r2, [sp, #0x9C]
        ldr     r0, [r7], #0x14
        ldr     r1, [r2, +r5, lsl #2]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0xA4]
        mov     r4, r0
        str     r4, [r10, +r2]
        ldr     r2, [sp, #0x58]
        ldr     r0, [r2]
        ldr     r2, [sp, #0x2C]
        ldr     r1, [r2, +r5, lsl #2]
        ldr     r2, [sp, #0x58]
        add     r5, r5, #5
        add     r2, r2, #0x14
        str     r2, [sp, #0x58]
        bl      __mulsf3
        mov     r1, r4
        bl      __addsf3
        ldr     r2, [sp, #0x30]
        str     r0, [sp, #0x18]
        cmp     r9, r2
        ldr     r2, [sp, #0x18]
        str     r2, [r10, +r8]
        ldr     r2, [sp, #0x54]
        add     r2, r2, #1
        str     r2, [sp, #0x54]
        ldr     r2, [sp, #0xC]
        add     r2, r2, #1
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #8]
        add     r2, r2, #8
        str     r2, [sp, #8]
        blt     LDGW1
        ldr     r11, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldr     r4, [sp, #0x44]
        ldr     r8, [sp, #0x28]
        ldr     r5, [sp, #0x50]
LDGW2:
        ldr     r2, [sp, #0x34]
        add     r9, r9, r9, lsl #2
        ldr     r0, [r5, +r9, lsl #2]
        add     r7, r2, r9
        ldr     r1, [r6, +r7, lsl #2]
        add     r2, r2, #5
        str     r2, [sp, #0x34]
        bl      __mulsf3
        ldr     r1, [sp, #0x10]
        bl      __addsf3
        ldr     r2, [sp, #0x7C]
        mov     r10, r0
        add     r8, r8, #1
        str     r10, [r2], #4
        ldr     r3, [sp, #0x14]
        ldr     r0, [r5, +r9, lsl #2]
        ldr     r1, [r3, +r7, lsl #2]
        str     r2, [sp, #0x7C]
        bl      __mulsf3
        ldr     r1, [sp, #0x18]
        bl      __addsf3
        ldr     r2, [sp, #0x80]
        str     r0, [r2], #0x20
        ldr     r1, [r11, +r7, lsl #2]
        ldr     r0, [r6, +r9, lsl #2]
        str     r2, [sp, #0x80]
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp, #0x84]
        mov     r10, r0
        str     r10, [r2], #4
        ldr     r3, [sp, #0x1C]
        ldr     r0, [r11, +r9, lsl #2]
        ldr     r1, [r3, +r7, lsl #2]
        str     r2, [sp, #0x84]
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp, #0x88]
        mov     r10, r0
        str     r10, [r2], #4
        ldr     r3, [sp, #0x1C]
        ldr     r0, [r3, +r9, lsl #2]
        ldr     r3, [sp, #0x14]
        ldr     r1, [r3, +r7, lsl #2]
        str     r2, [sp, #0x88]
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        ldr     r2, [sp, #0x4C]
        cmp     r8, #8
        str     r0, [r2], #4
        str     r2, [sp, #0x4C]
        blt     LDGW0
        add     sp, sp, #0xA8
        ldmia   sp!, {r4 - r11, pc}
        .long   LDGW__2il0floatpacket.1
        .long   LDGW__2il0floatpacket.2


        .data
        .align  4


LDGW__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00
LDGW__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x3F


