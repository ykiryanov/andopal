        .text
        .align  4
        .globl  _ippiSumsDiff8x8Blocks4x4_8u16s_C1


_ippiSumsDiff8x8Blocks4x4_8u16s_C1:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r12, [sp, #0x50]
        ldr     lr, [sp, #0x54]
        cmp     r0, #0
        beq     LKIY7
        cmp     r2, #0
        beq     LKIY7
        cmp     r12, #0
        beq     LKIY7
        cmp     lr, #0
        mov     r4, #0
        beq     LKIY3
        mov     r6, #0
        mov     r5, #2
        str     lr, [sp, #0x28]
LKIY0:
        mov     r8, r6
        mov     lr, #0
        mov     r9, #2
        str     r6, [sp, #0x18]
        str     r5, [sp, #0x1C]
        str     r3, [sp, #0x24]
        str     r1, [sp, #0x20]
LKIY1:
        strh    r4, [r12, +lr]
        mov     r7, #0
        ldr     r4, [sp, #0x24]
        mov     r11, r7
        add     r3, r2, #2
        mov     r1, r8
        str     r8, [sp, #0x10]
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #0x28]
        ldr     r8, [sp, #0x20]
        mov     r10, r11
        mov     r6, r10
        add     r5, r0, #2
        str     r10, [sp, #4]
        str     r11, [sp]
        str     r9, [sp, #0x14]
        str     r0, [sp, #8]
LKIY2:
        ldr     r0, [sp, #8]
        mov     r9, r1, lsl #1
        add     r1, r1, #4
        ldrb    r10, [r6, +r0]
        ldr     r0, [sp, #0xC]
        add     r6, r6, r8
        ldrb    r11, [r7, +r0]
        add     r0, r2, r9
        add     r7, r7, r4
        sub     r10, r10, r11
        ldr     r11, [sp]
        add     r11, r11, r10
        strh    r11, [r12, +lr]
        strh    r10, [r2, +r9]
        ldrb    r10, [r5, #-1]
        ldrb    r11, [r3, #-1]
        ldrsh   r9, [r12, +lr]
        sub     r10, r10, r11
        add     r9, r9, r10
        strh    r9, [r12, +lr]
        strh    r10, [r0, #2]
        ldrb    r9, [r5]
        ldr     r11, [sp, #4]
        str     r9, [sp]
        ldrb    r9, [r3]
        ldrsh   r10, [r12, +lr]
        add     r11, r11, #1
        str     r11, [sp, #4]
        cmp     r11, #4
        ldr     r11, [sp]
        sub     r9, r11, r9
        add     r10, r10, r9
        strh    r10, [r12, +lr]
        strh    r9, [r0, #4]
        ldrb    r10, [r5, #1]
        ldrb    r11, [r3, #1]
        ldrsh   r9, [r12, +lr]
        add     r5, r5, r8
        add     r3, r3, r4
        sub     r10, r10, r11
        add     r9, r9, r10
        strh    r9, [r12, +lr]
        strh    r10, [r0, #6]
        ldrccsh r0, [r12, +lr]
        strcc   r0, [sp]
        bcc     LKIY2
        ldr     r9, [sp, #0x14]
        ldr     r8, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r0, [sp, #8]
        subs    r9, r9, #1
        mov     r4, #0
        add     r2, r2, #4
        add     r0, r0, #4
        add     lr, lr, #2
        add     r8, r8, #0x10
        bne     LKIY1
        ldr     r5, [sp, #0x1C]
        ldr     r3, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        ldr     r6, [sp, #0x18]
        subs    r5, r5, #1
        add     r0, r0, r1, lsl #2
        add     r2, r2, r3, lsl #2
        sub     r0, r0, #8
        sub     r2, r2, #8
        add     r12, r12, #4
        add     r6, r6, #0x20
        bne     LKIY0
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LKIY3:
        mov     r5, #2
LKIY4:
        mov     lr, #0
        mov     r11, #2
        str     r5, [sp, #0x28]
LKIY5:
        mov     r10, #0
        strh    r4, [r12, +lr]
        mov     r9, r10
        add     r8, r0, #2
        mov     r7, r9
        add     r6, r2, #2
        mov     r5, #4
        str     r11, [sp, #0x1C]
LKIY6:
        ldrb    r11, [r9, +r0]
        ldrb    r4, [r7, +r2]
        add     r9, r9, r1
        add     r7, r7, r3
        subs    r5, r5, #1
        sub     r11, r11, r4
        add     r11, r10, r11
        mov     r4, r11, lsl #16
        mov     r4, r4, asr #16
        strh    r4, [r12, +lr]
        ldrb    r11, [r8, #-1]
        ldrb    r10, [r6, #-1]
        sub     r11, r11, r10
        add     r11, r4, r11
        mov     r4, r11, lsl #16
        mov     r4, r4, asr #16
        strh    r4, [r12, +lr]
        ldrb    r11, [r8]
        ldrb    r10, [r6]
        sub     r11, r11, r10
        add     r11, r4, r11
        mov     r4, r11, lsl #16
        mov     r4, r4, asr #16
        strh    r4, [r12, +lr]
        ldrb    r11, [r8, #1]
        ldrb    r10, [r6, #1]
        add     r8, r8, r1
        add     r6, r6, r3
        sub     r11, r11, r10
        add     r11, r4, r11
        mov     r4, r11, lsl #16
        mov     r10, r4, asr #16
        strh    r10, [r12, +lr]
        bne     LKIY6
        ldr     r11, [sp, #0x1C]
        mov     r4, #0
        add     r2, r2, #4
        subs    r11, r11, #1
        add     r0, r0, #4
        add     lr, lr, #2
        bne     LKIY5
        ldr     r5, [sp, #0x28]
        add     r0, r0, r1, lsl #2
        add     r2, r2, r3, lsl #2
        subs    r5, r5, #1
        sub     r0, r0, #8
        sub     r2, r2, #8
        add     r12, r12, #4
        bne     LKIY4
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LKIY7:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


