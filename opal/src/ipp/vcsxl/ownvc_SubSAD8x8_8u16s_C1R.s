        .text
        .align  4
        .globl  ownvc_SubSAD8x8_8u16s_C1R


ownvc_SubSAD8x8_8u16s_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     lr, [sp, #0x34]
        ldr     r5, [sp, #0x38]
        ldr     r12, [sp, #0x30]
        mov     r7, #0
        mov     r4, #8
        str     r5, [sp, #8]
        str     lr, [sp, #4]
        str     r1, [sp]
LEDR0:
        ldrb    lr, [r2]
        ldrb    r1, [r0]
        subs    r4, r4, #1
        sub     r1, r1, lr
        mov     r1, r1, lsl #16
        mov     r5, r1, asr #16
        strh    r5, [r12]
        ldrb    lr, [r2, #1]
        ldrb    r1, [r0, #1]
        eor     r11, r5, r5, asr #31
        sub     r5, r11, r5, asr #31
        add     r7, r5, r7
        sub     r1, r1, lr
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        strh    r1, [r12, #2]
        ldrb    lr, [r0, #2]
        ldrb    r6, [r2, #2]
        mov     r1, r1, lsl #16
        sub     lr, lr, r6
        mov     r6, r1, asr #16
        mov     lr, lr, lsl #16
        mov     r1, lr, asr #16
        strh    r1, [r12, #4]
        ldrb    lr, [r0, #3]
        ldrb    r8, [r2, #3]
        mov     r1, r1, lsl #16
        eor     r10, r6, r6, asr #31
        mov     r1, r1, asr #16
        sub     lr, lr, r8
        sub     r10, r10, r6, asr #31
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        strh    lr, [r12, #6]
        ldrb    r8, [r0, #4]
        ldrb    r9, [r2, #4]
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        sub     r8, r8, r9
        eor     r9, r1, r1, asr #31
        mov     r5, r8, lsl #16
        add     r8, r10, r7
        sub     r9, r9, r1, asr #31
        mov     r5, r5, asr #16
        strh    r5, [r12, #8]
        ldrb    r6, [r0, #5]
        ldrb    r7, [r2, #5]
        add     r1, r9, r8
        mov     r5, r5, lsl #16
        sub     r6, r6, r7
        eor     r7, lr, lr, asr #31
        mov     r5, r5, asr #16
        mov     r6, r6, lsl #16
        sub     lr, r7, lr, asr #31
        add     lr, lr, r1
        mov     r8, r6, asr #16
        strh    r8, [r12, #0xA]
        ldrb    r6, [r0, #6]
        ldrb    r7, [r2, #6]
        eor     r9, r5, r5, asr #31
        mov     r1, r8, lsl #16
        sub     r9, r9, r5, asr #31
        sub     r6, r6, r7
        mov     r5, r1, asr #16
        add     lr, r9, lr
        mov     r6, r6, lsl #16
        eor     r8, r5, r5, asr #31
        mov     r1, r6, asr #16
        strh    r1, [r12, #0xC]
        ldrb    r6, [r0, #7]
        ldrb    r7, [r2, #7]
        sub     r8, r8, r5, asr #31
        ldr     r5, [sp]
        mov     r1, r1, lsl #16
        sub     r6, r6, r7
        add     lr, r8, lr
        add     r0, r0, r5
        mov     r6, r6, lsl #16
        mov     r1, r1, asr #16
        add     r2, r2, r3
        mov     r5, r6, asr #16
        eor     r7, r1, r1, asr #31
        strh    r5, [r12, #0xE]
        mov     r5, r5, lsl #16
        sub     r7, r7, r1, asr #31
        mov     r1, r5, asr #16
        ldr     r5, [sp, #4]
        add     lr, r7, lr
        add     r12, r12, r5
        eor     r5, r1, r1, asr #31
        sub     r5, r5, r1, asr #31
        add     r7, r5, lr
        bne     LEDR0
        ldr     r5, [sp, #8]
        str     r7, [r5]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


