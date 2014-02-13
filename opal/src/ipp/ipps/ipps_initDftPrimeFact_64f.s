        .text
        .align  4
        .globl  _ipps_initDftPrimeFact_64f


_ipps_initDftPrimeFact_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        mov     r12, #0xE2, 30
        mov     r4, r1
        orr     r12, r12, #1, 20
        cmp     r12, r4
        mov     r5, r0
        mov     r6, r2
        mov     r10, r3
        mov     r8, #0
        strge   r8, [r5, #0x24]
        ldr     r7, [r5, #0x54]
        mov     r11, #1
        mov     r0, r4
        cmp     r7, #0
        blt     LCNY1
        mov     r1, r11
        mov     r9, r8
        str     r8, [sp, #0x18]
        add     r7, r5, #0x4C
        mov     r8, r1
LCNY0:
        ldr     r1, [r7, #0x10]
        str     r8, [r7, #0x18]
        add     r9, r9, #1
        mul     r8, r1, r8
        bl      __intel_idiv
        str     r0, [r7, #0x14]
        ldr     r1, [r5, #0x54]
        add     r7, r7, #0x18
        cmp     r9, r1
        ble     LCNY0
        mov     r7, r1
        ldr     r8, [sp, #0x18]
LCNY1:
        mov     r0, r10
        mov     r1, r4
        bl      __intel_idiv
        cmp     r7, #0
        mov     r7, r0
        movlt   r10, r8
        movlt   r9, r10
        blt     LCNY25
        mov     lr, r8
        mov     r12, r11
        mov     r9, lr
        mov     r0, r9
        str     r4, [sp, #0x34]
        str     r9, [sp, #0x38]
        str     r12, [sp, #0x44]
        str     lr, [sp, #0x48]
        str     r7, [sp, #0x28]
        str     r10, [sp, #0x4C]
        str     r6, [sp, #0x2C]
        str     r8, [sp, #0x18]
        mov     r4, r0
LCNY2:
        mov     r10, r11
        str     r11, [sp, #0x20]
LCNY3:
        rsb     r8, r4, r4, lsl #2
        add     r1, r5, r8, lsl #3
        ldr     r6, [r1, #0x5C]
        ldr     r7, [r1, #0x60]
        mul     r11, r6, r7
        cmp     r11, #0x7D, 30
        movgt   r9, #0
        movle   r9, #1
        add     r1, r5, r8, lsl #3
        cmp     r6, #5
        str     r10, [r1, #0x68]
        ble     LCNY5
        ldr     r1, [sp, #0x44]
        cmp     r6, r1
        beq     LCNY4
        mov     r0, r6
        ldr     r2, [sp, #0x4C]
        ldr     r1, [sp, #0x2C]
        bl      _ipps_createTabDftDir_64f
        cmp     r0, #0
        str     r0, [sp, #0x48]
        strne   r6, [sp, #0x44]
        beq     LCNY80
LCNY4:
        ldr     r1, [sp, #0x38]
        ldr     r3, [sp, #0x48]
        add     r2, r5, r8, lsl #3
        cmp     r6, r1
        movgt   r1, r6
        str     r3, [r2, #0x6C]
        str     r1, [sp, #0x38]
LCNY5:
        ldr     r1, [r5, #0x54]
        cmp     r4, r1
        bne     LCNY7
        cmp     r7, #5
        ble     LCNY7
        ldr     r1, [sp, #0x44]
        cmp     r7, r1
        beq     LCNY6
        mov     r0, r7
        ldr     r2, [sp, #0x4C]
        ldr     r1, [sp, #0x2C]
        bl      _ipps_createTabDftDir_64f
        cmp     r0, #0
        str     r0, [sp, #0x48]
        beq     LCNY81
LCNY6:
        ldr     r1, [sp, #0x38]
        ldr     r3, [sp, #0x48]
        add     r2, r5, r8, lsl #3
        cmp     r7, r1
        movgt   r1, r7
        str     r3, [r2, #0x84]
        str     r1, [sp, #0x38]
LCNY7:
        mov     r0, r11, lsl #4
        bl      _ippsMalloc_8u
        cmp     r0, #0
        beq     LCNY82
        add     r1, r5, r8, lsl #3
        ldr     r1, [r1, #0x64]
        ldr     r3, [sp, #0x28]
        ldr     r2, [r5, #0x24]
        mul     r1, r3, r1
        cmp     r2, #0
        bne     LCNY17
        cmp     r6, #5
        bgt     LCNY12
        cmp     r7, #0
        ble     LCNY17
        mov     r2, #0
        str     r10, [sp, #0x3C]
        str     r4, [sp, #0x40]
        str     r5, [sp, #0x30]
LCNY8:
        cmp     r6, #1
        ble     LCNY20
        sub     r3, r6, #1
        cmp     r3, #5
        blt     LCNY19
        mul     r12, r2, r1
        rsb     r3, r2, #0
        mla     r10, r6, r2, r3
        sub     r5, r6, #5
        str     r6, [sp, #4]
        ldr     r6, [sp, #0x2C]
        mov     r11, r12, lsl #2
        mov     r3, #1
        mov     lr, r12
        add     r4, r10, #1
        str     r10, [sp, #0x1C]
        str     r11, [sp, #0x24]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r7, [sp, #8]
        str     r8, [sp]
LCNY9:
        ldr     r8, [r6, +lr, lsl #4]
        add     r9, r6, lr, lsl #4
        ldr     r7, [r9, #4]
        mov     r2, r4, lsl #4
        sub     r1, r2, #0x10
        str     r8, [r0, +r1]
        add     r1, r0, r1
        str     r7, [r1, #4]
        ldr     r10, [r9, #8]
        ldr     r9, [r9, #0xC]
        add     r8, r3, #1
        mul     r8, r12, r8
        str     r10, [r1, #8]
        str     r9, [r1, #0xC]
        add     r7, r0, r2
        add     r9, r3, #2
        mul     r9, r12, r9
        add     r10, r6, r8, lsl #4
        ldr     r8, [r6, +r8, lsl #4]
        ldr     r1, [r10, #4]
        str     r8, [r0, +r4, lsl #4]
        add     r8, r2, #0x10
        add     r2, r2, #0x20
        str     r1, [r7, #4]
        ldr     r11, [r10, #8]
        ldr     r10, [r10, #0xC]
        add     r1, r6, r9, lsl #4
        str     r11, [r7, #8]
        add     r4, r4, #4
        str     r10, [r7, #0xC]
        ldr     r10, [r6, +r9, lsl #4]
        ldr     r9, [r1, #4]
        add     r7, r0, r8
        str     r10, [r0, +r8]
        add     r8, r3, #3
        mul     r8, r12, r8
        str     r9, [r7, #4]
        ldr     r9, [r1, #8]
        ldr     r10, [r1, #0xC]
        add     r1, r6, r8, lsl #4
        add     r3, r3, #4
        str     r9, [r7, #8]
        str     r10, [r7, #0xC]
        ldr     r8, [r6, +r8, lsl #4]
        ldr     r9, [r1, #4]
        add     r7, r0, r2
        str     r8, [r0, +r2]
        cmp     r3, r5
        str     r9, [r7, #4]
        ldr     r2, [r1, #8]
        ldr     r1, [r1, #0xC]
        str     r2, [r7, #8]
        str     r1, [r7, #0xC]
        ldr     r1, [sp, #0x24]
        add     lr, lr, r1
        ble     LCNY9
        ldr     r10, [sp, #0x1C]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        ldr     r9, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r8, [sp]
LCNY10:
        mul     r4, r3, r12
        str     r8, [sp]
        ldr     r8, [sp, #0x2C]
        add     lr, r3, r10
        str     r7, [sp, #8]
LCNY11:
        ldr     r10, [r8, +r4, lsl #4]
        add     r7, r8, r4, lsl #4
        ldr     r5, [r7, #4]
        mov     r11, lr, lsl #4
        sub     r11, r11, #0x10
        str     r10, [r0, +r11]
        add     r10, r0, r11
        str     r5, [r10, #4]
        ldr     r5, [r7, #8]
        ldr     r7, [r7, #0xC]
        add     r3, r3, #1
        cmp     r3, r6
        str     r5, [r10, #8]
        str     r7, [r10, #0xC]
        add     lr, lr, #1
        add     r4, r4, r12
        blt     LCNY11
        ldr     r7, [sp, #8]
        str     r8, [sp, #0x2C]
        ldr     r8, [sp]
        add     r2, r2, #1
        cmp     r2, r7
        blt     LCNY8
        b       LCNY18
LCNY12:
        cmp     r7, #0
        ble     LCNY17
        mov     r2, #0
        str     r10, [sp, #0x3C]
        str     r4, [sp, #0x40]
        str     r5, [sp, #0x30]
LCNY13:
        cmp     r6, #0
        ble     LCNY23
        cmp     r6, #5
        blt     LCNY22
        mul     r10, r6, r2
        mul     r5, r2, r1
        str     r8, [sp]
        ldr     r8, [sp, #0x2C]
        mov     lr, #0
        sub     r11, r6, #5
        mov     r4, lr
        mov     r12, r10
        mov     r3, r5, lsl #2
        str     r10, [sp, #0x1C]
        str     r11, [sp, #0x14]
        str     r2, [sp, #0x24]
        str     r1, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r7, [sp, #8]
        str     r6, [sp, #4]
LCNY14:
        ldr     r2, [r8, +lr, lsl #4]
        add     r1, r8, lr, lsl #4
        ldr     r7, [r1, #4]
        str     r2, [r0, +r12, lsl #4]
        add     r6, r0, r12, lsl #4
        add     r2, r4, #1
        mul     r2, r5, r2
        str     r7, [r6, #4]
        ldr     r9, [r1, #0xC]
        ldr     r10, [r1, #8]
        mov     r7, r12, lsl #4
        add     r1, r8, r2, lsl #4
        str     r9, [r6, #0xC]
        str     r10, [r6, #8]
        ldr     r6, [r8, +r2, lsl #4]
        ldr     r2, [r1, #4]
        add     r9, r7, #0x10
        str     r6, [r0, +r9]
        add     r6, r0, r9
        str     r2, [r6, #4]
        ldr     r9, [r1, #8]
        ldr     r1, [r1, #0xC]
        add     r2, r4, #2
        mul     r2, r5, r2
        str     r9, [r6, #8]
        str     r1, [r6, #0xC]
        add     r9, r7, #0x20
        add     r6, r0, r9
        ldr     r1, [r8, +r2, lsl #4]
        add     r2, r8, r2, lsl #4
        ldr     r10, [r2, #4]
        add     r11, r4, #3
        str     r1, [r0, +r9]
        mul     r1, r5, r11
        str     r10, [r6, #4]
        ldr     r9, [r2, #8]
        ldr     r10, [r2, #0xC]
        add     r2, r8, r1, lsl #4
        add     r7, r7, #0x30
        str     r9, [r6, #8]
        str     r10, [r6, #0xC]
        ldr     r6, [r8, +r1, lsl #4]
        ldr     r9, [r2, #4]
        add     r1, r0, r7
        str     r6, [r0, +r7]
        add     r12, r12, #4
        str     r9, [r1, #4]
        ldr     r6, [r2, #8]
        ldr     r7, [sp, #0x14]
        ldr     r2, [r2, #0xC]
        add     r4, r4, #4
        str     r6, [r1, #8]
        cmp     r4, r7
        str     r2, [r1, #0xC]
        add     lr, lr, r3
        ble     LCNY14
        ldr     r10, [sp, #0x1C]
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp, #0x10]
        ldr     r9, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r8, [sp]
LCNY15:
        mul     r12, r4, r5
        add     r3, r4, r10
        ldr     r10, [sp, #0x2C]
        str     r8, [sp]
LCNY16:
        ldr     r8, [r10, +r12, lsl #4]
        add     lr, r10, r12, lsl #4
        ldr     r11, [lr, #4]
        str     r8, [r0, +r3, lsl #4]
        add     r8, r0, r3, lsl #4
        add     r3, r3, #1
        str     r11, [r8, #4]
        ldr     r11, [lr, #8]
        ldr     lr, [lr, #0xC]
        add     r4, r4, #1
        cmp     r4, r6
        str     r11, [r8, #8]
        str     lr, [r8, #0xC]
        add     r12, r12, r5
        blt     LCNY16
        ldr     r8, [sp]
        add     r2, r2, #1
        cmp     r2, r7
        str     r10, [sp, #0x2C]
        blt     LCNY13
        b       LCNY21
LCNY17:
        add     r8, r5, r8, lsl #3
        str     r0, [r8, #0x70]
        ldr     r1, [r5, #0x54]
        add     r4, r4, #1
        cmp     r4, r1
        bgt     LCNY24
        cmp     r9, #0
        mulne   r10, r6, r10
        bne     LCNY3
        ldr     r11, [sp, #0x20]
        b       LCNY2
LCNY18:
        ldr     r10, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x30]
        b       LCNY17
LCNY19:
        mul     r12, r2, r1
        rsb     r3, r2, #0
        mla     r10, r6, r2, r3
        mov     r3, #1
        b       LCNY10
LCNY20:
        add     r2, r2, #1
        cmp     r2, r7
        blt     LCNY8
        ldr     r10, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x30]
        b       LCNY17
LCNY21:
        ldr     r10, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x30]
        b       LCNY17
LCNY22:
        mul     r10, r6, r2
        mul     r5, r2, r1
        mov     r4, #0
        b       LCNY15
LCNY23:
        add     r2, r2, #1
        cmp     r2, r7
        blt     LCNY13
        ldr     r10, [sp, #0x3C]
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x30]
        b       LCNY17
LCNY24:
        ldr     r11, [sp, #0x20]
        ldr     r9, [sp, #0x38]
        ldr     r7, [sp, #0x28]
        ldr     r6, [sp, #0x2C]
        ldr     r4, [sp, #0x34]
        ldr     r8, [sp, #0x18]
LCNY25:
        ldr     r3, [r5, #0x24]
        add     r12, r4, r9
        mov     r12, r12, lsl #4
        add     r12, r12, #0x40
        cmp     r3, #0
        str     r12, [r5, #0x1C]
        beq     LCNY39
        mov     r11, r4, lsl #2
        mov     r0, r11
        bl      _ippsMalloc_8u
        mov     r10, r0
        cmp     r10, #0
        beq     LCNY83
        str     r10, [r5, #0x58]
        mov     r0, r11
        bl      _ippsMalloc_8u
        cmp     r0, #0
        beq     LCNY83
        ldr     r3, [r5, #0x54]
        rsb     r12, r3, r3, lsl #2
        add     r12, r5, r12, lsl #3
        ldr     r12, [r12, #0x60]
        cmp     r12, #0
        ble     LCNY28
        cmp     r12, #6
        blt     LCNY27
        sub     r3, r12, #6
LCNY26:
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
        ble     LCNY26
LCNY27:
        str     r8, [r10, +r8, lsl #2]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LCNY27
        ldr     r3, [r5, #0x54]
LCNY28:
        cmp     r3, #0
        blt     LCNY64
        rsb     r12, r3, r3, lsl #2
        str     r9, [sp, #0x38]
        add     r12, r5, r12, lsl #3
        str     r6, [sp, #0x2C]
        str     r4, [sp, #0x34]
        str     r5, [sp, #0x30]
LCNY29:
        ldr     r1, [r12, #0x64]
        ldr     lr, [r12, #0x5C]
        ldr     r2, [r12, #0x60]
        mul     r1, r7, r1
        ldr     r4, [r12, #0x70]
        cmp     lr, #5
        bgt     LCNY34
        cmp     r2, #0
        ble     LCNY54
        mov     r5, #0
        str     r3, [sp, #0x1C]
        str     r0, [sp, #0x20]
        str     r7, [sp, #0x28]
LCNY30:
        ldr     r6, [r10, +r5, lsl #2]
        cmp     lr, #1
        ble     LCNY53
        sub     r3, lr, #1
        cmp     r3, #5
        blt     LCNY52
        mul     r3, r1, r6
        rsb     r6, r5, #0
        mla     r11, lr, r5, r6
        str     r2, [sp, #0x10]
        ldr     r2, [sp, #0x2C]
        mov     r0, r3, lsl #2
        mov     r6, #1
        sub     r9, lr, #5
        mov     r7, r3
        add     r8, r11, #1
        str     r11, [sp, #4]
        str     r0, [sp]
        str     r5, [sp, #8]
        str     r1, [sp, #0xC]
        str     lr, [sp, #0x14]
        str     r12, [sp, #0x18]
        str     r10, [sp, #0x24]
LCNY31:
        ldr     r0, [r2, +r7, lsl #4]
        add     r5, r2, r7, lsl #4
        ldr     r12, [r5, #4]
        mov     r1, r8, lsl #4
        sub     lr, r1, #0x10
        str     r0, [r4, +lr]
        add     r0, r4, lr
        str     r12, [r0, #4]
        ldr     r10, [r5, #8]
        ldr     r5, [r5, #0xC]
        add     lr, r6, #1
        mul     lr, r3, lr
        str     r10, [r0, #8]
        str     r5, [r0, #0xC]
        add     r12, r4, r1
        add     r5, r6, #2
        mul     r5, r3, r5
        add     r11, r2, lr, lsl #4
        ldr     lr, [r2, +lr, lsl #4]
        ldr     r0, [r11, #4]
        str     lr, [r4, +r8, lsl #4]
        add     lr, r1, #0x10
        add     r1, r1, #0x20
        str     r0, [r12, #4]
        ldr     r10, [r11, #8]
        ldr     r11, [r11, #0xC]
        add     r0, r2, r5, lsl #4
        str     r10, [r12, #8]
        add     r8, r8, #4
        str     r11, [r12, #0xC]
        ldr     r10, [r2, +r5, lsl #4]
        ldr     r5, [r0, #4]
        add     r12, r4, lr
        str     r10, [r4, +lr]
        add     lr, r6, #3
        mul     lr, r3, lr
        str     r5, [r12, #4]
        ldr     r5, [r0, #8]
        ldr     r10, [r0, #0xC]
        add     r0, r2, lr, lsl #4
        add     r6, r6, #4
        str     r5, [r12, #8]
        str     r10, [r12, #0xC]
        ldr     lr, [r2, +lr, lsl #4]
        ldr     r5, [r0, #4]
        add     r12, r4, r1
        str     lr, [r4, +r1]
        cmp     r6, r9
        str     r5, [r12, #4]
        ldr     r1, [r0, #8]
        ldr     r0, [r0, #0xC]
        str     r1, [r12, #8]
        str     r0, [r12, #0xC]
        ldr     r0, [sp]
        add     r7, r7, r0
        ble     LCNY31
        ldr     r11, [sp, #4]
        ldr     r5, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     lr, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     r10, [sp, #0x24]
LCNY32:
        mul     r8, r6, r3
        ldr     r9, [sp, #0x2C]
        add     r7, r6, r11
        str     r12, [sp, #0x18]
        str     r10, [sp, #0x24]
LCNY33:
        ldr     r10, [r9, +r8, lsl #4]
        add     r12, r9, r8, lsl #4
        ldr     r0, [r12, #4]
        mov     r11, r7, lsl #4
        sub     r11, r11, #0x10
        str     r10, [r4, +r11]
        add     r10, r4, r11
        str     r0, [r10, #4]
        ldr     r0, [r12, #8]
        ldr     r12, [r12, #0xC]
        add     r6, r6, #1
        cmp     r6, lr
        str     r0, [r10, #8]
        str     r12, [r10, #0xC]
        add     r7, r7, #1
        add     r8, r8, r3
        blt     LCNY33
        ldr     r12, [sp, #0x18]
        ldr     r10, [sp, #0x24]
        add     r5, r5, #1
        cmp     r5, r2
        str     r9, [sp, #0x2C]
        blt     LCNY30
        b       LCNY77
LCNY34:
        cmp     r2, #0
        ble     LCNY54
        mov     r5, #0
        str     r3, [sp, #0x1C]
        str     r0, [sp, #0x20]
        str     r7, [sp, #0x28]
LCNY35:
        ldr     r3, [r10, +r5, lsl #2]
        cmp     lr, #0
        ble     LCNY73
        cmp     lr, #5
        blt     LCNY74
        mul     r11, lr, r5
        mul     r3, r1, r3
        sub     r0, lr, #5
        str     lr, [sp, #0x14]
        ldr     lr, [sp, #0x2C]
        mov     r8, #0
        mov     r9, r8
        mov     r7, r11
        mov     r6, r3, lsl #2
        str     r11, [sp, #4]
        str     r0, [sp]
        str     r5, [sp, #8]
        str     r1, [sp, #0xC]
        str     r2, [sp, #0x10]
        str     r12, [sp, #0x18]
        str     r10, [sp, #0x24]
LCNY36:
        ldr     r1, [lr, +r8, lsl #4]
        add     r0, lr, r8, lsl #4
        ldr     r12, [r0, #4]
        str     r1, [r4, +r7, lsl #4]
        add     r2, r4, r7, lsl #4
        add     r1, r9, #1
        mul     r1, r3, r1
        str     r12, [r2, #4]
        ldr     r5, [r0, #0xC]
        ldr     r10, [r0, #8]
        mov     r12, r7, lsl #4
        add     r0, lr, r1, lsl #4
        str     r5, [r2, #0xC]
        str     r10, [r2, #8]
        ldr     r2, [lr, +r1, lsl #4]
        ldr     r1, [r0, #4]
        add     r5, r12, #0x10
        str     r2, [r4, +r5]
        add     r2, r4, r5
        str     r1, [r2, #4]
        ldr     r5, [r0, #8]
        ldr     r0, [r0, #0xC]
        add     r1, r9, #2
        mul     r1, r3, r1
        str     r5, [r2, #8]
        str     r0, [r2, #0xC]
        add     r5, r12, #0x20
        add     r2, r4, r5
        ldr     r0, [lr, +r1, lsl #4]
        add     r1, lr, r1, lsl #4
        ldr     r10, [r1, #4]
        add     r11, r9, #3
        str     r0, [r4, +r5]
        mul     r0, r3, r11
        str     r10, [r2, #4]
        ldr     r5, [r1, #8]
        ldr     r10, [r1, #0xC]
        add     r1, lr, r0, lsl #4
        add     r12, r12, #0x30
        str     r5, [r2, #8]
        str     r10, [r2, #0xC]
        ldr     r2, [lr, +r0, lsl #4]
        ldr     r5, [r1, #4]
        add     r0, r4, r12
        str     r2, [r4, +r12]
        add     r7, r7, #4
        str     r5, [r0, #4]
        ldr     r2, [r1, #8]
        ldr     r12, [sp]
        ldr     r1, [r1, #0xC]
        add     r9, r9, #4
        str     r2, [r0, #8]
        cmp     r9, r12
        str     r1, [r0, #0xC]
        add     r8, r8, r6
        ble     LCNY36
        ldr     r11, [sp, #4]
        ldr     r5, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x10]
        ldr     lr, [sp, #0x14]
        ldr     r12, [sp, #0x18]
        ldr     r10, [sp, #0x24]
LCNY37:
        mul     r7, r9, r3
        str     r10, [sp, #0x24]
        ldr     r10, [sp, #0x2C]
        add     r6, r9, r11
LCNY38:
        ldr     r8, [r10, +r7, lsl #4]
        add     r0, r10, r7, lsl #4
        ldr     r11, [r0, #4]
        str     r8, [r4, +r6, lsl #4]
        add     r8, r4, r6, lsl #4
        add     r6, r6, #1
        str     r11, [r8, #4]
        ldr     r11, [r0, #8]
        ldr     r0, [r0, #0xC]
        add     r9, r9, #1
        cmp     r9, lr
        str     r11, [r8, #8]
        str     r0, [r8, #0xC]
        add     r7, r7, r3
        blt     LCNY38
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #0x24]
        add     r5, r5, #1
        cmp     r5, r2
        blt     LCNY35
        b       LCNY72
LCNY39:
        mov     r0, r10, lsl #2
        bl      _ippsMalloc_8u
        mov     r6, r0
        cmp     r6, #0
        beq     LCNY83
        str     r8, [r6]
        ldr     r1, [r5, #0x54]
        subs    r1, r1, #1
        bmi     LCNY69
        rsb     r2, r1, r1, lsl #2
        cmp     r10, #1
        add     r2, r5, r2, lsl #3
        ldr     r2, [r2, #0x5C]
        bgt     LCNY46
LCNY40:
        cmp     r11, #0
        ble     LCNY76
        cmp     r11, #6
        movlt   r4, r8
        blt     LCNY42
        mov     r4, r8
        sub     r9, r11, #6
        add     r7, r6, #4
LCNY41:
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
        ble     LCNY41
LCNY42:
        add     r3, r6, r4, lsl #2
LCNY43:
        ldr     r12, [r3]
        add     r4, r4, #1
        cmp     r4, r11
        mul     r12, r2, r12
        str     r12, [r3], #4
        blt     LCNY43
LCNY44:
        subs    r1, r1, #1
        bmi     LCNY75
LCNY45:
        rsb     r2, r1, r1, lsl #2
        cmp     r11, r10
        add     r2, r5, r2, lsl #3
        ldr     r2, [r2, #0x5C]
        bge     LCNY40
LCNY46:
        subs    r9, r2, #1
        bmi     LCNY51
LCNY47:
        cmp     r11, #0
        ble     LCNY79
        cmp     r11, #6
        blt     LCNY78
        mul     r3, r11, r9
        mov     r12, r8
        sub     r7, r11, #6
        add     r4, r6, #4
        add     r3, r6, r3, lsl #2
        add     lr, r3, #4
LCNY48:
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
        ble     LCNY48
LCNY49:
        add     lr, r6, r12, lsl #2
LCNY50:
        ldr     r4, [lr], #4
        mla     r4, r2, r4, r9
        str     r4, [r3, +r12, lsl #2]
        add     r12, r12, #1
        cmp     r12, r11
        blt     LCNY50
        subs    r9, r9, #1
        bpl     LCNY47
LCNY51:
        mul     r11, r11, r2
        b       LCNY44
LCNY52:
        mul     r3, r1, r6
        rsb     r6, r5, #0
        mla     r11, lr, r5, r6
        mov     r6, #1
        b       LCNY32
LCNY53:
        add     r5, r5, #1
        cmp     r5, r2
        blt     LCNY30
        ldr     r3, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        ldr     r7, [sp, #0x28]
LCNY54:
        cmp     r2, #0
        ble     LCNY58
        cmp     r2, #6
        movlt   r1, #0
        blt     LCNY56
        mov     r1, #0
        sub     r6, r2, #6
        add     r5, r10, #4
        add     r4, r0, #4
LCNY55:
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
        ble     LCNY55
LCNY56:
        add     r5, r10, r1, lsl #2
        add     r6, r0, r1, lsl #2
LCNY57:
        ldr     r4, [r5], #4
        add     r1, r1, #1
        cmp     r1, r2
        str     r4, [r6], #4
        blt     LCNY57
LCNY58:
        cmp     r2, #0
        ble     LCNY63
        mov     r1, #0
        str     r0, [sp, #0x20]
        str     r7, [sp, #0x28]
LCNY59:
        cmp     lr, #0
        ble     LCNY71
        cmp     lr, #6
        blt     LCNY70
        mul     r4, lr, r1
        str     r3, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        mov     r0, #0
        add     r4, r10, r4, lsl #2
        mov     r6, r0
        mov     r5, r1, lsl #2
        add     r11, r2, r2, lsl #1
        sub     r9, lr, #6
        add     r8, r2, r2, lsl #2
        add     r7, r4, #4
        str     r10, [sp, #0x24]
LCNY60:
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
        ble     LCNY60
        ldr     r3, [sp, #0x1C]
        ldr     r10, [sp, #0x24]
LCNY61:
        mul     r7, r6, r2
        ldr     r8, [sp, #0x20]
LCNY62:
        ldr     r9, [r8, +r5]
        add     r9, r9, r7
        str     r9, [r4, +r6, lsl #2]
        add     r6, r6, #1
        cmp     r6, lr
        add     r7, r7, r2
        blt     LCNY62
        add     r1, r1, #1
        cmp     r1, r2
        str     r8, [sp, #0x20]
        blt     LCNY59
        ldr     r0, [sp, #0x20]
        ldr     r7, [sp, #0x28]
LCNY63:
        subs    r3, r3, #1
        sub     r12, r12, #0x18
        bpl     LCNY29
        ldr     r9, [sp, #0x38]
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0x30]
LCNY64:
        bl      _ippsFree
        ldr     r7, [r5, #0x54]
        mov     r0, r4
        rsb     r2, r7, r7, lsl #2
        add     r2, r5, r2, lsl #3
        ldr     r1, [r2, #0x60]
        bl      __intel_idiv
        cmp     r7, #0
        blt     LCNY68
        rsb     r2, r7, r7, lsl #2
        mov     r6, #1
        add     r8, r5, r2, lsl #3
LCNY65:
        ldr     r1, [r8, #0x5C]
        cmp     r0, #0x7D, 30
        str     r6, [r8, #0x68]
        ble     LCNY66
        cmp     r7, #1
        bne     LCNY67
LCNY66:
        mul     r6, r1, r6
LCNY67:
        bl      __intel_idiv
        subs    r7, r7, #1
        sub     r8, r8, #0x18
        bpl     LCNY65
LCNY68:
        ldr     r2, [r5, #0x1C]
        cmp     r9, #0
        mov     r6, #0
        sub     r2, r2, r4, lsl #4
        strne   r2, [r5, #0x1C]
        streq   r6, [r5, #0x1C]
        ldr     r0, [r5, #0x58]
        bl      _ippsFree
LCNY69:
        mov     r0, #0
        str     r6, [r5, #0x58]
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LCNY70:
        mul     r4, lr, r1
        mov     r6, #0
        mov     r5, r1, lsl #2
        add     r4, r10, r4, lsl #2
        b       LCNY61
LCNY71:
        add     r1, r1, #1
        cmp     r1, r2
        blt     LCNY59
        ldr     r0, [sp, #0x20]
        ldr     r7, [sp, #0x28]
        b       LCNY63
LCNY72:
        ldr     r3, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        ldr     r7, [sp, #0x28]
        b       LCNY54
LCNY73:
        add     r5, r5, #1
        cmp     r5, r2
        blt     LCNY35
        ldr     r3, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        ldr     r7, [sp, #0x28]
        b       LCNY54
LCNY74:
        mul     r11, lr, r5
        mul     r3, r1, r3
        mov     r9, #0
        b       LCNY37
LCNY75:
        b       LCNY69
LCNY76:
        subs    r1, r1, #1
        bpl     LCNY45
        b       LCNY69
LCNY77:
        ldr     r3, [sp, #0x1C]
        ldr     r0, [sp, #0x20]
        ldr     r7, [sp, #0x28]
        b       LCNY54
LCNY78:
        mul     r3, r11, r9
        mov     r12, r8
        add     r3, r6, r3, lsl #2
        b       LCNY49
LCNY79:
        subs    r9, r9, #1
        bpl     LCNY47
        b       LCNY51
LCNY80:
        mvn     r0, #8
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LCNY81:
        mvn     r0, #8
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LCNY82:
        mvn     r0, #8
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LCNY83:
        mvn     r0, #8
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}


