        .text
        .align  4
        .globl  _ipps_crRadix4Inv_64f


_ipps_crRadix4Inv_64f:
        mov     r12, sp
        stmdb   sp!, {r4 - r7, r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0xF8
        str     r0, [r11, #-0x2C]
        str     r1, [r11, #-0x28]
        str     r2, [r11, #-0x24]
        str     r3, [r11, #-0x20]
        ldr     r0, [r11, #-0x20]
        str     r0, [r11, #-0x74]
        mov     r0, #1
        str     r0, [r11, #-0x70]
        ldr     r1, [r11, #-0x24]
        mov     r2, #3
        mul     r1, r1, r2
        str     r1, [r11, #-0x6C]
        ldr     r1, [r11, #-0x24]
        mov     r1, r1, asr #2
        str     r1, [r11, #-0x68]
        ldr     r1, [r11, #-0x6C]
        mov     r1, r1, asr #1
        str     r1, [r11, #-0x6C]
        ldr     r1, [r11, #-0x2C]
        str     r1, [r11, #-0x64]
        ldr     r1, [r11, #-0x28]
        str     r1, [r11, #-0x60]
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x68]
        cmp     r0, r1
        bgt     LCEC3
LCEC0:
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __adddf3
        str     r0, [r11, #-0x114]
        str     r1, [r11, #-0x110]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __subdf3
        str     r0, [r11, #-0x10C]
        str     r1, [r11, #-0x108]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x10]
        ldr     r1, [r1, #0x14]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x18]
        ldr     r3, [r3, #0x1C]
        bl      __adddf3
        str     r0, [r11, #-0x104]
        str     r1, [r11, #-0x100]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x10]
        ldr     r1, [r1, #0x14]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x18]
        ldr     r3, [r3, #0x1C]
        bl      __subdf3
        str     r0, [r11, #-0xFC]
        str     r1, [r11, #-0xF8]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x10]
        str     r1, [r2, #0x14]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x10]
        ldr     r1, [r1, #0x14]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x18]
        ldr     r3, [r3, #0x1C]
        bl      __adddf3
        str     r0, [r11, #-0xF4]
        str     r1, [r11, #-0xF0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x10]
        ldr     r1, [r1, #0x14]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x18]
        ldr     r3, [r3, #0x1C]
        bl      __subdf3
        str     r0, [r11, #-0xEC]
        str     r1, [r11, #-0xE8]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x18]
        str     r1, [r2, #0x1C]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __adddf3
        str     r0, [r11, #-0xE4]
        str     r1, [r11, #-0xE0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __subdf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x10]
        str     r1, [r2, #0x14]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x18]
        str     r1, [r2, #0x1C]
        ldr     r0, [r11, #-0x74]
        str     r0, [r11, #-0x58]
        mov     r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        cmp     r0, #1
        bge     LCEC2
LCEC1:
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x6C]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x58]
        ldr     r0, [r11, #-0x58]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x50]
        ldr     r0, [r11, #-0x50]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x64]
        add     r0, r0, #8
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x60]
        add     r0, r0, #8
        str     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x10]
        ldr     r1, [r1, #0x14]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        ldr     r0, [lr, #0x10]
        ldr     r1, [lr, #0x14]
        ldr     lr, [r11, #-0x58]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x10]
        ldr     r1, [r1, #0x14]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        ldr     r0, [r2, #0x10]
        ldr     r1, [r2, #0x14]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        ldr     r0, [lr, #8]
        ldr     r1, [lr, #0xC]
        ldr     lr, [r11, #-0x50]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x18]
        ldr     r1, [r1, #0x1C]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        ldr     r0, [lr, #0x18]
        ldr     r1, [lr, #0x1C]
        ldr     lr, [r11, #-0x4C]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        str     r0, [r11, #-0x104]
        str     r1, [r11, #-0x100]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        str     r0, [r11, #-0xFC]
        str     r1, [r11, #-0xF8]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xC4]
        ldr     r3, [r11, #-0xC0]
        bl      __adddf3
        str     r0, [r11, #-0x114]
        str     r1, [r11, #-0x110]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xC4]
        ldr     r3, [r11, #-0xC0]
        bl      __subdf3
        str     r0, [r11, #-0x10C]
        str     r1, [r11, #-0x108]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x10]
        str     r1, [r2, #0x14]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        ldr     r0, [r2, #8]
        ldr     r1, [r2, #0xC]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x18]
        ldr     r1, [r1, #0x1C]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        ldr     r0, [r2, #0x18]
        ldr     r1, [r2, #0x1C]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        str     r0, [r11, #-0xF4]
        str     r1, [r11, #-0xF0]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        str     r0, [r11, #-0xEC]
        str     r1, [r11, #-0xE8]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        str     r0, [r11, #-0xE4]
        str     r1, [r11, #-0xE0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x18]
        str     r1, [r2, #0x1C]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x10]
        str     r1, [r2, #0x14]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x18]
        str     r1, [r2, #0x1C]
        ldr     r0, [r11, #-0x54]
        add     r0, r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        cmp     r0, #1
        blt     LCEC1
LCEC2:
        ldr     r0, [r11, #-0x64]
        add     r0, r0, #0x20
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x60]
        add     r0, r0, #0x20
        str     r0, [r11, #-0x60]
        ldr     r0, [r11, #-0x5C]
        add     r0, r0, #1
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x68]
        cmp     r0, r1
        ble     LCEC0
LCEC3:
        ldr     r0, [r11, #-0x70]
        mov     r0, r0, lsl #2
        str     r0, [r11, #-0x70]
        ldr     r0, [r11, #-0x6C]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x6C]
        ldr     r0, [r11, #-0x68]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        movs    r0, r0, asr #1
        str     r0, [r11, #-0x68]
        beq     LCEC20
        ldr     r0, [r11, #-0x6C]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x6C]
        ldr     r0, [r11, #-0x2C]
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x28]
        str     r0, [r11, #-0x60]
        mov     r0, #1
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x68]
        cmp     r0, r1
        bgt     LCEC7
LCEC4:
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x20]
        ldr     r3, [r3, #0x24]
        bl      __adddf3
        str     r0, [r11, #-0x114]
        str     r1, [r11, #-0x110]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x20]
        ldr     r3, [r3, #0x24]
        bl      __subdf3
        str     r0, [r11, #-0x10C]
        str     r1, [r11, #-0x108]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x40]
        ldr     r1, [r1, #0x44]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x60]
        ldr     r3, [r3, #0x64]
        bl      __adddf3
        str     r0, [r11, #-0x104]
        str     r1, [r11, #-0x100]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x40]
        ldr     r1, [r1, #0x44]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x60]
        ldr     r3, [r3, #0x64]
        bl      __subdf3
        str     r0, [r11, #-0xFC]
        str     r1, [r11, #-0xF8]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x40]
        str     r1, [r2, #0x44]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x40]
        ldr     r1, [r1, #0x44]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x60]
        ldr     r3, [r3, #0x64]
        bl      __adddf3
        str     r0, [r11, #-0xF4]
        str     r1, [r11, #-0xF0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x40]
        ldr     r1, [r1, #0x44]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x60]
        ldr     r3, [r3, #0x64]
        bl      __subdf3
        str     r0, [r11, #-0xEC]
        str     r1, [r11, #-0xE8]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x20]
        str     r1, [r2, #0x24]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x60]
        str     r1, [r2, #0x64]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x20]
        ldr     r3, [r3, #0x24]
        bl      __adddf3
        str     r0, [r11, #-0xE4]
        str     r1, [r11, #-0xE0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x20]
        ldr     r3, [r3, #0x24]
        bl      __subdf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x40]
        str     r1, [r2, #0x44]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x20]
        str     r1, [r2, #0x24]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x60]
        str     r1, [r2, #0x64]
        ldr     r0, [r11, #-0x74]
        str     r0, [r11, #-0x58]
        mov     r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        cmp     r0, #4
        bge     LCEC6
LCEC5:
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x6C]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x58]
        ldr     r0, [r11, #-0x58]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x50]
        ldr     r0, [r11, #-0x50]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x64]
        add     r0, r0, #8
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x60]
        add     r0, r0, #8
        str     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x40]
        ldr     r1, [r1, #0x44]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        ldr     r0, [lr, #0x40]
        ldr     r1, [lr, #0x44]
        ldr     lr, [r11, #-0x58]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x40]
        ldr     r1, [r1, #0x44]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        ldr     r0, [r2, #0x40]
        ldr     r1, [r2, #0x44]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x20]
        ldr     r1, [r1, #0x24]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        ldr     r0, [lr, #0x20]
        ldr     r1, [lr, #0x24]
        ldr     lr, [r11, #-0x50]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x60]
        ldr     r1, [r1, #0x64]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        ldr     r0, [lr, #0x60]
        ldr     r1, [lr, #0x64]
        ldr     lr, [r11, #-0x4C]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        str     r0, [r11, #-0x104]
        str     r1, [r11, #-0x100]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        str     r0, [r11, #-0xFC]
        str     r1, [r11, #-0xF8]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xC4]
        ldr     r3, [r11, #-0xC0]
        bl      __adddf3
        str     r0, [r11, #-0x114]
        str     r1, [r11, #-0x110]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xC4]
        ldr     r3, [r11, #-0xC0]
        bl      __subdf3
        str     r0, [r11, #-0x10C]
        str     r1, [r11, #-0x108]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x40]
        str     r1, [r2, #0x44]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x20]
        ldr     r1, [r1, #0x24]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        ldr     r0, [r2, #0x20]
        ldr     r1, [r2, #0x24]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x60]
        ldr     r1, [r1, #0x64]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        ldr     r0, [r2, #0x60]
        ldr     r1, [r2, #0x64]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        str     r0, [r11, #-0xF4]
        str     r1, [r11, #-0xF0]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        str     r0, [r11, #-0xEC]
        str     r1, [r11, #-0xE8]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        str     r0, [r11, #-0xE4]
        str     r1, [r11, #-0xE0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x20]
        str     r1, [r2, #0x24]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x60]
        str     r1, [r2, #0x64]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x40]
        str     r1, [r2, #0x44]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x20]
        str     r1, [r2, #0x24]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x60]
        str     r1, [r2, #0x64]
        ldr     r0, [r11, #-0x54]
        add     r0, r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        cmp     r0, #4
        blt     LCEC5
LCEC6:
        ldr     r0, [r11, #-0x64]
        add     r0, r0, #0x68
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x60]
        add     r0, r0, #0x68
        str     r0, [r11, #-0x60]
        ldr     r0, [r11, #-0x5C]
        add     r0, r0, #1
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x68]
        cmp     r0, r1
        ble     LCEC4
LCEC7:
        ldr     r0, [r11, #-0x70]
        mov     r0, r0, lsl #2
        str     r0, [r11, #-0x70]
        ldr     r0, [r11, #-0x6C]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x6C]
        ldr     r0, [r11, #-0x68]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        movs    r0, r0, asr #1
        str     r0, [r11, #-0x68]
        beq     LCEC20
        ldr     r0, [r11, #-0x6C]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x6C]
        ldr     r0, [r11, #-0x2C]
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x28]
        str     r0, [r11, #-0x60]
        mov     r0, #1
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x68]
        cmp     r0, r1
        bgt     LCEC11
LCEC8:
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x80]
        ldr     r3, [r3, #0x84]
        bl      __adddf3
        str     r0, [r11, #-0x114]
        str     r1, [r11, #-0x110]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x80]
        ldr     r3, [r3, #0x84]
        bl      __subdf3
        str     r0, [r11, #-0x10C]
        str     r1, [r11, #-0x108]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x100]
        ldr     r1, [r1, #0x104]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x180]
        ldr     r3, [r3, #0x184]
        bl      __adddf3
        str     r0, [r11, #-0x104]
        str     r1, [r11, #-0x100]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x100]
        ldr     r1, [r1, #0x104]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x180]
        ldr     r3, [r3, #0x184]
        bl      __subdf3
        str     r0, [r11, #-0xFC]
        str     r1, [r11, #-0xF8]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x100]
        str     r1, [r2, #0x104]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x100]
        ldr     r1, [r1, #0x104]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x180]
        ldr     r3, [r3, #0x184]
        bl      __adddf3
        str     r0, [r11, #-0xF4]
        str     r1, [r11, #-0xF0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x100]
        ldr     r1, [r1, #0x104]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x180]
        ldr     r3, [r3, #0x184]
        bl      __subdf3
        str     r0, [r11, #-0xEC]
        str     r1, [r11, #-0xE8]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x80]
        str     r1, [r2, #0x84]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x180]
        str     r1, [r2, #0x184]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x80]
        ldr     r3, [r3, #0x84]
        bl      __adddf3
        str     r0, [r11, #-0xE4]
        str     r1, [r11, #-0xE0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x80]
        ldr     r3, [r3, #0x84]
        bl      __subdf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x100]
        str     r1, [r2, #0x104]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x80]
        str     r1, [r2, #0x84]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x180]
        str     r1, [r2, #0x184]
        ldr     r0, [r11, #-0x74]
        str     r0, [r11, #-0x58]
        mov     r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        cmp     r0, #0x10
        bge     LCEC10
LCEC9:
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x6C]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x58]
        ldr     r0, [r11, #-0x58]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x50]
        ldr     r0, [r11, #-0x50]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x64]
        add     r0, r0, #8
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x60]
        add     r0, r0, #8
        str     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x100]
        ldr     r1, [r1, #0x104]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        ldr     r0, [lr, #0x100]
        ldr     r1, [lr, #0x104]
        ldr     lr, [r11, #-0x58]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x100]
        ldr     r1, [r1, #0x104]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        ldr     r0, [r2, #0x100]
        ldr     r1, [r2, #0x104]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x80]
        ldr     r1, [r1, #0x84]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        ldr     r0, [lr, #0x80]
        ldr     r1, [lr, #0x84]
        ldr     lr, [r11, #-0x50]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x180]
        ldr     r1, [r1, #0x184]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        ldr     r0, [lr, #0x180]
        ldr     r1, [lr, #0x184]
        ldr     lr, [r11, #-0x4C]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        str     r0, [r11, #-0x104]
        str     r1, [r11, #-0x100]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        str     r0, [r11, #-0xFC]
        str     r1, [r11, #-0xF8]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xC4]
        ldr     r3, [r11, #-0xC0]
        bl      __adddf3
        str     r0, [r11, #-0x114]
        str     r1, [r11, #-0x110]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xC4]
        ldr     r3, [r11, #-0xC0]
        bl      __subdf3
        str     r0, [r11, #-0x10C]
        str     r1, [r11, #-0x108]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x100]
        str     r1, [r2, #0x104]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x80]
        ldr     r1, [r1, #0x84]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        ldr     r0, [r2, #0x80]
        ldr     r1, [r2, #0x84]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x180]
        ldr     r1, [r1, #0x184]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        ldr     r0, [r2, #0x180]
        ldr     r1, [r2, #0x184]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        str     r0, [r11, #-0xF4]
        str     r1, [r11, #-0xF0]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        str     r0, [r11, #-0xEC]
        str     r1, [r11, #-0xE8]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        str     r0, [r11, #-0xE4]
        str     r1, [r11, #-0xE0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x80]
        str     r1, [r2, #0x84]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x180]
        str     r1, [r2, #0x184]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x100]
        str     r1, [r2, #0x104]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x80]
        str     r1, [r2, #0x84]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x180]
        str     r1, [r2, #0x184]
        ldr     r0, [r11, #-0x54]
        add     r0, r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        cmp     r0, #0x10
        blt     LCEC9
LCEC10:
        ldr     r0, [r11, #-0x64]
        add     r0, r0, #0x62, 30
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x60]
        add     r0, r0, #0x62, 30
        str     r0, [r11, #-0x60]
        ldr     r0, [r11, #-0x5C]
        add     r0, r0, #1
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x68]
        cmp     r0, r1
        ble     LCEC8
LCEC11:
        ldr     r0, [r11, #-0x70]
        mov     r0, r0, lsl #2
        str     r0, [r11, #-0x70]
        ldr     r0, [r11, #-0x6C]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x6C]
        ldr     r0, [r11, #-0x68]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        movs    r0, r0, asr #1
        str     r0, [r11, #-0x68]
        beq     LCEC20
        ldr     r0, [r11, #-0x6C]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x6C]
        ldr     r0, [r11, #-0x2C]
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x28]
        str     r0, [r11, #-0x60]
        mov     r0, #1
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x68]
        cmp     r0, r1
        bgt     LCEC15
LCEC12:
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x200]
        ldr     r3, [r3, #0x204]
        bl      __adddf3
        str     r0, [r11, #-0x114]
        str     r1, [r11, #-0x110]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x200]
        ldr     r3, [r3, #0x204]
        bl      __subdf3
        str     r0, [r11, #-0x10C]
        str     r1, [r11, #-0x108]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x400]
        ldr     r1, [r1, #0x404]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x600]
        ldr     r3, [r3, #0x604]
        bl      __adddf3
        str     r0, [r11, #-0x104]
        str     r1, [r11, #-0x100]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x400]
        ldr     r1, [r1, #0x404]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x600]
        ldr     r3, [r3, #0x604]
        bl      __subdf3
        str     r0, [r11, #-0xFC]
        str     r1, [r11, #-0xF8]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x400]
        str     r1, [r2, #0x404]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x400]
        ldr     r1, [r1, #0x404]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x600]
        ldr     r3, [r3, #0x604]
        bl      __adddf3
        str     r0, [r11, #-0xF4]
        str     r1, [r11, #-0xF0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x400]
        ldr     r1, [r1, #0x404]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x600]
        ldr     r3, [r3, #0x604]
        bl      __subdf3
        str     r0, [r11, #-0xEC]
        str     r1, [r11, #-0xE8]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x200]
        str     r1, [r2, #0x204]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x600]
        str     r1, [r2, #0x604]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x200]
        ldr     r3, [r3, #0x204]
        bl      __adddf3
        str     r0, [r11, #-0xE4]
        str     r1, [r11, #-0xE0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x200]
        ldr     r3, [r3, #0x204]
        bl      __subdf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x400]
        str     r1, [r2, #0x404]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x200]
        str     r1, [r2, #0x204]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x600]
        str     r1, [r2, #0x604]
        ldr     r0, [r11, #-0x74]
        str     r0, [r11, #-0x58]
        mov     r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        cmp     r0, #0x40
        bge     LCEC14
LCEC13:
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x6C]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x58]
        ldr     r0, [r11, #-0x58]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x50]
        ldr     r0, [r11, #-0x50]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x64]
        add     r0, r0, #8
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x60]
        add     r0, r0, #8
        str     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x400]
        ldr     r1, [r1, #0x404]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        ldr     r0, [lr, #0x400]
        ldr     r1, [lr, #0x404]
        ldr     lr, [r11, #-0x58]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x400]
        ldr     r1, [r1, #0x404]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        ldr     r0, [r2, #0x400]
        ldr     r1, [r2, #0x404]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x200]
        ldr     r1, [r1, #0x204]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        ldr     r0, [lr, #0x200]
        ldr     r1, [lr, #0x204]
        ldr     lr, [r11, #-0x50]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x600]
        ldr     r1, [r1, #0x604]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        ldr     r0, [lr, #0x600]
        ldr     r1, [lr, #0x604]
        ldr     lr, [r11, #-0x4C]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        str     r0, [r11, #-0x104]
        str     r1, [r11, #-0x100]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        str     r0, [r11, #-0xFC]
        str     r1, [r11, #-0xF8]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xC4]
        ldr     r3, [r11, #-0xC0]
        bl      __adddf3
        str     r0, [r11, #-0x114]
        str     r1, [r11, #-0x110]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xC4]
        ldr     r3, [r11, #-0xC0]
        bl      __subdf3
        str     r0, [r11, #-0x10C]
        str     r1, [r11, #-0x108]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x400]
        str     r1, [r2, #0x404]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x200]
        ldr     r1, [r1, #0x204]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        ldr     r0, [r2, #0x200]
        ldr     r1, [r2, #0x204]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x600]
        ldr     r1, [r1, #0x604]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        ldr     r0, [r2, #0x600]
        ldr     r1, [r2, #0x604]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        str     r0, [r11, #-0xF4]
        str     r1, [r11, #-0xF0]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        str     r0, [r11, #-0xEC]
        str     r1, [r11, #-0xE8]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        str     r0, [r11, #-0xE4]
        str     r1, [r11, #-0xE0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x200]
        str     r1, [r2, #0x204]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x600]
        str     r1, [r2, #0x604]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x400]
        str     r1, [r2, #0x404]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x200]
        str     r1, [r2, #0x204]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x600]
        str     r1, [r2, #0x604]
        ldr     r0, [r11, #-0x54]
        add     r0, r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        cmp     r0, #0x40
        blt     LCEC13
LCEC14:
        ldr     r0, [r11, #-0x64]
        add     r0, r0, #0x82, 30
        add     r0, r0, #1, 22
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x60]
        add     r0, r0, #0x82, 30
        add     r0, r0, #1, 22
        str     r0, [r11, #-0x60]
        ldr     r0, [r11, #-0x5C]
        add     r0, r0, #1
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x68]
        cmp     r0, r1
        ble     LCEC12
LCEC15:
        ldr     r0, [r11, #-0x70]
        mov     r0, r0, lsl #2
        str     r0, [r11, #-0x70]
        ldr     r0, [r11, #-0x6C]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x6C]
        ldr     r0, [r11, #-0x68]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        movs    r0, r0, asr #1
        str     r0, [r11, #-0x68]
        beq     LCEC20
        ldr     r0, [r11, #-0x6C]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x6C]
        ldr     r0, [r11, #-0x2C]
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x28]
        str     r0, [r11, #-0x60]
        mov     r0, #1
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x68]
        cmp     r0, r1
        bgt     LCEC19
LCEC16:
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x800]
        ldr     r3, [r3, #0x804]
        bl      __adddf3
        str     r0, [r11, #-0x114]
        str     r1, [r11, #-0x110]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x64]
        ldr     r2, [r3, #0x800]
        ldr     r3, [r3, #0x804]
        bl      __subdf3
        str     r0, [r11, #-0x10C]
        str     r1, [r11, #-0x108]
        ldr     r0, [r11, #-0x64]
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x64]
        add     r3, r2, #6, 22
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0x104]
        str     r1, [r11, #-0x100]
        ldr     r0, [r11, #-0x64]
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x64]
        add     r3, r2, #6, 22
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xFC]
        str     r1, [r11, #-0xF8]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        add     r2, r2, #1, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x60]
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x60]
        add     r3, r2, #6, 22
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xF4]
        str     r1, [r11, #-0xF0]
        ldr     r0, [r11, #-0x60]
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x60]
        add     r3, r2, #6, 22
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xEC]
        str     r1, [r11, #-0xE8]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x800]
        str     r1, [r2, #0x804]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        add     r2, r2, #6, 22
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x800]
        ldr     r3, [r3, #0x804]
        bl      __adddf3
        str     r0, [r11, #-0xE4]
        str     r1, [r11, #-0xE0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x60]
        ldr     r2, [r3, #0x800]
        ldr     r3, [r3, #0x804]
        bl      __subdf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        add     r2, r2, #1, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x800]
        str     r1, [r2, #0x804]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        add     r2, r2, #6, 22
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x74]
        str     r0, [r11, #-0x58]
        mov     r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        cmp     r0, #1, 24
        bge     LCEC18
LCEC17:
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x6C]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x58]
        ldr     r0, [r11, #-0x58]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x50]
        ldr     r0, [r11, #-0x50]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x64]
        add     r0, r0, #8
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x60]
        add     r0, r0, #8
        str     r0, [r11, #-0x60]
        ldr     r0, [r11, #-0x64]
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        add     lr, lr, #1, 20
        ldr     r0, [lr]
        ldr     r1, [lr, #4]
        ldr     lr, [r11, #-0x58]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r0, [r11, #-0x60]
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        add     r2, r2, #1, 20
        ldr     r0, [r2]
        ldr     r1, [r2, #4]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1, #0x800]
        ldr     r1, [r1, #0x804]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        ldr     r0, [lr, #0x800]
        ldr     r1, [lr, #0x804]
        ldr     lr, [r11, #-0x50]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0x64]
        add     r1, r0, #6, 22
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x60]
        add     lr, lr, #6, 22
        ldr     r0, [lr]
        ldr     r1, [lr, #4]
        ldr     lr, [r11, #-0x4C]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        str     r0, [r11, #-0x104]
        str     r1, [r11, #-0x100]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        str     r0, [r11, #-0xFC]
        str     r1, [r11, #-0xF8]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xC4]
        ldr     r3, [r11, #-0xC0]
        bl      __adddf3
        str     r0, [r11, #-0x114]
        str     r1, [r11, #-0x110]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xC4]
        ldr     r3, [r11, #-0xC0]
        bl      __subdf3
        str     r0, [r11, #-0x10C]
        str     r1, [r11, #-0x108]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x114]
        ldr     r1, [r11, #-0x110]
        ldr     r2, [r11, #-0x104]
        ldr     r3, [r11, #-0x100]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        add     r2, r2, #1, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1, #0x800]
        ldr     r1, [r1, #0x804]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        ldr     r0, [r2, #0x800]
        ldr     r1, [r2, #0x804]
        ldr     r3, [r11, #-0x50]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0x60]
        add     r1, r0, #6, 22
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x64]
        add     r2, r2, #6, 22
        ldr     r0, [r2]
        ldr     r1, [r2, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        str     r0, [r11, #-0xF4]
        str     r1, [r11, #-0xF0]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        str     r0, [r11, #-0xEC]
        str     r1, [r11, #-0xE8]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        str     r0, [r11, #-0xE4]
        str     r1, [r11, #-0xE0]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __subdf3
        ldr     r2, [r11, #-0x64]
        str     r0, [r2, #0x800]
        str     r1, [r2, #0x804]
        ldr     r0, [r11, #-0x10C]
        ldr     r1, [r11, #-0x108]
        ldr     r2, [r11, #-0xEC]
        ldr     r3, [r11, #-0xE8]
        bl      __adddf3
        ldr     r2, [r11, #-0x64]
        add     r2, r2, #6, 22
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xE4]
        ldr     r1, [r11, #-0xE0]
        ldr     r2, [r11, #-0xF4]
        ldr     r3, [r11, #-0xF0]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        add     r2, r2, #1, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __adddf3
        ldr     r2, [r11, #-0x60]
        str     r0, [r2, #0x800]
        str     r1, [r2, #0x804]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xFC]
        ldr     r3, [r11, #-0xF8]
        bl      __subdf3
        ldr     r2, [r11, #-0x60]
        add     r2, r2, #6, 22
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x54]
        add     r0, r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        cmp     r0, #1, 24
        blt     LCEC17
LCEC18:
        ldr     r0, [r11, #-0x64]
        add     r0, r0, #8
        add     r0, r0, #6, 22
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x60]
        add     r0, r0, #8
        add     r0, r0, #6, 22
        str     r0, [r11, #-0x60]
        ldr     r0, [r11, #-0x5C]
        add     r0, r0, #1
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x68]
        cmp     r0, r1
        ble     LCEC16
LCEC19:
        ldr     r0, [r11, #-0x70]
        mov     r0, r0, lsl #2
        str     r0, [r11, #-0x70]
        ldr     r0, [r11, #-0x6C]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x6C]
        ldr     r0, [r11, #-0x68]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x48]
LCEC20:
        ldr     r0, [r11, #-0x48]
        cmp     r0, #0
        ble     LCEC28
LCEC21:
        ldr     r0, [r11, #-0x2C]
        str     r0, [r11, #-0x64]
        ldr     r0, [r11, #-0x28]
        str     r0, [r11, #-0x60]
        mov     r0, #1
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x48]
        cmp     r0, r1
        bgt     LCEC27
LCEC22:
        ldr     r0, [r11, #-0x64]
        ldr     r1, [r11, #-0x70]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x44]
        ldr     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x70]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x40]
        ldr     r0, [r11, #-0x74]
        str     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r1, [r11, #-0x64]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r1, [r11, #-0x60]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r0, [r11, #-0xA4]
        ldr     r1, [r11, #-0xA0]
        ldr     r2, [r11, #-0x64]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x44]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x60]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x8C]
        ldr     r1, [r11, #-0x88]
        ldr     r2, [r11, #-0x40]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x6C]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x58]
        mov     r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        ldr     r1, [r11, #-0x70]
        mov     r1, r1, asr #1
        cmp     r0, r1
        bge     LCEC24
LCEC23:
        ldr     r0, [r11, #-0x44]
        ldr     r2, [r11, #-0x54]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r6, [r11, #-0x40]
        ldr     r7, [r11, #-0x54]
        mov     lr, r7, lsl #3
        add     lr, r6, lr
        ldr     r0, [r6, +r7, lsl #3]
        ldr     r1, [lr, #4]
        ldr     lr, [r11, #-0x58]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x84]
        str     r1, [r11, #-0x80]
        ldr     r0, [r11, #-0x40]
        ldr     r2, [r11, #-0x54]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r3, [r11, #-0x44]
        ldr     lr, [r11, #-0x54]
        mov     r2, lr, lsl #3
        add     r2, r3, r2
        ldr     r0, [r3, +lr, lsl #3]
        ldr     r1, [r2, #4]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x7C]
        str     r1, [r11, #-0x78]
        ldr     r0, [r11, #-0x64]
        ldr     r2, [r11, #-0x54]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __adddf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0x64]
        ldr     r2, [r11, #-0x54]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __subdf3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r0, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        ldr     r1, [r11, #-0x64]
        ldr     r2, [r11, #-0x54]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x9C]
        ldr     r3, [r11, #-0x98]
        ldr     r1, [r11, #-0x44]
        ldr     r2, [r11, #-0x54]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x60]
        ldr     r2, [r11, #-0x54]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __adddf3
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r0, [r11, #-0x60]
        ldr     r2, [r11, #-0x54]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __subdf3
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r0, [r11, #-0x94]
        ldr     r3, [r11, #-0x90]
        ldr     r1, [r11, #-0x60]
        ldr     r2, [r11, #-0x54]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        ldr     r1, [r11, #-0x40]
        ldr     r2, [r11, #-0x54]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x6C]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x58]
        ldr     r0, [r11, #-0x54]
        add     r0, r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        ldr     r1, [r11, #-0x70]
        mov     r1, r1, asr #1
        cmp     r0, r1
        blt     LCEC23
LCEC24:
        ldr     r0, [r11, #-0x64]
        ldr     r1, [r11, #-0x70]
        bic     r1, r1, #1
        mov     r1, r1, lsl #2
        add     r1, r0, r1
        str     r1, [r11, #-0x3C]
        ldr     r0, [r11, #-0x3C]
        ldr     r1, [r11, #-0x70]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x38]
        ldr     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x70]
        bic     r1, r1, #1
        mov     r1, r1, lsl #2
        add     r1, r0, r1
        str     r1, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x70]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x30]
        ldr     r0, [r11, #-0x74]
        str     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x3C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x30]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r1, [r11, #-0x3C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x30]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r1, [r11, #-0x34]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x38]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r1, [r11, #-0x34]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x38]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r0, [r11, #-0xA4]
        ldr     r1, [r11, #-0xA0]
        ldr     r2, [r11, #-0x3C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x38]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x34]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x8C]
        ldr     r1, [r11, #-0x88]
        ldr     r2, [r11, #-0x30]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x6C]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x58]
        mov     r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        ldr     r1, [r11, #-0x70]
        mov     r1, r1, asr #1
        cmp     r0, r1
        bge     LCEC26
LCEC25:
        ldr     r0, [r11, #-0x38]
        ldr     r2, [r11, #-0x54]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r3, [r11, #-0x30]
        ldr     lr, [r11, #-0x54]
        mov     r2, lr, lsl #3
        add     r2, r3, r2
        ldr     r0, [r3, +lr, lsl #3]
        ldr     r1, [r2, #4]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x84]
        str     r1, [r11, #-0x80]
        ldr     r0, [r11, #-0x30]
        ldr     r2, [r11, #-0x54]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x58]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r6, [r11, #-0x38]
        ldr     r7, [r11, #-0x54]
        mov     lr, r7, lsl #3
        add     lr, r6, lr
        ldr     r0, [r6, +r7, lsl #3]
        ldr     r1, [lr, #4]
        ldr     lr, [r11, #-0x58]
        ldr     r2, [lr]
        ldr     r3, [lr, #4]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x7C]
        str     r1, [r11, #-0x78]
        ldr     r0, [r11, #-0x3C]
        ldr     r2, [r11, #-0x54]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __adddf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0x3C]
        ldr     r2, [r11, #-0x54]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __subdf3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r0, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        ldr     r1, [r11, #-0x3C]
        ldr     r2, [r11, #-0x54]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x9C]
        ldr     r3, [r11, #-0x98]
        ldr     r1, [r11, #-0x38]
        ldr     r2, [r11, #-0x54]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x34]
        ldr     r2, [r11, #-0x54]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __adddf3
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r0, [r11, #-0x34]
        ldr     r2, [r11, #-0x54]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __subdf3
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r0, [r11, #-0x94]
        ldr     r3, [r11, #-0x90]
        ldr     r1, [r11, #-0x34]
        ldr     r2, [r11, #-0x54]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        ldr     r1, [r11, #-0x30]
        ldr     r2, [r11, #-0x54]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x6C]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x58]
        ldr     r0, [r11, #-0x54]
        add     r0, r0, #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x54]
        ldr     r1, [r11, #-0x70]
        mov     r1, r1, asr #1
        cmp     r0, r1
        blt     LCEC25
LCEC26:
        ldr     r0, [r11, #-0x64]
        ldr     r1, [r11, #-0x70]
        mov     r1, r1, lsl #1
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x64]
        ldr     r0, [r11, #-0x60]
        ldr     r1, [r11, #-0x70]
        mov     r1, r1, lsl #1
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x60]
        ldr     r0, [r11, #-0x5C]
        add     r0, r0, #1
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x5C]
        ldr     r1, [r11, #-0x48]
        cmp     r0, r1
        ble     LCEC22
LCEC27:
        ldr     r0, [r11, #-0x70]
        mov     r0, r0, lsl #1
        str     r0, [r11, #-0x70]
        ldr     r0, [r11, #-0x6C]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x6C]
        ldr     r0, [r11, #-0x48]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        cmp     r0, #0
        bgt     LCEC21
LCEC28:
        ldmdb   r11, {r4 - r7, r11, sp, pc}


