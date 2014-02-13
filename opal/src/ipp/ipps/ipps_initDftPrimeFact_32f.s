        .text
        .align  4
        .globl  _ipps_initDftPrimeFact_32f


_ipps_initDftPrimeFact_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        mov     r4, r1
        cmp     r4, #0x7D, 28
        mov     r5, r0
        mov     r6, r2
        mov     r10, r3
        mov     r8, #0
        strle   r8, [r5, #0x20]
        ldr     r7, [r5, #0x50]
        mov     r11, #1
        mov     r0, r4
        cmp     r7, #0
        blt     LCJN1
        mov     r1, r11
        mov     r9, r8
        str     r8, [sp, #0x38]
        add     r7, r5, #0x48
        mov     r8, r1
LCJN0:
        ldr     r1, [r7, #0x10]
        str     r8, [r7, #0x18]
        add     r9, r9, #1
        mul     r8, r1, r8
        bl      __intel_idiv
        str     r0, [r7, #0x14]
        ldr     r1, [r5, #0x50]
        add     r7, r7, #0x18
        cmp     r9, r1
        ble     LCJN0
        mov     r7, r1
        ldr     r8, [sp, #0x38]
LCJN1:
        mov     r0, r10
        mov     r1, r4
        bl      __intel_idiv
        cmp     r7, #0
        mov     r7, r0
        movlt   r10, r8
        movlt   r9, r10
        blt     LCJN25
        mov     lr, r8
        mov     r12, r11
        mov     r9, lr
        mov     r0, r9
        str     r4, [sp, #0x2C]
        str     r9, [sp, #0x30]
        str     r12, [sp, #0x44]
        str     lr, [sp, #0x48]
        str     r7, [sp, #0xC]
        str     r10, [sp, #0x4C]
        str     r6, [sp, #0x10]
        str     r8, [sp, #0x38]
        mov     r4, r0
LCJN2:
        mov     r10, r11
        str     r11, [sp, #0x24]
LCJN3:
        rsb     r8, r4, r4, lsl #2
        add     r1, r5, r8, lsl #3
        ldr     r6, [r1, #0x58]
        ldr     r7, [r1, #0x5C]
        mul     r11, r6, r7
        cmp     r11, #0x7D, 28
        movgt   r9, #0
        movle   r9, #1
        add     r1, r5, r8, lsl #3
        cmp     r6, #5
        str     r10, [r1, #0x64]
        ble     LCJN5
        ldr     r1, [sp, #0x44]
        cmp     r6, r1
        beq     LCJN4
        mov     r0, r6
        ldr     r2, [sp, #0x4C]
        ldr     r1, [sp, #0x10]
        bl      _ipps_createTabDftDir_32f
        cmp     r0, #0
        str     r0, [sp, #0x48]
        strne   r6, [sp, #0x44]
        beq     LCJN80
LCJN4:
        ldr     r1, [sp, #0x30]
        ldr     r3, [sp, #0x48]
        add     r2, r5, r8, lsl #3
        cmp     r6, r1
        movgt   r1, r6
        str     r3, [r2, #0x68]
        str     r1, [sp, #0x30]
LCJN5:
        ldr     r1, [r5, #0x50]
        cmp     r4, r1
        bne     LCJN7
        cmp     r7, #5
        ble     LCJN7
        ldr     r1, [sp, #0x44]
        cmp     r7, r1
        beq     LCJN6
        mov     r0, r7
        ldr     r2, [sp, #0x4C]
        ldr     r1, [sp, #0x10]
        bl      _ipps_createTabDftDir_32f
        cmp     r0, #0
        str     r0, [sp, #0x48]
        beq     LCJN81
LCJN6:
        ldr     r1, [sp, #0x30]
        ldr     r3, [sp, #0x48]
        add     r2, r5, r8, lsl #3
        cmp     r7, r1
        movgt   r1, r7
        str     r3, [r2, #0x80]
        str     r1, [sp, #0x30]
LCJN7:
        mov     r0, r11, lsl #3
        bl      _ippsMalloc_8u
        cmp     r0, #0
        beq     LCJN82
        add     r1, r5, r8, lsl #3
        ldr     r1, [r1, #0x60]
        ldr     r3, [sp, #0xC]
        ldr     r2, [r5, #0x20]
        mul     r1, r3, r1
        cmp     r2, #0
        bne     LCJN17
        cmp     r6, #5
        bgt     LCJN12
        cmp     r7, #0
        ble     LCJN17
        mov     r2, #0
        str     r10, [sp, #0x3C]
        str     r4, [sp, #0x40]
        str     r5, [sp, #0x28]
LCJN8:
        cmp     r6, #1
        ble     LCJN20
        sub     r3, r6, #1
        cmp     r3, #5
        blt     LCJN19
        mul     r12, r2, r1
        rsb     r3, r2, #0
        mla     r11, r6, r2, r3
        sub     r10, r6, #5
        str     r6, [sp, #4]
        ldr     r6, [sp, #0x10]
        mov     r3, #1
        mov     r4, r12
        mov     lr, r12, lsl #2
        add     r5, r11, #1
        str     r11, [sp, #0x20]
        str     r10, [sp, #0x34]
        str     r2, [sp, #0x1C]
        str     r1, [sp, #0x18]
        str     r9, [sp, #0x14]
        str     r7, [sp, #8]
        str     r8, [sp]
LCJN9:
        ldr     r2, [r6, +r4, lsl #3]
        mov     r10, r5, lsl #3
        sub     r1, r10, #8
        str     r2, [r0, +r1]
        add     r2, r6, r4, lsl #3
        ldr     r2, [r2, #4]
        add     r7, r0, r1
        add     r1, r3, #1
        mul     r1, r12, r1
        str     r2, [r7, #4]
        add     r7, r0, r10
        add     r8, r10, #8
        ldr     r2, [r6, +r1, lsl #3]
        add     r11, r6, r1, lsl #3
        add     r1, r3, #2
        mul     r1, r12, r1
        str     r2, [r0, +r5, lsl #3]
        ldr     r2, [r11, #4]
        add     r9, r0, r8
        add     r10, r10, #0x10
        add     r11, r0, r10
        str     r2, [r7, #4]
        ldr     r2, [r6, +r1, lsl #3]
        add     r7, r6, r1, lsl #3
        add     r1, r3, #3
        str     r2, [r0, +r8]
        ldr     r7, [r7, #4]
        mul     r1, r12, r1
        add     r5, r5, #4
        str     r7, [r9, #4]
        ldr     r7, [sp, #0x34]
        add     r4, r4, lr
        ldr     r2, [r6, +r1, lsl #3]
        add     r1, r6, r1, lsl #3
        add     r3, r3, #4
        cmp     r3, r7
        str     r2, [r0, +r10]
        ldr     r1, [r1, #4]
        str     r1, [r11, #4]
        ble     LCJN9
        ldr     r11, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        ldr     r9, [sp, #0x14]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r8, [sp]
LCJN10:
        mul     r10, r3, r12
        ldr     r5, [sp, #0x10]
        add     lr, r3, r11
LCJN11:
        ldr     r11, [r5, +r10, lsl #3]
        mov     r4, lr, lsl #3
        sub     r4, r4, #8
        str     r11, [r0, +r4]
        add     r11, r5, r10, lsl #3
        ldr     r11, [r11, #4]
        add     r3, r3, #1
        add     r4, r0, r4
        cmp     r3, r6
        str     r11, [r4, #4]
        add     lr, lr, #1
        add     r10, r10, r12
        blt     LCJN11
        add     r2, r2, #1
        cmp     r2, r7
        str     r5, [sp, #0x10]
        blt     LCJN8
        b       LCJN18
LCJN12:
        cmp     r7, #0
        ble     LCJN17
        mov     r2, #0
        str     r10, [sp, #0x3C]
        str     r4, [sp, #0x40]
        str     r5, [sp, #0x28]
LCJN13:
        cmp     r6, #0
        ble     LCJN23
        cmp     r6, #5
        blt     LCJN22
        mul     r11, r6, r2
        mul     r12, r2, r1
        sub     r5, r6, #5
        str     r6, [sp, #4]
        ldr     r6, [sp, #0x10]
        mov     r10, #0
        mov     r3, r10
        mov     r4, r11
        mov     lr, r12, lsl #2
        str     r2, [sp, #0x34]
        str     r1, [sp, #0x18]
        str     r9, [sp, #0x14]
        str     r7, [sp, #8]
        str     r8, [sp]
LCJN14:
        ldr     r2, [r6, +r10, lsl #3]
        add     r7, r6, r10, lsl #3
        add     r1, r3, #1
        str     r2, [r0, +r4, lsl #3]
        ldr     r2, [r7, #4]
        mul     r1, r12, r1
        add     r7, r0, r4, lsl #3
        str     r2, [r7, #4]
        mov     r2, r4, lsl #3
        add     r8, r2, #8
        ldr     r7, [r6, +r1, lsl #3]
        add     r9, r6, r1, lsl #3
        add     r1, r3, #2
        mul     r1, r12, r1
        str     r7, [r0, +r8]
        ldr     r9, [r9, #4]
        add     r8, r0, r8
        add     r7, r2, #0x10
        add     r2, r2, #0x18
        str     r9, [r8, #4]
        ldr     r8, [r6, +r1, lsl #3]
        add     r1, r6, r1, lsl #3
        add     r9, r3, #3
        str     r8, [r0, +r7]
        ldr     r1, [r1, #4]
        mul     r8, r12, r9
        add     r7, r0, r7
        str     r1, [r7, #4]
        add     r1, r0, r2
        add     r4, r4, #4
        ldr     r7, [r6, +r8, lsl #3]
        add     r8, r6, r8, lsl #3
        add     r10, r10, lr
        add     r3, r3, #4
        str     r7, [r0, +r2]
        ldr     r8, [r8, #4]
        cmp     r3, r5
        str     r8, [r1, #4]
        ble     LCJN14
        ldr     r2, [sp, #0x34]
        ldr     r1, [sp, #0x18]
        ldr     r9, [sp, #0x14]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r8, [sp]
LCJN15:
        mul     lr, r3, r12
        ldr     r5, [sp, #0x10]
        add     r11, r3, r11
        str     r8, [sp]
LCJN16:
        ldr     r8, [r5, +lr, lsl #3]
        add     r10, r5, lr, lsl #3
        add     r4, r0, r11, lsl #3
        str     r8, [r0, +r11, lsl #3]
        ldr     r10, [r10, #4]
        add     r3, r3, #1
        cmp     r3, r6
        str     r10, [r4, #4]
        add     r11, r11, #1
        add     lr, lr, r12
        blt     LCJN16
        ldr     r8, [sp]
        add     r2, r2, #1
        cmp     r2, r7
        str     r5, [sp, #0x10]
        blt     LCJN13
        b       LCJN21
LCJN17:
        add     r8, r5, r8, lsl #3
        str     r0, [r8, #0x6C]
        ldr     r1, [r5, #0x50]
        add     r4, r4, #1
        cmp     r4, r1
        bgt     LCJN24
        cmp     r9, #0
        mulne   r10, r6, r10
        bne     LCJN3
        ldr     r11, [sp, #0x24]
        b       LCJN2
LCJN18:
        ldr     r10, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x28]
        b       LCJN17
LCJN19:
        mul     r12, r2, r1
        rsb     r3, r2, #0
        mla     r11, r6, r2, r3
        mov     r3, #1
        b       LCJN10
LCJN20:
        add     r2, r2, #1
        cmp     r2, r7
        blt     LCJN8
        ldr     r10, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x28]
        b       LCJN17
LCJN21:
        ldr     r10, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x28]
        b       LCJN17
LCJN22:
        mul     r11, r6, r2
        mul     r12, r2, r1
        mov     r3, #0
        b       LCJN15
LCJN23:
        add     r2, r2, #1
        cmp     r2, r7
        blt     LCJN13
        ldr     r10, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x28]
        b       LCJN17
LCJN24:
        ldr     r11, [sp, #0x24]
        ldr     r9, [sp, #0x30]
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #0x10]
        ldr     r4, [sp, #0x2C]
        ldr     r8, [sp, #0x38]
LCJN25:
        ldr     r3, [r5, #0x20]
        add     r12, r4, r9
        mov     r12, r12, lsl #3
        add     r12, r12, #0x40
        cmp     r3, #0
        str     r12, [r5, #0x18]
        beq     LCJN39
        mov     r11, r4, lsl #2
        mov     r0, r11
        bl      _ippsMalloc_8u
        mov     r10, r0
        cmp     r10, #0
        beq     LCJN83
        str     r10, [r5, #0x54]
        mov     r0, r11
        bl      _ippsMalloc_8u
        cmp     r0, #0
        beq     LCJN83
        ldr     r3, [r5, #0x50]
        rsb     r12, r3, r3, lsl #2
        add     r12, r5, r12, lsl #3
        ldr     r12, [r12, #0x5C]
        cmp     r12, #0
        ble     LCJN28
        cmp     r12, #6
        blt     LCJN27
        sub     r3, r12, #6
LCJN26:
        str     r8, [r10, +r8, lsl #2]
        add     lr, r8, #1
        str     lr, [r10, +lr, lsl #2]
        add     lr, r8, #2
        str     lr, [r10, +lr, lsl #2]
        add     lr, r8, #3
        str     lr, [r10, +lr, lsl #2]
        add     lr, r8, #4
        add     r8, r8, #5
        cmp     r8, r3
        str     lr, [r10, +lr, lsl #2]
        ble     LCJN26
LCJN27:
        str     r8, [r10, +r8, lsl #2]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LCJN27
        ldr     r3, [r5, #0x50]
LCJN28:
        cmp     r3, #0
        blt     LCJN64
        rsb     r12, r3, r3, lsl #2
        str     r9, [sp, #0x30]
        add     r12, r5, r12, lsl #3
        str     r6, [sp, #0x10]
        str     r4, [sp, #0x2C]
        str     r5, [sp, #0x28]
LCJN29:
        ldr     r1, [r12, #0x60]
        ldr     lr, [r12, #0x58]
        ldr     r2, [r12, #0x5C]
        mul     r1, r7, r1
        ldr     r4, [r12, #0x6C]
        cmp     lr, #5
        bgt     LCJN34
        cmp     r2, #0
        ble     LCJN54
        mov     r5, #0
        str     r3, [sp, #4]
        str     r0, [sp, #8]
        str     r7, [sp, #0xC]
LCJN30:
        ldr     r6, [r10, +r5, lsl #2]
        cmp     lr, #1
        ble     LCJN53
        sub     r3, lr, #1
        cmp     r3, #5
        blt     LCJN52
        mul     r3, r1, r6
        rsb     r6, r5, #0
        mla     r0, lr, r5, r6
        str     r2, [sp, #0x1C]
        ldr     r2, [sp, #0x10]
        sub     r11, lr, #5
        mov     r6, #1
        mov     r8, r3
        mov     r7, r3, lsl #2
        add     r9, r0, #1
        str     r0, [sp, #0x34]
        str     r11, [sp, #0x38]
        str     r5, [sp, #0x14]
        str     r1, [sp, #0x18]
        str     lr, [sp, #0x20]
        str     r12, [sp, #0x24]
        str     r10, [sp]
LCJN31:
        ldr     r1, [r2, +r8, lsl #3]
        mov     r10, r9, lsl #3
        sub     r0, r10, #8
        str     r1, [r4, +r0]
        add     r1, r2, r8, lsl #3
        ldr     r1, [r1, #4]
        add     r12, r4, r0
        add     r0, r6, #1
        mul     r0, r3, r0
        str     r1, [r12, #4]
        add     r12, r4, r10
        add     lr, r10, #8
        ldr     r1, [r2, +r0, lsl #3]
        add     r11, r2, r0, lsl #3
        add     r0, r6, #2
        mul     r0, r3, r0
        str     r1, [r4, +r9, lsl #3]
        ldr     r1, [r11, #4]
        add     r5, r4, lr
        add     r10, r10, #0x10
        add     r11, r4, r10
        str     r1, [r12, #4]
        ldr     r1, [r2, +r0, lsl #3]
        add     r12, r2, r0, lsl #3
        add     r0, r6, #3
        str     r1, [r4, +lr]
        ldr     r12, [r12, #4]
        mul     r0, r3, r0
        add     r9, r9, #4
        str     r12, [r5, #4]
        ldr     r12, [sp, #0x38]
        add     r8, r8, r7
        ldr     r1, [r2, +r0, lsl #3]
        add     r0, r2, r0, lsl #3
        add     r6, r6, #4
        cmp     r6, r12
        str     r1, [r4, +r10]
        ldr     r0, [r0, #4]
        str     r0, [r11, #4]
        ble     LCJN31
        ldr     r0, [sp, #0x34]
        ldr     r5, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        ldr     r10, [sp]
LCJN32:
        mul     r11, r6, r3
        ldr     r9, [sp, #0x10]
        add     r7, r6, r0
LCJN33:
        ldr     r0, [r9, +r11, lsl #3]
        mov     r8, r7, lsl #3
        sub     r8, r8, #8
        str     r0, [r4, +r8]
        add     r0, r9, r11, lsl #3
        ldr     r0, [r0, #4]
        add     r6, r6, #1
        add     r8, r4, r8
        cmp     r6, lr
        str     r0, [r8, #4]
        add     r7, r7, #1
        add     r11, r11, r3
        blt     LCJN33
        add     r5, r5, #1
        cmp     r5, r2
        str     r9, [sp, #0x10]
        blt     LCJN30
        b       LCJN77
LCJN34:
        cmp     r2, #0
        ble     LCJN54
        mov     r5, #0
        str     r3, [sp, #4]
        str     r0, [sp, #8]
        str     r7, [sp, #0xC]
LCJN35:
        ldr     r3, [r10, +r5, lsl #2]
        cmp     lr, #0
        ble     LCJN73
        cmp     lr, #5
        blt     LCJN74
        mul     r0, lr, r5
        mul     r3, r1, r3
        str     r12, [sp, #0x24]
        ldr     r12, [sp, #0x10]
        mov     r11, #0
        mov     r6, r11
        sub     r9, lr, #5
        mov     r8, r0
        mov     r7, r3, lsl #2
        str     r5, [sp, #0x14]
        str     r1, [sp, #0x18]
        str     r2, [sp, #0x1C]
        str     lr, [sp, #0x20]
        str     r10, [sp]
LCJN36:
        ldr     lr, [r12, +r11, lsl #3]
        add     r2, r12, r11, lsl #3
        add     r1, r6, #1
        str     lr, [r4, +r8, lsl #3]
        ldr     r2, [r2, #4]
        mul     r1, r3, r1
        add     lr, r4, r8, lsl #3
        str     r2, [lr, #4]
        mov     r2, r8, lsl #3
        add     r5, r2, #8
        ldr     lr, [r12, +r1, lsl #3]
        add     r10, r12, r1, lsl #3
        add     r1, r6, #2
        mul     r1, r3, r1
        str     lr, [r4, +r5]
        ldr     r10, [r10, #4]
        add     r5, r4, r5
        add     lr, r2, #0x10
        add     r2, r2, #0x18
        str     r10, [r5, #4]
        ldr     r5, [r12, +r1, lsl #3]
        add     r1, r12, r1, lsl #3
        add     r10, r6, #3
        str     r5, [r4, +lr]
        ldr     r1, [r1, #4]
        mul     r5, r3, r10
        add     lr, r4, lr
        str     r1, [lr, #4]
        add     r1, r4, r2
        add     r8, r8, #4
        ldr     lr, [r12, +r5, lsl #3]
        add     r5, r12, r5, lsl #3
        add     r11, r11, r7
        add     r6, r6, #4
        str     lr, [r4, +r2]
        ldr     r5, [r5, #4]
        cmp     r6, r9
        str     r5, [r1, #4]
        ble     LCJN36
        ldr     r5, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        ldr     r10, [sp]
LCJN37:
        mul     r7, r6, r3
        ldr     r9, [sp, #0x10]
        add     r0, r6, r0
        str     r10, [sp]
LCJN38:
        ldr     r11, [r9, +r7, lsl #3]
        add     r10, r9, r7, lsl #3
        add     r8, r4, r0, lsl #3
        str     r11, [r4, +r0, lsl #3]
        ldr     r10, [r10, #4]
        add     r6, r6, #1
        cmp     r6, lr
        str     r10, [r8, #4]
        add     r0, r0, #1
        add     r7, r7, r3
        blt     LCJN38
        ldr     r10, [sp]
        add     r5, r5, #1
        cmp     r5, r2
        str     r9, [sp, #0x10]
        blt     LCJN35
        b       LCJN72
LCJN39:
        mov     r0, r10, lsl #2
        bl      _ippsMalloc_8u
        mov     r6, r0
        cmp     r6, #0
        beq     LCJN83
        str     r8, [r6]
        ldr     r1, [r5, #0x50]
        subs    r1, r1, #1
        bmi     LCJN69
        rsb     r2, r1, r1, lsl #2
        cmp     r10, #1
        add     r2, r5, r2, lsl #3
        ldr     r2, [r2, #0x58]
        bgt     LCJN46
LCJN40:
        cmp     r11, #0
        ble     LCJN76
        cmp     r11, #6
        movlt   r4, r8
        blt     LCJN42
        mov     r4, r8
        sub     r9, r11, #6
        add     r7, r6, #4
LCJN41:
        ldr     r12, [r7, #-4]
        ldr     r3, [r7]
        ldr     lr, [r7, #4]
        mul     r12, r2, r12
        add     r4, r4, #5
        mul     r3, r2, r3
        mul     lr, r2, lr
        cmp     r4, r9
        str     r12, [r7, #-4]
        ldr     r12, [r7, #8]
        str     r3, [r7]
        ldr     r3, [r7, #0xC]
        str     lr, [r7, #4]
        mul     r12, r2, r12
        mul     r3, r2, r3
        str     r12, [r7, #8]
        str     r3, [r7, #0xC]
        add     r7, r7, #0x14
        ble     LCJN41
LCJN42:
        add     r3, r6, r4, lsl #2
LCJN43:
        ldr     r12, [r3]
        add     r4, r4, #1
        cmp     r4, r11
        mul     r12, r2, r12
        str     r12, [r3], #4
        blt     LCJN43
LCJN44:
        subs    r1, r1, #1
        bmi     LCJN75
LCJN45:
        rsb     r2, r1, r1, lsl #2
        cmp     r11, r10
        add     r2, r5, r2, lsl #3
        ldr     r2, [r2, #0x58]
        bge     LCJN40
LCJN46:
        subs    r9, r2, #1
        bmi     LCJN51
LCJN47:
        cmp     r11, #0
        ble     LCJN79
        cmp     r11, #6
        blt     LCJN78
        mul     r3, r11, r9
        mov     r12, r8
        sub     r7, r11, #6
        add     r4, r6, #4
        add     r3, r6, r3, lsl #2
        add     lr, r3, #4
LCJN48:
        ldr     r0, [r4, #-4]
        add     r12, r12, #5
        cmp     r12, r7
        mla     r0, r2, r0, r9
        str     r0, [lr, #-4]
        ldr     r0, [r4]
        mla     r0, r2, r0, r9
        str     r0, [lr]
        ldr     r0, [r4, #4]
        mla     r0, r2, r0, r9
        str     r0, [lr, #4]
        ldr     r0, [r4, #8]
        mla     r0, r2, r0, r9
        str     r0, [lr, #8]
        ldr     r0, [r4, #0xC]
        add     r4, r4, #0x14
        mla     r0, r2, r0, r9
        str     r0, [lr, #0xC]
        add     lr, lr, #0x14
        ble     LCJN48
LCJN49:
        add     lr, r6, r12, lsl #2
LCJN50:
        ldr     r4, [lr], #4
        mla     r4, r2, r4, r9
        str     r4, [r3, +r12, lsl #2]
        add     r12, r12, #1
        cmp     r12, r11
        blt     LCJN50
        subs    r9, r9, #1
        bpl     LCJN47
LCJN51:
        mul     r11, r11, r2
        b       LCJN44
LCJN52:
        mul     r3, r1, r6
        rsb     r6, r5, #0
        mla     r0, lr, r5, r6
        mov     r6, #1
        b       LCJN32
LCJN53:
        add     r5, r5, #1
        cmp     r5, r2
        blt     LCJN30
        ldr     r3, [sp, #4]
        ldr     r0, [sp, #8]
        ldr     r7, [sp, #0xC]
LCJN54:
        cmp     r2, #0
        ble     LCJN58
        cmp     r2, #6
        movlt   r1, #0
        blt     LCJN56
        mov     r1, #0
        sub     r6, r2, #6
        add     r5, r10, #4
        add     r4, r0, #4
LCJN55:
        ldr     r8, [r5, #-4]
        add     r1, r1, #5
        cmp     r1, r6
        str     r8, [r4, #-4]
        ldr     r8, [r5]
        str     r8, [r4]
        ldr     r8, [r5, #4]
        str     r8, [r4, #4]
        ldr     r8, [r5, #8]
        str     r8, [r4, #8]
        ldr     r8, [r5, #0xC]
        add     r5, r5, #0x14
        str     r8, [r4, #0xC]
        add     r4, r4, #0x14
        ble     LCJN55
LCJN56:
        add     r5, r10, r1, lsl #2
        add     r6, r0, r1, lsl #2
LCJN57:
        ldr     r4, [r5], #4
        add     r1, r1, #1
        cmp     r1, r2
        str     r4, [r6], #4
        blt     LCJN57
LCJN58:
        cmp     r2, #0
        ble     LCJN63
        mov     r1, #0
        str     r0, [sp, #8]
        str     r7, [sp, #0xC]
LCJN59:
        cmp     lr, #0
        ble     LCJN71
        cmp     lr, #6
        blt     LCJN70
        mul     r4, lr, r1
        str     r3, [sp, #4]
        ldr     r3, [sp, #8]
        mov     r0, #0
        add     r4, r10, r4, lsl #2
        mov     r6, r0
        mov     r5, r1, lsl #2
        add     r11, r2, r2, lsl #1
        sub     r9, lr, #6
        add     r8, r2, r2, lsl #2
        add     r7, r4, #4
        str     r10, [sp]
LCJN60:
        ldr     r10, [r3, +r5]
        add     r6, r6, #5
        cmp     r6, r9
        add     r10, r10, r0
        str     r10, [r7, #-4]
        ldr     r10, [r3, +r5]
        add     r10, r2, r10
        add     r10, r10, r0
        str     r10, [r7]
        ldr     r10, [r3, +r5]
        add     r10, r10, r2, lsl #1
        add     r10, r10, r0
        str     r10, [r7, #4]
        ldr     r10, [r3, +r5]
        add     r10, r11, r10
        add     r10, r10, r0
        str     r10, [r7, #8]
        ldr     r10, [r3, +r5]
        add     r10, r10, r2, lsl #2
        add     r10, r10, r0
        str     r10, [r7, #0xC]
        add     r0, r0, r8
        add     r7, r7, #0x14
        ble     LCJN60
        ldr     r3, [sp, #4]
        ldr     r10, [sp]
LCJN61:
        mul     r7, r6, r2
        ldr     r8, [sp, #8]
LCJN62:
        ldr     r9, [r8, +r5]
        add     r9, r9, r7
        str     r9, [r4, +r6, lsl #2]
        add     r6, r6, #1
        cmp     r6, lr
        add     r7, r7, r2
        blt     LCJN62
        add     r1, r1, #1
        cmp     r1, r2
        str     r8, [sp, #8]
        blt     LCJN59
        ldr     r0, [sp, #8]
        ldr     r7, [sp, #0xC]
LCJN63:
        subs    r3, r3, #1
        sub     r12, r12, #0x18
        bpl     LCJN29
        ldr     r9, [sp, #0x30]
        ldr     r4, [sp, #0x2C]
        ldr     r5, [sp, #0x28]
LCJN64:
        bl      _ippsFree
        ldr     r7, [r5, #0x50]
        mov     r0, r4
        rsb     r2, r7, r7, lsl #2
        add     r2, r5, r2, lsl #3
        ldr     r1, [r2, #0x5C]
        bl      __intel_idiv
        cmp     r7, #0
        blt     LCJN68
        rsb     r2, r7, r7, lsl #2
        mov     r6, #1
        add     r8, r5, r2, lsl #3
LCJN65:
        ldr     r1, [r8, #0x58]
        cmp     r0, #0x7D, 28
        str     r6, [r8, #0x64]
        ble     LCJN66
        cmp     r7, #1
        bne     LCJN67
LCJN66:
        mul     r6, r1, r6
LCJN67:
        bl      __intel_idiv
        subs    r7, r7, #1
        sub     r8, r8, #0x18
        bpl     LCJN65
LCJN68:
        ldr     r2, [r5, #0x18]
        cmp     r9, #0
        mov     r6, #0
        sub     r2, r2, r4, lsl #3
        strne   r2, [r5, #0x18]
        streq   r6, [r5, #0x18]
        ldr     r0, [r5, #0x54]
        bl      _ippsFree
LCJN69:
        mov     r0, #0
        str     r6, [r5, #0x54]
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LCJN70:
        mul     r4, lr, r1
        mov     r6, #0
        mov     r5, r1, lsl #2
        add     r4, r10, r4, lsl #2
        b       LCJN61
LCJN71:
        add     r1, r1, #1
        cmp     r1, r2
        blt     LCJN59
        ldr     r0, [sp, #8]
        ldr     r7, [sp, #0xC]
        b       LCJN63
LCJN72:
        ldr     r3, [sp, #4]
        ldr     r0, [sp, #8]
        ldr     r7, [sp, #0xC]
        b       LCJN54
LCJN73:
        add     r5, r5, #1
        cmp     r5, r2
        blt     LCJN35
        ldr     r3, [sp, #4]
        ldr     r0, [sp, #8]
        ldr     r7, [sp, #0xC]
        b       LCJN54
LCJN74:
        mul     r0, lr, r5
        mul     r3, r1, r3
        mov     r6, #0
        b       LCJN37
LCJN75:
        b       LCJN69
LCJN76:
        subs    r1, r1, #1
        bpl     LCJN45
        b       LCJN69
LCJN77:
        ldr     r3, [sp, #4]
        ldr     r0, [sp, #8]
        ldr     r7, [sp, #0xC]
        b       LCJN54
LCJN78:
        mul     r3, r11, r9
        mov     r12, r8
        add     r3, r6, r3, lsl #2
        b       LCJN49
LCJN79:
        subs    r9, r9, #1
        bpl     LCJN47
        b       LCJN51
LCJN80:
        mvn     r0, #8
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LCJN81:
        mvn     r0, #8
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LCJN82:
        mvn     r0, #8
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LCJN83:
        mvn     r0, #8
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}


