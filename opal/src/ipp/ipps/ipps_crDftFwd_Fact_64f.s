        .text
        .align  4
        .globl  _ipps_crDftFwd_Fact_64f


_ipps_crDftFwd_Fact_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x9C
        ldr     r12, [sp, #0xC0]
        ldr     r6, [sp, #0xC4]
        ldr     lr, [sp, #0xC8]
        ldr     r5, [sp, #0xCC]
        add     r4, r3, #1
        cmp     r12, #0
        mov     r7, r4, asr #1
        ble     LCOM9
        rsb     r4, r12, #0
        mla     r8, r3, r12, r4
        add     r10, r5, #0x10
        sub     r9, r3, #1
        mov     r4, #0
        str     r9, [sp, #0x68]
        str     r10, [sp, #0x64]
        str     r8, [sp, #0x60]
        str     r7, [sp, #0x5C]
        str     r5, [sp, #0x58]
        str     r6, [sp, #0x54]
        str     r3, [sp, #0x50]
LCOM0:
        ldr     r9, [r0, #8]
        ldr     r6, [r0]
        ldr     r5, [r0, #4]
        str     r9, [sp, #0x7C]
        ldr     r3, [r0, #0xC]
        add     r7, r0, r12, lsl #4
        str     r7, [sp, #0x38]
        ldr     r7, [sp, #0x60]
        cmp     r4, #0
        add     r8, r0, r7, lsl #4
        str     r8, [sp, #0x3C]
        add     r8, r1, r12, lsl #3
        str     r8, [sp, #0x6C]
        add     r8, r2, r12, lsl #3
        str     r8, [sp, #0x70]
        add     r8, r1, r7, lsl #3
        add     r7, r2, r7, lsl #3
        str     r8, [sp, #0x74]
        str     r7, [sp, #0x78]
        mov     r8, r6
        mov     r7, r5
        mov     r10, r3
        bne     LCOM2
        ldr     r11, [sp, #0x5C]
        cmp     r11, #1
        ble     LCOM10
        ldr     r11, [sp, #0x58]
        str     r10, [sp, #0x10]
        str     r9, [sp, #0xC]
        sub     r11, r11, #4
        str     r11, [sp, #0x40]
        ldr     r11, [sp, #0x58]
        ldr     r10, [sp, #0x40]
        str     r7, [sp, #4]
        sub     r11, r11, #0x14
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x5C]
        ldr     r9, [sp, #0x44]
        str     r8, [sp, #8]
        sub     r11, r11, #1
        str     r11, [sp]
        ldr     r8, [sp, #0x3C]
        ldr     r11, [sp, #0x38]
        str     r3, [sp, #0x1C]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r4, [sp, #0x28]
        str     lr, [sp, #0x18]
        str     r12, [sp, #0x14]
        str     r2, [sp, #0x2C]
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x34]
LCOM1:
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        ldr     r0, [r11]
        ldr     r1, [r11, #4]
        bl      __adddf3
        ldr     r2, [r11, #8]
        ldr     r3, [r8, #0xC]
        ldr     r4, [r11, #0xC]
        ldr     r5, [r8, #8]
        mov     r6, r0
        mov     r0, r2
        mov     r7, r1
        mov     r2, r5
        mov     r1, r4
        bl      __adddf3
        mov     r5, r0
        ldr     r0, [sp, #8]
        mov     r4, r1
        ldr     r1, [sp, #4]
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #8]
        ldr     r0, [sp, #0xC]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x10]
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r5, [r9, #0x1C]
        str     r4, [r9, #0x20]
        str     r6, [r9, #0x14]
        str     r7, [r9, #0x18]
        ldr     r2, [r11]
        ldr     r3, [r8, #4]
        ldr     r4, [r11, #4]
        ldr     r5, [r8]
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        mov     r0, r2
        mov     r1, r4
        mov     r2, r5
        bl      __subdf3
        str     r0, [r10, #0x14]
        str     r1, [r10, #0x18]
        ldr     r0, [r11, #8]
        ldr     r1, [r11, #0xC]
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        bl      __subdf3
        str     r0, [r10, #0x1C]
        str     r1, [r10, #0x20]!
        ldr     r0, [sp]
        add     r9, r9, #0x20
        subs    r0, r0, #1
        str     r0, [sp]
        ldr     r0, [sp, #0x14]
        add     r11, r11, r0, lsl #4
        sub     r8, r8, r0, lsl #4
        ldr     r0, [sp]
        bne     LCOM1
        ldr     r11, [sp, #0x50]
        ldr     lr, [sp, #0x18]
        ldr     r10, [sp, #0x10]
        ldr     r9, [sp, #0xC]
        ldr     r7, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r3, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldr     r4, [sp, #0x28]
        ldr     r12, [sp, #0x14]
        ldr     r2, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        add     r11, lr, r11, lsl #4
        str     r11, [sp]
        b       LCOM4
LCOM2:
        ldr     r11, [sp, #0x5C]
        cmp     r11, #1
        ble     LCOM12
        mov     r11, #1
        str     r11, [sp, #0x44]
        ldr     r11, [sp, #0x50]
        str     r10, [sp, #0x10]
        str     r9, [sp, #0xC]
        add     r11, lr, r11, lsl #4
        str     r11, [sp]
        ldr     r11, [sp, #0x58]
        str     r7, [sp, #4]
        str     r8, [sp, #8]
        sub     r11, r11, #4
        str     r11, [sp, #0x48]
        ldr     r11, [sp, #0x58]
        str     r4, [sp, #0x28]
        ldr     r4, [sp, #0x44]
        sub     r11, r11, #0x14
        str     r11, [sp, #0x4C]
        add     r11, lr, #4
        str     r11, [sp, #0x40]
        str     r3, [sp, #0x1C]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     lr, [sp, #0x18]
        str     r12, [sp, #0x14]
        str     r2, [sp, #0x2C]
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x34]
LCOM3:
        ldr     r1, [sp, #0x38]
        ldr     r2, [sp, #0x18]
        ldr     r12, [sp, #0x40]
        ldr     r11, [r1]
        ldr     r7, [r1, #4]
        ldr     r2, [r2, +r4, lsl #4]
        mov     r0, r11
        mov     r1, r7
        str     r2, [sp, #0x80]
        ldr     r10, [r12, #0x14]
        ldr     r6, [r12, #0x18]
        ldr     r9, [r12, #0x10]
        ldr     r12, [sp, #0x38]
        ldr     r2, [sp, #0x80]
        mov     r3, r9
        ldr     r8, [r12, #8]
        ldr     r5, [r12, #0xC]
        bl      __muldf3
        str     r0, [sp, #0x84]
        str     r1, [sp, #0x88]
        mov     r2, r10
        mov     r0, r8
        mov     r1, r5
        mov     r3, r6
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x88]
        mov     r2, r0
        ldr     r0, [sp, #0x84]
        bl      __subdf3
        ldr     r2, [sp, #0x80]
        str     r0, [sp, #0x88]
        str     r1, [sp, #0x84]
        mov     r0, r8
        mov     r1, r5
        mov     r3, r9
        bl      __muldf3
        mov     r5, r0
        mov     r8, r1
        mov     r1, r7
        mov     r3, r6
        mov     r2, r10
        mov     r0, r11
        bl      __muldf3
        mov     r3, r8
        rsb     r11, r4, #0
        mov     r2, r5
        bl      __adddf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [r2, #8]
        add     r4, r4, #1
        str     r3, [sp, #0x80]
        ldr     r10, [r2]
        ldr     r9, [r2, #0xC]
        ldr     r6, [r2, #4]
        ldr     r2, [sp]
        ldr     r3, [sp]
        ldr     r7, [r2, +r11, lsl #4]
        str     r0, [sp, #0x8C]
        str     r1, [sp, #0x90]
        add     r12, r3, r11, lsl #4
        ldr     r11, [r12, #4]
        ldr     r8, [r12, #8]
        ldr     r5, [r12, #0xC]
        mov     r1, r6
        mov     r3, r11
        mov     r0, r10
        mov     r2, r7
        bl      __muldf3
        str     r0, [sp, #0x94]
        ldr     r0, [sp, #0x80]
        str     r1, [sp, #0x98]
        mov     r2, r8
        mov     r1, r9
        mov     r3, r5
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x98]
        mov     r2, r0
        ldr     r0, [sp, #0x94]
        bl      __subdf3
        str     r0, [sp, #0x98]
        ldr     r0, [sp, #0x80]
        str     r1, [sp, #0x94]
        mov     r1, r9
        mov     r3, r11
        mov     r2, r7
        bl      __muldf3
        mov     r7, r0
        mov     r9, r1
        mov     r3, r5
        mov     r1, r6
        mov     r2, r8
        mov     r0, r10
        bl      __muldf3
        mov     r3, r9
        mov     r2, r7
        bl      __adddf3
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x94]
        mov     r5, r0
        ldr     r0, [sp, #0x88]
        mov     r6, r1
        ldr     r1, [sp, #0x84]
        bl      __adddf3
        mov     r10, r0
        ldr     r0, [sp, #0x8C]
        mov     r7, r1
        ldr     r1, [sp, #0x90]
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r9, r0
        mov     r8, r1
        ldr     r0, [sp, #8]
        ldr     r1, [sp, #4]
        mov     r2, r10
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #8]
        ldr     r0, [sp, #0xC]
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x10]
        mov     r2, r9
        mov     r3, r8
        bl      __adddf3
        ldr     r12, [sp, #0x4C]
        str     r0, [sp, #0xC]
        str     r1, [sp, #0x10]
        str     r10, [r12, #0x14]
        str     r7, [r12, #0x18]
        str     r9, [r12, #0x1C]
        str     r8, [r12, #0x20]
        ldr     r0, [sp, #0x88]
        ldr     r1, [sp, #0x84]
        ldr     r2, [sp, #0x98]
        ldr     r3, [sp, #0x94]
        bl      __subdf3
        ldr     r12, [sp, #0x48]
        mov     r2, r5
        str     r0, [r12, #0x14]
        str     r1, [r12, #0x18]
        ldr     r0, [sp, #0x8C]
        ldr     r1, [sp, #0x90]
        mov     r3, r6
        bl      __subdf3
        ldr     r2, [sp, #0x48]
        str     r0, [r2, #0x1C]
        str     r1, [r2, #0x20]
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x38]
        cmp     r4, r0
        ldr     r0, [sp, #0x14]
        add     r1, r1, r0, lsl #4
        str     r1, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        sub     r1, r1, r0, lsl #4
        ldr     r0, [sp, #0x48]
        str     r1, [sp, #0x3C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x4C]
        add     r0, r0, #0x20
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x10
        str     r0, [sp, #0x40]
        blt     LCOM3
        ldr     r10, [sp, #0x10]
        ldr     r9, [sp, #0xC]
        ldr     r7, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r3, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r6, [sp, #0x24]
        ldr     r4, [sp, #0x28]
        ldr     r12, [sp, #0x14]
        ldr     r2, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x34]
LCOM4:
        str     r8, [r1]
        str     r7, [r1, #4]
        ldr     lr, [sp, #0x5C]
        str     r9, [r2]
        str     r10, [r2, #4]
        cmp     lr, #1
        ble     LCOM8
        mov     r11, #1
        str     r3, [sp, #0x1C]
        str     r5, [sp, #0x20]
        str     r6, [sp, #0x24]
        str     r4, [sp, #0x28]
        str     r12, [sp, #0x14]
        str     r2, [sp, #0x2C]
        str     r1, [sp, #0x30]
        str     r0, [sp, #0x34]
LCOM5:
        ldr     r0, [sp, #0x68]
        cmp     r0, #0
        ldr     r0, [sp, #0x24]
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0x7C]
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x1C]
        str     r0, [sp, #0x3C]
        mov     r0, r11
        ble     LCOM11
        mov     r10, #0
        mov     r6, r10
        mov     r7, r6
        ldr     r8, [sp, #0x64]
        ldr     r9, [sp, #0x58]
        mov     r5, r7
        str     r6, [sp, #0xC]
        ldr     r6, [sp, #0x50]
        mov     r4, r5
        str     r4, [sp, #0x48]
        str     r5, [sp, #0x44]
        str     r7, [sp, #0x38]
        str     r11, [sp, #0x4C]
        mov     r4, r0
LCOM6:
        ldr     r3, [sp, #0x54]
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        ldr     r11, [r3, +r4, lsl #4]
        add     r5, r3, r4, lsl #4
        ldr     r7, [r5, #4]
        mov     r2, r11
        mov     r3, r7
        bl      __muldf3
        ldr     r3, [sp, #0x10]
        ldr     r2, [sp, #0x18]
        bl      __adddf3
        ldr     r2, [r9, #8]
        ldr     r3, [r9, #0xC]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x10]
        mov     r0, r2
        mov     r1, r3
        mov     r3, r7
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x3C]
        bl      __adddf3
        ldr     r7, [r5, #8]
        ldr     r2, [r8, #8]
        ldr     r3, [r8, #0xC]
        ldr     r5, [r5, #0xC]
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x3C]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r7
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x48]
        bl      __adddf3
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x48]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r7
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x38]
        bl      __adddf3
        ldr     r2, [sp, #0x4C]
        str     r0, [sp, #0xC]
        add     r4, r2, r4
        cmp     r4, r6
        str     r1, [sp, #0x38]
        subge   r4, r4, r6
        ldr     r1, [sp, #0x68]
        add     r10, r10, #2
        add     r8, r8, #0x20
        cmp     r10, r1
        add     r9, r9, #0x20
        blt     LCOM6
        ldr     r4, [sp, #0x48]
        ldr     r5, [sp, #0x44]
        ldr     r7, [sp, #0x38]
        ldr     r6, [sp, #0xC]
        ldr     r11, [sp, #0x4C]
LCOM7:
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x10]
        mov     r3, r4
        mov     r0, r9
        mov     r2, r5
        mov     r1, r10
        bl      __subdf3
        ldr     r8, [sp, #0x6C]
        mov     r2, r6
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x3C]
        mov     r3, r7
        add     r11, r11, #1
        bl      __adddf3
        ldr     r12, [sp, #0x70]
        mov     r2, r5
        str     r0, [r12]
        str     r1, [r12, #4]
        mov     r3, r4
        mov     r0, r9
        mov     r1, r10
        bl      __adddf3
        ldr     r4, [sp, #0x74]
        str     r0, [r4]
        str     r1, [r4, #4]
        ldr     r0, [sp, #0x40]
        ldr     r1, [sp, #0x3C]
        mov     r2, r6
        mov     r3, r7
        bl      __subdf3
        ldr     r2, [sp, #0x78]
        str     r0, [r2]
        str     r1, [r2, #4]
        ldr     r0, [sp, #0x5C]
        ldr     r1, [sp, #0x70]
        cmp     r11, r0
        ldr     r0, [sp, #0x14]
        add     r8, r8, r0, lsl #3
        str     r8, [sp, #0x6C]
        add     r1, r1, r0, lsl #3
        sub     r4, r4, r0, lsl #3
        sub     r2, r2, r0, lsl #3
        str     r1, [sp, #0x70]
        str     r4, [sp, #0x74]
        str     r2, [sp, #0x78]
        blt     LCOM5
        ldr     r4, [sp, #0x28]
        ldr     r12, [sp, #0x14]
        ldr     r2, [sp, #0x2C]
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x34]
LCOM8:
        ldr     lr, [sp]
        add     r4, r4, #1
        cmp     r4, r12
        add     r0, r0, #0x10
        add     r1, r1, #8
        add     r2, r2, #8
        blt     LCOM0
LCOM9:
        add     sp, sp, #0x9C
        ldmia   sp!, {r4 - r11, pc}
LCOM10:
        ldr     r11, [sp, #0x50]
        add     r11, lr, r11, lsl #4
        str     r11, [sp]
        b       LCOM4
LCOM11:
        mov     r4, #0
        mov     r6, r4
        mov     r7, r6
        mov     r5, r7
        b       LCOM7
LCOM12:
        ldr     r11, [sp, #0x50]
        add     r11, lr, r11, lsl #4
        str     r11, [sp]
        b       LCOM4


