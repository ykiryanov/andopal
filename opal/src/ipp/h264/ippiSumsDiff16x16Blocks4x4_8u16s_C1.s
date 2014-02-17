        .text
        .align  4
        .globl  ippiSumsDiff16x16Blocks4x4_8u16s_C1


ippiSumsDiff16x16Blocks4x4_8u16s_C1:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r12, [sp, #0x4C]
        ldr     lr, [sp, #0x50]
        cmp     r0, #0
        beq     LKIZ7
        cmp     r2, #0
        beq     LKIZ7
        cmp     r12, #0
        beq     LKIZ7
        cmp     lr, #0
        beq     LKIZ3
        mov     r5, #0
        mov     r4, #4
LKIZ0:
        mov     r9, r5
        mov     r11, #0
        mov     r10, #4
        str     r5, [sp, #0x14]
        str     r4, [sp, #0x18]
        str     r3, [sp, #0x20]
        str     r1, [sp, #0x24]
LKIZ1:
        mov     r4, r9
        str     r9, [sp, #8]
        str     r10, [sp, #0xC]
        ldr     r9, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        mov     r8, #0
        mov     r1, r8
        mov     r7, r1
        add     r6, r0, #2
        add     r5, r2, #2
        mov     r3, #4
        str     r11, [sp, #0x10]
        str     r12, [sp, #0x1C]
        str     r2, [sp, #4]
        str     r0, [sp]
LKIZ2:
        ldr     r0, [sp]
        subs    r3, r3, #1
        ldrb    r12, [r7, +r0]
        ldr     r0, [sp, #4]
        add     r7, r7, r10
        ldrb    r11, [r8, +r0]
        mov     r0, r4, lsl #1
        add     r2, lr, r0
        add     r8, r8, r9
        sub     r11, r12, r11
        strh    r11, [lr, +r0]
        ldrb    r12, [r5, #-1]
        ldrb    r0, [r6, #-1]
        add     r11, r1, r11
        add     r4, r4, #4
        sub     r12, r0, r12
        strh    r12, [r2, #2]
        ldrb    r0, [r6]
        ldrb    r1, [r5]
        add     r11, r11, r12
        sub     r12, r0, r1
        strh    r12, [r2, #4]
        ldrb    r0, [r6, #1]
        ldrb    r1, [r5, #1]
        add     r11, r11, r12
        add     r6, r6, r10
        add     r5, r5, r9
        sub     r0, r0, r1
        add     r1, r11, r0
        strh    r0, [r2, #6]
        bne     LKIZ2
        ldr     r10, [sp, #0xC]
        ldr     r11, [sp, #0x10]
        ldr     r9, [sp, #8]
        ldr     r12, [sp, #0x1C]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        subs    r10, r10, #1
        strh    r1, [r12, +r11]
        add     r11, r11, #2
        add     r2, r2, #4
        add     r0, r0, #4
        add     r9, r9, #0x10
        bne     LKIZ1
        ldr     r4, [sp, #0x18]
        ldr     r3, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        ldr     r5, [sp, #0x14]
        subs    r4, r4, #1
        add     r0, r0, r1, lsl #2
        add     r2, r2, r3, lsl #2
        sub     r0, r0, #0x10
        sub     r2, r2, #0x10
        add     r12, r12, #8
        add     r5, r5, #0x40
        bne     LKIZ0
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LKIZ3:
        mov     lr, #4
LKIZ4:
        mov     r8, #0
        mov     r7, #4
        str     lr, [sp, #0x18]
        str     r3, [sp, #0x20]
        str     r1, [sp, #0x24]
LKIZ5:
        mov     r1, #0
        mov     r6, r1
        add     r5, r0, #2
        mov     r4, r6
        add     lr, r2, #2
        mov     r3, #4
        str     r7, [sp, #0x10]
        str     r8, [sp, #0x14]
        str     r12, [sp, #0x1C]
        str     r2, [sp, #4]
        str     r0, [sp]
LKIZ6:
        ldr     r0, [sp]
        ldr     r2, [sp, #4]
        ldrb    r12, [lr, #-1]
        ldrb    r0, [r6, +r0]
        ldrb    r7, [r5]
        ldrb    r11, [r4, +r2]
        ldrb    r2, [r5, #-1]
        ldrb    r8, [lr]
        ldrb    r9, [r5, #1]
        ldrb    r10, [lr, #1]
        sub     r0, r0, r11
        sub     r2, r2, r12
        add     r0, r1, r0
        add     r2, r0, r2
        ldr     r0, [sp, #0x24]
        sub     r7, r7, r8
        add     r7, r2, r7
        sub     r9, r9, r10
        add     r6, r6, r0
        add     r5, r5, r0
        ldr     r0, [sp, #0x20]
        subs    r3, r3, #1
        add     r1, r7, r9
        add     r4, r4, r0
        add     lr, lr, r0
        bne     LKIZ6
        ldr     r7, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        ldr     r12, [sp, #0x1C]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
        strh    r1, [r12, +r8]
        subs    r7, r7, #1
        add     r8, r8, #2
        add     r2, r2, #4
        add     r0, r0, #4
        bne     LKIZ5
        ldr     lr, [sp, #0x18]
        ldr     r3, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        subs    lr, lr, #1
        add     r12, r12, #8
        add     r0, r0, r1, lsl #2
        add     r2, r2, r3, lsl #2
        sub     r0, r0, #0x10
        sub     r2, r2, #0x10
        bne     LKIZ4
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LKIZ7:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


