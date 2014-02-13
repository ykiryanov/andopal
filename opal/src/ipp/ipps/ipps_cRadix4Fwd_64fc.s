        .text
        .align  4
        .globl  _ipps_cRadix4Fwd_64fc


        .long   0xaaaaaaaa
_ipps_cRadix4Fwd_64fc:
        mov     r12, sp
        stmdb   sp!, {r4 - r7, r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0xC0
        str     r0, [r11, #-0x28]
        str     r1, [r11, #-0x24]
        str     r2, [r11, #-0x20]
        ldr     r0, [r11, #-0x28]
        str     r0, [r11, #-0x5C]
        ldr     r0, [r11, #-0x20]
        str     r0, [r11, #-0x58]
        ldr     r0, [r11, #-0x24]
        mov     r1, #3
        mul     r1, r0, r1
        mov     r0, r1, asr #2
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x24]
        mov     r0, r0, asr #2
        str     r0, [r11, #-0x50]
        ldr     r0, [r11, #-0x5C]
        str     r0, [r11, #-0x4C]
        mov     r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        bgt     LCEF1
LCEF0:
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x10]
        ldr     r3, [r3, #0x14]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x18]
        ldr     r3, [r3, #0x1C]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x10]
        ldr     r3, [r3, #0x14]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x18]
        ldr     r3, [r3, #0x1C]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x20]
        ldr     r1, [r1, #0x24]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x30]
        ldr     r3, [r3, #0x34]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x28]
        ldr     r1, [r1, #0x2C]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x38]
        ldr     r3, [r3, #0x3C]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x20]
        ldr     r1, [r1, #0x24]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x30]
        ldr     r3, [r3, #0x34]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x28]
        ldr     r1, [r1, #0x2C]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x38]
        ldr     r3, [r3, #0x3C]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x20]
        str     r1, [r2, #0x24]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x28]
        str     r1, [r2, #0x2C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x10]
        str     r1, [r2, #0x14]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x18]
        str     r1, [r2, #0x1C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x30]
        str     r1, [r2, #0x34]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x38]
        str     r1, [r2, #0x3C]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x48]
        add     r0, r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        ble     LCEF0
LCEF1:
        ldr     r0, [r11, #-0x24]
        ldr     r1, [pc, #-0x2C4]
        tst     r0, r1
        beq     LCEF15
        ldr     r0, [r11, #-0x50]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x50]
        ldr     r0, [r11, #-0x5C]
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x54]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x44]
        mov     r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        bgt     LCEF3
LCEF2:
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x38]
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xDC]
        ldr     r3, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r2, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r1, r3
        str     r0, [r1, +r3]
        str     r2, [lr, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r3, [r11, #-0xC8]
        ldr     r1, [r11, #-0x38]
        ldr     r2, [r11, #-0x2C]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r2, [r11, #-0xC0]
        ldr     r1, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r1, r3
        str     r0, [r1, +r3]
        str     r2, [lr, #4]
        mov     r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x38]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __adddf3
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        str     r0, [r11, #-0x6C]
        str     r1, [r11, #-0x68]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        str     r0, [r11, #-0x64]
        str     r1, [r11, #-0x60]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x6C]
        ldr     r3, [r11, #-0x68]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x64]
        ldr     r3, [r11, #-0x60]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x6C]
        ldr     r3, [r11, #-0x68]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x64]
        ldr     r3, [r11, #-0x60]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xDC]
        ldr     r3, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r2, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r1, r3
        str     r0, [r1, +r3]
        str     r2, [lr, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r3, [r11, #-0xC8]
        ldr     r1, [r11, #-0x38]
        ldr     r2, [r11, #-0x2C]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r2, [r11, #-0xC0]
        ldr     r1, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r1, r3
        str     r0, [r1, +r3]
        str     r2, [lr, #4]
        mov     r0, #4
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xDC]
        ldr     r3, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r2, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r1, r3
        str     r0, [r1, +r3]
        str     r2, [lr, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r3, [r11, #-0xC8]
        ldr     r1, [r11, #-0x38]
        ldr     r2, [r11, #-0x2C]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r2, [r11, #-0xC0]
        ldr     r1, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r1, r3
        str     r0, [r1, +r3]
        str     r2, [lr, #4]
        mov     r0, #6
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x38]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __subdf3
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        str     r0, [r11, #-0x6C]
        str     r1, [r11, #-0x68]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        str     r0, [r11, #-0x64]
        str     r1, [r11, #-0x60]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x6C]
        ldr     r3, [r11, #-0x68]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x64]
        ldr     r3, [r11, #-0x60]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x6C]
        ldr     r3, [r11, #-0x68]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x64]
        ldr     r3, [r11, #-0x60]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xDC]
        ldr     r3, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r2, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r1, r3
        str     r0, [r1, +r3]
        str     r2, [lr, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r3, [r11, #-0xC8]
        ldr     r1, [r11, #-0x38]
        ldr     r2, [r11, #-0x2C]
        mov     lr, r2, lsl #3
        add     lr, r1, lr
        str     r0, [r1, +r2, lsl #3]
        str     r3, [lr, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r2, [r11, #-0xC0]
        ldr     r1, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r1, r3
        str     r0, [r1, +r3]
        str     r2, [lr, #4]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x80
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x48]
        add     r0, r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        ble     LCEF2
LCEF3:
        ldr     r0, [r11, #-0x50]
        movs    r0, r0, asr #2
        str     r0, [r11, #-0x50]
        ldmeqdb r11, {r4 - r7, r11, sp, pc}
        ldr     r0, [r11, #-0x54]
        mov     r0, r0, asr #2
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x5C]
        str     r0, [r11, #-0x4C]
        mov     r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        bgt     LCEF7
LCEF4:
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x80]
        ldr     r3, [r3, #0x84]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x88]
        ldr     r3, [r3, #0x8C]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x80]
        ldr     r3, [r3, #0x84]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x88]
        ldr     r3, [r3, #0x8C]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x100]
        ldr     r1, [r1, #0x104]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x180]
        ldr     r3, [r3, #0x184]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x108]
        ldr     r1, [r1, #0x10C]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x188]
        ldr     r3, [r3, #0x18C]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x100]
        ldr     r1, [r1, #0x104]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x180]
        ldr     r3, [r3, #0x184]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x108]
        ldr     r1, [r1, #0x10C]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x188]
        ldr     r3, [r3, #0x18C]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x100]
        str     r1, [r2, #0x104]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x108]
        str     r1, [r2, #0x10C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x80]
        str     r1, [r2, #0x84]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x88]
        str     r1, [r2, #0x8C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x180]
        str     r1, [r2, #0x184]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x188]
        str     r1, [r2, #0x18C]
        ldr     r0, [r11, #-0x58]
        str     r0, [r11, #-0x44]
        mov     r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0x10
        bge     LCEF6
LCEF5:
        ldr     r0, [r11, #-0x44]
        ldr     r1, [r11, #-0x54]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x44]
        ldr     r0, [r11, #-0x44]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x100]
        ldr     r1, [r1, #0x104]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        ldr     r0, [r2, #0x108]
        ldr     r1, [r2, #0x10C]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x108]
        ldr     r1, [r1, #0x10C]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        ldr     r0, [lr, #0x100]
        ldr     r1, [lr, #0x104]
        ldr     lr, [r11, #-0x44]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x80]
        ldr     r1, [r1, #0x84]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        ldr     r0, [r2, #0x88]
        ldr     r1, [r2, #0x8C]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x84]
        str     r1, [r11, #-0x80]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x88]
        ldr     r1, [r1, #0x8C]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        ldr     r0, [lr, #0x80]
        ldr     r1, [lr, #0x84]
        ldr     lr, [r11, #-0x40]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x74]
        str     r1, [r11, #-0x70]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x180]
        ldr     r1, [r1, #0x184]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        ldr     r0, [r2, #0x188]
        ldr     r1, [r2, #0x18C]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x188]
        ldr     r1, [r1, #0x18C]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        ldr     r0, [lr, #0x180]
        ldr     r1, [lr, #0x184]
        ldr     lr, [r11, #-0x3C]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x7C]
        str     r1, [r11, #-0x78]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x100]
        str     r1, [r2, #0x104]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x108]
        str     r1, [r2, #0x10C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x80]
        str     r1, [r2, #0x84]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x88]
        str     r1, [r2, #0x8C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x180]
        str     r1, [r2, #0x184]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x188]
        str     r1, [r2, #0x18C]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0x10
        blt     LCEF5
LCEF6:
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x19, 28
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x48]
        add     r0, r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        ble     LCEF4
LCEF7:
        ldr     r0, [r11, #-0x50]
        movs    r0, r0, asr #2
        str     r0, [r11, #-0x50]
        ldmeqdb r11, {r4 - r7, r11, sp, pc}
        ldr     r0, [r11, #-0x54]
        mov     r0, r0, asr #2
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x5C]
        str     r0, [r11, #-0x4C]
        mov     r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        bgt     LCEF11
LCEF8:
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x200]
        ldr     r3, [r3, #0x204]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x208]
        ldr     r3, [r3, #0x20C]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x200]
        ldr     r3, [r3, #0x204]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x208]
        ldr     r3, [r3, #0x20C]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x400]
        ldr     r1, [r1, #0x404]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x600]
        ldr     r3, [r3, #0x604]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x408]
        ldr     r1, [r1, #0x40C]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x608]
        ldr     r3, [r3, #0x60C]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x400]
        ldr     r1, [r1, #0x404]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x600]
        ldr     r3, [r3, #0x604]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x408]
        ldr     r1, [r1, #0x40C]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x608]
        ldr     r3, [r3, #0x60C]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x400]
        str     r1, [r2, #0x404]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x408]
        str     r1, [r2, #0x40C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x200]
        str     r1, [r2, #0x204]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x208]
        str     r1, [r2, #0x20C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x600]
        str     r1, [r2, #0x604]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x608]
        str     r1, [r2, #0x60C]
        ldr     r0, [r11, #-0x58]
        str     r0, [r11, #-0x44]
        mov     r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0x40
        bge     LCEF10
LCEF9:
        ldr     r0, [r11, #-0x44]
        ldr     r1, [r11, #-0x54]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x44]
        ldr     r0, [r11, #-0x44]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x400]
        ldr     r1, [r1, #0x404]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        ldr     r0, [r2, #0x408]
        ldr     r1, [r2, #0x40C]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x408]
        ldr     r1, [r1, #0x40C]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        ldr     r0, [lr, #0x400]
        ldr     r1, [lr, #0x404]
        ldr     lr, [r11, #-0x44]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x200]
        ldr     r1, [r1, #0x204]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        ldr     r0, [r2, #0x208]
        ldr     r1, [r2, #0x20C]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x84]
        str     r1, [r11, #-0x80]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x208]
        ldr     r1, [r1, #0x20C]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        ldr     r0, [lr, #0x200]
        ldr     r1, [lr, #0x204]
        ldr     lr, [r11, #-0x40]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x74]
        str     r1, [r11, #-0x70]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x600]
        ldr     r1, [r1, #0x604]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        ldr     r0, [r2, #0x608]
        ldr     r1, [r2, #0x60C]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x608]
        ldr     r1, [r1, #0x60C]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        ldr     r0, [lr, #0x600]
        ldr     r1, [lr, #0x604]
        ldr     lr, [r11, #-0x3C]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x7C]
        str     r1, [r11, #-0x78]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x400]
        str     r1, [r2, #0x404]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x408]
        str     r1, [r2, #0x40C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x200]
        str     r1, [r2, #0x204]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x208]
        str     r1, [r2, #0x20C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x600]
        str     r1, [r2, #0x604]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x608]
        str     r1, [r2, #0x60C]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0x40
        blt     LCEF9
LCEF10:
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x61, 28
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x48]
        add     r0, r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        ble     LCEF8
LCEF11:
        ldr     r0, [r11, #-0x50]
        movs    r0, r0, asr #2
        str     r0, [r11, #-0x50]
        ldmeqdb r11, {r4 - r7, r11, sp, pc}
        ldr     r0, [r11, #-0x54]
        mov     r0, r0, asr #2
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x5C]
        str     r0, [r11, #-0x4C]
        mov     r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        bgt     LCEF29
LCEF12:
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x800]
        ldr     r3, [r3, #0x804]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x808]
        ldr     r3, [r3, #0x80C]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x800]
        ldr     r3, [r3, #0x804]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x808]
        ldr     r3, [r3, #0x80C]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0x4C]
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x4C]
        add     r3, r2, #6, 22
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #8
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r3, r2, #6, 22
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0x4C]
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x4C]
        add     r3, r2, #6, 22
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #8
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r3, r2, #6, 22
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #1, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #1, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x800]
        str     r1, [r2, #0x804]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x808]
        str     r1, [r2, #0x80C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #6, 22
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #6, 22
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x58]
        str     r0, [r11, #-0x44]
        mov     r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #1, 24
        bge     LCEF14
LCEF13:
        ldr     r0, [r11, #-0x44]
        ldr     r1, [r11, #-0x54]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x44]
        ldr     r0, [r11, #-0x44]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x4C]
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #1, 20
        ldr     r0, [r2]
        ldr     r1, [r2, #4]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #8
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        add     lr, lr, #1, 20
        ldr     r0, [lr]
        ldr     r1, [lr, #4]
        ldr     lr, [r11, #-0x44]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x800]
        ldr     r1, [r1, #0x804]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        ldr     r0, [r2, #0x808]
        ldr     r1, [r2, #0x80C]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x84]
        str     r1, [r11, #-0x80]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x808]
        ldr     r1, [r1, #0x80C]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        ldr     r0, [lr, #0x800]
        ldr     r1, [lr, #0x804]
        ldr     lr, [r11, #-0x40]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x74]
        str     r1, [r11, #-0x70]
        ldr     r0, [r11, #-0x4C]
        add     r1, r0, #6, 22
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #6, 22
        ldr     r0, [r2]
        ldr     r1, [r2, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #8
        add     r1, r0, #6, 22
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        add     lr, lr, #6, 22
        ldr     r0, [lr]
        ldr     r1, [lr, #4]
        ldr     lr, [r11, #-0x3C]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x7C]
        str     r1, [r11, #-0x78]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #1, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #1, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x800]
        str     r1, [r2, #0x804]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x808]
        str     r1, [r2, #0x80C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #6, 22
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #6, 22
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #1, 24
        blt     LCEF13
LCEF14:
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x81, 28
        add     r0, r0, #1, 20
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x48]
        add     r0, r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        ble     LCEF12
        b       LCEF29
LCEF15:
        ldr     r0, [r11, #-0x50]
        movs    r0, r0, asr #2
        str     r0, [r11, #-0x50]
        ldmeqdb r11, {r4 - r7, r11, sp, pc}
        ldr     r0, [r11, #-0x5C]
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x54]
        mov     r0, r0, asr #1
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x58]
        ldr     r1, [r11, #-0x54]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x44]
        ldr     r0, [r11, #-0x44]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x3C]
        mov     r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        bgt     LCEF17
LCEF16:
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x38]
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #-0x34]
        add     r0, r0, #0x40
        str     r0, [r11, #-0x30]
        mov     r0, #0
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0x34]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x30]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0x34]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x30]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        mov     r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x34]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r0, [r2, +lr]
        ldr     r1, [r3, #4]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r6, [r11, #-0x34]
        ldr     r7, [r11, #-0x2C]
        mov     lr, r7, lsl #3
        add     lr, r6, lr
        ldr     r0, [r6, +r7, lsl #3]
        ldr     r1, [lr, #4]
        ldr     lr, [r11, #-0x44]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r0, [r11, #-0x30]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r0, [r2, +lr]
        ldr     r1, [r3, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r0, [r11, #-0x38]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __adddf3
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        str     r0, [r11, #-0x84]
        str     r1, [r11, #-0x80]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r6, [r11, #-0x30]
        ldr     r7, [r11, #-0x2C]
        mov     lr, r7, lsl #3
        add     lr, r6, lr
        ldr     r0, [r6, +r7, lsl #3]
        ldr     r1, [lr, #4]
        ldr     lr, [r11, #-0x3C]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x7C]
        str     r1, [r11, #-0x78]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        str     r0, [r11, #-0x74]
        str     r1, [r11, #-0x70]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        mov     r0, #4
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x34]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __adddf3
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x34]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r0, [r11, #-0x30]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __subdf3
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x30]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        str     r0, [r11, #-0x7C]
        str     r1, [r11, #-0x78]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        mov     r0, #6
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x34]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r0, [r2, +lr]
        ldr     r1, [r3, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r0, [r11, #-0x34]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r6, [r11, #-0x34]
        ldr     r7, [r11, #-0x2C]
        mov     lr, r7, lsl #3
        add     lr, r6, lr
        ldr     r0, [r6, +r7, lsl #3]
        ldr     r1, [lr, #4]
        ldr     lr, [r11, #-0x3C]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r0, [r11, #-0x30]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r0, [r2, +lr]
        ldr     r1, [r3, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r0, [r11, #-0x38]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     lr, r3, #8
        add     r3, r2, lr
        ldr     r2, [r2, +lr]
        ldr     r3, [r3, #4]
        bl      __subdf3
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        str     r0, [r11, #-0x84]
        str     r1, [r11, #-0x80]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r0, [r11, #-0x4C]
        ldr     r2, [r11, #-0x2C]
        mov     r1, r2, lsl #3
        add     r1, r0, r1
        ldr     r0, [r0, +r2, lsl #3]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0x30]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r6, [r11, #-0x30]
        ldr     r7, [r11, #-0x2C]
        mov     lr, r7, lsl #3
        add     lr, r6, lr
        ldr     r0, [r6, +r7, lsl #3]
        ldr     r1, [lr, #4]
        ldr     lr, [r11, #-0x3C]
        ldr     r2, [lr]
        ldr     r3, [lr, #4]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x7C]
        str     r1, [r11, #-0x78]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x38]
        ldr     lr, [r11, #-0x2C]
        mov     r3, lr, lsl #3
        add     r3, r2, r3
        ldr     r2, [r2, +lr, lsl #3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        str     r0, [r11, #-0x74]
        str     r1, [r11, #-0x70]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #3
        add     r2, r1, #8
        add     r1, r0, r2
        ldr     r0, [r0, +r2]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x34]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x38]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     lr, r3, lsl #3
        add     lr, r2, lr
        str     r0, [r2, +r3, lsl #3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x30]
        ldr     r3, [r11, #-0x2C]
        mov     r3, r3, lsl #3
        add     r3, r3, #8
        add     lr, r2, r3
        str     r0, [r2, +r3]
        str     r1, [lr, #4]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #1, 24
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x48]
        add     r0, r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        ble     LCEF16
LCEF17:
        ldr     r0, [r11, #-0x50]
        movs    r0, r0, asr #2
        str     r0, [r11, #-0x50]
        ldmeqdb r11, {r4 - r7, r11, sp, pc}
        ldr     r0, [r11, #-0x54]
        mov     r0, r0, asr #2
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x5C]
        str     r0, [r11, #-0x4C]
        mov     r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        bgt     LCEF21
LCEF18:
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x100]
        ldr     r3, [r3, #0x104]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x108]
        ldr     r3, [r3, #0x10C]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x100]
        ldr     r3, [r3, #0x104]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x108]
        ldr     r3, [r3, #0x10C]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x200]
        ldr     r1, [r1, #0x204]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x300]
        ldr     r3, [r3, #0x304]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x208]
        ldr     r1, [r1, #0x20C]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x308]
        ldr     r3, [r3, #0x30C]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x200]
        ldr     r1, [r1, #0x204]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x300]
        ldr     r3, [r3, #0x304]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x208]
        ldr     r1, [r1, #0x20C]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x308]
        ldr     r3, [r3, #0x30C]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x200]
        str     r1, [r2, #0x204]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x208]
        str     r1, [r2, #0x20C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x100]
        str     r1, [r2, #0x104]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x108]
        str     r1, [r2, #0x10C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x300]
        str     r1, [r2, #0x304]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x308]
        str     r1, [r2, #0x30C]
        ldr     r0, [r11, #-0x58]
        str     r0, [r11, #-0x44]
        mov     r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0x20
        bge     LCEF20
LCEF19:
        ldr     r0, [r11, #-0x44]
        ldr     r1, [r11, #-0x54]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x44]
        ldr     r0, [r11, #-0x44]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x200]
        ldr     r1, [r1, #0x204]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        ldr     r0, [r2, #0x208]
        ldr     r1, [r2, #0x20C]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x208]
        ldr     r1, [r1, #0x20C]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        ldr     r0, [lr, #0x200]
        ldr     r1, [lr, #0x204]
        ldr     lr, [r11, #-0x44]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x100]
        ldr     r1, [r1, #0x104]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        ldr     r0, [r2, #0x108]
        ldr     r1, [r2, #0x10C]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x84]
        str     r1, [r11, #-0x80]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x108]
        ldr     r1, [r1, #0x10C]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        ldr     r0, [lr, #0x100]
        ldr     r1, [lr, #0x104]
        ldr     lr, [r11, #-0x40]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x74]
        str     r1, [r11, #-0x70]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x300]
        ldr     r1, [r1, #0x304]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        ldr     r0, [r2, #0x308]
        ldr     r1, [r2, #0x30C]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x308]
        ldr     r1, [r1, #0x30C]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        ldr     r0, [lr, #0x300]
        ldr     r1, [lr, #0x304]
        ldr     lr, [r11, #-0x3C]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x7C]
        str     r1, [r11, #-0x78]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x200]
        str     r1, [r2, #0x204]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x208]
        str     r1, [r2, #0x20C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x100]
        str     r1, [r2, #0x104]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x108]
        str     r1, [r2, #0x10C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x300]
        str     r1, [r2, #0x304]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x308]
        str     r1, [r2, #0x30C]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0x20
        blt     LCEF19
LCEF20:
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x31, 28
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x48]
        add     r0, r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        ble     LCEF18
LCEF21:
        ldr     r0, [r11, #-0x50]
        movs    r0, r0, asr #2
        str     r0, [r11, #-0x50]
        ldmeqdb r11, {r4 - r7, r11, sp, pc}
        ldr     r0, [r11, #-0x54]
        mov     r0, r0, asr #2
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x5C]
        str     r0, [r11, #-0x4C]
        mov     r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        bgt     LCEF25
LCEF22:
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x400]
        ldr     r3, [r3, #0x404]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x408]
        ldr     r3, [r3, #0x40C]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x400]
        ldr     r3, [r3, #0x404]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0x408]
        ldr     r3, [r3, #0x40C]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x800]
        ldr     r1, [r1, #0x804]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0xC00]
        ldr     r3, [r3, #0xC04]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x808]
        ldr     r1, [r1, #0x80C]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0xC08]
        ldr     r3, [r3, #0xC0C]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x800]
        ldr     r1, [r1, #0x804]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0xC00]
        ldr     r3, [r3, #0xC04]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x808]
        ldr     r1, [r1, #0x80C]
        ldr     r3, [r11, #-0x4C]
        ldr     r2, [r3, #0xC08]
        ldr     r3, [r3, #0xC0C]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x800]
        str     r1, [r2, #0x804]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x808]
        str     r1, [r2, #0x80C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x400]
        str     r1, [r2, #0x404]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x408]
        str     r1, [r2, #0x40C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0xC00]
        str     r1, [r2, #0xC04]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0xC08]
        str     r1, [r2, #0xC0C]
        ldr     r0, [r11, #-0x58]
        str     r0, [r11, #-0x44]
        mov     r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0x80
        bge     LCEF24
LCEF23:
        ldr     r0, [r11, #-0x44]
        ldr     r1, [r11, #-0x54]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x44]
        ldr     r0, [r11, #-0x44]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x4C]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x800]
        ldr     r1, [r1, #0x804]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        ldr     r0, [r2, #0x808]
        ldr     r1, [r2, #0x80C]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x808]
        ldr     r1, [r1, #0x80C]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        ldr     r0, [lr, #0x800]
        ldr     r1, [lr, #0x804]
        ldr     lr, [r11, #-0x44]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x400]
        ldr     r1, [r1, #0x404]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        ldr     r0, [r2, #0x408]
        ldr     r1, [r2, #0x40C]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x84]
        str     r1, [r11, #-0x80]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0x408]
        ldr     r1, [r1, #0x40C]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        ldr     r0, [lr, #0x400]
        ldr     r1, [lr, #0x404]
        ldr     lr, [r11, #-0x40]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x74]
        str     r1, [r11, #-0x70]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0xC00]
        ldr     r1, [r1, #0xC04]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        ldr     r0, [r2, #0xC08]
        ldr     r1, [r2, #0xC0C]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #0xC08]
        ldr     r1, [r1, #0xC0C]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        ldr     r0, [lr, #0xC00]
        ldr     r1, [lr, #0xC04]
        ldr     lr, [r11, #-0x3C]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x7C]
        str     r1, [r11, #-0x78]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x800]
        str     r1, [r2, #0x804]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x808]
        str     r1, [r2, #0x80C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x400]
        str     r1, [r2, #0x404]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0x408]
        str     r1, [r2, #0x40C]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0xC00]
        str     r1, [r2, #0xC04]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #0xC08]
        str     r1, [r2, #0xC0C]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0x80
        blt     LCEF23
LCEF24:
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0xC1, 28
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x48]
        add     r0, r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        ble     LCEF22
LCEF25:
        ldr     r0, [r11, #-0x50]
        movs    r0, r0, asr #2
        str     r0, [r11, #-0x50]
        ldmeqdb r11, {r4 - r7, r11, sp, pc}
        ldr     r0, [r11, #-0x54]
        mov     r0, r0, asr #2
        str     r0, [r11, #-0x54]
        ldr     r0, [r11, #-0x5C]
        str     r0, [r11, #-0x4C]
        mov     r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        bgt     LCEF29
LCEF26:
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x4C]
        add     r3, r2, #1, 20
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r3, r2, #1, 20
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x4C]
        add     r3, r2, #1, 20
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r3, r2, #1, 20
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0x4C]
        add     r1, r0, #2, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x4C]
        add     r3, r2, #3, 20
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #8
        add     r1, r0, #2, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r3, r2, #3, 20
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0x4C]
        add     r1, r0, #2, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x4C]
        add     r3, r2, #3, 20
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #8
        add     r1, r0, #2, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r3, r2, #3, 20
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #2, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #2, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #1, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #1, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #3, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #3, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x58]
        str     r0, [r11, #-0x44]
        mov     r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #2, 24
        bge     LCEF28
LCEF27:
        ldr     r0, [r11, #-0x44]
        ldr     r1, [r11, #-0x54]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        str     r1, [r11, #-0x44]
        ldr     r0, [r11, #-0x44]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x40]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x3C]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x10
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x4C]
        add     r1, r0, #2, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #2, 20
        ldr     r0, [r2]
        ldr     r1, [r2, #4]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x9C]
        str     r1, [r11, #-0x98]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #8
        add     r1, r0, #2, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x44]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        add     lr, lr, #2, 20
        ldr     r0, [lr]
        ldr     r1, [lr, #4]
        ldr     lr, [r11, #-0x44]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x94]
        str     r1, [r11, #-0x90]
        ldr     r0, [r11, #-0x4C]
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #1, 20
        ldr     r0, [r2]
        ldr     r1, [r2, #4]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x84]
        str     r1, [r11, #-0x80]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #8
        add     r1, r0, #1, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x40]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        add     lr, lr, #1, 20
        ldr     r0, [lr]
        ldr     r1, [lr, #4]
        ldr     lr, [r11, #-0x40]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x74]
        str     r1, [r11, #-0x70]
        ldr     r0, [r11, #-0x4C]
        add     r1, r0, #3, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #3, 20
        ldr     r0, [r2]
        ldr     r1, [r2, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3, #8]
        ldr     r3, [r3, #0xC]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        str     r0, [r11, #-0x8C]
        str     r1, [r11, #-0x88]
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #8
        add     r1, r0, #3, 20
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r3, [r11, #-0x3C]
        ldr     r2, [r3]
        ldr     r3, [r3, #4]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     lr, [r11, #-0x4C]
        add     lr, lr, #3, 20
        ldr     r0, [lr]
        ldr     r1, [lr, #4]
        ldr     lr, [r11, #-0x3C]
        ldr     r2, [lr, #8]
        ldr     r3, [lr, #0xC]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r11, #-0x7C]
        str     r1, [r11, #-0x78]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __adddf3
        str     r0, [r11, #-0xBC]
        str     r1, [r11, #-0xB8]
        ldr     r0, [r11, #-0x9C]
        ldr     r1, [r11, #-0x98]
        ldr     r2, [r11, #-0x8C]
        ldr     r3, [r11, #-0x88]
        bl      __subdf3
        str     r0, [r11, #-0xAC]
        str     r1, [r11, #-0xA8]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __adddf3
        str     r0, [r11, #-0xB4]
        str     r1, [r11, #-0xB0]
        ldr     r0, [r11, #-0x94]
        ldr     r1, [r11, #-0x90]
        ldr     r2, [r11, #-0x7C]
        ldr     r3, [r11, #-0x78]
        bl      __subdf3
        str     r0, [r11, #-0xA4]
        str     r1, [r11, #-0xA0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __adddf3
        str     r0, [r11, #-0xDC]
        str     r1, [r11, #-0xD8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1]
        ldr     r1, [r1, #4]
        ldr     r2, [r11, #-0x84]
        ldr     r3, [r11, #-0x80]
        bl      __subdf3
        str     r0, [r11, #-0xCC]
        str     r1, [r11, #-0xC8]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __adddf3
        str     r0, [r11, #-0xD4]
        str     r1, [r11, #-0xD0]
        ldr     r1, [r11, #-0x4C]
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x74]
        ldr     r3, [r11, #-0x70]
        bl      __subdf3
        str     r0, [r11, #-0xC4]
        str     r1, [r11, #-0xC0]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        str     r0, [r2, #8]
        str     r1, [r2, #0xC]
        ldr     r0, [r11, #-0xDC]
        ldr     r1, [r11, #-0xD8]
        ldr     r2, [r11, #-0xBC]
        ldr     r3, [r11, #-0xB8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #2, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xD4]
        ldr     r1, [r11, #-0xD0]
        ldr     r2, [r11, #-0xB4]
        ldr     r3, [r11, #-0xB0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #2, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #1, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #1, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xCC]
        ldr     r1, [r11, #-0xC8]
        ldr     r2, [r11, #-0xA4]
        ldr     r3, [r11, #-0xA0]
        bl      __subdf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #3, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0xC4]
        ldr     r1, [r11, #-0xC0]
        ldr     r2, [r11, #-0xAC]
        ldr     r3, [r11, #-0xA8]
        bl      __adddf3
        ldr     r2, [r11, #-0x4C]
        add     r2, r2, #8
        add     r2, r2, #3, 20
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #2
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #2, 24
        blt     LCEF27
LCEF28:
        ldr     r0, [r11, #-0x4C]
        add     r0, r0, #0x10
        add     r0, r0, #3, 20
        str     r0, [r11, #-0x4C]
        ldr     r0, [r11, #-0x48]
        add     r0, r0, #1
        str     r0, [r11, #-0x48]
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x50]
        cmp     r0, r1
        ble     LCEF26
LCEF29:
        ldmdb   r11, {r4 - r7, r11, sp, pc}


