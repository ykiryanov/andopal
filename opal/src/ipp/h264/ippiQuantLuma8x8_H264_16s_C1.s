        .text
        .align  4
        .globl  _ippiQuantLuma8x8_H264_16s_C1


_ippiQuantLuma8x8_H264_16s_C1:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     lr, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        ldr     r5, [sp, #0x44]
        ldr     r4, [sp, #0x48]
        cmp     r0, #0
        beq     LLCS4
        cmp     r1, #0
        beq     LLCS4
        cmp     lr, #0
        beq     LLCS4
        cmp     r12, #0
        beq     LLCS4
        cmp     r5, #0
        beq     LLCS4
        cmp     r4, #0
        beq     LLCS4
        cmp     r2, #0
        blt     LLCS3
        cmp     r2, #8
        bgt     LLCS3
        cmp     r3, #0
        mov     r3, #0x56
        orr     r3, r3, #1, 24
        add     r6, r2, #1
        addne   r3, r3, #0x55, 30
        mov     r3, r3, lsl r6
        mov     r9, #0
        add     r2, r2, #0xC
        mov     r8, r9
        mov     r6, r1
        mov     r7, #8
        str     r4, [sp, #0xC]
        str     r5, [sp, #0x10]
        str     r1, [sp, #0x14]
LLCS0:
        mov     r10, r0
        mov     r5, r12
        mov     r4, r6
        mov     r1, lr
        mov     r11, #8
        str     r6, [sp]
        str     lr, [sp, #4]
        str     r7, [sp, #8]
LLCS1:
        ldrsh   r7, [r10], #2
        cmp     r7, #0
        rsblt   r7, r7, #0
        movlt   lr, #1
        movge   lr, #0
        ldrsh   r6, [r5], #2
        cmp     lr, #0
        mla     r7, r6, r7, r3
        mov     lr, r7, asr r2
        rsbne   lr, lr, #0
        strh    lr, [r4], #2
        cmp     lr, #0
        beq     LLCS2
        ldrsh   lr, [r1]
        add     r8, r8, #1
        cmp     r9, lr
        movlt   r9, lr
LLCS2:
        subs    r11, r11, #1
        add     r1, r1, #2
        bne     LLCS1
        ldr     r7, [sp, #8]
        ldr     r6, [sp]
        ldr     lr, [sp, #4]
        subs    r7, r7, #1
        add     r0, r0, #0x10
        add     r12, r12, #0x10
        add     r6, r6, #0x10
        add     lr, lr, #0x10
        bne     LLCS0
        ldr     r1, [sp, #0x14]
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #0x10]
        ldrsh   r1, [r1]
        cmp     r1, #0
        rsbne   r8, r8, #0
        str     r8, [r5]
        mov     r0, #0
        str     r9, [r4]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LLCS3:
        mvn     r0, #0xBF
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LLCS4:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


