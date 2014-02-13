        .text
        .align  4
        .globl  _ippsConvCyclic8x8_16s_Sfs


_ippsConvCyclic8x8_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5C
        add     r5, sp, #0x3C
        mov     r4, r0
        mov     r0, r5
        mov     r7, r1
        mov     r6, r2
        mov     r2, #0x20
        mov     r1, #0
        mov     r5, r3
        bl      __intel_memset
        ldrsh   r8, [r7, #0xE]
        add     lr, sp, #0x1C
        ldrsh   r11, [r7, #0xC]
        strh    r8, [lr, #0x10]
        add     r12, sp, #0x1C
        strh    r8, [r12]
        ldrsh   r10, [r7, #0xA]
        ldrsh   r9, [r7, #8]
        ldrsh   r1, [r7, #4]
        ldrsh   r8, [r7, #2]
        ldrsh   r0, [r7]
        ldrsh   r2, [r7, #6]
        strh    r10, [r12, #4]
        strh    r9, [r12, #6]
        strh    r1, [r12, #0xA]
        strh    r8, [r12, #0xC]
        strh    r11, [r12, #2]
        strh    r10, [lr, #0x14]
        strh    r9, [lr, #0x16]
        strh    r1, [lr, #0x1A]
        strh    r8, [lr, #0x1C]
        strh    r11, [lr, #0x12]
        strh    r0, [r12, #0xE]
        strh    r2, [r12, #8]
        ldrsh   r10, [r4, #2]
        ldrsh   r9, [r4, #4]
        ldrsh   r1, [r4, #8]
        ldrsh   r8, [r4, #0xA]
        ldrsh   r11, [r4]
        ldrsh   r7, [r4, #6]
        ldrsh   r12, [r4, #0xC]
        ldrsh   r4, [r4, #0xE]
        strh    r0, [lr, #0x1E]
        strh    r2, [lr, #0x18]
        add     lr, lr, #0x10
        mov     r0, #0
        str     r4, [sp, #4]
        str     r8, [sp]
        str     r1, [sp, #0xC]
        str     r9, [sp, #0x10]
        str     r10, [sp, #8]
        str     r5, [sp, #0x14]
        str     r6, [sp, #0x18]
LCXJ0:
        sub     lr, lr, #2
        add     r2, sp, #0x3C
        ldr     r6, [r2, +r0, lsl #2]
        ldrsh   r5, [lr]
        ldrsh   r1, [lr, #2]
        ldrsh   r2, [lr, #4]
        ldrsh   r3, [lr, #6]
        mla     r9, r11, r5, r6
        ldr     r10, [sp, #8]
        ldrsh   r4, [lr, #8]
        ldrsh   r5, [lr, #0xA]
        ldrsh   r6, [lr, #0xC]
        mla     r9, r10, r1, r9
        ldr     r1, [sp, #0x10]
        ldrsh   r8, [lr, #0xE]
        mla     r9, r1, r2, r9
        ldr     r1, [sp, #0xC]
        mla     r3, r7, r3, r9
        mla     r3, r1, r4, r3
        ldr     r1, [sp]
        mla     r3, r1, r5, r3
        ldr     r1, [sp, #4]
        mla     r6, r12, r6, r3
        mla     r6, r1, r8, r6
        add     r1, sp, #0x3C
        str     r6, [r1, +r0, lsl #2]
        add     r0, r0, #1
        cmp     r0, #8
        blt     LCXJ0
        ldr     r5, [sp, #0x14]
        ldr     r6, [sp, #0x18]
        add     r8, sp, #0x3C
        cmp     r5, #0
        blt     LCXJ1
        cmp     r5, #0
        ble     LCXJ3
        ldr     r1, [r8]
        ldr     r12, [r8, #4]
        ldr     lr, [r8, #8]
        ldr     r4, [r8, #0xC]
        ldr     r7, [r8, #0x10]
        ldr     r0, [r8, #0x14]
        ldr     r9, [r8, #0x18]
        ldr     r10, [r8, #0x1C]
        mov     r1, r1, asr r5
        mov     r12, r12, asr r5
        mov     lr, lr, asr r5
        mov     r4, r4, asr r5
        mov     r7, r7, asr r5
        mov     r0, r0, asr r5
        mov     r9, r9, asr r5
        mov     r5, r10, asr r5
        str     r1, [r8]
        str     r12, [r8, #4]
        str     lr, [r8, #8]
        str     r4, [r8, #0xC]
        str     r7, [r8, #0x10]
        str     r0, [r8, #0x14]
        str     r9, [r8, #0x18]
        b       LCXJ2
LCXJ1:
        ldr     r1, [r8]
        ldr     r12, [r8, #4]
        ldr     lr, [r8, #8]
        ldr     r4, [r8, #0xC]
        ldr     r7, [r8, #0x10]
        ldr     r0, [r8, #0x14]
        ldr     r9, [r8, #0x18]
        ldr     r3, [r8, #0x1C]
        rsb     r5, r5, #0
        mov     r1, r1, lsl r5
        mov     r12, r12, lsl r5
        mov     lr, lr, lsl r5
        mov     r4, r4, lsl r5
        mov     r7, r7, lsl r5
        mov     r0, r0, lsl r5
        mov     r9, r9, lsl r5
        mov     r5, r3, lsl r5
        str     r1, [r8]
        str     r12, [r8, #4]
        str     lr, [r8, #8]
        str     r4, [r8, #0xC]
        str     r7, [r8, #0x10]
        str     r0, [r8, #0x14]
        str     r9, [r8, #0x18]
LCXJ2:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r3, r3
        mov     r8, #0
        cmp     r3, r1
        sub     r8, r8, #2, 18
        movlt   r1, r3
        cmp     r1, r8
        mov     r10, r8
        movgt   r10, r1
        cmp     r3, r12
        movlt   r12, r3
        cmp     r12, r8
        mov     r1, r8
        movgt   r1, r12
        cmp     r3, lr
        movlt   lr, r3
        strh    r1, [r6, #2]
        mov     r1, r8
        cmp     lr, r8
        movgt   r1, lr
        cmp     r3, r4
        movlt   r4, r3
        cmp     r4, r8
        mov     r12, r8
        movgt   r12, r4
        cmp     r3, r7
        movlt   r7, r3
        cmp     r7, r8
        mov     lr, r8
        movgt   lr, r7
        cmp     r3, r0
        movlt   r0, r3
        cmp     r0, r8
        mov     r4, r8
        movgt   r4, r0
        cmp     r3, r9
        movlt   r9, r3
        cmp     r9, r8
        mov     r0, r8
        movgt   r0, r9
        cmp     r3, r5
        movlt   r5, r3
        cmp     r5, r8
        strh    r0, [r6, #0xC]
        movgt   r8, r5
        mov     r0, #0
        strh    r10, [r6]
        strh    r1, [r6, #4]
        strh    r12, [r6, #6]
        strh    lr, [r6, #8]
        strh    r4, [r6, #0xA]
        strh    r8, [r6, #0xE]
        add     sp, sp, #0x5C
        ldmia   sp!, {r4 - r11, pc}
LCXJ3:
        ldr     r1, [r8]
        ldr     r12, [r8, #4]
        ldr     lr, [r8, #8]
        ldr     r4, [r8, #0xC]
        ldr     r7, [r8, #0x10]
        ldr     r0, [r8, #0x14]
        ldr     r9, [r8, #0x18]
        ldr     r5, [r8, #0x1C]
        b       LCXJ2


