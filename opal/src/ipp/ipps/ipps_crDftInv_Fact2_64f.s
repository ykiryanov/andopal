        .text
        .align  4
        .globl  _ipps_crDftInv_Fact2_64f


_ipps_crDftInv_Fact2_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r12, [sp, #0x4C]
        mov     r6, r0
        mov     r4, r3
        str     r12, [sp]
        ldr     r7, [r6]
        ldr     r10, [r6, #4]
        ldr     r11, [r6, +r4, lsl #4]
        mov     r8, r1
        mov     r5, r2
        add     r9, r6, r4, lsl #4
        ldr     r3, [r9, #4]
        mov     r0, r7
        mov     r1, r10
        mov     r2, r11
        str     r3, [sp, #0x14]
        bl      __adddf3
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0x10]
        str     r1, [sp, #0xC]
        mov     r0, r7
        mov     r1, r10
        mov     r2, r11
        bl      __subdf3
        str     r1, [sp, #8]
        str     r0, [sp, #0x14]
        ldr     r0, [r6, #8]
        str     r0, [sp, #4]
        ldr     r11, [r6, #0xC]
        ldr     r10, [r9, #8]
        ldr     r7, [r9, #0xC]
        mov     r1, r11
        mov     r2, r10
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0x18]
        ldr     r0, [sp, #4]
        str     r1, [sp, #0x1C]
        mov     r1, r11
        mov     r2, r10
        mov     r3, r7
        bl      __subdf3
        ldr     r12, [sp, #0x10]
        str     r12, [r8]
        ldr     r12, [sp, #0xC]
        cmp     r4, #1
        str     r12, [r8, #4]
        ldr     r12, [sp, #0x18]
        str     r12, [r5]
        ldr     r12, [sp, #0x1C]
        str     r12, [r5, #4]
        ldr     r12, [sp, #0x14]
        str     r12, [r8, +r4, lsl #3]
        ldr     lr, [sp, #8]
        add     r12, r8, r4, lsl #3
        str     lr, [r12, #4]
        str     r0, [r5, +r4, lsl #3]
        add     lr, r5, r4, lsl #3
        str     r1, [lr, #4]
        ble     LCOH1
        ldr     r0, [sp]
        add     r7, r6, #0xC
        add     r9, r9, #4
        add     r6, r0, #4
        add     r0, lr, #4
        add     r12, r12, #4
        add     r5, r5, #4
        add     r8, r8, #4
        sub     r4, r4, #1
        str     r4, [sp, #8]
        str     r8, [sp, #0x14]
        str     r5, [sp, #0xC]
        str     r12, [sp, #0x10]
        str     r0, [sp]
        str     r9, [sp, #4]
LCOH0:
        ldr     r2, [sp, #4]
        ldr     r3, [r6, #0xC]
        ldr     r8, [r2, #0x14]
        ldr     r9, [r2, #0x18]
        str     r3, [sp, #0x1C]
        ldr     r3, [r2, #0xC]
        str     r3, [sp, #0x18]
        ldr     r3, [r2, #0x10]!
        str     r2, [sp, #4]
        ldr     r2, [sp, #0x1C]
        str     r3, [sp, #0x20]
        ldr     r3, [r6, #0x10]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x20]
        str     r3, [sp, #0x24]
        ldr     r10, [r6, #0x18]
        ldr     r11, [r6, #0x14]
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r3, r10
        mov     r1, r9
        mov     r2, r11
        mov     r0, r8
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x24]
        mov     r5, r1
        mov     r4, r0
        mov     r0, r8
        mov     r1, r9
        bl      __muldf3
        mov     r8, r0
        ldr     r0, [sp, #0x18]
        mov     r9, r1
        ldr     r1, [sp, #0x20]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        ldr     r10, [r7, #4]
        ldr     r11, [r7, #8]
        mov     r8, r0
        mov     r9, r1
        mov     r2, r4
        mov     r3, r5
        mov     r0, r10
        mov     r1, r11
        bl      __adddf3
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x20]
        mov     r0, r10
        mov     r1, r11
        mov     r2, r4
        mov     r3, r5
        bl      __subdf3
        str     r1, [sp, #0x1C]
        ldr     r5, [r7, #0xC]
        ldr     r4, [r7, #0x10]!
        mov     r11, r0
        mov     r2, r8
        mov     r3, r9
        mov     r0, r5
        mov     r1, r4
        bl      __adddf3
        str     r0, [sp, #0x18]
        mov     r10, r1
        mov     r0, r5
        mov     r1, r4
        mov     r2, r8
        mov     r3, r9
        bl      __subdf3
        ldr     r3, [sp, #0x24]
        ldr     r2, [sp, #0x14]
        add     r6, r6, #0x10
        str     r3, [r2, #4]
        ldr     r3, [sp, #0x20]
        str     r3, [r2, #8]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #0x18]
        str     r10, [r3, #8]
        str     r2, [r3, #4]
        ldr     r2, [sp, #0x10]
        str     r11, [r2, #4]
        ldr     r3, [sp, #0x1C]
        str     r3, [r2, #8]
        ldr     r2, [sp]
        str     r0, [r2, #4]
        str     r1, [r2, #8]!
        ldr     r0, [sp, #8]
        str     r2, [sp]
        subs    r0, r0, #1
        str     r0, [sp, #8]
        ldr     r0, [sp, #0x10]
        add     r0, r0, #8
        str     r0, [sp, #0x10]
        ldr     r0, [sp, #0xC]
        add     r0, r0, #8
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x14]
        add     r0, r0, #8
        str     r0, [sp, #0x14]
        ldr     r0, [sp, #8]
        bne     LCOH0
LCOH1:
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


