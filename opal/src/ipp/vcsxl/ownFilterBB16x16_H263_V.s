        .text
        .align  4
        .globl  ownFilterBB16x16_H263_V


ownFilterBB16x16_H263_V:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldrb    r2, [r0, #-1]
        ldrb    r3, [r0]
        sub     r5, r0, #1
        add     r9, r5, r1
        add     r12, r2, r3
        add     r12, r12, #2
        add     r2, r12, r2, lsl #1
        add     r3, r12, r3, lsl #1
        mov     r2, r2, asr #2
        mov     r3, r3, asr #2
        strb    r2, [r0, #-1]
        strb    r3, [r0]
        ldrb    r6, [r1, +r5]
        ldrb    r3, [r9, #1]
        add     r4, r9, r1
        add     r12, r4, r1
        add     lr, r12, r1
        add     r7, r6, r3
        add     r7, r7, #2
        add     r6, r7, r6, lsl #1
        add     r7, r7, r3, lsl #1
        mov     r6, r6, asr #2
        strb    r6, [r1, +r5]
        mov     r7, r7, asr #2
        strb    r7, [r9, #1]
        ldrb    r10, [r4, #1]
        ldrb    r11, [r1, +r9]
        add     r0, lr, r1
        add     r2, r0, r1
        add     r3, r2, r1
        add     r8, r11, r10
        add     r8, r8, #2
        add     r11, r8, r11, lsl #1
        add     r10, r8, r10, lsl #1
        mov     r11, r11, asr #2
        mov     r10, r10, asr #2
        strb    r10, [r4, #1]
        strb    r11, [r1, +r9]
        ldrb    r11, [r1, +r4]
        add     r5, r3, r1
        add     r6, r5, r1
        str     r11, [sp]
        ldrb    r9, [r12, #1]
        add     r7, r6, r1
        add     r10, r7, r1
        str     r9, [sp, #4]
        add     r9, r11, r9
        ldr     r11, [sp]
        add     r8, r10, r1
        str     r8, [sp, #8]
        add     r8, r8, r1
        add     r9, r9, #2
        add     r11, r9, r11, lsl #1
        str     r11, [sp]
        ldr     r11, [sp, #4]
        str     r9, [sp, #0xC]
        ldr     r9, [sp, #0xC]
        add     r11, r9, r11, lsl #1
        str     r11, [sp, #0xC]
        ldr     r11, [sp]
        add     r9, r8, r1
        mov     r11, r11, asr #2
        str     r11, [sp, #4]
        ldr     r11, [sp, #0xC]
        mov     r11, r11, asr #2
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #4]
        strb    r11, [r1, +r4]
        ldr     r4, [sp, #0xC]
        strb    r4, [r12, #1]
        ldrb    r4, [r1, +r12]
        str     r4, [sp, #0xC]
        ldrb    r4, [lr, #1]
        str     r4, [sp, #4]
        ldr     r11, [sp, #4]
        add     r4, r9, r1
        str     r4, [sp]
        ldr     r4, [sp, #0xC]
        add     r11, r4, r11
        add     r4, r11, #2
        ldr     r11, [sp, #0xC]
        str     r4, [sp, #0x10]
        add     r11, r4, r11, lsl #1
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #4]
        ldr     r4, [sp, #0x10]
        add     r11, r4, r11, lsl #1
        ldr     r4, [sp, #0xC]
        str     r11, [sp, #0x10]
        mov     r4, r4, asr #2
        strb    r4, [r1, +r12]
        ldr     r12, [sp, #0x10]
        mov     r12, r12, asr #2
        strb    r12, [lr, #1]
        ldrb    r12, [r0, #1]
        ldrb    r4, [r1, +lr]
        str     r12, [sp, #0x10]
        ldr     r11, [sp, #0x10]
        add     r12, r4, r12
        add     r12, r12, #2
        add     r4, r12, r4, lsl #1
        add     r12, r12, r11, lsl #1
        mov     r4, r4, asr #2
        strb    r4, [r1, +lr]
        mov     r12, r12, asr #2
        strb    r12, [r0, #1]
        ldrb    r4, [r1, +r0]
        ldrb    r12, [r2, #1]
        add     lr, r4, r12
        add     lr, lr, #2
        add     r4, lr, r4, lsl #1
        add     r12, lr, r12, lsl #1
        mov     r4, r4, asr #2
        strb    r4, [r1, +r0]
        mov     r12, r12, asr #2
        strb    r12, [r2, #1]
        ldrb    lr, [r1, +r2]
        ldrb    r0, [r3, #1]
        add     r12, lr, r0
        add     r12, r12, #2
        add     lr, r12, lr, lsl #1
        add     r0, r12, r0, lsl #1
        mov     lr, lr, asr #2
        strb    lr, [r1, +r2]
        mov     r0, r0, asr #2
        strb    r0, [r3, #1]
        ldrb    r0, [r5, #1]
        ldrb    r12, [r1, +r3]
        add     r2, r12, r0
        add     r2, r2, #2
        add     r0, r2, r0, lsl #1
        add     r12, r2, r12, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r1, +r3]
        mov     r0, r0, asr #2
        strb    r0, [r5, #1]
        ldrb    r0, [r6, #1]
        ldrb    r3, [r1, +r5]
        add     r2, r3, r0
        add     r2, r2, #2
        add     r0, r2, r0, lsl #1
        add     r3, r2, r3, lsl #1
        mov     r3, r3, asr #2
        strb    r3, [r1, +r5]
        mov     r0, r0, asr #2
        strb    r0, [r6, #1]
        ldrb    r3, [r1, +r6]
        ldrb    r0, [r7, #1]
        add     r2, r3, r0
        add     r2, r2, #2
        add     r3, r2, r3, lsl #1
        add     r0, r2, r0, lsl #1
        mov     r0, r0, asr #2
        strb    r0, [r7, #1]
        mov     r3, r3, asr #2
        strb    r3, [r1, +r6]
        ldrb    r3, [r1, +r7]
        ldrb    r0, [r10, #1]
        add     r2, r3, r0
        add     r2, r2, #2
        add     r3, r2, r3, lsl #1
        add     r0, r2, r0, lsl #1
        mov     r0, r0, asr #2
        strb    r0, [r10, #1]
        mov     r3, r3, asr #2
        strb    r3, [r1, +r7]
        ldr     r0, [sp, #8]
        ldrb    r2, [r1, +r10]
        ldrb    r0, [r0, #1]
        add     r3, r2, r0
        add     r3, r3, #2
        add     r2, r3, r2, lsl #1
        add     r0, r3, r0, lsl #1
        mov     r2, r2, asr #2
        strb    r2, [r1, +r10]
        ldr     r2, [sp, #8]
        mov     r0, r0, asr #2
        strb    r0, [r2, #1]
        ldrb    r2, [r1, +r2]
        ldrb    r0, [r8, #1]
        add     r3, r2, r0
        add     r3, r3, #2
        add     r2, r3, r2, lsl #1
        add     r0, r3, r0, lsl #1
        ldr     r3, [sp, #8]
        mov     r2, r2, asr #2
        mov     r0, r0, asr #2
        strb    r0, [r8, #1]
        strb    r2, [r1, +r3]
        ldrb    r0, [r9, #1]
        ldrb    r3, [r1, +r8]
        add     r2, r3, r0
        add     r2, r2, #2
        add     r0, r2, r0, lsl #1
        add     r3, r2, r3, lsl #1
        mov     r0, r0, asr #2
        strb    r0, [r9, #1]
        mov     r3, r3, asr #2
        strb    r3, [r1, +r8]
        ldr     r0, [sp]
        ldrb    r2, [r1, +r9]
        ldrb    r0, [r0, #1]
        add     r3, r2, r0
        add     r3, r3, #2
        add     r2, r3, r2, lsl #1
        add     r0, r3, r0, lsl #1
        mov     r2, r2, asr #2
        strb    r2, [r1, +r9]
        ldr     r1, [sp]
        mov     r0, r0, asr #2
        strb    r0, [r1, #1]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


