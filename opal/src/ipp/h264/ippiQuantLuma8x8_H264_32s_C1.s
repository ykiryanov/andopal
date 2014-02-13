        .text
        .align  4
        .globl  _ippiQuantLuma8x8_H264_32s_C1


_ippiQuantLuma8x8_H264_32s_C1:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     lr, [sp, #0x50]
        ldr     r12, [sp, #0x54]
        ldr     r7, [sp, #0x58]
        ldr     r6, [sp, #0x5C]
        cmp     r0, #0
        mov     r8, r1
        beq     LLCG4
        cmp     r8, #0
        beq     LLCG4
        cmp     lr, #0
        beq     LLCG4
        cmp     r12, #0
        beq     LLCG4
        cmp     r7, #0
        beq     LLCG4
        cmp     r6, #0
        beq     LLCG4
        cmp     r2, #0
        blt     LLCG3
        cmp     r2, #0xE
        bgt     LLCG3
        cmp     r3, #0
        mov     r3, #0x56
        orr     r3, r3, #1, 24
        add     r5, r2, #1
        addne   r3, r3, #0x55, 30
        add     r4, r2, #0xC
        mov     r10, #0
        mov     r2, r3, lsl r5
        mov     r9, r10
        mov     r5, r4, asr #31
        mov     r11, r8
        mov     r1, #8
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x20]
        str     r2, [sp, #0x28]
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        str     r8, [sp]
LLCG0:
        mov     r7, r11
        mov     r9, r0
        mov     r8, r12
        mov     r6, lr
        mov     r10, #8
        str     r11, [sp, #0x1C]
        str     r0, [sp, #0x18]
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r1, [sp, #0xC]
LLCG1:
        ldr     r1, [r9], #4
        cmp     r1, #0
        rsblt   r1, r1, #0
        movlt   r11, #1
        movge   r11, #0
        ldrsh   r0, [r8], #2
        ldr     r12, [sp, #0x28]
        smull   r0, r1, r0, r1
        mov     r2, r4
        mov     r3, r5
        adds    r0, r12, r0
        adc     r1, r1, r12, asr #31
        bl      __ashrdi3
        cmp     r11, #0
        rsbne   r0, r0, #0
        str     r0, [r7], #4
        cmp     r0, #0
        beq     LLCG2
        ldr     r1, [sp, #0x24]
        ldrsh   r0, [r6]
        add     r1, r1, #1
        str     r1, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        cmp     r1, r0
        strlt   r0, [sp, #0x20]
LLCG2:
        subs    r10, r10, #1
        add     r6, r6, #2
        bne     LLCG1
        ldr     r1, [sp, #0xC]
        ldr     r11, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        ldr     r12, [sp, #0x14]
        ldr     lr, [sp, #0x10]
        subs    r1, r1, #1
        add     r0, r0, #0x20
        add     r12, r12, #0x10
        add     lr, lr, #0x10
        add     r11, r11, #0x20
        bne     LLCG0
        ldr     r8, [sp]
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x20]
        ldr     r8, [r8]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #4]
        cmp     r8, #0
        rsbne   r9, r9, #0
        str     r9, [r7]
        mov     r0, #0
        str     r10, [r6]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LLCG3:
        mvn     r0, #0xBF
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LLCG4:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


