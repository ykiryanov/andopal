        .text
        .align  4
        .globl  _ipps_rDftInv_Dir_64f


_ipps_rDftInv_Dir_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        mov     r5, r0
        ldr     r12, [r5, #4]
        ldr     r4, [r5]
        ldr     r9, [sp, #0x7C]
        mov     r6, r2
        tst     r6, #1
        str     r12, [sp, #0x50]
        mov     r7, r1
        str     r3, [sp, #0x54]
        beq     LCQB7
        ldr     r12, [sp, #0x50]
        add     r3, r6, #1
        mov     r3, r3, asr #1
        cmp     r3, #1
        str     r4, [sp, #0x44]
        str     r12, [sp, #0x1C]
        ble     LCQB3
        sub     r12, r3, #1
        cmp     r12, #4
        mov     r0, #0
        blt     LCQB18
        sub     r10, r9, #0xC
        str     r10, [sp, #0x20]
        sub     lr, r5, #8
        sub     r10, lr, #0x1C
        str     r10, [sp, #0x24]
        str     r4, [sp, #0x34]
        str     r6, [sp, #0x3C]
        ldr     r4, [sp, #0x24]
        ldr     r6, [sp, #0x20]
        add     r12, r9, #8
        sub     r1, r3, #4
        mov     r8, #1
        sub     r11, r9, #4
        sub     r10, r5, #0x1C
        str     r12, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r1, [sp, #0x4C]
        str     r0, [sp, #0x48]
        str     r3, [sp, #0x28]
        str     r9, [sp, #0x38]
        str     r7, [sp, #0x40]
LCQB0:
        ldr     r0, [r4, #0x2C]
        ldr     r1, [r4, #0x30]!
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x1C]
        mov     r9, r0
        mov     r7, r1
        bl      __adddf3
        str     r9, [r6, #0xC]
        str     r7, [r6, #0x10]
        ldr     r7, [r10, #0x2C]
        ldr     r9, [r10, #0x30]!
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x1C]
        mov     r1, r9
        mov     r2, #0
        mov     r3, #1, 2
        mov     r0, r7
        bl      __muldf3
        str     r0, [r11, #0xC]
        str     r1, [r11, #0x10]
        ldr     r1, [sp, #0x30]
        add     r9, r8, #1
        mov     r2, #0
        ldr     r0, [r1, +r9, lsl #4]
        add     r1, r1, r9, lsl #4
        ldr     r1, [r1, #4]
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x1C]
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #0x18]
        mov     r7, r1
        bl      __adddf3
        ldr     r2, [sp, #0x18]
        str     r7, [r6, #0x20]
        mov     r3, #1, 2
        str     r2, [r6, #0x1C]
        add     r2, r5, r9, lsl #4
        ldr     r9, [r5, +r9, lsl #4]
        ldr     r2, [r2, #4]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x44]
        mov     r0, r9
        mov     r1, r2
        mov     r2, #0
        bl      __muldf3
        str     r0, [r11, #0x1C]
        str     r1, [r11, #0x20]
        ldr     r1, [sp, #0x30]
        add     r9, r8, #2
        mov     r2, #0
        ldr     r0, [r1, +r9, lsl #4]
        add     r1, r1, r9, lsl #4
        ldr     r1, [r1, #4]
        mov     r3, #1, 2
        add     r8, r8, #3
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x1C]
        str     r1, [sp, #0x18]
        mov     r7, r0
        bl      __adddf3
        str     r7, [r6, #0x2C]
        ldr     r2, [sp, #0x18]
        str     r2, [r6, #0x30]!
        ldr     r2, [r5, +r9, lsl #4]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x44]
        add     r9, r5, r9, lsl #4
        ldr     r1, [r9, #4]
        mov     r0, r2
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r1, [r11, #0x30]
        str     r0, [r11, #0x2C]
        ldr     r1, [sp, #0x4C]
        add     r11, r11, #0x30
        cmp     r8, r1
        ldr     r1, [sp, #0x48]
        add     r1, r1, #6
        str     r1, [sp, #0x48]
        ble     LCQB0
        ldr     r12, [sp, #0x2C]
        ldr     lr, [sp, #0x30]
        ldr     r0, [sp, #0x48]
        ldr     r3, [sp, #0x28]
        ldr     r4, [sp, #0x34]
        ldr     r9, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x40]
LCQB1:
        mov     r10, r0, lsl #3
        mov     r11, r8, lsl #4
        sub     r10, r10, #0xC
        sub     r1, r11, #0xC
        add     r11, r10, r12
        add     r2, r1, lr
        str     r2, [sp, #0x4C]
        add     r10, r10, r9
        str     r9, [sp, #0x38]
        ldr     r9, [sp, #0x4C]
        add     r5, r1, r5
        str     r6, [sp, #0x3C]
        str     r7, [sp, #0x40]
        str     r12, [sp, #0x2C]
        str     lr, [sp, #0x30]
        str     r3, [sp, #0x28]
        str     r4, [sp, #0x34]
        mov     r6, r0
        mov     r7, r5
LCQB2:
        ldr     r1, [sp, #0x30]
        mov     r2, #0
        mov     r3, #1, 2
        ldr     r0, [r1, +r8, lsl #4]
        ldr     r1, [r9, #0x10]!
        add     r8, r8, #1
        bl      __muldf3
        ldr     r2, [sp, #0x44]
        ldr     r3, [sp, #0x1C]
        mov     r5, r0
        mov     r4, r1
        bl      __adddf3
        str     r5, [r10, #0xC]
        str     r4, [r10, #0x10]!
        ldr     r3, [r7, #0xC]
        ldr     r2, [r7, #0x10]!
        str     r0, [sp, #0x44]
        str     r1, [sp, #0x1C]
        mov     r0, r3
        mov     r1, r2
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        str     r0, [r2, +r6, lsl #3]
        str     r1, [r11, #0x10]!
        ldr     r1, [sp, #0x28]
        cmp     r8, r1
        add     r6, r6, #2
        blt     LCQB2
        ldr     r3, [sp, #0x28]
        ldr     r4, [sp, #0x34]
        ldr     r9, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x40]
LCQB3:
        ldr     r12, [sp, #0x44]
        cmp     r3, #1
        str     r12, [r7]
        ldr     r12, [sp, #0x1C]
        str     r12, [r7, #4]
        ble     LCQB17
        ldr     r11, [sp, #0x50]
        add     r5, r7, r6, lsl #3
        add     r1, r9, #8
        sub     r12, r6, #1
        mov     r8, #1
        add     r7, r7, #4
        str     r12, [sp, #0x40]
        str     r1, [sp, #0x48]
        str     r3, [sp, #0x28]
        str     r4, [sp, #0x34]
        str     r9, [sp, #0x38]
        str     r6, [sp, #0x3C]
LCQB4:
        ldr     r0, [sp, #0x40]
        ldr     r4, [sp, #0x34]
        mov     r6, r11
        cmp     r0, #0
        mov     r1, r8
        movle   r10, #0
        movle   r9, r10
        ble     LCQB6
        ldr     r2, [sp, #0x48]
        ldr     r3, [sp, #0x38]
        mov     r0, #0
        mov     r9, r0
        mov     r10, r9
        str     r8, [sp, #0x30]
        ldr     r8, [sp, #0x3C]
        str     r10, [sp, #0x24]
        str     r9, [sp, #0x2C]
        str     r5, [sp, #0x4C]
        str     r7, [sp, #0x44]
        mov     r11, r0
        mov     r5, r1
        mov     r9, r2
        mov     r10, r3
LCQB5:
        ldr     r12, [sp, #0x54]
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        add     r7, r12, r5, lsl #4
        ldr     r2, [r12, +r5, lsl #4]
        ldr     r3, [r7, #4]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [r9]
        ldr     r3, [r7, #0xC]
        ldr     r12, [r9, #4]
        ldr     lr, [r7, #8]
        mov     r4, r0
        mov     r0, r2
        mov     r6, r1
        mov     r1, r12
        mov     r2, lr
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x24]
        bl      __adddf3
        ldr     r12, [sp, #0x30]
        str     r0, [sp, #0x2C]
        add     r5, r12, r5
        cmp     r5, r8
        str     r1, [sp, #0x24]
        subge   r5, r5, r8
        ldr     r12, [sp, #0x40]
        add     r11, r11, #2
        add     r9, r9, #0x10
        cmp     r11, r12
        add     r10, r10, #0x10
        blt     LCQB5
        ldr     r10, [sp, #0x24]
        ldr     r9, [sp, #0x2C]
        ldr     r7, [sp, #0x44]
        ldr     r5, [sp, #0x4C]
        ldr     r8, [sp, #0x30]
        ldr     r11, [sp, #0x50]
LCQB6:
        mov     r0, r4
        mov     r1, r6
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        str     r0, [r7, #4]
        str     r1, [r7, #8]!
        mov     r0, r4
        mov     r1, r6
        mov     r2, r9
        mov     r3, r10
        bl      __subdf3
        rsb     r2, r8, #0
        str     r0, [r5, +r2, lsl #3]
        add     r2, r5, r2, lsl #3
        str     r1, [r2, #4]
        ldr     r0, [sp, #0x28]
        add     r8, r8, #1
        cmp     r8, r0
        blt     LCQB4
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LCQB7:
        ldr     r2, [r5, #8]
        ldr     r10, [sp, #0x50]
        mov     r0, r4
        str     r2, [sp, #0x2C]
        ldr     r3, [r5, #0xC]
        mov     r1, r10
        str     r3, [sp, #0x28]
        bl      __adddf3
        mov     r2, r1
        str     r2, [sp, #0x20]
        mov     r8, r6, asr #1
        str     r0, [sp, #0x24]
        cmp     r8, #1
        add     r1, r5, #8
        str     r2, [sp, #0xC]
        str     r4, [sp, #4]
        str     r10, [sp]
        ble     LCQB11
        sub     r3, r8, #1
        cmp     r3, #4
        blt     LCQB19
        sub     lr, r9, #4
        str     lr, [sp, #0x4C]
        sub     lr, r9, #0xC
        str     lr, [sp, #0x48]
        str     r6, [sp, #0x3C]
        str     r7, [sp, #0x40]
        ldr     r7, [sp, #0x48]
        ldr     r6, [sp, #0x4C]
        sub     lr, r5, #0x1C
        mov     r2, #1
        mov     r11, #0
        add     r3, r9, #8
        sub     r12, r8, #4
        sub     r10, r5, #0x14
        str     r4, [sp, #0x34]
        str     r5, [sp, #0x10]
        str     lr, [sp, #0x44]
        str     r11, [sp, #0x14]
        str     r3, [sp, #0x1C]
        str     r12, [sp, #0x18]
        str     r0, [sp, #8]
        str     r8, [sp, #0x30]
        str     r9, [sp, #0x38]
        mov     r5, r1
        mov     r4, r2
LCQB8:
        ldr     r3, [sp, #0x44]
        add     r11, r4, #1
        mov     r2, #0
        ldr     r0, [r3, #0x2C]
        ldr     r1, [r3, #0x30]
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        mov     r8, r0
        mov     r9, r1
        bl      __adddf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        str     r0, [sp, #0xC]
        str     r1, [sp, #8]
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        str     r8, [r7, #0xC]
        str     r9, [r7, #0x10]
        ldr     r3, [r10, #0x2C]
        ldr     r2, [r10, #0x30]!
        str     r1, [sp]
        str     r0, [sp, #4]
        mov     r0, r3
        mov     r1, r2
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r0, [r6, #0xC]
        str     r1, [r6, #0x10]
        ldr     r3, [sp, #0x10]
        mov     r2, #0
        ldr     r0, [r3, +r11, lsl #4]
        add     r3, r3, r11, lsl #4
        ldr     r1, [r3, #4]
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        mov     r8, r0
        mov     r9, r1
        bl      __adddf3
        ldr     r3, [sp]
        ldr     r2, [sp, #4]
        str     r0, [sp, #0xC]
        str     r1, [sp, #8]
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        str     r8, [r7, #0x1C]
        str     r9, [r7, #0x20]
        ldr     r2, [r5, +r11, lsl #4]
        add     r11, r5, r11, lsl #4
        ldr     r3, [r11, #4]
        str     r1, [sp]
        str     r0, [sp, #4]
        mov     r0, r2
        mov     r1, r3
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r1, [r6, #0x20]
        str     r0, [r6, #0x1C]
        ldr     r0, [sp, #0x10]
        add     r11, r4, #2
        mov     r2, #0
        add     r4, r4, #3
        add     r3, r0, r11, lsl #4
        ldr     r1, [r3, #4]
        ldr     r0, [r0, +r11, lsl #4]
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        mov     r9, r0
        mov     r8, r1
        bl      __adddf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        mov     r0, r9
        mov     r1, r8
        bl      __subdf3
        str     r9, [r7, #0x2C]
        str     r8, [r7, #0x30]!
        ldr     r2, [r5, +r11, lsl #4]
        str     r1, [sp]
        str     r0, [sp, #4]
        add     r11, r5, r11, lsl #4
        ldr     r1, [r11, #4]
        mov     r0, r2
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        str     r0, [r6, #0x2C]
        str     r1, [r6, #0x30]!
        ldr     r0, [sp, #0x18]
        cmp     r4, r0
        ldr     r0, [sp, #0x44]
        add     r0, r0, #0x30
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #6
        str     r0, [sp, #0x14]
        ble     LCQB8
        mov     r2, r4
        mov     r1, r5
        ldr     r11, [sp, #0x14]
        ldr     r3, [sp, #0x1C]
        ldr     r0, [sp, #8]
        ldr     r8, [sp, #0x30]
        ldr     r4, [sp, #0x34]
        ldr     r9, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x40]
        ldr     r5, [sp, #0x10]
LCQB9:
        mov     lr, r11, lsl #3
        mov     r12, r2, lsl #4
        sub     lr, lr, #0xC
        add     r10, lr, r3
        sub     r12, r12, #0xC
        str     r10, [sp, #0x18]
        add     r10, lr, r9
        add     r5, r12, r5
        add     r1, r12, r1
        str     r8, [sp, #0x30]
        str     r4, [sp, #0x34]
        str     r9, [sp, #0x38]
        str     r7, [sp, #0x40]
        str     r3, [sp, #0x1C]
        str     r6, [sp, #0x3C]
        mov     r4, r0
        mov     r8, r1
        mov     r7, r2
        mov     r9, r5
LCQB10:
        ldr     r0, [r9, #0xC]
        ldr     r1, [r9, #0x10]!
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r3, [sp, #0xC]
        mov     r6, r0
        mov     r5, r1
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        str     r1, [sp, #0xC]
        mov     r4, r0
        mov     r0, r6
        mov     r1, r5
        bl      __subdf3
        str     r6, [r10, #0xC]
        str     r5, [r10, #0x10]!
        ldr     r3, [r8, #0xC]
        ldr     r2, [r8, #0x10]!
        str     r0, [sp, #4]
        str     r1, [sp]
        mov     r0, r3
        mov     r1, r2
        mov     r2, #0
        mov     r3, #1, 2
        bl      __muldf3
        ldr     r3, [sp, #0x1C]
        str     r0, [r3, +r11, lsl #3]
        ldr     r3, [sp, #0x18]
        add     r7, r7, #1
        str     r1, [r3, #0x10]
        ldr     r3, [sp, #0x30]
        cmp     r7, r3
        ldr     r3, [sp, #0x18]
        add     r11, r11, #2
        add     r3, r3, #0x10
        str     r3, [sp, #0x18]
        blt     LCQB10
        mov     r0, r4
        ldr     r8, [sp, #0x30]
        ldr     r4, [sp, #0x34]
        ldr     r9, [sp, #0x38]
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x40]
LCQB11:
        str     r0, [r7]
        ldr     r3, [sp, #0xC]
        tst     r8, #1
        add     r5, r7, r8, lsl #3
        str     r3, [r7, #4]
        beq     LCQB12
        ldr     r0, [sp, #4]
        ldr     r1, [sp]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        bl      __subdf3
        b       LCQB13
LCQB12:
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x28]
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        bl      __subdf3
LCQB13:
        str     r0, [r7, +r8, lsl #3]
        cmp     r8, #1
        str     r1, [r5, #4]
        ble     LCQB17
        mov     r0, r4
        ldr     r3, [sp, #0x28]
        ldr     r1, [sp, #0x50]
        ldr     r2, [sp, #0x2C]
        mov     r5, #1
        bl      __subdf3
        sub     r3, r6, #2
        add     r12, r9, #8
        add     r4, r7, r6, lsl #3
        add     r10, r7, #4
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     r3, [sp, #0x28]
        str     r9, [sp, #0x38]
        str     r6, [sp, #0x3C]
LCQB14:
        tst     r5, #1
        ldreq   r7, [sp, #0x24]
        ldreq   r6, [sp, #0x20]
        ldrne   r7, [sp, #0x14]
        ldrne   r6, [sp, #0x18]
        ldr     r12, [sp, #0x28]
        mov     r0, r5
        cmp     r12, #0
        movle   r11, #0
        movle   r9, r11
        ble     LCQB16
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x38]
        mov     r1, #0
        mov     r9, r1
        mov     r11, r9
        str     r8, [sp, #0x30]
        ldr     r8, [sp, #0x3C]
        str     r11, [sp, #0x40]
        str     r9, [sp, #0x34]
        str     r10, [sp, #0x1C]
        str     r4, [sp, #0xC]
        str     r5, [sp, #0x2C]
        mov     r4, r0
        mov     r11, r1
        mov     r9, r2
        mov     r10, r3
LCQB15:
        ldr     r12, [sp, #0x54]
        ldr     r0, [r10]
        ldr     r1, [r10, #4]
        add     r5, r12, r4, lsl #4
        ldr     r2, [r12, +r4, lsl #4]
        ldr     r3, [r5, #4]
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [r5, #8]
        ldr     r3, [r5, #0xC]
        ldr     lr, [r9]
        ldr     r12, [r9, #4]
        mov     r7, r0
        mov     r6, r1
        mov     r0, lr
        mov     r1, r12
        bl      __muldf3
        ldr     r2, [sp, #0x34]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        ldr     r12, [sp, #0x2C]
        str     r0, [sp, #0x34]
        add     r4, r12, r4
        cmp     r4, r8
        str     r1, [sp, #0x40]
        subge   r4, r4, r8
        ldr     r12, [sp, #0x28]
        add     r11, r11, #2
        add     r9, r9, #0x10
        cmp     r11, r12
        add     r10, r10, #0x10
        blt     LCQB15
        ldr     r11, [sp, #0x40]
        ldr     r9, [sp, #0x34]
        ldr     r10, [sp, #0x1C]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
LCQB16:
        mov     r0, r7
        mov     r1, r6
        mov     r2, r9
        mov     r3, r11
        bl      __adddf3
        str     r0, [r10, #4]
        str     r1, [r10, #8]!
        mov     r0, r7
        mov     r1, r6
        mov     r2, r9
        mov     r3, r11
        bl      __subdf3
        rsb     r2, r5, #0
        str     r0, [r4, +r2, lsl #3]
        add     r5, r5, #1
        add     r2, r4, r2, lsl #3
        cmp     r5, r8
        str     r1, [r2, #4]
        blt     LCQB14
LCQB17:
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LCQB18:
        mov     r8, #1
        add     r12, r9, #8
        sub     lr, r5, #8
        b       LCQB1
LCQB19:
        mov     r2, #1
        mov     r11, #0
        add     r3, r9, #8
        b       LCQB9


