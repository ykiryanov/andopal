        .text
        .align  4
        .globl  _ippsWTHaarFwd_64f


_ippsWTHaarFwd_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        cmp     r0, #0
        beq     LAJM5
        cmp     r2, #0
        beq     LAJM5
        cmp     r3, #0
        beq     LAJM5
        cmp     r1, #0
        ble     LAJM6
        sub     r12, r1, #1
        cmp     r12, #0
        mov     r8, #0
        movle   r7, r8
        ble     LAJM3
        sub     lr, r1, #1
        cmp     lr, #8
        movlt   r7, r8
        addlt   r10, r0, #8
        blt     LAJM1
        mov     r7, r8
        add     r10, r0, #8
        sub     r9, r1, #9
        str     r10, [sp, #0x14]
        sub     r11, r2, #4
        sub     r6, r3, #4
        sub     r5, r0, #4
        sub     r4, r0, #0xC
        str     r12, [sp, #0xC]
        str     r3, [sp, #0x10]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
        mov     r10, r9
LAJM0:
        ldr     r0, [r5, #0xC]
        ldr     r1, [r5, #0x10]
        ldr     r2, [r4, #0xC]
        ldr     r3, [r4, #0x10]
        mov     r9, #0xFE, 12
        bl      __subdf3
        orr     r9, r9, #3, 4
        mov     r2, #0
        mov     r3, r9
        bl      __muldf3
        str     r0, [r6, #4]
        str     r1, [r6, #8]
        ldr     r2, [r4, #0xC]
        ldr     r3, [r4, #0x10]
        bl      __adddf3
        str     r0, [r11, #4]
        str     r1, [r11, #8]
        ldr     r0, [r5, #0x1C]
        ldr     r1, [r5, #0x20]
        ldr     r2, [r4, #0x1C]
        ldr     r3, [r4, #0x20]
        bl      __subdf3
        mov     r2, #0
        mov     r3, r9
        bl      __muldf3
        str     r0, [r6, #0xC]
        str     r1, [r6, #0x10]
        ldr     r2, [r4, #0x1C]
        ldr     r3, [r4, #0x20]
        bl      __adddf3
        str     r0, [r11, #0xC]
        str     r1, [r11, #0x10]
        ldr     r0, [r5, #0x2C]
        ldr     r1, [r5, #0x30]!
        ldr     r2, [r4, #0x2C]
        ldr     r3, [r4, #0x30]
        bl      __subdf3
        mov     r2, #0
        mov     r3, r9
        bl      __muldf3
        str     r0, [r6, #0x14]
        str     r1, [r6, #0x18]!
        ldr     r2, [r4, #0x2C]
        ldr     r3, [r4, #0x30]!
        bl      __adddf3
        add     r8, r8, #6
        str     r0, [r11, #0x14]
        str     r1, [r11, #0x18]!
        cmp     r8, r10
        add     r7, r7, #3
        ble     LAJM0
        ldr     r10, [sp, #0x14]
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LAJM1:
        mov     r4, r7, lsl #3
        mov     lr, r8, lsl #3
        sub     r4, r4, #4
        sub     lr, lr, #0xC
        add     r5, r4, r3
        add     r6, r4, r2
        add     r9, lr, r10
        add     r4, lr, r0
        str     r12, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LAJM2:
        ldr     r0, [r10, +r8, lsl #3]
        ldr     r1, [r9, #0x10]!
        ldr     r2, [r4, #0xC]
        ldr     r3, [r4, #0x10]
        mov     r12, #0xFE, 12
        orr     r11, r12, #3, 4
        bl      __subdf3
        mov     r3, r11
        mov     r2, #0
        bl      __muldf3
        str     r0, [r5, #4]
        str     r1, [r5, #8]!
        ldr     r2, [r4, #0xC]
        ldr     r3, [r4, #0x10]!
        bl      __adddf3
        str     r0, [r6, #4]
        str     r1, [r6, #8]!
        ldr     r0, [sp, #0xC]
        add     r8, r8, #2
        cmp     r8, r0
        add     r7, r7, #1
        blt     LAJM2
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LAJM3:
        tst     r1, #1
        beq     LAJM4
        ldr     r1, [r0, +r8, lsl #3]
        add     r8, r0, r8, lsl #3
        ldr     r0, [r8, #4]
        str     r1, [r2, +r7, lsl #3]
        add     r7, r2, r7, lsl #3
        str     r0, [r7, #4]
LAJM4:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAJM5:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAJM6:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


