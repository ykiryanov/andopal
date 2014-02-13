        .text
        .align  4
        .globl  _ippsMDCTInv_MP3_32s


_ippsMDCTInv_MP3_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x73, 30
        ldr     r5, [sp, #0x1F0]
        ldr     lr, [sp, #0x1F4]
        ldr     r12, [sp, #0x1F8]
        cmp     r0, #0
        mov     r4, r1
        mov     r7, r2
        beq     LGDP25
        cmp     r4, #0
        beq     LGDP25
        cmp     r7, #0
        beq     LGDP25
        cmp     r5, #0
        beq     LGDP25
        cmp     r3, #0
        blt     LGDP16
        cmp     r3, #9, 26
        bgt     LGDP16
        cmp     lr, #0
        blt     LGDP16
        cmp     lr, #3
        bgt     LGDP16
        cmp     r12, #0
        blt     LGDP16
        cmp     r12, #1
        bgt     LGDP16
        ldr     r9, [r5]
        cmp     r9, #0
        blt     LGDP16
        cmp     r9, #0x20
        bgt     LGDP16
        rsb     r6, r3, r3, lsl #3
        cmp     lr, #2
        add     r6, r6, r6, lsl #6
        mov     r8, #2
        add     r3, r3, r6, lsl #3
        beq     LGDP24
        mov     r6, #0x72, 30
        orr     r6, r6, #7, 20
        add     r6, r3, r6
        mov     r3, r6, asr #16
        add     r6, r3, #1
LGDP0:
        cmp     r6, #0x20
        movge   r6, #0x20
        cmp     lr, #2
        beq     LGDP23
LGDP1:
        mov     r8, r6
LGDP2:
        add     r3, r8, r8, lsl #3
        add     r8, r0, #0x48
        add     r3, r0, r3, lsl #3
        cmp     r8, r3
        bcs     LGDP4
        ldr     r9, [pc, #0xC48]
        ldr     r10, [r9, #4]
        str     r10, [sp, #0x58]
        ldr     r10, [r9, #8]
        str     r10, [sp, #0x48]
        ldr     r10, [r9, #0xC]
        str     r10, [sp, #0x50]
        ldr     r10, [r9, #0x10]
        str     r10, [sp, #0x54]
        ldr     r10, [r9, #0x14]
        str     r10, [sp, #0x40]
        ldr     r10, [r9, #0x18]
        str     r10, [sp, #0x3C]
        ldr     r10, [pc, #0xC18]
        ldr     r9, [r9, #0x1C]
        ldr     r11, [r10, #4]
        str     r11, [sp, #0x60]
        ldr     r11, [r10, #8]
        str     r11, [sp, #0x44]
        ldr     r11, [r10, #0xC]
        str     r11, [sp, #0x4C]
        ldr     r2, [r10, #0x10]
        ldr     r1, [r10, #0x14]
        ldr     r11, [r10, #0x18]
        ldr     r10, [r10, #0x1C]
        str     r2, [sp, #0x30]
        str     r11, [sp, #0x28]
        str     r1, [sp, #0x2C]
        str     r10, [sp, #0x5C]
        str     r9, [sp, #0x34]
        str     r8, [sp, #0x24]
        str     r3, [sp, #0x38]
        str     r6, [sp, #0x7C]
        str     r12, [sp, #0x78]
        str     lr, [sp, #0x74]
        str     r5, [sp, #0x70]
        str     r7, [sp, #0x68]
        str     r4, [sp, #0x64]
        str     r0, [sp, #0x6C]
LGDP3:
        ldr     r9, [sp, #0x24]
        ldr     r1, [r9, #-0x14]
        ldr     r12, [r9, #-0x18]
        ldr     r0, [r9, #-0x10]
        ldr     lr, [r9, #0xC]
        ldr     r10, [r9]
        ldr     r8, [r9, #-4]
        ldr     r4, [r9, #-8]
        ldr     r5, [r9, #4]
        ldr     r6, [r9, #-0xC]
        ldr     r7, [r9, #8]
        ldr     r2, [r9, #0x10]
        ldr     r3, [r9, #0x14]
        ldr     r11, [r9, #-0x1C]
        mov     r5, r5, lsl #1
        mov     r8, r8, lsl #1
        mov     r10, r10, lsl #1
        str     r11, [sp, #0x84]
        ldr     r11, [r9, #0x18]
        mov     r6, r6, lsl #1
        mov     r4, r4, lsl #1
        str     r11, [sp, #0x80]
        ldr     r9, [r9, #0x1C]
        mov     lr, lr, lsl #1
        mov     r0, r0, lsl #1
        str     r9, [sp, #0x20]
        ldr     r9, [sp, #0x24]
        ldr     r9, [r9, #-0x20]
        str     r9, [sp, #0x1C]
        ldr     r9, [pc, #0xB40]
        smull   r9, r11, r9, r10
        ldr     r9, [pc, #0xB3C]
        str     r11, [sp, #0x18]
        smull   r10, r9, r9, r10
        str     r9, [sp, #0x14]
        ldr     r9, [pc, #0xB2C]
        smull   r9, r10, r9, r8
        ldr     r9, [pc, #0xB20]
        str     r10, [sp, #0x10]
        ldr     r10, [sp, #0x5C]
        smull   r8, r9, r9, r8
        ldr     r8, [sp, #0x58]
        str     r9, [sp, #0xC]
        smull   r8, r9, r4, r8
        ldr     r8, [sp, #0x60]
        str     r9, [sp, #8]
        smull   r4, r8, r4, r8
        ldr     r4, [sp, #0x60]
        str     r8, [sp, #4]
        smull   r4, r8, r5, r4
        ldr     r4, [sp, #0x58]
        str     r8, [sp]
        smull   r5, r4, r4, r5
        str     r4, [sp, #0x88]
        ldr     r4, [sp, #0x48]
        smull   r4, r5, r6, r4
        ldr     r4, [sp, #0x44]
        str     r5, [sp, #0x8C]
        ldr     r5, [sp, #0x44]
        smull   r6, r4, r6, r4
        str     r4, [sp, #0x90]
        mov     r4, r7, lsl #1
        smull   r5, r7, r5, r4
        ldr     r5, [sp, #0x48]
        smull   r4, r9, r5, r4
        ldr     r4, [sp, #0x4C]
        smull   r4, r8, lr, r4
        ldr     r4, [sp, #0x50]
        smull   lr, r4, lr, r4
        ldr     lr, [sp, #0x50]
        str     r4, [sp, #0x94]
        smull   lr, r4, lr, r0
        ldr     lr, [sp, #0x4C]
        str     r4, [sp, #0x98]
        smull   lr, r0, lr, r0
        mov     lr, r1, lsl #1
        ldr     r1, [sp, #0x54]
        smull   r4, r1, lr, r1
        ldr     r4, [sp, #0x30]
        smull   lr, r4, lr, r4
        mov     lr, r2, lsl #1
        ldr     r2, [sp, #0x30]
        str     r4, [sp, #0x9C]
        smull   r4, r2, r2, lr
        ldr     r4, [sp, #0x54]
        sub     r2, r1, r2
        ldr     r1, [sp, #0x9C]
        smull   lr, r4, r4, lr
        mov     lr, r3, lsl #1
        ldr     r3, [sp, #0x2C]
        str     r4, [sp, #0xA0]
        smull   r4, r3, lr, r3
        ldr     r4, [sp, #0x40]
        smull   lr, r4, lr, r4
        mov     lr, r12, lsl #1
        ldr     r12, [sp, #0x40]
        str     r4, [sp, #0xA4]
        smull   r4, r12, r12, lr
        ldr     r4, [sp, #0x2C]
        sub     r12, r12, r3
        smull   lr, r4, r4, lr
        ldr     lr, [sp, #0x84]
        str     r4, [sp, #0xA8]
        ldr     r3, [sp, #0xA8]
        mov     r4, lr, lsl #1
        ldr     lr, [sp, #0x3C]
        smull   r5, lr, r4, lr
        ldr     r5, [sp, #0x28]
        smull   r4, r5, r4, r5
        ldr     r4, [sp, #0x80]
        str     r5, [sp, #0x84]
        mov     r5, r4, lsl #1
        ldr     r4, [sp, #0x28]
        smull   r6, r4, r4, r5
        ldr     r6, [sp, #0x3C]
        sub     lr, lr, r4
        ldr     r4, [sp, #0x84]
        smull   r6, r5, r6, r5
        ldr     r6, [sp, #0x20]
        add     r5, r4, r5
        mov     r6, r6, lsl #1
        smull   r10, r11, r6, r10
        ldr     r10, [sp, #0x34]
        str     r11, [sp, #0x80]
        ldr     r4, [sp, #0x80]
        smull   r6, r10, r6, r10
        ldr     r6, [sp, #0x1C]
        str     r10, [sp, #0x20]
        ldr     r10, [sp, #0x34]
        mov     r6, r6, lsl #1
        smull   r10, r11, r10, r6
        ldr     r10, [sp, #0x5C]
        str     r11, [sp, #0x1C]
        ldr     r11, [sp, #0x10]
        smull   r10, r6, r10, r6
        ldr     r10, [sp, #0x18]
        sub     r11, r11, r10
        str     r11, [sp, #0x18]
        ldr     r11, [sp, #0x14]
        ldr     r10, [sp, #0xC]
        add     r11, r10, r11
        str     r11, [sp, #0x14]
        ldr     r11, [sp, #8]
        ldr     r10, [sp]
        sub     r11, r11, r10
        str     r11, [sp, #0x10]
        ldr     r11, [sp, #0x88]
        ldr     r10, [sp, #4]
        add     r11, r10, r11
        ldr     r10, [sp, #0x8C]
        str     r11, [sp, #0x88]
        ldr     r11, [sp, #0x14]
        sub     r7, r10, r7
        ldr     r10, [sp, #0x90]
        add     r9, r10, r9
        ldr     r10, [sp, #0x98]
        sub     r8, r10, r8
        ldr     r10, [sp, #0x94]
        add     r0, r0, r10
        ldr     r10, [sp, #0xA0]
        add     r1, r1, r10
        ldr     r10, [sp, #0xA4]
        add     r3, r3, r10
        ldr     r10, [sp, #0x1C]
        sub     r4, r10, r4
        ldr     r10, [sp, #0x20]
        add     r6, r6, r10
        ldr     r10, [sp, #0x24]
        str     r11, [r10]
        ldr     r11, [sp, #0x18]
        str     r11, [r10, #-4]
        ldr     r11, [sp, #0x88]
        str     r11, [r10, #4]
        ldr     r11, [sp, #0x10]
        str     r0, [r10, #0xC]
        str     r9, [r10, #8]
        str     r11, [r10, #-8]
        str     r7, [r10, #-0xC]
        str     r8, [r10, #-0x10]
        str     r1, [r10, #0x10]
        str     r2, [r10, #-0x14]
        str     r3, [r10, #0x14]
        str     r12, [r10, #-0x18]
        str     r5, [r10, #0x18]
        str     lr, [r10, #-0x1C]
        str     r6, [r10, #0x1C]
        str     r4, [r10, #-0x20]
        ldr     r0, [sp, #0x38]
        add     r10, r10, #0x48
        str     r10, [sp, #0x24]
        cmp     r10, r0
        bcc     LGDP3
        ldr     r5, [sp, #0x70]
        ldr     r6, [sp, #0x7C]
        ldr     r12, [sp, #0x78]
        ldr     lr, [sp, #0x74]
        ldr     r7, [sp, #0x68]
        ldr     r4, [sp, #0x64]
        ldr     r0, [sp, #0x6C]
        ldr     r9, [r5]
LGDP4:
        cmp     r6, r9
        movgt   r9, r6
        cmp     r9, #0
        mov     r8, #0
        movle   r3, #0
        ble     LGDP13
        ldr     r11, [pc, #0x884]
        ldr     r1, [pc, #0x884]
        mov     r3, #0
        add     r10, sp, #0x4F, 30
        str     r3, [sp, #0x84]
        str     r6, [sp, #0x7C]
        str     r9, [sp, #0x80]
        str     r12, [sp, #0x78]
        str     lr, [sp, #0x74]
        str     r5, [sp, #0x70]
        str     r0, [sp, #0x6C]
LGDP5:
        ldr     r0, [sp, #0x7C]
        ldr     r3, [sp, #0x84]
        cmp     r3, r0
        bge     LGDP9
        ldr     r0, [sp, #0x74]
        cmp     r0, #2
        beq     LGDP17
        ldr     r0, [sp, #0x78]
        cmp     r0, #0
        beq     LGDP7
        ldr     r0, [sp, #0x84]
        cmp     r0, #2
        bge     LGDP7
LGDP6:
        mov     r2, #0
        b       LGDP8
LGDP7:
        ldr     r2, [sp, #0x74]
LGDP8:
        ldr     r0, [sp, #0x6C]
        add     r1, sp, #0x4F, 30
        bl      LGDP__sIMDCT_36_32s
        b       LGDP10
LGDP9:
        add     r1, sp, #0x4F, 30
        mov     r2, #0x24
        mov     r0, #0
        bl      ownsSet_32s
LGDP10:
        ldr     r0, [sp, #0x84]
        tst     r0, #1
        add     r0, sp, #0x4F, 30
        ldr     r3, [r0]
        str     r3, [sp, #0xA8]
        ldr     r3, [r7]
        str     r3, [sp, #0xA4]
        ldr     r3, [r0, #4]
        str     r3, [sp, #4]
        ldr     r3, [r0, #0x48]
        ldr     r12, [r0, #0x4C]
        str     r12, [sp, #8]
        ldr     r12, [r0, #8]
        str     r12, [sp, #0x10]
        ldr     r6, [r0, #0x10]
        ldr     r12, [r0, #0xC]
        ldr     r5, [r0, #0x50]
        ldr     lr, [r0, #0x54]
        str     r6, [sp, #0x1C]
        ldr     r6, [r0, #0x14]
        ldr     r8, [r0, #0x58]
        str     r8, [sp, #0x2C]
        ldr     r8, [r0, #0x5C]
        str     r8, [sp, #0x24]
        ldr     r8, [r0, #0x18]
        str     r8, [sp, #0x20]
        ldr     r8, [r0, #0x1C]
        str     r8, [sp, #0x28]
        ldr     r8, [r0, #0x60]
        str     r8, [sp, #0x3C]
        ldr     r8, [r0, #0x64]
        str     r8, [sp, #0x38]
        ldr     r8, [r0, #0x20]
        str     r8, [sp, #0x18]
        ldr     r8, [r0, #0x24]
        str     r8, [sp, #0x30]
        ldr     r10, [r0, #0x28]
        ldr     r9, [r0, #0x68]
        ldr     r8, [r0, #0x6C]
        str     r10, [sp, #0x14]
        ldr     r10, [r0, #0x2C]
        ldr     r11, [r0, #0x70]
        str     r11, [sp, #0x4C]
        ldr     r11, [r0, #0x74]
        str     r11, [sp, #0x58]
        ldr     r11, [r0, #0x30]
        str     r11, [sp, #0x40]
        ldr     r11, [r0, #0x34]
        str     r11, [sp, #0x34]
        ldr     r11, [r0, #0x78]
        str     r11, [sp, #0x44]
        ldr     r11, [r0, #0x7C]
        str     r11, [sp, #0x48]
        ldr     r11, [r0, #0x38]
        str     r11, [sp, #0xC]
        ldr     r2, [r0, #0x84]
        ldr     r11, [r0, #0x3C]
        ldr     r1, [r0, #0x80]
        str     r2, [sp, #0x50]
        ldr     r2, [r0, #0x40]
        str     r2, [sp, #0x54]
        ldr     r2, [r0, #0x44]
        str     r2, [sp]
        ldr     r2, [r0, #0x88]
        str     r2, [sp, #0x5C]
        ldr     r0, [r0, #0x8C]
        ldr     r2, [sp, #0xA8]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0xA4]
        add     r0, r2, r0
        beq     LGDP11
        str     r0, [r4]
        ldr     r2, [sp, #4]
        ldr     r0, [r7, #4]
        add     r0, r2, r0
        rsb     r0, r0, #0
        str     r0, [r4, #0x80]
        str     r3, [r7]
        ldr     r0, [r7, #8]
        ldr     r3, [sp, #8]
        str     r3, [r7, #4]
        ldr     r3, [sp, #0x10]
        add     r0, r3, r0
        str     r0, [r4, #0x100]
        ldr     r0, [r7, #0xC]
        add     r0, r12, r0
        rsb     r0, r0, #0
        str     r0, [r4, #0x180]
        str     r5, [r7, #8]
        str     lr, [r7, #0xC]
        ldr     r0, [r7, #0x10]
        ldr     r3, [sp, #0x1C]
        add     r0, r3, r0
        str     r0, [r4, #0x200]
        ldr     r0, [r7, #0x14]
        add     r0, r6, r0
        rsb     r0, r0, #0
        str     r0, [r4, #0x280]
        ldr     r3, [sp, #0x2C]
        ldr     r0, [r7, #0x18]
        str     r3, [r7, #0x10]
        ldr     r3, [sp, #0x24]
        str     r3, [r7, #0x14]
        ldr     r3, [sp, #0x20]
        add     r0, r3, r0
        str     r0, [r4, #0x300]
        ldr     r0, [r7, #0x1C]
        ldr     r3, [sp, #0x28]
        add     r0, r3, r0
        rsb     r0, r0, #0
        str     r0, [r4, #0x380]
        ldr     r3, [sp, #0x3C]
        ldr     r0, [r7, #0x20]
        str     r3, [r7, #0x18]
        ldr     r3, [sp, #0x38]
        str     r3, [r7, #0x1C]
        ldr     r3, [sp, #0x18]
        add     r0, r3, r0
        str     r0, [r4, #0x400]
        ldr     r0, [r7, #0x24]
        ldr     r3, [sp, #0x30]
        add     r0, r3, r0
        rsb     r0, r0, #0
        str     r0, [r4, #0x480]
        str     r9, [r7, #0x20]
        str     r8, [r7, #0x24]
        ldr     r3, [sp, #0x14]
        ldr     r0, [r7, #0x28]
        add     r0, r3, r0
        str     r0, [r4, #0x500]
        ldr     r0, [r7, #0x2C]
        add     r0, r10, r0
        rsb     r0, r0, #0
        str     r0, [r4, #0x580]
        ldr     r3, [sp, #0x4C]
        ldr     r0, [r7, #0x30]
        str     r3, [r7, #0x28]
        ldr     r3, [sp, #0x58]
        str     r3, [r7, #0x2C]
        ldr     r3, [sp, #0x40]
        add     r0, r3, r0
        str     r0, [r4, #0x600]
        ldr     r0, [r7, #0x34]
        ldr     r3, [sp, #0x34]
        add     r0, r3, r0
        rsb     r0, r0, #0
        str     r0, [r4, #0x680]
        ldr     r3, [sp, #0x44]
        ldr     r0, [r7, #0x38]
        str     r3, [r7, #0x30]
        ldr     r3, [sp, #0x48]
        str     r3, [r7, #0x34]
        ldr     r3, [sp, #0xC]
        add     r0, r3, r0
        str     r0, [r4, #0x700]
        ldr     r0, [r7, #0x3C]
        add     r0, r11, r0
        rsb     r0, r0, #0
        str     r0, [r4, #0x780]
        str     r1, [r7, #0x38]
        ldr     r3, [sp, #0x50]
        ldr     r0, [r7, #0x40]
        str     r3, [r7, #0x3C]
        ldr     r3, [sp, #0x54]
        add     r0, r3, r0
        str     r0, [r4, #0x800]
        ldr     r0, [r7, #0x44]
        ldr     r3, [sp]
        add     r0, r3, r0
        rsb     r0, r0, #0
        str     r0, [r4, #0x880]
        b       LGDP12
LGDP11:
        str     r0, [r4]
        ldr     r0, [r7, #4]
        ldr     r2, [sp, #4]
        add     r0, r2, r0
        str     r0, [r4, #0x80]
        str     r3, [r7]
        ldr     r0, [r7, #8]
        ldr     r3, [sp, #8]
        str     r3, [r7, #4]
        ldr     r3, [sp, #0x10]
        add     r0, r3, r0
        str     r0, [r4, #0x100]
        ldr     r0, [r7, #0xC]
        add     r0, r12, r0
        str     r0, [r4, #0x180]
        str     r5, [r7, #8]
        str     lr, [r7, #0xC]
        ldr     r3, [sp, #0x1C]
        ldr     r0, [r7, #0x10]
        add     r0, r3, r0
        str     r0, [r4, #0x200]
        ldr     r0, [r7, #0x14]
        add     r0, r6, r0
        str     r0, [r4, #0x280]
        ldr     r3, [sp, #0x2C]
        ldr     r0, [r7, #0x18]
        str     r3, [r7, #0x10]
        ldr     r3, [sp, #0x24]
        str     r3, [r7, #0x14]
        ldr     r3, [sp, #0x20]
        add     r0, r3, r0
        str     r0, [r4, #0x300]
        ldr     r0, [r7, #0x1C]
        ldr     r3, [sp, #0x28]
        add     r0, r3, r0
        str     r0, [r4, #0x380]
        ldr     r3, [sp, #0x3C]
        ldr     r0, [r7, #0x20]
        str     r3, [r7, #0x18]
        ldr     r3, [sp, #0x38]
        str     r3, [r7, #0x1C]
        ldr     r3, [sp, #0x18]
        add     r0, r3, r0
        str     r0, [r4, #0x400]
        ldr     r3, [sp, #0x30]
        ldr     r0, [r7, #0x24]
        add     r0, r3, r0
        str     r0, [r4, #0x480]
        str     r9, [r7, #0x20]
        str     r8, [r7, #0x24]
        ldr     r3, [sp, #0x14]
        ldr     r0, [r7, #0x28]
        add     r0, r3, r0
        str     r0, [r4, #0x500]
        ldr     r0, [r7, #0x2C]
        add     r0, r10, r0
        str     r0, [r4, #0x580]
        ldr     r3, [sp, #0x4C]
        ldr     r0, [r7, #0x30]
        str     r3, [r7, #0x28]
        ldr     r3, [sp, #0x58]
        str     r3, [r7, #0x2C]
        ldr     r3, [sp, #0x40]
        add     r0, r3, r0
        str     r0, [r4, #0x600]
        ldr     r0, [r7, #0x34]
        ldr     r3, [sp, #0x34]
        add     r0, r3, r0
        str     r0, [r4, #0x680]
        ldr     r3, [sp, #0x44]
        ldr     r0, [r7, #0x38]
        str     r3, [r7, #0x30]
        ldr     r3, [sp, #0x48]
        str     r3, [r7, #0x34]
        ldr     r3, [sp, #0xC]
        add     r0, r3, r0
        str     r0, [r4, #0x700]
        ldr     r0, [r7, #0x3C]
        add     r0, r11, r0
        str     r0, [r4, #0x780]
        str     r1, [r7, #0x38]
        ldr     r3, [sp, #0x50]
        ldr     r0, [r7, #0x40]
        str     r3, [r7, #0x3C]
        ldr     r3, [sp, #0x54]
        add     r0, r3, r0
        str     r0, [r4, #0x800]
        ldr     r0, [r7, #0x44]
        ldr     r3, [sp]
        add     r0, r3, r0
        str     r0, [r4, #0x880]
LGDP12:
        ldr     r0, [sp, #0x84]
        ldr     r1, [sp, #0x5C]
        mov     r3, #0xFC
        add     r0, r0, #1
        str     r0, [sp, #0x84]
        str     r1, [r7, #0x40]
        ldr     r1, [sp, #0x60]
        add     r4, r4, #9, 24
        orr     r3, r3, #2, 22
        str     r1, [r7, #0x44]
        ldr     r1, [sp, #0x80]
        add     r7, r7, #0x48
        sub     r4, r4, r3
        cmp     r0, r1
        ldr     r0, [sp, #0x6C]
        add     r0, r0, #0x48
        str     r0, [sp, #0x6C]
        blt     LGDP5
        ldr     r3, [sp, #0x84]
        ldr     r6, [sp, #0x7C]
        ldr     r5, [sp, #0x70]
LGDP13:
        cmp     r3, #0x20
        str     r6, [r5]
        bge     LGDP15
        mov     r0, #0
LGDP14:
        add     r3, r3, #1
        str     r0, [r4]
        str     r0, [r4, #0x80]
        str     r0, [r4, #0x100]
        str     r0, [r4, #0x180]
        str     r0, [r4, #0x200]
        str     r0, [r4, #0x280]
        str     r0, [r4, #0x300]
        str     r0, [r4, #0x380]
        str     r0, [r4, #0x400]
        str     r0, [r4, #0x480]
        str     r0, [r4, #0x500]
        str     r0, [r4, #0x580]
        str     r0, [r4, #0x600]
        str     r0, [r4, #0x680]
        str     r0, [r4, #0x700]
        str     r0, [r4, #0x780]
        str     r0, [r4, #0x800]
        str     r0, [r4, #0x880]
        cmp     r3, #0x20
        add     r4, r4, #4
        blt     LGDP14
LGDP15:
        mov     r0, #0
        add     sp, sp, #0x73, 30
        ldmia   sp!, {r4 - r11, pc}
LGDP16:
        mvn     r0, #4
        add     sp, sp, #0x73, 30
        ldmia   sp!, {r4 - r11, pc}
LGDP17:
        ldr     r0, [sp, #0x78]
        cmp     r0, #0
        beq     LGDP18
        ldr     r0, [sp, #0x84]
        cmp     r0, #2
        bge     LGDP18
        ldr     r0, [sp, #0x78]
        cmp     r0, #0
        bne     LGDP6
        b       LGDP7
LGDP18:
        ldr     r0, [sp, #0x6C]
        add     r3, sp, #0x4F, 30
        mov     r6, #0
        mov     r5, #3
        str     r3, [sp, #0x60]
        str     r7, [sp, #0x68]
        str     r4, [sp, #0x64]
LGDP19:
        ldr     r4, [r0]
        ldr     lr, [r0, #4]
        ldr     r7, [r0, #8]
        ldr     r12, [r0, #0xC]
        ldr     r3, [r0, #0x10]
        ldr     r2, [r0, #0x14]
        ldr     r8, [pc, #0x2AC]
        add     r1, sp, #0xAC
        add     r1, r1, r6
        add     r11, r1, #8
        mov     r10, #0
        add     r9, r1, #0xC
        sub     r8, r8, #4
        str     r11, [sp, #0x4C]
        str     r7, [sp, #0x50]
        str     r1, [sp, #0x48]
        str     r5, [sp, #0x54]
        str     r6, [sp, #0x58]
        str     r0, [sp, #0x5C]
LGDP20:
        ldr     r0, [r8, #4]
        ldr     r5, [r8, #8]
        ldr     r1, [r8, #0xC]
        smull   r0, r7, r4, r0
        ldr     r0, [r8, #0x10]
        smull   r5, r11, lr, r5
        ldr     r5, [sp, #0x50]
        ldr     r6, [r8, #0x18]
        adds    r7, r7, #0
        smull   r5, r1, r5, r1
        smull   r0, r5, r12, r0
        ldr     r0, [r8, #0x14]
        adds    r11, r7, r11
        adds    r1, r11, r1
        smull   r7, r0, r3, r0
        smull   r7, r6, r2, r6
        adds    r5, r1, r5
        adds    r0, r5, r0
        adds    r6, r0, r6
        str     r6, [r9], #4
        ldr     r5, [sp, #0x4C]
        rsb     r0, r10, #0
        add     r10, r10, #1
        rsb     r1, r6, #0
        cmp     r10, #3
        str     r1, [r5, +r0, lsl #2]
        add     r8, r8, #0x18
        blt     LGDP20
        ldr     r1, [sp, #0x48]
        ldr     r7, [sp, #0x50]
        ldr     r5, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        ldr     r0, [sp, #0x5C]
        ldr     r8, [pc, #0x1F4]
        add     r10, r1, #0x44
        mov     r9, #6
        add     r1, r1, #0x18
        add     r8, r8, #0x44
        str     r10, [sp, #0x4C]
        str     r7, [sp, #0x50]
        str     r5, [sp, #0x54]
        str     r6, [sp, #0x58]
        str     r0, [sp, #0x5C]
LGDP21:
        ldr     r6, [r8, #8]
        ldr     r0, [r8, #4]
        ldr     r5, [r8, #0xC]
        smull   r6, r11, lr, r6
        ldr     r6, [sp, #0x50]
        smull   r0, r10, r4, r0
        ldr     r0, [r8, #0x10]
        smull   r6, r5, r6, r5
        ldr     r7, [r8, #0x18]
        smull   r0, r6, r12, r0
        ldr     r0, [r8, #0x14]
        adds    r10, r10, #0
        adds    r11, r10, r11
        adds    r5, r11, r5
        smull   r10, r0, r3, r0
        smull   r10, r7, r2, r7
        adds    r6, r5, r6
        adds    r0, r6, r0
        adds    r7, r0, r7
        str     r7, [r1], #4
        ldr     r0, [sp, #0x4C]
        rsb     r5, r9, #0
        add     r9, r9, #1
        cmp     r9, #9
        str     r7, [r0, +r5, lsl #2]
        add     r8, r8, #0x18
        blt     LGDP21
        ldr     r5, [sp, #0x54]
        ldr     r6, [sp, #0x58]
        ldr     r0, [sp, #0x5C]
        subs    r5, r5, #1
        add     r0, r0, #0x18
        add     r6, r6, #0x30
        bne     LGDP19
        ldr     r3, [sp, #0x60]
        ldr     r7, [sp, #0x68]
        ldr     r4, [sp, #0x64]
        ldr     r0, [pc, #0x13C]
        mov     r8, #0
        add     r9, r3, #0x60
        add     r10, r3, #0x78
        mov     r6, r8
        add     r5, r3, #0x18
        add     lr, r3, #0x30
        add     r12, r3, #0x48
        str     r10, [sp, #0x58]
        str     r9, [sp, #0x5C]
        str     r7, [sp, #0x68]
        str     r4, [sp, #0x64]
LGDP22:
        add     r2, sp, #0xAC
        ldr     r10, [r2, +r6, lsl #2]
        ldr     r7, [r0, #-0x14]
        ldr     r4, [r0, #4]!
        add     r1, r2, r8
        ldr     r2, [r1, #0x18]
        smull   r10, r11, r10, r7
        add     r6, r6, #1
        cmp     r6, #6
        str     r2, [sp, #0xA8]
        ldr     r9, [r1, #0x30]
        ldr     r2, [r1, #0x48]
        ldr     r10, [sp, #0xA8]
        str     r11, [sp, #0xA4]
        add     r8, r8, #4
        smull   r10, r11, r10, r4
        smull   r10, r9, r9, r7
        smull   r10, r2, r2, r4
        str     r11, [sp, #0xA8]
        ldr     r10, [r1, #0x60]
        ldr     r1, [r1, #0x78]
        mov     r11, #0
        smull   r10, r7, r10, r7
        str     r11, [r3], #4
        ldr     r10, [sp, #0xA4]
        smull   r4, r1, r1, r4
        add     r7, r2, r7
        str     r10, [r5], #4
        ldr     r10, [sp, #0xA8]
        add     r9, r10, r9
        str     r9, [lr], #4
        str     r7, [r12], #4
        ldr     r2, [sp, #0x5C]
        str     r1, [r2]
        ldr     r2, [sp, #0x58]
        mov     r1, #0
        str     r1, [r2]
        ldr     r1, [sp, #0x5C]
        add     r1, r1, #4
        str     r1, [sp, #0x5C]
        ldr     r1, [sp, #0x58]
        add     r1, r1, #4
        str     r1, [sp, #0x58]
        blt     LGDP22
        ldr     r7, [sp, #0x68]
        ldr     r4, [sp, #0x64]
        b       LGDP10
LGDP23:
        cmp     r12, #0
        beq     LGDP4
        cmp     r6, #2
        bgt     LGDP2
        b       LGDP1
LGDP24:
        mov     r6, #0xC9
        orr     r6, r6, #0xF1, 24
        add     r6, r3, r6
        cmp     r12, #0
        mov     r6, r6, asr #16
        beq     LGDP0
        cmp     r6, #2
        movlt   r6, r8
        b       LGDP0
LGDP25:
        mvn     r0, #7
        add     sp, sp, #0x73, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   LGDP__pCs
        .long   LGDP__pCa
        .long   0xbe2500ca
        .long   0x6dc25404
        .long   LGDP__pIMDCT12x3Coeff
        .long   LGDP__pIMDCTWinShort
        .long   0x7847d900
        .long   0x620dbe80
        .long   0x163a1a80
        .long   0x6ed9eb80
        .long   0x7e0e2e00
        .long   0x5246dd80
        .long   0x2bc75100
        .long   0x2d413cc0
        .long   LGDP__pIMDCT36CoeffStage3
        .long   0x201f4ac0
        .long   LGDP__pIMDCTWin
        .long   0x5bca2a00
LGDP__sIMDCT_36_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #5, 26
        ldr     r3, [r0]
        str     r3, [sp, #0x28]
        ldr     r3, [sp, #0x28]
        ldr     r4, [r0, #4]
        str     r3, [r1]
        add     r3, r3, r4
        str     r3, [r1, #4]
        ldr     r6, [r0, #8]
        ldr     r12, [r0, #0xC]
        ldr     lr, [r0, #0x10]
        add     r4, r4, r6
        str     r4, [sp, #0x24]
        str     r4, [r1, #8]
        ldr     r5, [r0, #0x14]
        str     r2, [sp]
        add     r6, r6, r12
        add     r12, lr, r12
        add     lr, lr, r5
        add     r4, lr, r6
        str     r12, [r1, #0x10]
        add     r6, r3, r6
        str     r6, [sp, #0x1C]
        str     r6, [r1, #0xC]
        str     r4, [r1, #0x14]
        ldr     r6, [r0, #0x18]
        ldr     r9, [r0, #0x1C]
        ldr     r8, [r0, #0x20]
        add     r2, r5, r6
        str     r2, [r1, #0x18]
        ldr     r5, [r0, #0x24]
        add     r6, r6, r9
        add     r9, r8, r9
        str     r9, [sp, #0x14]
        add     r7, r8, r5
        add     r8, r7, r6
        str     r8, [sp, #0x10]
        ldr     r8, [pc, #-0xD0]
        smull   r9, r10, r8, r12
        str     r10, [sp, #0x18]
        str     r9, [sp, #0x20]
        ldr     r9, [sp, #0x14]
        smull   r8, r9, r8, r9
        ldr     r8, [pc, #-0xE8]
        str     r9, [sp, #0xC]
        smull   r8, r9, r8, r4
        str     r9, [sp, #4]
        ldr     r9, [sp, #0x10]
        str     r8, [sp, #8]
        ldr     r8, [pc, #-0x100]
        smull   r8, r9, r8, r9
        str     r9, [sp, #0x2C]
        add     r9, lr, r6
        str     r9, [r1, #0x1C]
        ldr     lr, [sp, #0x14]
        str     lr, [r1, #0x20]
        ldr     lr, [sp, #0x10]
        str     lr, [r1, #0x24]
        ldr     r10, [r0, #0x28]
        ldr     r8, [r0, #0x2C]
        ldr     lr, [r0, #0x30]
        add     r5, r5, r10
        str     r5, [sp, #0x30]
        str     r5, [r1, #0x28]
        ldr     r6, [r0, #0x34]
        ldr     r11, [sp, #0x14]
        add     r5, r10, r8
        ldr     r10, [pc, #-0x144]
        smull   r10, r11, r10, r11
        str     r11, [sp, #0x38]
        str     r10, [sp, #0x34]
        ldr     r10, [pc, #-0x150]
        smull   r10, r11, r10, r12
        str     r11, [sp, #0x3C]
        ldr     r11, [sp, #0x14]
        ldr     r10, [pc, #-0x160]
        smull   r10, r11, r10, r11
        ldr     r10, [pc, #-0x16C]
        str     r11, [sp, #0x40]
        smull   r10, r11, r10, r12
        ldr     r10, [pc, #-0x170]
        str     r11, [sp, #0x44]
        smull   r2, r10, r10, r2
        str     r10, [sp, #0x4C]
        ldr     r10, [sp, #0x10]
        str     r2, [sp, #0x48]
        ldr     r2, [pc, #-0x190]
        smull   r2, r10, r2, r10
        str     r10, [sp, #0x54]
        str     r2, [sp, #0x50]
        ldr     r2, [pc, #-0x19C]
        smull   r2, r10, r2, r4
        ldr     r2, [pc, #-0x1A4]
        str     r10, [sp, #0x58]
        ldr     r10, [sp, #0x10]
        smull   r2, r10, r2, r10
        ldr     r2, [pc, #-0x1B8]
        str     r10, [sp, #0x5C]
        smull   r2, r10, r2, r4
        ldr     r2, [pc, #-0x1BC]
        str     r10, [sp, #0x60]
        smull   r9, r2, r2, r9
        str     r2, [sp, #0x64]
        ldr     r2, [pc, #-0x1C8]
        str     r9, [sp, #0x68]
        ldr     r9, [sp, #0x24]
        smull   r9, r10, r2, r9
        str     r10, [sp, #0x70]
        str     r9, [sp, #0x6C]
        ldr     r9, [sp, #0x30]
        smull   r2, r9, r2, r9
        ldr     r2, [pc, #-0x1E4]
        str     r9, [sp, #0x74]
        ldr     r9, [sp, #0x30]
        smull   r2, r9, r2, r9
        str     r9, [sp, #0x7C]
        ldr     r9, [sp, #0x24]
        str     r2, [sp, #0x78]
        ldr     r2, [pc, #-0x200]
        smull   r2, r9, r2, r9
        str     r9, [sp, #0x80]
        ldr     r9, [sp, #0x30]
        ldr     r2, [pc, #-0x20C]
        smull   r2, r9, r2, r9
        ldr     r2, [pc, #-0x214]
        str     r9, [sp, #0x84]
        ldr     r9, [sp, #0x24]
        smull   r2, r9, r2, r9
        ldr     r2, [pc, #-0x22C]
        str     r9, [sp, #0x88]
        ldr     r9, [sp, #0x1C]
        smull   r2, r9, r2, r9
        str     r9, [sp, #0x90]
        ldr     r9, [sp, #0x1C]
        str     r2, [sp, #0x8C]
        ldr     r2, [pc, #-0x244]
        smull   r2, r9, r2, r9
        ldr     r2, [pc, #-0x248]
        str     r9, [sp, #0x94]
        ldr     r9, [sp, #0x1C]
        smull   r2, r9, r2, r9
        add     r2, lr, r8
        add     lr, lr, r6
        str     lr, [sp, #0x9C]
        add     lr, lr, r5
        add     r5, r7, r5
        str     r5, [sp, #0xA0]
        str     r9, [sp, #0x98]
        str     r5, [r1, #0x2C]
        str     lr, [r1, #0x34]
        str     r2, [r1, #0x30]
        ldr     r7, [r0, #0x40]
        str     r7, [sp, #0xA4]
        ldr     r7, [r0, #0x3C]
        str     r7, [sp, #0xA8]
        ldr     r7, [pc, #-0x294]
        smull   r7, r8, r7, r5
        str     r8, [sp, #0xB0]
        ldr     r8, [sp, #0xA8]
        str     r7, [sp, #0xAC]
        ldr     r7, [pc, #-0x2A4]
        smull   r5, r7, r7, r5
        ldr     r5, [pc, #-0x2B4]
        str     r7, [sp, #0xB4]
        ldr     r7, [sp, #0xA0]
        smull   r5, r7, r5, r7
        str     r7, [sp, #0xB8]
        ldr     r7, [sp, #0xA4]
        ldr     r5, [r0, #0x38]
        add     r7, r7, r8
        ldr     r8, [pc, #-0x2DC]
        str     r7, [sp, #0xBC]
        smull   r9, r10, r8, r7
        ldr     r8, [pc, #-0x2EC]
        smull   r7, r8, r8, r7
        ldr     r7, [pc, #-0x2F8]
        str     r8, [sp, #0xC0]
        ldr     r8, [sp, #0xBC]
        smull   r7, r8, r7, r8
        ldr     r7, [sp, #0x28]
        str     r8, [sp, #0xC4]
        ldr     r8, [sp, #0x34]
        add     r7, r2, r7, lsl #1
        str     r7, [sp, #0xC8]
        ldr     r7, [sp, #0x20]
        ldr     r11, [sp, #0xC8]
        adds    r8, r7, r8
        ldr     r7, [sp, #0x18]
        str     r8, [sp, #0x34]
        ldr     r8, [sp, #0x38]
        adc     r8, r7, r8
        str     r8, [sp, #0x38]
        mov     r8, r11, lsr #2
        mov     r7, r11, asr #31
        adds    r9, r9, r11, lsl #30
        orr     r7, r8, r7, lsl #30
        adc     r8, r10, r7
        add     r10, r6, r5
        ldr     r6, [pc, #-0x33C]
        str     r10, [sp, #0xCC]
        ldr     r11, [pc, #-0x34C]
        smull   r7, r6, r6, r10
        smull   r10, r11, r11, r10
        str     r11, [sp, #0xD0]
        ldr     r11, [sp, #0xCC]
        ldr     r10, [pc, #-0x35C]
        smull   r10, r11, r10, r11
        ldr     r10, [sp, #0xCC]
        str     r11, [sp, #0xD4]
        str     r10, [r1, #0x38]
        ldr     r0, [r0, #0x44]
        ldr     r10, [sp, #0x34]
        adds    r9, r10, r9
        ldr     r10, [sp, #0x4C]
        str     r9, [sp, #0x34]
        ldr     r9, [sp, #0x38]
        adc     r8, r9, r8
        str     r8, [sp, #0x38]
        ldr     r8, [sp, #0x6C]
        ldr     r9, [sp, #0x48]
        adds    r8, r8, r9
        ldr     r9, [sp, #0x70]
        adc     r9, r9, r10
        ldr     r10, [sp, #0x78]
        adds    r7, r10, r7
        ldr     r10, [sp, #0xA8]
        add     r5, r5, r10
        ldr     r10, [sp, #0xA4]
        add     r0, r10, r0
        ldr     r10, [sp, #0x7C]
        adc     r10, r10, r6
        add     r6, r0, r5
        ldr     r0, [pc, #-0x3D4]
        str     r6, [sp, #0xA8]
        adds    r7, r8, r7
        smull   r0, r11, r0, r6
        str     r11, [sp, #0xA4]
        ldr     r11, [pc, #-0x3EC]
        ldr     r8, [sp, #0x50]
        str     r7, [sp, #0x70]
        ldr     r7, [sp, #8]
        smull   r6, r11, r11, r6
        str     r11, [sp, #0x7C]
        ldr     r6, [pc, #-0x408]
        ldr     r11, [sp, #0xA8]
        adc     r10, r9, r10
        str     r10, [sp, #0x6C]
        adds    r8, r7, r8
        smull   r6, r11, r6, r11
        ldr     r7, [sp, #4]
        str     r8, [sp, #0x50]
        ldr     r8, [sp, #0x54]
        add     r6, lr, r3, lsl #1
        str     r11, [sp, #0x78]
        ldr     r11, [pc, #-0x424]
        adc     r8, r7, r8
        mov     r7, r6, lsr #2
        adds    r9, r0, r6, lsl #30
        ldr     r0, [sp, #0xA4]
        mov     r10, r6, asr #31
        orr     r10, r7, r10, lsl #30
        adc     r10, r0, r10
        ldr     r0, [sp, #0x9C]
        add     r5, r0, r5
        ldr     r0, [pc, #-0x444]
        str     r5, [sp, #0xA4]
        smull   r0, r7, r0, r5
        smull   r5, r11, r11, r5
        str     r11, [sp, #0x9C]
        ldr     r5, [pc, #-0x45C]
        ldr     r11, [sp, #0xA4]
        smull   r5, r11, r5, r11
        ldr     r5, [sp, #0x50]
        str     r11, [sp, #0x54]
        ldr     r11, [sp, #0x64]
        adds    r9, r5, r9
        str     r9, [sp, #0x18]
        adc     r10, r8, r10
        ldr     r8, [sp, #0xA8]
        ldr     r5, [sp, #0x10]
        str     r10, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        add     r9, r5, r8
        ldr     r5, [sp, #0x8C]
        ldr     r8, [sp, #0x68]
        sub     r4, r9, r4
        sub     r9, r3, lr
        adds    r8, r5, r8
        ldr     r5, [sp, #0x30]
        add     r9, r9, r4
        rsb     r4, r4, r3, lsl #1
        ldr     r3, [sp, #0xB4]
        sub     r5, r10, r5
        ldr     r10, [sp, #0x90]
        adc     r11, r10, r11
        ldr     r10, [sp, #0xAC]
        str     r11, [sp, #0x90]
        ldr     r11, [sp, #0x74]
        adds    r0, r10, r0
        ldr     r10, [sp, #0xB0]
        adc     r7, r10, r7
        ldr     r10, [sp, #0xBC]
        str     r7, [sp, #0xB0]
        ldr     r7, [sp, #0x14]
        adds    r0, r8, r0
        ldr     r8, [sp, #0x28]
        add     r7, r7, r10
        str     r0, [sp, #0xAC]
        sub     r12, r7, r12
        ldr     r0, [sp, #0xA0]
        ldr     r7, [sp, #0x1C]
        rsb     r10, lr, #0
        sub     lr, r10, lr
        ldr     r10, [sp, #0x94]
        sub     r0, r7, r0
        ldr     r7, [sp, #0xCC]
        add     lr, lr, r4
        ldr     r4, [sp, #0x58]
        mov     lr, lr, asr #2
        sub     r5, r5, r7
        ldr     r7, [pc, #-0x530]
        sub     r10, r10, r3
        str     r10, [sp, #0xB4]
        ldr     r3, [sp, #0x98]
        smull   r5, r7, r7, r5
        ldr     r5, [pc, #-0x534]
        ldr     r10, [sp, #0xB8]
        str     r7, [sp, #4]
        smull   r9, r5, r5, r9
        str     r5, [sp, #0xCC]
        ldr     r5, [sp, #0xA4]
        add     r10, r3, r10
        str     r10, [sp, #0xB8]
        sub     r0, r0, r5
        ldr     r5, [pc, #-0x568]
        ldr     r3, [sp, #0xC8]
        sub     r9, r8, r2
        smull   r0, r5, r5, r0
        str     r5, [sp, #0x10]
        ldr     r8, [sp, #0x80]
        ldr     r5, [sp, #0xC]
        rsb     r0, r2, #0
        sub     r7, r0, r2
        ldr     r0, [sp, #0x28]
        ldr     r2, [sp, #0x84]
        str     lr, [sp, #0x28]
        rsb     r5, r5, #0
        rsb     r0, r12, r0, lsl #1
        sub     r8, r8, r2
        ldr     r2, [sp, #0x88]
        add     r0, r7, r0
        str     r0, [sp, #0x98]
        ldr     r0, [sp, #0x3C]
        ldr     r7, [sp, #0x5C]
        add     r11, r2, r11
        str     r11, [sp, #0xA0]
        ldr     r2, [sp, #0x2C]
        sub     r5, r5, r0
        ldr     r0, [sp, #0xC0]
        str     r5, [sp, #0x94]
        ldr     r5, [sp, #0xA0]
        rsb     r2, r2, #0
        add     r3, r0, r3, asr #2
        str     r3, [sp, #0xC0]
        ldr     r3, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        ldr     r10, [sp, #0xC0]
        sub     r4, r2, r4
        ldr     r2, [sp, #0x7C]
        sub     r3, r3, r0
        str     r3, [sp, #0x8C]
        ldr     r0, [sp, #0xC4]
        ldr     r3, [sp, #0xC8]
        add     r2, r2, r6, asr #2
        add     r4, r4, r2
        ldr     r2, [sp, #0x90]
        rsb     r3, r0, r3, asr #2
        str     r3, [sp, #0xC8]
        ldr     r11, [sp, #0xC8]
        ldr     r0, [sp, #0xD0]
        add     r3, r9, r12
        ldr     r12, [sp, #0xD4]
        ldr     r9, [sp, #0xB8]
        add     r0, r8, r0
        ldr     r8, [sp, #0x9C]
        sub     r12, r5, r12
        ldr     r5, [sp, #0x60]
        mov     r3, r3, asr #2
        sub     r5, r7, r5
        ldr     r7, [sp, #0x78]
        rsb     r6, r7, r6, asr #2
        ldr     r7, [sp, #0xB4]
        add     r6, r5, r6
        ldr     r5, [sp, #0xB0]
        str     r6, [sp, #0x14]
        add     r7, r7, r8
        ldr     r8, [sp, #0x54]
        adc     r2, r2, r5
        ldr     r5, [sp, #0x64]
        sub     r8, r9, r8
        ldr     r9, [sp, #0x98]
        sub     r7, r7, r5
        sub     r8, r8, r5
        str     r8, [sp, #0x1C]
        ldr     r5, [sp]
        mov     r9, r9, asr #2
        str     r9, [sp, #0x24]
        ldr     r9, [sp, #0x94]
        cmp     r5, #3
        ldr     r5, [sp, #0xA4]
        add     r9, r9, r10
        ldr     r10, [sp, #0x8C]
        add     r10, r10, r11
        ldr     r11, [sp, #0x4C]
        str     r10, [sp, #8]
        sub     r12, r12, r11
        str     r12, [sp, #0xC]
        str     r5, [r1, #0x3C]
        ldr     r5, [sp, #0xBC]
        sub     r0, r0, r11
        str     r5, [r1, #0x40]
        ldr     r5, [sp, #0xA8]
        str     r5, [r1, #0x44]
        ldr     r11, [sp, #0x34]
        add     r5, sp, #0x12, 28
        str     r11, [r5]
        ldr     r11, [sp, #0x38]
        str     r11, [r5, #4]
        ldr     r5, [sp, #0x24]
        add     r11, sp, #0xD8
        str     r9, [r11, #8]
        str     r5, [r11, #4]
        str     r3, [r11, #0x10]
        str     r10, [r11, #0xC]
        ldr     r5, [sp, #0x70]
        add     r3, sp, #0x12, 28
        str     r5, [r3, #8]
        ldr     r5, [sp, #0x6C]
        str     r5, [r3, #0xC]
        ldr     r3, [sp, #4]
        add     r5, sp, #0xD8
        str     r12, [r5, #0x20]
        str     r3, [r5, #0x18]
        str     r0, [r5, #0x1C]
        ldr     r12, [sp, #0x18]
        add     r3, sp, #0x12, 28
        str     r12, [r3, #0x10]
        ldr     r12, [sp, #0x20]
        str     r12, [r3, #0x14]
        add     r3, sp, #0xD8
        str     lr, [r3, #0x28]
        str     r4, [r3, #0x2C]
        str     r6, [r3, #0x30]
        ldr     r12, [sp, #0xCC]
        str     r12, [r3, #0x34]
        ldr     r3, [sp, #0xAC]
        add     r12, sp, #0x12, 28
        str     r2, [r12, #0x1C]
        str     r3, [r12, #0x18]
        ldr     r2, [sp, #0x10]
        add     r3, sp, #0xD8
        str     r7, [r3, #0x40]
        str     r2, [r3, #0x3C]
        str     r8, [r3, #0x44]
        moveq   r2, #2
        streq   r2, [sp]
        add     r3, sp, #0x12, 28
        ldr     lr, [r3]
        ldr     r3, [r3, #4]
        add     r12, sp, #0x12, 28
        ldr     r5, [r12, #8]
        ldr     r12, [r12, #0xC]
        add     r2, sp, #0x12, 28
        add     r6, sp, #0xD8
        str     r12, [sp, #0xD4]
        ldr     r12, [r2, #0x18]
        str     r12, [sp, #0xD0]
        ldr     r2, [r2, #0x1C]
        add     r12, sp, #0xD8
        str     r2, [sp, #0xCC]
        ldr     r2, [pc, #-0x79C]
        ldr     r8, [r2, #8]
        str     r8, [sp, #0xC8]
        ldr     r8, [r2, #0xC]
        str     r8, [sp, #0xC4]
        ldr     r8, [r2, #0x10]
        str     r8, [sp, #0xC0]
        ldr     r8, [r2, #0x14]
        str     r8, [sp, #0xBC]
        ldr     r8, [r2, #0x18]
        str     r8, [sp, #0xB8]
        ldr     r2, [r2, #0x1C]
        ldr     r8, [sp, #0xCC]
        str     r2, [sp, #0xB4]
        ldr     r12, [r12, #0x10]
        ldr     r2, [sp, #0xD4]
        str     r12, [sp, #0xB0]
        ldr     r6, [r6, #0x34]
        ldr     r12, [sp, #0xD0]
        str     r6, [sp, #0xAC]
        adds    r6, lr, r5
        adc     r2, r3, r2
        str     r2, [sp, #0xA8]
        ldr     r2, [sp, #0x18]
        adds    r12, r2, r12
        ldr     r2, [sp, #0x20]
        adc     r2, r2, r8
        add     r8, r4, r7
        str     r8, [sp, #0xA4]
        ldr     r8, [sp]
        sub     r4, r4, r7
        add     r8, r8, r8, lsl #3
        str     r8, [sp, #0xA0]
        mov     r8, r2, lsl #2
        orr     r12, r8, r12, lsr #30
        ldr     r8, [pc, #-0x824]
        mov     r2, r2, asr #30
        mov     r4, r4, lsl #2
        umull   r8, r12, r8, r12
        str     r8, [sp, #0x9C]
        ldr     r8, [pc, #-0x838]
        ldr     r11, [sp, #0x9C]
        mul     r10, r2, r8
        ldr     r2, [pc, #-0x840]
        ldr     r8, [sp, #0xA0]
        adds    r11, r6, r11
        add     r12, r10, r12
        ldr     r10, [sp, #0xA8]
        add     r2, r2, r8, lsl #4
        ldr     r8, [r2, #0x68]
        str     r11, [sp, #0x98]
        str     r12, [sp, #0x94]
        adc     r12, r10, r12
        str     r12, [sp, #0x90]
        ldr     r12, [sp, #0xA4]
        ldr     r10, [sp, #0xC0]
        mov     r12, r12, lsl #2
        smull   r12, r10, r12, r10
        ldr     r12, [sp, #0x90]
        str     r10, [sp, #0xC0]
        ldr     r10, [sp, #0x98]
        mov     r12, r12, lsl #2
        orr     r12, r12, r10, lsr #30
        umull   r10, r11, r8, r12
        str     r11, [sp, #0xA4]
        ldr     r10, [sp, #0x90]
        ldr     r11, [sp, #0xA4]
        mov     r10, r10, asr #30
        str     r10, [sp, #0x98]
        mla     r11, r8, r10, r11
        add     r10, r9, r0
        str     r10, [sp, #0x90]
        sub     r9, r9, r0
        str     r11, [sp, #0xA4]
        ldr     r7, [sp, #0xA4]
        mov     r8, r8, asr #31
        str     r9, [sp, #0xA4]
        mla     r8, r8, r12, r7
        ldr     r7, [sp, #0x9C]
        subs    r6, r6, r7
        ldr     r7, [sp, #0xBC]
        smull   r4, r7, r4, r7
        str     r7, [sp, #0xBC]
        str     r8, [r1, #0x68]
        ldr     r0, [sp, #0xC0]
        ldr     r4, [sp, #0x90]
        ldr     r8, [sp, #0xA8]
        ldr     r7, [r2, #0x6C]
        ldr     r9, [sp, #0xA4]
        sub     r4, r4, r0
        ldr     r0, [sp, #0x94]
        mov     r4, r4, lsl #2
        str     r4, [sp, #0xA8]
        sbc     r0, r8, r0
        umull   r8, r4, r7, r12
        ldr     r8, [sp, #0x98]
        subs    r5, lr, r5
        mla     r4, r7, r8, r4
        ldr     r8, [sp, #0xBC]
        mov     r7, r7, asr #31
        add     r9, r8, r9
        mov     r8, r0, lsl #4
        mla     r4, r7, r12, r4
        mov     r9, r9, lsl #2
        str     r9, [sp, #0x9C]
        mov     r12, r0, asr #28
        orr     r6, r8, r6, lsr #28
        str     r4, [r1, #0x6C]
        ldr     r0, [sp, #0xD4]
        ldr     r4, [sp, #0x1C]
        ldr     lr, [r2, #0x20]
        sbc     r0, r3, r0
        ldr     r3, [sp, #0x14]
        add     r4, r3, r4
        umull   r3, r7, lr, r6
        mla     r3, lr, r12, r7
        ldr     r7, [sp, #0xB8]
        mov     r4, r4, lsl #2
        mov     lr, lr, asr #31
        smull   r4, r7, r4, r7
        mla     r3, lr, r6, r3
        ldr     r4, [sp, #0xC]
        ldr     lr, [sp, #8]
        str     r7, [sp, #0xD4]
        add     lr, lr, r4
        ldr     r4, [sp, #0xD4]
        str     lr, [sp, #0xB8]
        add     lr, r4, lr
        ldr     r4, [sp, #0x18]
        str     lr, [sp, #0x98]
        ldr     lr, [sp, #0xD0]
        str     r3, [r1, #0x20]
        ldr     r9, [r2, #0x24]
        ldr     r3, [sp, #0xCC]
        subs    r8, r4, lr
        umull   r10, r11, r9, r6
        mla     r12, r9, r12, r11
        ldr     lr, [sp, #0x20]
        ldr     r4, [sp, #0x10]
        mov     r9, r9, asr #31
        mla     r9, r9, r6, r12
        ldr     r12, [pc, #-0x9C4]
        sbc     r3, lr, r3
        ldr     lr, [sp, #0x28]
        mov     r10, r3, lsl #4
        orr     r8, r10, r8, lsr #28
        umull   r6, r12, r12, r8
        ldr     r8, [pc, #-0x9DC]
        add     r7, lr, r4
        mov     r3, r3, asr #28
        mul     r8, r3, r8
        ldr     r3, [sp, #0xC8]
        mov     r7, r7, lsl #2
        str     r9, [r1, #0x24]
        smull   r7, r3, r7, r3
        ldr     r7, [r2, #0x48]
        adds    r11, r5, r6
        add     r9, r8, r12
        adc     r8, r0, r9
        subs    r10, r5, r6
        mov     r12, r7, asr #31
        sbc     r9, r0, r9
        mov     r0, r8, lsl #2
        orr     r6, r0, r11, lsr #30
        umull   r5, r0, r7, r6
        mov     r5, r8, asr #30
        mla     r7, r7, r5, r0
        sub     lr, lr, r4
        ldr     r4, [sp, #0xC4]
        mov     r0, r9, lsl #2
        mla     r7, r12, r6, r7
        orr     r0, r0, r10, lsr #30
        ldr     r10, [sp, #4]
        mov     lr, lr, lsl #2
        smull   r4, lr, lr, r4
        mov     r8, r9, asr #30
        ldr     r9, [sp, #0x24]
        str     r7, [r1, #0x48]
        ldr     r4, [r2, #0x8C]
        sub     r7, r9, r10
        add     r12, r9, r10
        add     r10, r3, r12
        umull   r9, r11, r4, r6
        mla     r9, r4, r5, r11
        mov     r4, r4, asr #31
        mov     r5, r10, lsl #2
        sub     r12, r12, r3
        mla     r9, r4, r6, r9
        add     r3, lr, r7
        mov     r12, r12, lsl #2
        mov     r3, r3, lsl #2
        str     r3, [sp, #0xCC]
        ldr     r3, [pc, #-0xA94]
        str     r12, [sp, #0xD0]
        str     r9, [r1, #0x8C]
        ldr     r12, [sp, #0xA0]
        ldr     r9, [sp, #0x90]
        ldr     r10, [sp, #8]
        ldr     r3, [r3, +r12, lsl #4]
        sub     r7, r7, lr
        ldr     r12, [sp, #0x98]
        mov     r4, r7, lsl #2
        umull   lr, r6, r3, r0
        mla     lr, r3, r8, r6
        ldr     r6, [sp, #0xBC]
        ldr     r7, [sp, #0xA4]
        mov     r12, r12, lsl #2
        mov     r3, r3, asr #31
        sub     r6, r7, r6
        ldr     r7, [sp, #0xC0]
        add     r7, r7, r9
        mla     r9, r3, r0, lr
        mov     lr, r7, lsl #2
        mov     r3, r6, lsl #2
        ldr     r7, [sp, #0x14]
        ldr     r6, [sp, #0x1C]
        sub     r7, r7, r6
        ldr     r6, [sp, #0xC]
        str     r9, [r1]
        ldr     r9, [sp, #0xB4]
        sub     r6, r10, r6
        ldr     r10, [r2, #0x44]
        mov     r7, r7, lsl #2
        smull   r9, r7, r7, r9
        umull   r9, r11, r10, r0
        mla     r9, r10, r8, r11
        ldr     r11, [sp, #0xB8]
        mov     r8, r10, asr #31
        ldr     r10, [sp, #0xD4]
        mla     r9, r8, r0, r9
        ldr     r0, [sp, #0xB0]
        sub     r10, r11, r10
        add     r11, r7, r6
        sub     r6, r6, r7
        ldr     r7, [sp, #0xAC]
        str     r9, [r1, #0x44]
        ldr     r8, [r2, #0x64]
        ldr     r9, [sp, #0xB0]
        add     r0, r0, r7
        mov     r10, r10, lsl #2
        mov     r11, r11, lsl #2
        mov     r7, r0, lsl #2
        ldr     r0, [sp, #0xAC]
        mov     r6, r6, lsl #2
        sub     r0, r9, r0
        smull   r8, r9, r8, r5
        str     r9, [r1, #0x64]
        ldr     r8, [r2, #0x70]
        mov     r9, r0, lsl #2
        mov     r0, #0
        smull   r5, r8, r8, r5
        str     r8, [r1, #0x70]
        ldr     r5, [r2, #0x1C]
        ldr     r8, [sp, #0xD0]
        smull   r5, r8, r5, r8
        str     r8, [r1, #0x1C]
        ldr     r5, [r2, #0x28]
        ldr     r8, [sp, #0xD0]
        smull   r5, r8, r5, r8
        str     r8, [r1, #0x28]
        ldr     r5, [r2, #0x4C]
        ldr     r8, [sp, #0xCC]
        smull   r5, r8, r5, r8
        str     r8, [r1, #0x4C]
        ldr     r5, [r2, #0x88]
        ldr     r8, [sp, #0xCC]
        smull   r5, r8, r5, r8
        str     r8, [r1, #0x88]
        ldr     r5, [r2, #4]
        smull   r5, r8, r5, r4
        str     r8, [r1, #4]
        ldr     r5, [r2, #0x40]
        smull   r4, r5, r5, r4
        str     r5, [r1, #0x40]
        ldr     r4, [r2, #0x60]
        smull   r4, r5, r4, lr
        str     r5, [r1, #0x60]
        ldr     r4, [r2, #0x74]
        smull   lr, r4, r4, lr
        str     r4, [r1, #0x74]
        ldr     lr, [r2, #0x18]
        ldr     r4, [sp, #0xA8]
        smull   lr, r4, lr, r4
        str     r4, [r1, #0x18]
        ldr     lr, [r2, #0x2C]
        ldr     r4, [sp, #0xA8]
        smull   lr, r4, lr, r4
        str     r4, [r1, #0x2C]
        ldr     lr, [r2, #0x50]
        ldr     r4, [sp, #0x9C]
        smull   lr, r4, lr, r4
        str     r4, [r1, #0x50]
        ldr     lr, [r2, #0x84]
        ldr     r4, [sp, #0x9C]
        smull   lr, r4, lr, r4
        str     r4, [r1, #0x84]
        ldr     lr, [r2, #8]
        smull   lr, r4, lr, r3
        str     r4, [r1, #8]
        ldr     lr, [r2, #0x3C]
        smull   r3, lr, lr, r3
        str     lr, [r1, #0x3C]
        ldr     r3, [r2, #0x5C]
        smull   r3, lr, r3, r12
        str     lr, [r1, #0x5C]
        ldr     r3, [r2, #0x78]
        smull   r12, r3, r3, r12
        str     r3, [r1, #0x78]
        ldr     r3, [r2, #0x14]
        smull   r3, r12, r3, r10
        str     r12, [r1, #0x14]
        ldr     r3, [r2, #0x30]
        smull   r10, r3, r3, r10
        str     r3, [r1, #0x30]
        ldr     r3, [r2, #0x54]
        smull   r3, r12, r3, r11
        str     r12, [r1, #0x54]
        ldr     r3, [r2, #0x80]
        smull   r11, r3, r3, r11
        str     r3, [r1, #0x80]
        ldr     r3, [r2, #0xC]
        smull   r3, r12, r3, r6
        str     r12, [r1, #0xC]
        ldr     r3, [r2, #0x38]
        smull   r6, r3, r3, r6
        str     r3, [r1, #0x38]
        ldr     r3, [r2, #0x58]
        smull   r3, r12, r3, r7
        str     r12, [r1, #0x58]
        ldr     r3, [r2, #0x7C]
        smull   r7, r3, r3, r7
        str     r3, [r1, #0x7C]
        ldr     r3, [r2, #0x10]
        smull   r3, r12, r3, r9
        str     r12, [r1, #0x10]
        ldr     r2, [r2, #0x34]
        smull   r9, r2, r2, r9
        str     r2, [r1, #0x34]
        add     sp, sp, #5, 26
        ldmia   sp!, {r4 - r11, pc}


        .data
        .align  4


LGDP__pIMDCT12x3Coeff:
        .byte   0xF1,0xEA,0x4A,0xEF,0x4D,0xC5,0xFB,0x30,0x02,0x1B,0x14,0xB2,0x2D,0x9A,0x8C,0x65
        .byte   0xC4,0x50,0xBE,0x89,0x4B,0xAA,0xE7,0x7E,0xB3,0x3A,0x04,0xCF,0x3C,0xAF,0x41,0x76
        .byte   0xC4,0x50,0xBE,0x89,0x4D,0xC5,0xFB,0x30,0x4D,0xC5,0xFB,0x30,0xC4,0x50,0xBE,0x89
        .byte   0x02,0x1B,0x14,0xB2,0x3C,0xAF,0x41,0x76,0x0F,0x15,0xB5,0x10,0xB5,0x55,0x18,0x81
        .byte   0x4D,0xC5,0xFB,0x30,0x2D,0x9A,0x8C,0x65,0xD3,0x65,0x73,0x9A,0x4D,0xC5,0xFB,0x30
        .byte   0x4B,0xAA,0xE7,0x7E,0x0F,0x15,0xB5,0x10,0xC4,0x50,0xBE,0x89,0x02,0x1B,0x14,0xB2
        .byte   0xC4,0x50,0xBE,0x89,0xB3,0x3A,0x04,0xCF,0x4D,0xC5,0xFB,0x30,0x3C,0xAF,0x41,0x76
        .byte   0x3C,0xAF,0x41,0x76,0x4D,0xC5,0xFB,0x30,0xB5,0x55,0x18,0x81,0xC4,0x50,0xBE,0x89
        .byte   0xD3,0x65,0x73,0x9A,0x02,0x1B,0x14,0xB2,0xB3,0x3A,0x04,0xCF,0xF1,0xEA,0x4A,0xEF
LGDP__pIMDCTWinShort:
        .byte   0x0F,0x15,0xB5,0x10,0x4D,0xC5,0xFB,0x30,0xFE,0xE4,0xEB,0x4D,0x2D,0x9A,0x8C,0x65
        .byte   0x3D,0xAF,0x41,0x76,0x4C,0xAA,0xE7,0x7E,0x4C,0xAA,0xE7,0x7E,0x3D,0xAF,0x41,0x76
        .byte   0x2D,0x9A,0x8C,0x65,0xFE,0xE4,0xEB,0x4D,0x4D,0xC5,0xFB,0x30,0x0F,0x15,0xB5,0x10
LGDP__pCs:
        .byte   0x04,0x54,0xC2,0x6D,0xF9,0xEB,0xDC,0x70,0x7C,0x6E,0x8D,0x79,0xA8,0x40,0xDD,0x7D
        .byte   0xB7,0x20,0x6D,0x7F,0x40,0x7E,0xE4,0x7F,0x63,0xB2,0xFC,0x7F,0x95,0xC6,0xFF,0x7F
LGDP__pCa:
        .byte   0xCA,0x00,0x25,0xBE,0x6F,0x49,0x9E,0xC3,0x61,0x3F,0xE3,0xD7,0x7A,0x11,0xB7,0xE8
        .byte   0x2C,0xFE,0xE4,0xF3,0xC9,0xA3,0xC1,0xFA,0xC6,0xBD,0x2E,0xFE,0x5D,0xC2,0x86,0xFF
LGDP__pIMDCTWin:
        .byte   0x29,0x75,0x08,0x01,0x05,0x3C,0x6E,0x03,0x54,0xFC,0x71,0x06,0x03,0x73,0x6B,0x0A
        .byte   0x17,0x00,0x00,0x20,0x45,0x9C,0x91,0x18,0x1D,0x19,0xB8,0x27,0x54,0x58,0x9F,0x4A
        .byte   0x12,0x05,0xF4,0x3D,0x58,0xD3,0x63,0xBC,0x3A,0x09,0xC0,0x9E,0x77,0x48,0xA7,0xC1
        .byte   0x51,0xC5,0xCD,0xD0,0xFD,0xC2,0xBE,0xB2,0x89,0xEE,0xF3,0xDE,0x4C,0x65,0xED,0xE2
        .byte   0xA2,0x25,0xF1,0xE5,0x7F,0xEC,0x56,0xE8,0x45,0xB6,0x51,0xEA,0x36,0x46,0x01,0xEC
        .byte   0xB2,0x89,0x7A,0xED,0xAE,0xF7,0xCB,0xEE,0xF8,0xFF,0xFF,0xDF,0xDA,0x7C,0x1E,0xF1
        .byte   0x2D,0x98,0x2D,0xF2,0x5E,0x62,0x32,0xF3,0x24,0x3C,0x31,0xF4,0x68,0x25,0x2E,0xF5
        .byte   0x3A,0xFF,0x2C,0xF6,0x7B,0xC9,0x31,0xF7,0xB7,0xE4,0x40,0xF8,0x30,0xC3,0xBE,0xF2
        .byte   0xF4,0x69,0x93,0xFA,0xD9,0xD7,0xE4,0xFB,0x63,0x1B,0x5E,0xFD,0x50,0xAB,0x0D,0xFF
        .byte   0x29,0x75,0x08,0x01,0x05,0x3C,0x6E,0x03,0x54,0xFC,0x71,0x06,0x03,0x73,0x6B,0x0A
        .byte   0x17,0x00,0x00,0x20,0x45,0x9C,0x91,0x18,0x1D,0x19,0xB8,0x27,0x54,0x58,0x9F,0x4A
        .byte   0x12,0x05,0xF4,0x3D,0x58,0xD3,0x63,0xBC,0x3A,0x09,0xC0,0x9E,0x77,0x48,0xA7,0xC1
        .byte   0x51,0xC5,0xCD,0xD0,0xFD,0xC2,0xBE,0xB2,0x89,0xEE,0xF3,0xDE,0x4C,0x65,0xED,0xE2
        .byte   0xA2,0x25,0xF1,0xE5,0x7F,0xEC,0x56,0xE8,0xA0,0x6C,0x4C,0xEA,0xE0,0x1A,0xD5,0xEB
        .byte   0xE0,0x6A,0x07,0xED,0x60,0x3E,0xF6,0xED,0x00,0x0B,0x5D,0xDD,0x80,0x39,0x39,0xEF
        .byte   0xA4,0x71,0xC0,0xEF,0xB8,0x22,0x17,0xF1,0x2B,0x54,0x4B,0xF3,0x39,0x23,0x40,0xF6
        .byte   0xC5,0x00,0xD3,0xF9,0x51,0x62,0xDC,0xFD,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xD4,0x22,0xA6,0x09,0x5E,0xDD,0xE8,0x2E
        .byte   0x2D,0x29,0xD3,0x37,0x87,0x65,0x3F,0xB7,0x33,0x09,0xC0,0x8E,0x3A,0x74,0xB5,0xB6
        .byte   0x80,0xB6,0xCA,0xCA,0x80,0x45,0x61,0xAC,0x40,0x5F,0x59,0xDD,0x60,0xB1,0x38,0xE2
        .byte   0xA0,0x95,0xB7,0xE5,0x40,0x27,0x51,0xE8,0x45,0xB6,0x51,0xEA,0x36,0x46,0x01,0xEC
        .byte   0xB2,0x89,0x7A,0xED,0xAE,0xF7,0xCB,0xEE,0xF8,0xFF,0xFF,0xDF,0xDA,0x7C,0x1E,0xF1
        .byte   0x2D,0x98,0x2D,0xF2,0x5E,0x62,0x32,0xF3,0x24,0x3C,0x31,0xF4,0x68,0x25,0x2E,0xF5
        .byte   0x3A,0xFF,0x2C,0xF6,0x7B,0xC9,0x31,0xF7,0xB7,0xE4,0x40,0xF8,0x30,0xC3,0xBE,0xF2
        .byte   0xF4,0x69,0x93,0xFA,0xD9,0xD7,0xE4,0xFB,0x63,0x1B,0x5E,0xFD,0x50,0xAB,0x0D,0xFF
LGDP__pIMDCT36CoeffStage3:
        .byte   0xC0,0x4A,0x1F,0x20,0x00,0x2A,0xCA,0x5B,0x80,0xFB,0x20,0x21,0x00,0x75,0xA3,0x7B
        .byte   0x40,0xDF,0x4E,0x23,0x80,0xEC,0xB7,0x4B,0xC0,0x95,0x10,0x27,0x00,0x51,0xCA,0x37


