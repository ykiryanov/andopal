        .text
        .align  4
        .globl  _ippsTriangleQ15_16s


_ippsTriangleQ15_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x54
        cmp     r0, #0
        str     r0, [sp]
        mov     r6, r1
        mov     r7, r2
        beq     LANN14
        cmp     r7, #0
        beq     LANN14
        cmp     r6, #0
        ble     LANN13
        ldr     r0, [r7]
        ldr     r3, [pc, #0x5D8]
        cmp     r3, r0
        beq     LANN0
        mvn     r0, #0x10
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LANN0:
        ldr     lr, [r7, #0x10]
        ldr     r12, [r7, #0x80]
        ldr     r4, [r7, #8]
        ldr     r5, [r7, #0xC]
        str     lr, [sp, #0x10]
        ldr     lr, [r7, #0x14]
        cmp     r12, #0
        str     lr, [sp, #0xC]
        ldr     lr, [r7, #0x18]
        str     lr, [sp, #8]
        ldr     lr, [r7, #0x1C]
        str     lr, [sp, #4]
        ldr     r11, [r7, #0x20]
        ldr     r10, [r7, #0x24]
        bne     LANN3
        ldr     r0, [pc, #0x588]
        ldr     r1, [pc, #0x588]
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        mov     r8, r0
        ldr     r0, [pc, #0x570]
        mov     r9, r1
        ldr     r1, [pc, #0x56C]
        mov     r3, r10
        mov     r2, r11
        bl      __subdf3
        ldr     r12, [pc, #0x55C]
        mov     r10, r0
        ldr     r0, [pc, #0x550]
        mov     r11, r1
        add     r1, r12, #2, 12
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x50]
        str     r1, [sp, #0x44]
        bl      __muldf3
        str     r1, [sp, #0x4C]
        ldr     r12, [sp, #0x4C]
        str     r0, [sp, #0x48]
        eor     r1, r12, #2, 2
        mov     r2, r8
        mov     r3, r9
        bl      __divdf3
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x48]
        str     r1, [sp, #0x10]
        ldr     r1, [sp, #0x4C]
        mov     r2, r10
        mov     r3, r11
        bl      __divdf3
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x1C]
        eor     r1, r11, #2, 2
        mov     r2, r8
        mov     r3, r9
        mov     r0, r10
        bl      __divdf3
        str     r0, [sp, #0x30]
        str     r1, [sp, #0x4C]
        eor     r1, r9, #2, 2
        mov     r2, r10
        mov     r3, r11
        mov     r0, r8
        bl      __divdf3
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x50]
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x44]
        mov     r2, r10
        mov     r3, r11
        bl      __divdf3
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x50]
        str     r1, [sp, #0x2C]
        ldr     r1, [sp, #0x44]
        mov     r2, r8
        mov     r3, r9
        bl      __divdf3
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x20]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x4C]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x34]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x3C]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x44]
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r2, r8
        mov     r3, r9
        bl      __ltdf2
        cmp     r0, #0
        bge     LANN1
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __divdf3
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __subdf3
        ldr     r11, [sp, #0x18]
        ldr     r10, [sp, #0x10]
        b       LANN2
LANN1:
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __divdf3
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #2, 2
        mov     r2, #0
        bl      __adddf3
        ldr     r11, [sp, #0x1C]
        ldr     r10, [sp, #0xC]
LANN2:
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        mov     r9, r0
        mov     r8, r1
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        movle   r12, #0
        movgt   r12, #1
        b       LANN4
LANN3:
        ldr     r12, [r7, #0x28]
        str     r12, [sp, #0x18]
        ldr     r12, [r7, #0x2C]
        str     r12, [sp, #0x10]
        ldr     r12, [r7, #0x30]
        str     r12, [sp, #0x1C]
        ldr     r12, [r7, #0x34]
        str     r12, [sp, #0xC]
        ldr     r12, [r7, #0x38]
        str     r12, [sp, #0x30]
        ldr     r12, [r7, #0x3C]
        str     r12, [sp, #0x4C]
        ldr     r12, [r7, #0x40]
        str     r12, [sp, #0x48]
        ldr     r12, [r7, #0x44]
        str     r12, [sp, #0x34]
        ldr     r12, [r7, #0x48]
        str     r12, [sp, #0x28]
        ldr     r12, [r7, #0x4C]
        str     r12, [sp, #0x2C]
        ldr     r12, [r7, #0x50]
        str     r12, [sp, #0x24]
        ldr     r12, [r7, #0x54]
        str     r12, [sp, #0x20]
        ldr     r12, [r7, #0x58]
        str     r12, [sp, #0x38]
        ldr     r12, [r7, #0x5C]
        str     r12, [sp, #0x3C]
        ldr     r12, [r7, #0x60]
        str     r12, [sp, #0x40]
        ldr     r12, [r7, #0x64]
        str     r12, [sp, #0x44]
        ldr     r11, [r7, #0x68]
        ldr     r10, [r7, #0x6C]
        ldr     r9, [r7, #0x70]
        ldr     r8, [r7, #0x74]
        ldr     r12, [r7, #0x78]
LANN4:
        cmp     r6, #0
        ble     LANN12
        str     r11, [sp, #0x50]
        ldr     r11, [sp]
        str     r12, [sp, #8]
        str     r10, [sp, #4]
        str     r7, [sp, #0x14]
LANN5:
        mov     r0, r9
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LANN6
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r1, r12, #1, 12
        mov     r0, #0
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        b       LANN7
LANN6:
        mov     r0, r9
        mov     r1, r8
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        mov     r2, #0
        bl      __subdf3
LANN7:
        bl      __fixdfsi
        strh    r0, [r11], #2
        ldr     r0, [sp, #0x50]
        ldr     r1, [sp, #4]
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        ldr     r12, [sp, #8]
        mov     r7, r0
        mov     r10, r1
        cmp     r12, #0
        mov     r9, r7
        mov     r8, r10
        beq     LANN9
        mov     r0, r7
        mov     r1, r10
        mov     r2, r4
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LANN11
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x4C]
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        ldr     r3, [sp, #0x3C]
        bl      __adddf3
        mov     r9, r0
        mov     r8, r1
        eor     r3, r5, #2, 2
        mov     r2, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LANN8
        mov     r0, r7
        mov     r1, r10
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x2C]
        bl      __subdf3
        mov     r9, r0
        mov     r8, r1
        b       LANN11
LANN8:
        ldr     r12, [sp, #0x18]
        str     r12, [sp, #0x50]
        ldr     r12, [sp, #0x10]
        str     r12, [sp, #4]
        mov     r12, #0
        str     r12, [sp, #8]
        b       LANN11
LANN9:
        eor     r3, r5, #2, 2
        mov     r0, r7
        mov     r1, r10
        mov     r2, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LANN11
        ldr     r0, [sp, #0x48]
        ldr     r1, [sp, #0x34]
        mov     r2, r7
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        bl      __adddf3
        mov     r9, r0
        mov     r8, r1
        mov     r2, r4
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        ble     LANN10
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        mov     r2, r7
        mov     r3, r10
        bl      __adddf3
        mov     r9, r0
        mov     r8, r1
        b       LANN11
LANN10:
        ldr     r12, [sp, #0x1C]
        str     r12, [sp, #0x50]
        ldr     r12, [sp, #0xC]
        str     r12, [sp, #4]
        mov     r12, #1
        str     r12, [sp, #8]
LANN11:
        subs    r6, r6, #1
        bne     LANN5
        ldr     r12, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r11, [sp, #0x50]
        ldr     r7, [sp, #0x14]
LANN12:
        ldr     r4, [sp, #0x18]
        mov     lr, #1
        mov     r0, #0
        str     r4, [r7, #0x28]
        ldr     r4, [sp, #0x10]
        str     r4, [r7, #0x2C]
        ldr     r4, [sp, #0x1C]
        str     r4, [r7, #0x30]
        ldr     r4, [sp, #0xC]
        str     r4, [r7, #0x34]
        ldr     r4, [sp, #0x30]
        str     r4, [r7, #0x38]
        ldr     r4, [sp, #0x4C]
        str     r4, [r7, #0x3C]
        ldr     r4, [sp, #0x48]
        str     r4, [r7, #0x40]
        ldr     r4, [sp, #0x34]
        str     r4, [r7, #0x44]
        ldr     r4, [sp, #0x28]
        str     r4, [r7, #0x48]
        ldr     r4, [sp, #0x2C]
        str     r4, [r7, #0x4C]
        ldr     r4, [sp, #0x24]
        str     r4, [r7, #0x50]
        ldr     r4, [sp, #0x20]
        str     r4, [r7, #0x54]
        ldr     r4, [sp, #0x38]
        str     r4, [r7, #0x58]
        ldr     r4, [sp, #0x3C]
        str     r4, [r7, #0x5C]
        ldr     r4, [sp, #0x40]
        str     r4, [r7, #0x60]
        ldr     r4, [sp, #0x44]
        str     r11, [r7, #0x68]
        str     r10, [r7, #0x6C]
        str     r4, [r7, #0x64]
        str     r9, [r7, #0x70]
        str     r8, [r7, #0x74]
        str     r12, [r7, #0x78]
        str     lr, [r7, #0x80]
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LANN13:
        mvn     r0, #5
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
LANN14:
        mvn     r0, #7
        add     sp, sp, #0x54
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d4149
        .long   0x54442d18
        .long   0x400921fb


