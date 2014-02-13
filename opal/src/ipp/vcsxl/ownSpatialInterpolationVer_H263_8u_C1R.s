        .text
        .align  4
        .globl  ownSpatialInterpolationVer_H263_8u_C1R


ownSpatialInterpolationVer_H263_8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     lr, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        str     r2, [sp, #0x10]
        str     r3, [sp, #0x14]
        cmp     r2, #0
        add     r4, lr, r12
        addle   lr, r1, r0
        ble     LFFC1
        add     lr, r1, r0
        add     r9, r12, r4
        sub     r8, r4, r12
        mov     r7, lr
        mov     r6, r4
        mov     r5, r2
        str     r1, [sp]
LFFC0:
        ldrb    r11, [r0], #1
        subs    r5, r5, #1
        strb    r11, [r8], #1
        ldrb    r10, [r7], #1
        add     r1, r11, r10
        add     r1, r1, #2
        add     r11, r1, r11, lsl #1
        add     r10, r1, r10, lsl #1
        mov     r11, r11, asr #2
        strb    r11, [r6], #1
        mov     r10, r10, asr #2
        strb    r10, [r9], #1
        bne     LFFC0
        ldr     r1, [sp]
LFFC1:
        sub     r0, r3, #3
        cmp     r0, #0
        add     r3, r4, r12, lsl #1
        ble     LFFC6
        sub     r4, r2, #4
LFFC2:
        cmp     r2, #0
        addle   r5, r1, lr
        ble     LFFC5
        cmp     r2, #4
        mov     r11, #0
        addlt   r5, r1, lr
        addlt   r6, r12, r3
        blt     LFFC4
        add     r5, r1, lr
        add     r6, r12, r3
        sub     r10, lr, #1
        sub     r9, r5, #1
        sub     r8, r3, #1
        sub     r7, r6, #1
        str     r12, [sp, #4]
        str     r2, [sp, #8]
        str     r1, [sp]
LFFC3:
        ldrb    r12, [r11, +lr]
        ldrb    r2, [r9, #1]
        add     r1, r12, r2
        add     r1, r1, #2
        add     r12, r1, r12, lsl #1
        add     r2, r1, r2, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r3, +r11]
        mov     r2, r2, asr #2
        strb    r2, [r7, #1]
        ldrb    r12, [r10, #2]
        ldrb    r2, [r9, #2]
        add     r11, r11, #3
        cmp     r11, r4
        add     r1, r12, r2
        add     r1, r1, #2
        add     r12, r1, r12, lsl #1
        add     r2, r1, r2, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r8, #2]
        mov     r2, r2, asr #2
        strb    r2, [r7, #2]
        ldrb    r12, [r10, #3]!
        ldrb    r2, [r9, #3]!
        add     r1, r12, r2
        add     r1, r1, #2
        add     r12, r1, r12, lsl #1
        add     r2, r1, r2, lsl #1
        mov     r12, r12, asr #2
        strb    r12, [r8, #3]!
        mov     r2, r2, asr #2
        strb    r2, [r7, #3]!
        ble     LFFC3
        ldr     r12, [sp, #4]
        ldr     r2, [sp, #8]
        ldr     r1, [sp]
LFFC4:
        ldrb    r9, [r11, +lr]
        ldrb    r7, [r5, +r11]
        add     r8, r9, r7
        add     r8, r8, #2
        add     r9, r8, r9, lsl #1
        add     r7, r8, r7, lsl #1
        mov     r9, r9, asr #2
        strb    r9, [r3, +r11]
        mov     r7, r7, asr #2
        strb    r7, [r6, +r11]
        add     r11, r11, #1
        cmp     r11, r2
        blt     LFFC4
LFFC5:
        subs    r0, r0, #1
        add     r3, r3, r12, lsl #1
        mov     lr, r5
        bne     LFFC2
LFFC6:
        cmp     r2, #0
        ble     LFFC8
        add     r0, r3, r12, lsl #1
        add     r1, r1, lr
        mov     r4, #0
        add     r12, r12, r3
LFFC7:
        ldrb    r7, [r4, +lr]
        ldrb    r5, [r1], #1
        add     r6, r7, r5
        add     r6, r6, #2
        add     r7, r6, r7, lsl #1
        add     r6, r6, r5, lsl #1
        mov     r7, r7, asr #2
        strb    r7, [r3, +r4]
        mov     r6, r6, asr #2
        strb    r6, [r12], #1
        add     r4, r4, #1
        strb    r5, [r0], #1
        cmp     r4, r2
        blt     LFFC7
LFFC8:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


