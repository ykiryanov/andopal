        .text
        .align  4
        .globl  _ippiResizeYUV422_8u_C2R


_ippiResizeYUV422_8u_C2R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x68
        ldr     lr, [sp, #0xA0]
        str     r1, [sp, #0x60]
        ldr     r12, [sp, #0xB4]
        str     lr, [sp, #0x4C]
        str     r2, [sp, #0x64]
        ldr     r7, [sp, #0x9C]
        ldr     r5, [sp, #0xAC]
        ldr     r4, [sp, #0xB0]
        str     r12, [sp, #0x44]
        ldr     r12, [sp, #0xB8]
        ldr     r9, [sp, #0xBC]
        cmp     r0, #0
        str     r12, [sp, #0x40]
        str     r0, [sp, #0x3C]
        str     r3, [sp, #0x48]
        beq     LNAC14
        cmp     r7, #0
        beq     LNAC14
        ldr     r11, [sp, #0x60]
        cmp     r11, #0
        ble     LNAC13
        ldr     r10, [sp, #0x64]
        cmp     r10, #0
        ble     LNAC13
        ldr     r8, [sp, #0x8C]
        cmp     r8, #0
        blt     LNAC13
        ldr     r6, [sp, #0x90]
        cmp     r6, #0
        blt     LNAC13
        ldr     r12, [sp, #0x94]
        cmp     r12, #0
        str     r12, [sp, #0x50]
        ble     LNAC13
        ldr     r12, [sp, #0x98]
        cmp     r12, #0
        str     r12, [sp, #0x38]
        ble     LNAC13
        cmp     r11, r8
        ble     LNAC12
        cmp     r10, r6
        ble     LNAC12
        ldr     r12, [sp, #0xA4]
        cmp     r12, #0
        str     r12, [sp, #0x54]
        ble     LNAC13
        ldr     r12, [sp, #0xA8]
        cmp     r12, #0
        str     r12, [sp, #0x58]
        ble     LNAC13
        tst     r11, #1
        bne     LNAC13
        ldr     r12, [sp, #0x50]
        tst     r12, #1
        bne     LNAC13
        tst     r8, #1
        bne     LNAC13
        ldr     r12, [sp, #0x54]
        cmp     r12, #2
        blt     LNAC13
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        ble     LNAC11
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x40]
        mov     r2, #0
        mov     r3, #0
        bl      __ledf2
        cmp     r0, #0
        ble     LNAC11
        cmp     r9, #1
        beq     LNAC0
        cmp     r9, #2
        beq     LNAC0
        cmp     r9, #4
        beq     LNAC0
        cmp     r9, #8
        beq     LNAC0
        mvn     r0, #0x15
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LNAC0:
        ldr     r12, [sp, #0x3C]
        ldr     lr, [sp, #0x48]
        add     r12, r12, r8, lsl #2
        mla     r12, r6, lr, r12
        str     r12, [sp, #0x5C]
        ldr     r12, [sp, #0x50]
        add     r12, r8, r12
        cmp     r12, r11
        ble     LNAC1
        sub     r11, r11, r8
        str     r11, [sp, #0x50]
        str     r11, [sp, #0x94]
LNAC1:
        ldr     r12, [sp, #0x38]
        add     r12, r6, r12
        cmp     r12, r10
        ble     LNAC2
        sub     r10, r10, r6
        str     r10, [sp, #0x38]
        str     r10, [sp, #0x98]
LNAC2:
        ldr     r0, [sp, #0x50]
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x2BC]
        ldr     r3, [pc, #0x2BC]
        bl      __adddf3
        mov     r8, r0
        mov     r6, r1
        bl      __fixdfsi
        ldr     r12, [sp, #0x54]
        mov     r1, r0
        cmp     r1, r12
        ldrge   r1, [sp, #0x54]
        bge     LNAC4
        cmp     r1, #2
        bge     LNAC4
        mov     r0, r8
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        add     r3, r12, #2, 14
        mov     r1, r6
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        movge   r1, #2
        bge     LNAC4
LNAC3:
        mvn     r0, #0xC8
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LNAC4:
        ldr     r0, [sp, #0x38]
        mov     r8, r1, asr #1
        bl      __floatsidf
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        bl      __muldf3
        ldr     r2, [pc, #0x23C]
        ldr     r3, [pc, #0x23C]
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
        bl      __fixdfsi
        ldr     r12, [sp, #0x58]
        mov     r6, r0
        cmp     r6, r12
        ldrge   r6, [sp, #0x58]
        bge     LNAC5
        cmp     r6, #1
        bge     LNAC5
        mov     r0, r11
        mov     r1, r10
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        movge   r6, #1
        blt     LNAC3
LNAC5:
        cmp     r9, #8
        beq     LNAC6
        str     r9, [sp, #0x30]
        ldr     r12, [sp, #0x40]
        add     r1, sp, #0x8C
        str     r12, [sp, #0x2C]
        ldr     r12, [sp, #0x44]
        str     r4, [sp, #0x24]
        str     r5, [sp, #0x20]
        str     r12, [sp, #0x28]
        str     r6, [sp, #0x1C]
        str     r8, [sp, #0x18]
        ldr     r0, [sp, #0x4C]
        str     r7, [sp, #0x10]
        mov     r2, #0x10
        str     r0, [sp, #0x14]
        mov     r0, sp
        bl      __intel_memcpy
        ldr     r2, [sp, #0x64]
        ldr     r1, [sp, #0x60]
        ldr     r0, [sp, #0x5C]
        ldr     r3, [sp, #0x48]
        bl      ownpiResizeYUY2
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LNAC6:
        mov     r0, r5
        mov     r12, #0xFF, 12
        orr     r3, r12, #3, 4
        mov     r1, r4
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LNAC11
        ldr     r0, [sp, #0x44]
        ldr     r1, [sp, #0x40]
        mov     r12, #0xFF, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LNAC11
        mov     r12, #0xFF, 12
        orr     r10, r12, #3, 4
        mov     r2, r5
        mov     r3, r4
        mov     r0, #0
        mov     r1, r10
        bl      __divdf3
        ldr     r11, [sp, #0x40]
        ldr     r2, [sp, #0x44]
        str     r0, [sp, #0x38]
        mov     r9, r1
        str     r9, [sp, #0x3C]
        mov     r3, r11
        mov     r0, #0
        mov     r1, r10
        bl      __divdf3
        ldr     r2, [sp, #0x44]
        str     r0, [sp, #0x58]
        str     r1, [sp, #0x54]
        mov     r0, r5
        mov     r1, r4
        mov     r3, r11
        bl      __muldf3
        mov     r5, r0
        add     r0, r8, #1
        mov     r4, r1
        bl      __floatsisf
        bl      __extendsfdf2
        ldr     r2, [sp, #0x38]
        mov     r3, r9
        bl      __muldf3
        bl      __fixdfsi
        ldr     r3, [sp, #0x50]
        add     r2, r0, #1
        cmp     r2, r3
        ble     LNAC10
        ldr     r3, [sp, #0x50]
        sub     r3, r2, r3
        cmp     r3, #6
        blt     LNAC8
        ldr     r3, [sp, #0x50]
        add     r3, r3, #6
LNAC7:
        sub     r2, r2, #5
        cmp     r2, r3
        bgt     LNAC7
LNAC8:
        ldr     r3, [sp, #0x50]
LNAC9:
        sub     r2, r2, #1
        cmp     r2, r3
        bgt     LNAC9
LNAC10:
        str     r4, [sp, #0x20]
        str     r5, [sp, #0x1C]
        ldr     r3, [sp, #0x54]
        mov     r1, r7
        str     r3, [sp, #0x18]
        ldr     r3, [sp, #0x58]
        str     r3, [sp, #0x14]
        ldr     r3, [sp, #0x3C]
        str     r3, [sp, #0x10]
        ldr     r3, [sp, #0x38]
        str     r2, [sp]
        str     r6, [sp, #8]
        str     r3, [sp, #0xC]
        str     r8, [sp, #4]
        ldr     r0, [sp, #0x5C]
        ldr     r3, [sp, #0x4C]
        ldr     r2, [sp, #0x48]
        bl      ownpiDecimateYUY2super
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LNAC11:
        mvn     r0, #0x16
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LNAC12:
        mov     r0, #0x1D
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LNAC13:
        mvn     r0, #5
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
LNAC14:
        mvn     r0, #7
        add     sp, sp, #0x68
        ldmia   sp!, {r4 - r11, pc}
        .long   0x9abcaf48
        .long   0x3e7ad7f2


