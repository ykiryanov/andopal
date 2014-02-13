        .text
        .align  4
        .globl  h264_interpolate_luma_get_average_16u_px


h264_interpolate_luma_get_average_16u_px:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [sp, #0x30]
        ldr     lr, [sp, #0x2C]
        cmp     r12, #0
        ble     LKZN5
        mov     r6, #0
        sub     r5, lr, #4
        mov     r4, #1
LKZN0:
        cmp     lr, #0
        ble     LKZN4
        cmp     lr, #4
        movlt   r7, #0
        blt     LKZN2
        mov     r7, #0
        mov     r10, r7
        mov     r9, #2
        mov     r8, #4
        str     r3, [sp, #4]
        str     r1, [sp]
LKZN1:
        ldrh    r1, [r2, +r10]
        ldrh    r3, [r0, +r10]
        add     r7, r7, #3
        add     r1, r3, r1
        adds    r11, r1, #1
        mov     r3, r6
        movmi   r3, r4
        add     r3, r1, r3
        add     r1, r3, #1
        mov     r1, r1, asr #1
        strh    r1, [r0, +r10]
        ldrh    r1, [r2, +r9]
        ldrh    r3, [r9, +r0]
        add     r10, r10, #6
        add     r1, r3, r1
        adds    r11, r1, #1
        mov     r3, r6
        movmi   r3, r4
        add     r3, r1, r3
        add     r1, r3, #1
        mov     r1, r1, asr #1
        strh    r1, [r9, +r0]
        ldrh    r1, [r2, +r8]
        ldrh    r3, [r8, +r0]
        add     r9, r9, #6
        add     r1, r3, r1
        adds    r11, r1, #1
        mov     r3, r6
        movmi   r3, r4
        add     r3, r1, r3
        add     r1, r3, #1
        cmp     r7, r5
        mov     r1, r1, asr #1
        strh    r1, [r8, +r0]
        add     r8, r8, #6
        ble     LKZN1
        ldr     r3, [sp, #4]
        ldr     r1, [sp]
LKZN2:
        mov     r8, r7, lsl #1
LKZN3:
        ldrh    r9, [r2, +r8]
        ldrh    r10, [r0, +r8]
        add     r7, r7, #1
        add     r9, r10, r9
        adds    r11, r9, #1
        mov     r10, r6
        movmi   r10, r4
        add     r10, r9, r10
        add     r9, r10, #1
        cmp     r7, lr
        mov     r9, r9, asr #1
        strh    r9, [r0, +r8]
        add     r8, r8, #2
        blt     LKZN3
LKZN4:
        subs    r12, r12, #1
        add     r0, r0, r1, lsl #1
        add     r2, r2, r3, lsl #1
        bne     LKZN0
LKZN5:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


