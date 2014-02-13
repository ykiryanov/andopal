        .text
        .align  4
        .globl  ownSpatialInterpolationHor_H263_8u_C1R


ownSpatialInterpolationHor_H263_8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        str     r2, [sp, #0x18]
        ldr     lr, [sp, #0x44]
        ldr     r12, [sp, #0x48]
        str     r3, [sp, #0x1C]
        cmp     r3, #0
        ble     LFFD5
        sub     r4, r2, #5
        sub     r5, r2, #1
        str     r4, [sp, #0x10]
LFFD0:
        ldrb    r8, [r0]
        cmp     r5, #0
        add     r7, lr, #1
        add     r4, r8, r8, lsl #1
        strb    r8, [lr]
        add     r4, r4, #2
        add     r10, r0, #1
        ble     LFFD4
        cmp     r5, #4
        movlt   r6, #0
        blt     LFFD2
        mov     r9, r0
        ldr     r11, [sp, #0x10]
        mov     r6, #0
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LFFD1:
        ldrb    r3, [r9, #1]
        add     r6, r6, #3
        cmp     r6, r11
        add     r0, r3, r3, lsl #1
        add     r1, r0, #2
        add     r8, r8, r1
        add     r4, r4, r3
        mov     r0, r4, asr #2
        strb    r0, [r7]
        mov     r8, r8, asr #2
        strb    r8, [r7, #1]
        ldrb    r2, [r9, #2]
        add     r0, r2, r2, lsl #1
        add     r0, r0, #2
        add     r1, r1, r2
        add     r3, r3, r0
        mov     r1, r1, asr #2
        strb    r1, [r7, #2]
        mov     r3, r3, asr #2
        strb    r3, [r7, #3]
        ldrb    r8, [r9, #3]!
        add     r1, r8, r8, lsl #1
        add     r4, r1, #2
        add     r0, r0, r8
        add     r2, r2, r4
        mov     r0, r0, asr #2
        strb    r0, [r7, #4]
        mov     r2, r2, asr #2
        strb    r2, [r7, #5]
        add     r7, r7, #6
        ble     LFFD1
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LFFD2:
        add     r10, r6, r10
        str     r0, [sp]
LFFD3:
        ldrb    r9, [r10], #1
        add     r6, r6, #1
        cmp     r6, r5
        add     r0, r9, r9, lsl #1
        add     r11, r4, r9
        add     r0, r0, #2
        add     r4, r8, r0
        mov     r8, r9
        mov     r9, r11, asr #2
        mov     r4, r4, asr #2
        strb    r4, [r7, #1]
        strb    r9, [r7], #2
        mov     r4, r0
        blt     LFFD3
        ldr     r0, [sp]
LFFD4:
        add     r4, r0, r2
        ldrb    r4, [r4, #-1]
        subs    r3, r3, #1
        add     r0, r0, r1
        strb    r4, [r7]
        add     lr, lr, r12
        bne     LFFD0
LFFD5:
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


