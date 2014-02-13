        .text
        .align  4
        .globl  _ippsRandUniform_Direct_32f


_ippsRandUniform_Direct_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r7, [sp, #0x50]
        mov     r11, r0
        cmp     r11, #0
        mov     r10, r1
        mov     r6, r2
        mov     r4, r3
        beq     LAZQ3
        cmp     r7, #0
        beq     LAZQ3
        cmp     r10, #0
        ble     LAZQ4
        mov     r0, r4
        mov     r1, r6
        bl      __subsf3
        bl      __extendsfdf2
        mov     r12, #0xFE, 12
        orr     r8, r12, #3, 4
        sub     r3, r8, #0x1F, 12
        mov     r2, #7
        bl      __muldf3
        mov     r9, r0
        mov     r5, r1
        mov     r0, r6
        mov     r1, r4
        bl      __addsf3
        bl      __extendsfdf2
        mov     r3, r8
        mov     r2, #0
        bl      __muldf3
        ldr     lr, [pc, #0x290]
        ldr     r2, [r7]
        ldr     r6, [pc, #0x28C]
        mov     r3, r0
        mul     r8, r2, lr
        cmp     r10, #4
        mvn     r12, #0
        add     r0, r8, r6
        mul     lr, r0, lr
        add     r6, lr, r6
        ldrlt   r4, [pc, #0x270]
        movlt   r8, #0
        blt     LAZQ1
        ldr     r4, [pc, #0x264]
        sub     lr, r10, #4
        mov     r8, #0
        str     lr, [sp, #0x18]
        str     r7, [sp, #0xC]
        add     lr, r11, #4
        str     r4, [sp, #4]
        str     r8, [sp]
        str     r10, [sp, #0x10]
        str     r11, [sp, #0x14]
        mov     r7, r5
        str     r12, [sp, #8]
        mov     r8, r0
        mov     r4, r1
        mov     r11, r2
        mov     r5, r3
        mov     r10, lr
LAZQ0:
        ldr     r12, [pc, #0x218]
        ldr     r0, [sp, #4]
        sub     r6, r8, r6
        sub     r8, r11, r8
        mul     r12, r0, r12
        ldr     r0, [sp, #8]
        str     r8, [sp, #8]
        add     r6, r6, r0
        mov     r8, r6, asr #31
        and     r0, r8, #0x12
        sub     r6, r6, r0
        ldr     r0, [pc, #0x1F0]
        sub     r11, r6, r11
        add     r12, r12, r0
        ldr     r0, [pc, #0x1E0]
        mul     r0, r12, r0
        str     r0, [sp, #4]
        add     r0, r6, r12
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r7
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r12, [sp, #8]
        add     r8, r12, r8
        bl      __truncdfsf2
        str     r0, [r10, #-4]
        ldr     r0, [sp, #4]
        mov     r12, r8, asr #31
        str     r12, [sp, #8]
        and     r12, r12, #0x12
        sub     r8, r8, r12
        ldr     r12, [pc, #0x194]
        add     r12, r0, r12
        ldr     r0, [pc, #0x188]
        mul     r0, r12, r0
        str     r0, [sp, #4]
        add     r0, r8, r12
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r7
        bl      __muldf3
        ldr     r12, [sp, #8]
        add     r11, r11, r12
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r2, [sp, #4]
        ldr     r1, [pc, #0x150]
        mov     r12, r11, asr #31
        str     r12, [sp, #8]
        and     r12, r12, #0x12
        add     r1, r2, r1
        str     r1, [sp, #4]
        sub     r11, r11, r12
        ldr     r12, [sp, #4]
        str     r0, [r10]
        add     r1, r11, r12
        mov     r0, r1
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r7
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r12, [sp]
        add     r12, r12, #3
        str     r12, [sp]
        str     r0, [r10, #4]
        ldr     r12, [sp, #0x18]
        ldr     r0, [sp]
        add     r10, r10, #0xC
        cmp     r0, r12
        ble     LAZQ0
        mov     r1, r4
        mov     r3, r5
        mov     r5, r7
        mov     r0, r8
        mov     r2, r11
        ldr     r4, [sp, #4]
        ldr     r8, [sp]
        ldr     r12, [sp, #8]
        ldr     r7, [sp, #0xC]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0x14]
LAZQ1:
        add     r11, r11, r8, lsl #2
        str     r9, [sp, #0x20]
        str     r7, [sp, #0xC]
        mov     r9, r11
        str     r1, [sp, #0x1C]
        str     r3, [sp, #0x24]
        str     r5, [sp, #0x28]
        mov     r11, r2
        mov     r7, r12
LAZQ2:
        ldr     lr, [pc, #0x8C]
        ldr     r3, [pc, #0x8C]
        sub     r6, r0, r6
        mul     r4, r4, lr
        add     lr, r6, r7
        mov     r6, r0
        mov     r7, lr, asr #31
        and     r0, r7, #0x12
        sub     r5, lr, r0
        add     r4, r4, r3
        add     r0, r5, r4
        bl      __floatsidf
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x28]
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        bl      __truncdfsf2
        mov     r1, r0
        add     r8, r8, #1
        mov     r0, r11
        str     r1, [r9], #4
        cmp     r8, r10
        mov     r11, r5
        blt     LAZQ2
        ldr     r7, [sp, #0xC]
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LAZQ3:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LAZQ4:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x00010dcd
        .long   0x3c6ef373
        .long   0x436cbae9


