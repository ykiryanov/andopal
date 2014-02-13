        .text
        .align  4
        .globl  h264_interpolate_luma_type_h_16u_px


h264_interpolate_luma_type_h_16u_px:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r1, [r0, #0x44]
        ldr     r6, [r0, #0x1C]
        ldr     lr, [r0]
        ldr     r7, [r0, #4]
        ldr     r4, [r0, #8]
        mov     r2, #1
        mov     r1, r2, lsl r1
        cmp     r6, #0
        sub     r8, r1, #1
        ble     LKYV4
        ldr     r5, [r0, #0x18]
        add     r1, r7, r7, lsl #2
        add     r1, r7, r1
        mov     r12, #0
        mov     r3, r7, lsl #1
        mov     r2, r7, lsl #2
        str     r8, [sp, #0x10]
LKYV0:
        cmp     r5, #0
        ble     LKYV3
        mov     r5, #0
        add     r10, lr, r1
        str     r1, [sp, #0xC]
        mov     r11, r5
        sub     r9, lr, r2
        add     r6, lr, r2
        add     r8, r3, lr
        sub     r7, lr, r3
        str     r2, [sp, #8]
        str     r3, [sp, #4]
        str     r12, [sp]
        str     r4, [sp, #0x14]
        str     lr, [sp, #0x18]
        mov     r1, r5
LKYV1:
        ldr     r3, [sp, #0x18]
        ldrh    r2, [r8], #2
        ldrh    r12, [r7], #2
        ldrh    r5, [r3, +r1]
        ldrh    r3, [r6], #2
        ldrh    r4, [r9], #2
        ldrh    lr, [r10], #2
        add     r5, r2, r5
        add     r12, r3, r12
        add     lr, r4, lr
        add     r5, r5, r5, lsl #2
        add     r12, r12, r12, lsl #2
        add     r5, lr, r5, lsl #2
        rsb     r5, r12, r5
        add     r2, r5, #0x10
        mov     r2, r2, asr #5
        cmp     r2, #0
        movle   r2, #0
        ble     LKYV2
        ldr     r3, [sp, #0x10]
        cmp     r3, r2
        movlt   r2, r3
LKYV2:
        ldr     r3, [sp, #0x14]
        add     r11, r11, #1
        strh    r2, [r3, +r1]
        ldr     r5, [r0, #0x18]
        add     r1, r1, #2
        cmp     r11, r5
        blt     LKYV1
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r12, [sp]
        ldr     r4, [sp, #0x14]
        ldr     lr, [sp, #0x18]
        ldr     r7, [r0, #4]
        ldr     r6, [r0, #0x1C]
LKYV3:
        ldr     r8, [r0, #0xC]
        add     r12, r12, #1
        cmp     r12, r6
        add     lr, lr, r7, lsl #1
        add     r4, r4, r8, lsl #1
        blt     LKYV0
LKYV4:
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


