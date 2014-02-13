        .text
        .align  4
        .globl  h264_interpolate_luma_get_average_8u_px


h264_interpolate_luma_get_average_8u_px:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r12, [sp, #0x38]
        ldr     lr, [sp, #0x34]
        cmp     r12, #0
        ble     LKZM4
        mov     r6, #0
        sub     r5, lr, #5
        mov     r4, #1
LKZM0:
        cmp     lr, #0
        ble     LKZM3
        cmp     lr, #5
        movlt   r9, #0
        blt     LKZM2
        mov     r9, #0
        sub     r8, r0, #1
        sub     r7, r2, #1
        str     r12, [sp, #0xC]
        str     lr, [sp, #8]
        str     r3, [sp, #4]
        str     r1, [sp]
LKZM1:
        ldrb    lr, [r9, +r0]
        ldrb    r10, [r9, +r2]
        ldrb    r1, [r8, #2]
        ldrb    r3, [r8, #3]
        ldrb    r12, [r8, #4]
        add     lr, lr, r10
        adds    r10, lr, #1
        mov     r11, r6
        movmi   r11, r4
        add     r11, lr, r11
        add     lr, r11, #1
        mov     r10, r6
        mov     lr, lr, asr #1
        strb    lr, [r9, +r0]
        ldrb    lr, [r7, #2]
        add     r9, r9, #4
        add     r1, r1, lr
        adds    lr, r1, #1
        movmi   r10, r4
        add     r10, r1, r10
        add     r1, r10, #1
        mov     lr, r6
        mov     r1, r1, asr #1
        strb    r1, [r8, #2]
        ldrb    r1, [r7, #3]
        add     r3, r3, r1
        adds    r1, r3, #1
        movmi   lr, r4
        add     lr, r3, lr
        add     r1, lr, #1
        mov     r3, r6
        mov     r1, r1, asr #1
        strb    r1, [r8, #3]
        ldrb    r1, [r7, #4]!
        add     r12, r12, r1
        adds    r1, r12, #1
        movmi   r3, r4
        add     r3, r12, r3
        add     r1, r3, #1
        cmp     r9, r5
        mov     r1, r1, asr #1
        strb    r1, [r8, #4]!
        ble     LKZM1
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r1, [sp]
LKZM2:
        ldrb    r7, [r9, +r2]
        ldrb    r8, [r9, +r0]
        add     r7, r8, r7
        adds    r10, r7, #1
        mov     r8, r6
        movmi   r8, r4
        add     r8, r7, r8
        add     r7, r8, #1
        mov     r7, r7, asr #1
        strb    r7, [r9, +r0]
        add     r9, r9, #1
        cmp     r9, lr
        blt     LKZM2
LKZM3:
        subs    r12, r12, #1
        add     r0, r1, r0
        add     r2, r3, r2
        bne     LKZM0
LKZM4:
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


