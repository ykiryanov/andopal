        .text
        .align  4
        .globl  _ipps_rDftFwd_Dir_64f


_ipps_rDftFwd_Dir_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        mov     r8, r0
        ldr     r7, [r8]
        ldr     r6, [r8, #4]
        ldr     r11, [sp, #0x6C]
        mov     r9, r2
        tst     r9, #1
        mov     r10, r1
        str     r3, [sp, #0x3C]
        beq     LCQC5
        add     r3, r9, #1
        mov     r5, r7
        mov     r12, r3, asr #1
        cmp     r12, #1
        mov     r4, r6
        ble     LCQC1
        add     r0, r8, r9, lsl #3
        add     r8, r8, #4
        str     r9, [sp, #0x2C]
        mov     r1, #1
        sub     lr, r11, #4
        sub     r2, r11, #0xC
        str     r7, [sp, #0x24]
        str     r10, [sp, #0x30]
        mov     r9, r8
        str     lr, [sp, #0x38]
        str     r12, [sp, #0x1C]
        str     r6, [sp, #0x20]
        str     r11, [sp, #0x28]
        mov     r7, r0
        mov     r8, r1
        mov     r10, r2
LCQC0:
        ldr     r0, [r9, #4]
        ldr     r1, [r9, #8]
        rsb     r11, r8, #0
        add     r12, r7, r11, lsl #3
        str     r12, [sp, #0x34]
        ldr     r3, [r12, #4]
        ldr     r2, [r7, +r11, lsl #3]
        add     r8, r8, #1
        bl      __adddf3
        str     r1, [sp, #0x18]
        mov     r6, r0
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        str     r6, [r10, #0xC]
        ldr     r12, [sp, #0x18]
        mov     r5, r0
        mov     r4, r1
        str     r12, [r10, #0x10]!
        ldr     r12, [sp, #0x34]
        ldr     r2, [r9, #4]
        ldr     r3, [r9, #8]!
        ldr     r6, [r12, #4]
        ldr     r11, [r7, +r11, lsl #3]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r11
        mov     r3, r6
        bl      __subdf3
        ldr     r12, [sp, #0x38]
        str     r0, [r12, #0xC]
        str     r1, [r12, #0x10]
        ldr     r12, [sp, #0x1C]
        cmp     r8, r12
        ldr     r12, [sp, #0x38]
        add     r12, r12, #0x10
        str     r12, [sp, #0x38]
        blt     LCQC0
        ldr     r12, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        ldr     r11, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
LCQC1:
        cmp     r12, #1
        str     r5, [r10]
        str     r4, [r10, #4]
        ble     LCQC13
        sub     r3, r10, #8
        add     lr, r3, #4
        add     r3, r11, #8
        add     r0, r10, #4
        mov     r2, #1
        sub     r1, r9, #1
        str     r3, [sp, #0x18]
        str     r7, [sp, #0x24]
        str     r11, [sp, #0x28]
        str     r9, [sp, #0x2C]
LCQC2:
        ldr     r4, [sp, #0x24]
        cmp     r1, #0
        mov     r5, r6
        mov     r10, r2
        movle   r3, #0
        movle   r11, r3
        ble     LCQC4
        mov     r9, #0
        mov     r11, r9
        ldr     r7, [sp, #0x18]
        ldr     r8, [sp, #0x28]
        mov     r3, r11
        str     r11, [sp, #4]
        ldr     r11, [sp, #0x2C]
        str     r3, [sp]
        str     r0, [sp, #0x10]
        str     lr, [sp, #0x14]
        str     r1, [sp, #0xC]
        str     r2, [sp, #8]
        str     r12, [sp, #0x1C]
        str     r6, [sp, #0x20]
LCQC3:
        ldr     r12, [sp, #0x3C]
        ldr     r0, [r8]
        ldr     r1, [r8, #4]
        add     r6, r12, r10, lsl #4
        ldr     r2, [r12, +r10, lsl #4]
        ldr     r3, [r6, #4]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [r6, #8]
        ldr     r3, [r6, #0xC]
        ldr     lr, [r7]
        ldr     r12, [r7, #4]
        mov     r4, r0
        mov     r5, r1
        mov     r0, lr
        mov     r1, r12
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        bl      __adddf3
        ldr     r12, [sp, #8]
        str     r0, [sp, #4]
        add     r10, r12, r10
        cmp     r10, r11
        str     r1, [sp]
        subge   r10, r10, r11
        ldr     r12, [sp, #0xC]
        add     r9, r9, #2
        add     r7, r7, #0x10
        cmp     r9, r12
        add     r8, r8, #0x10
        blt     LCQC3
        ldr     r3, [sp]
        ldr     r11, [sp, #4]
        ldr     r0, [sp, #0x10]
        ldr     lr, [sp, #0x14]
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r12, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
LCQC4:
        str     r4, [lr, #0xC]
        str     r5, [lr, #0x10]!
        add     r2, r2, #1
        str     r11, [r0, #0xC]
        str     r3, [r0, #0x10]!
        cmp     r2, r12
        blt     LCQC2
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LCQC5:
        mov     r4, r9, asr #1
        ldr     r5, [r8, +r4, lsl #3]
        add     r3, r8, r4, lsl #3
        ldr     r3, [r3, #4]
        mov     r0, r7
        mov     r1, r6
        str     r3, [sp, #0xC]
        mov     r2, r5
        bl      __adddf3
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x38]
        cmp     r4, #1
        mov     r2, r7
        mov     r3, r6
        ble     LCQC7
        add     lr, r8, r9, lsl #3
        str     lr, [sp, #0x14]
        sub     lr, r11, #4
        str     lr, [sp, #0x18]
        sub     lr, r11, #0xC
        str     lr, [sp, #0x1C]
        str     r7, [sp, #0x24]
        str     r9, [sp, #0x2C]
        ldr     r7, [sp, #0x1C]
        ldr     r9, [sp, #0x14]
        mov     r12, #1
        str     r5, [sp, #0x10]
        str     r4, [sp]
        str     r6, [sp, #0x20]
        add     r8, r8, #4
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r11, [sp, #0x28]
        str     r10, [sp, #0x30]
        mov     r5, r0
        mov     r4, r3
        mov     r6, r12
LCQC6:
        rsb     r10, r6, #0
        str     r10, [sp, #0x40]
        ldr     r0, [r8, #4]
        ldr     r1, [r8, #8]
        add     lr, r9, r10, lsl #3
        str     lr, [sp, #0x44]
        ldr     r2, [r9, +r10, lsl #3]
        ldr     r3, [lr, #4]
        bl      __adddf3
        ldr     r3, [sp, #4]
        mov     r10, r1
        mov     r11, r0
        mov     r2, r5
        bl      __adddf3
        ldr     r2, [sp, #8]
        str     r1, [sp, #4]
        mov     r5, r0
        mov     r1, r10
        mov     r0, r11
        mov     r3, r4
        bl      __subdf3
        str     r10, [r7, #0x10]
        str     r11, [r7, #0xC]
        ldr     lr, [sp, #0x40]
        ldr     r3, [r8, #4]
        ldr     r2, [r8, #8]!
        ldr     r10, [r9, +lr, lsl #3]
        ldr     lr, [sp, #0x44]
        mov     r4, r1
        ldr     r11, [lr, #4]
        str     r0, [sp, #8]
        mov     r0, r3
        mov     r1, r2
        mov     r2, r10
        mov     r3, r11
        bl      __subdf3
        ldr     lr, [sp, #0x18]
        add     r6, r6, #1
        str     r0, [lr, #0xC]
        str     r1, [lr, #0x10]
        ldr     lr, [sp]
        add     r7, r7, #0x10
        cmp     r6, lr
        ldr     lr, [sp, #0x18]
        add     lr, lr, #0x10
        str     lr, [sp, #0x18]
        blt     LCQC6
        mov     r3, r4
        mov     r0, r5
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r5, [sp, #0x10]
        ldr     r4, [sp]
        ldr     r6, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        ldr     r11, [sp, #0x28]
        ldr     r9, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
LCQC7:
        tst     r4, #1
        str     r0, [r10]
        str     r1, [r10, #4]
        beq     LCQC8
        mov     r0, r2
        mov     r1, r3
        mov     r2, r5
        ldr     r3, [sp, #0xC]
        bl      __subdf3
        b       LCQC9
LCQC8:
        mov     r0, r5
        ldr     r1, [sp, #0xC]
        bl      __subdf3
LCQC9:
        cmp     r4, #1
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        ble     LCQC13
        mov     r0, r7
        mov     r1, r6
        mov     r2, r5
        ldr     r3, [sp, #0xC]
        bl      __subdf3
        mov     r3, r0
        mov     r5, r1
        mov     r1, #1
        sub     r0, r9, #2
        add     lr, r11, #8
        add     r12, r10, #4
        add     r2, r10, #0xC
        str     r5, [sp, #0xC]
        str     r3, [sp, #8]
        str     r11, [sp, #0x28]
        str     r9, [sp, #0x2C]
LCQC10:
        tst     r1, #1
        ldreq   r6, [sp, #0x34]
        ldreq   r5, [sp, #0x38]
        ldrne   r6, [sp, #8]
        ldrne   r5, [sp, #0xC]
        cmp     r0, #0
        mov     r10, r1
        movle   r3, #0
        movle   r11, r3
        ble     LCQC12
        mov     r9, #0
        mov     r8, lr
        mov     r11, r9
        ldr     r7, [sp, #0x28]
        mov     r3, r11
        str     r11, [sp, #0x20]
        ldr     r11, [sp, #0x2C]
        str     r3, [sp, #0x24]
        str     r2, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     lr, [sp, #4]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        str     r4, [sp]
LCQC11:
        ldr     r12, [sp, #0x3C]
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        add     r4, r12, r10, lsl #4
        ldr     r2, [r12, +r10, lsl #4]
        ldr     r3, [r4, #4]
        bl      __muldf3
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [r4, #8]
        ldr     r3, [r4, #0xC]
        ldr     lr, [r8]
        ldr     r12, [r8, #4]
        mov     r6, r0
        mov     r5, r1
        mov     r0, lr
        mov     r1, r12
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x24]
        bl      __adddf3
        ldr     r12, [sp, #0x1C]
        str     r0, [sp, #0x20]
        add     r10, r12, r10
        cmp     r10, r11
        str     r1, [sp, #0x24]
        subge   r10, r10, r11
        ldr     r12, [sp, #0x18]
        add     r9, r9, #2
        add     r8, r8, #0x10
        cmp     r9, r12
        add     r7, r7, #0x10
        blt     LCQC11
        ldr     r3, [sp, #0x24]
        ldr     r11, [sp, #0x20]
        ldr     r2, [sp, #0x14]
        ldr     r12, [sp, #0x10]
        ldr     lr, [sp, #4]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        ldr     r4, [sp]
LCQC12:
        str     r6, [r12, #0xC]
        str     r5, [r12, #0x10]!
        add     r1, r1, #1
        str     r11, [r2, #0xC]
        str     r3, [r2, #0x10]!
        cmp     r1, r4
        blt     LCQC10
LCQC13:
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}


