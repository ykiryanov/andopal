        .text
        .align  4
        .globl  _ippsRandUniform_Direct_64f


_ippsRandUniform_Direct_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r8, [sp, #0x58]
        ldr     r7, [sp, #0x5C]
        ldr     r10, [sp, #0x60]
        mov     r5, r0
        cmp     r5, #0
        mov     r11, r1
        mov     r4, r2
        mov     r6, r3
        beq     LAZP3
        cmp     r10, #0
        beq     LAZP3
        cmp     r11, #0
        ble     LAZP4
        mov     r0, r8
        mov     r1, r7
        mov     r2, r4
        mov     r3, r6
        bl      __subdf3
        mov     r12, #0xFE, 12
        orr     r9, r12, #3, 4
        sub     r3, r9, #0x1F, 12
        mov     r2, #7
        bl      __muldf3
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x20]
        mov     r0, r4
        mov     r1, r6
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        mov     r3, r9
        mov     r2, #0
        bl      __muldf3
        ldr     lr, [pc, #0x298]
        ldr     r4, [r10]
        ldr     r12, [pc, #0x294]
        mov     r2, r0
        mul     r6, r4, lr
        cmp     r11, #4
        mvn     r9, #0
        add     r0, r6, r12
        mul     lr, r0, lr
        add     r6, lr, r12
        ldrlt   r7, [pc, #0x278]
        movlt   r8, #0
        blt     LAZP1
        ldr     r7, [pc, #0x26C]
        mov     r8, #0
        str     r8, [sp, #4]
        str     r6, [sp]
        ldr     r6, [sp, #0x20]
        ldr     r8, [sp, #0x1C]
        str     r10, [sp, #0x10]
        sub     r12, r11, #4
        sub     r3, r5, #4
        str     r9, [sp, #8]
        str     r11, [sp, #0x14]
        str     r5, [sp, #0x18]
        mov     r10, r4
        str     r12, [sp, #0xC]
        mov     r9, r0
        mov     r4, r1
        mov     r5, r2
        mov     r11, r3
LAZP0:
        ldr     r12, [pc, #0x21C]
        ldr     r0, [pc, #0x21C]
        ldr     lr, [sp]
        mul     r12, r7, r12
        ldr     r7, [sp, #8]
        sub     lr, r9, lr
        sub     r9, r10, r9
        add     lr, lr, r7
        str     r9, [sp, #8]
        add     r12, r12, r0
        ldr     r0, [pc, #0x1F4]
        mov     r7, lr, asr #31
        and     r9, r7, #0x12
        mul     r0, r12, r0
        sub     lr, lr, r9
        str     lr, [sp]
        str     r0, [sp, #0x2C]
        add     r0, lr, r12
        bl      __floatsidf
        mov     r2, r8
        mov     r3, r6
        bl      __muldf3
        ldr     r12, [pc, #0x1C8]
        ldr     lr, [sp, #0x2C]
        mov     r2, r5
        add     r12, lr, r12
        ldr     lr, [pc, #0x1B4]
        str     r12, [sp, #0x2C]
        mov     r3, r4
        mul     lr, r12, lr
        ldr     r12, [sp, #8]
        add     r12, r12, r7
        str     lr, [sp, #0x30]
        mov     r7, r12, asr #31
        and     lr, r7, #0x12
        str     lr, [sp, #8]
        ldr     lr, [sp, #8]
        sub     r9, r12, lr
        bl      __adddf3
        ldr     r12, [sp, #0x2C]
        str     r0, [r11, #4]
        add     r2, r9, r12
        str     r1, [r11, #8]
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r8
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r12, [sp]
        str     r0, [r11, #0xC]
        sub     r10, r12, r10
        add     r12, r10, r7
        ldr     r10, [sp, #0x30]
        ldr     r7, [pc, #0x140]
        mov     lr, r12, asr #31
        str     lr, [sp, #8]
        and     lr, lr, #0x12
        add     r7, r10, r7
        sub     r10, r12, lr
        add     r0, r10, r7
        str     r1, [r11, #0x10]
        bl      __floatsidf
        mov     r2, r8
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r12, [sp, #4]
        add     r12, r12, #3
        str     r12, [sp, #4]
        str     r0, [r11, #0x14]
        str     r1, [r11, #0x18]!
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #4]
        cmp     lr, r12
        ble     LAZP0
        mov     r1, r4
        mov     r4, r10
        mov     r2, r5
        mov     r0, r9
        ldr     r8, [sp, #4]
        ldr     r6, [sp]
        ldr     r9, [sp, #8]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        ldr     r5, [sp, #0x18]
LAZP1:
        mov     r12, r8, lsl #3
        str     r10, [sp, #0x10]
        ldr     r10, [sp, #0x1C]
        sub     r12, r12, #4
        add     r5, r12, r5
        str     r1, [sp, #0x24]
        str     r2, [sp, #0x28]
        str     r11, [sp, #0x14]
LAZP2:
        ldr     r3, [pc, #0x94]
        ldr     r1, [pc, #0x94]
        sub     r6, r0, r6
        mul     r7, r7, r3
        add     r3, r6, r9
        mov     r6, r0
        mov     r9, r3, asr #31
        and     r0, r9, #0x12
        sub     r11, r3, r0
        add     r7, r7, r1
        add     r0, r11, r7
        bl      __floatsidf
        ldr     r3, [sp, #0x20]
        mov     r2, r10
        bl      __muldf3
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x24]
        bl      __adddf3
        str     r1, [r5, #8]
        mov     r2, r0
        str     r2, [r5, #4]
        ldr     r1, [sp, #0x14]
        add     r8, r8, #1
        mov     r0, r4
        cmp     r8, r1
        mov     r4, r11
        add     r5, r5, #8
        blt     LAZP2
        ldr     r10, [sp, #0x10]
        mov     r0, #0
        str     r11, [r10]
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LAZP3:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LAZP4:
        mvn     r0, #5
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
        .long   0x00010dcd
        .long   0x3c6ef373
        .long   0x436cbae9


