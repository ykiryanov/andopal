        .text
        .align  4
        .globl  _ippiResize_16u_C3R


_ippiResize_16u_C3R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x68
        ldr     r9, [sp, #0xBC]
        str     r1, [sp, #0x60]
        ldr     r11, [sp, #0x9C]
        ldr     r10, [sp, #0xA0]
        ldr     r8, [sp, #0xAC]
        ldr     r5, [sp, #0xB0]
        ldr     r7, [sp, #0xB4]
        ldr     r6, [sp, #0xB8]
        str     r2, [sp, #0x64]
        cmp     r9, #8
        mov     r4, r0
        str     r3, [sp, #0x5C]
        beq     LMXP1
LMXP0:
        mov     r2, #0
        str     r2, [sp, #0x4C]
        str     r2, [sp, #0x3C]
        str     r2, [sp, #0x38]
        str     r2, [sp, #0x34]
        str     r2, [sp, #0x30]
        mov     r2, #1
        str     r2, [sp, #0x54]
        str     r2, [sp, #0x48]
        mov     r2, #3
        str     r2, [sp, #0x44]
        str     r2, [sp, #0x40]
        add     r2, sp, #0x18
        add     r0, r2, #0
        add     r1, sp, #0xA4
        str     r9, [sp, #0x50]
        str     r6, [sp, #0x2C]
        str     r7, [sp, #0x28]
        str     r5, [sp, #0x24]
        str     r8, [sp, #0x20]
        mov     r2, #8
        bl      __intel_memcpy
        add     r1, sp, #0x8C
        mov     r0, sp
        str     r10, [sp, #0x14]
        str     r11, [sp, #0x10]
        mov     r2, #0x10
        bl      __intel_memcpy
        ldr     r2, [sp, #0x64]
        ldr     r1, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        mov     r0, r4
        bl      ownpiResize
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LMXP1:
        mov     r0, r8
        mov     r2, #0xFF, 12
        orr     r3, r2, #3, 4
        str     r3, [sp, #0x58]
        mov     r1, r5
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        bgt     LMXP0
        ldr     r3, [sp, #0x58]
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        bgt     LMXP0
        mov     r2, #3
        str     r2, [sp, #0x34]
        str     r2, [sp, #0x30]
        add     r2, sp, #0x18
        add     r0, r2, #0
        mov     r2, #0
        str     r2, [sp, #0x3C]
        mov     r2, #1
        str     r2, [sp, #0x38]
        add     r1, sp, #0xA4
        str     r6, [sp, #0x2C]
        str     r7, [sp, #0x28]
        str     r5, [sp, #0x24]
        str     r8, [sp, #0x20]
        mov     r2, #8
        bl      __intel_memcpy
        add     r1, sp, #0x8C
        mov     r0, sp
        str     r10, [sp, #0x14]
        str     r11, [sp, #0x10]
        mov     r2, #0x10
        bl      __intel_memcpy
        ldr     r2, [sp, #0x64]
        ldr     r1, [sp, #0x60]
        ldr     r3, [sp, #0x5C]
        mov     r0, r4
        bl      ownpiDecimateSuper
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}


