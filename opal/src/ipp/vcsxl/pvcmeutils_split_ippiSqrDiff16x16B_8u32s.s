        .text
        .align  4
        .globl  ippiSqrDiff16x16B_8u32s


ippiSqrDiff16x16B_8u32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        ldr     r6, [sp, #0x58]
        ldr     r12, [sp, #0x5C]
        ldr     r4, [sp, #0x60]
        ldr     lr, [sp, #0x64]
        ldr     r5, [sp, #0x68]
        cmp     r0, #0
        str     r1, [sp, #0x1C]
        beq     LEJV2
        cmp     r2, #0
        beq     LEJV2
        cmp     r12, #0
        beq     LEJV2
        cmp     r5, #0
        beq     LEJV2
        ands    r1, r6, #8
        mov     r8, #0
        mov     r9, r8
        mov     r10, #1
        movne   r9, r10
        ands    r1, r6, #4
        mov     r7, r8
        movne   r7, r10
        cmp     r6, #0
        mla     r6, r3, r7, r2
        mov     r1, r8
        movne   r1, r10
        mov     r7, r8
        mov     r11, r8
        mov     r1, r1, lsl #1
        and     r1, r1, #0xFF
        str     r1, [sp, #0x14]
        ands    r1, lr, #8
        movne   r7, r10
        ands    r1, lr, #4
        movne   r11, r10
        mla     r1, r4, r11, r12
        cmp     lr, #0
        mov     lr, r8
        movne   lr, r10
        add     r10, r2, r9
        mov     lr, lr, lsl #1
        and     lr, lr, #0xFF
        add     r11, r6, r9
        add     r9, r12, r7
        str     lr, [sp, #0x18]
        add     r7, r1, r7
        mov     lr, #0x10
        str     r8, [sp, #8]
        str     r5, [sp, #0xC]
        str     r4, [sp, #4]
        str     r3, [sp]
LEJV0:
        mov     r3, #0x10
        str     lr, [sp, #0x10]
LEJV1:
        ldrb    lr, [r9], #1
        ldrb    r5, [r12], #1
        ldrb    r4, [r2], #1
        str     lr, [sp, #0x20]
        ldrb    lr, [r1], #1
        subs    r3, r3, #1
        str     lr, [sp, #0x24]
        ldrb    r8, [r10], #1
        ldrb    lr, [r7], #1
        str     r8, [sp, #0x28]
        ldrb    r8, [r6], #1
        str     r8, [sp, #0x2C]
        ldrb    r8, [r11], #1
        str     r8, [sp, #0x30]
        ldr     r8, [sp, #0x18]
        add     r5, r8, r5
        ldr     r8, [sp, #0x14]
        add     r4, r8, r4
        ldr     r8, [sp, #0x20]
        add     r8, r5, r8
        ldr     r5, [sp, #0x24]
        str     r8, [sp, #0x20]
        ldr     r8, [sp, #0x30]
        add     r5, r5, lr
        ldr     lr, [sp, #0x28]
        add     lr, r4, lr
        ldr     r4, [sp, #0x2C]
        add     r4, r4, r8
        ldr     r8, [sp, #0x20]
        add     r4, lr, r4
        add     r5, r8, r5
        ldrb    r8, [r0], #1
        mov     r5, r5, asr #2
        add     r4, r5, r4, asr #2
        add     lr, r4, #1
        ldr     r4, [sp, #8]
        rsb     lr, r8, lr, asr #1
        mla     r4, lr, lr, r4
        str     r4, [sp, #8]
        bne     LEJV1
        ldr     r3, [sp, #0x1C]
        ldr     lr, [sp, #0x10]
        add     r0, r0, r3
        ldr     r3, [sp]
        sub     r0, r0, #0x10
        subs    lr, lr, #1
        add     r2, r2, r3
        add     r10, r10, r3
        add     r6, r6, r3
        add     r3, r11, r3
        str     r2, [sp, #0x30]
        ldr     r2, [sp, #4]
        str     r10, [sp, #0x2C]
        str     r3, [sp, #0x24]
        ldr     r3, [sp, #0x2C]
        str     r6, [sp, #0x28]
        add     r12, r12, r2
        sub     r10, r3, #0x10
        ldr     r3, [sp, #0x28]
        add     r9, r9, r2
        add     r1, r1, r2
        add     r7, r7, r2
        ldr     r2, [sp, #0x30]
        sub     r6, r3, #0x10
        ldr     r3, [sp, #0x24]
        sub     r12, r12, #0x10
        sub     r2, r2, #0x10
        sub     r9, r9, #0x10
        sub     r11, r3, #0x10
        sub     r1, r1, #0x10
        sub     r7, r7, #0x10
        bne     LEJV0
        ldr     r8, [sp, #8]
        ldr     r5, [sp, #0xC]
        mov     r0, #0
        str     r8, [r5]
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LEJV2:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}


