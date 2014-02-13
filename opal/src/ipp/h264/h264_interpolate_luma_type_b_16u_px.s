        .text
        .align  4
        .globl  h264_interpolate_luma_type_b_16u_px


h264_interpolate_luma_type_b_16u_px:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r1, [r0, #0x44]
        ldr     r3, [r0, #0x1C]
        ldr     r6, [r0]
        ldr     r5, [r0, #8]
        mov     r2, #1
        mov     r1, r2, lsl r1
        cmp     r3, #0
        sub     r1, r1, #1
        ble     LKZH4
        ldr     r2, [r0, #0x18]
        mov     r7, #0
LKZH0:
        cmp     r2, #0
        ble     LKZH3
        mov     r4, #0
        mov     lr, r4
        mov     r12, r6
LKZH1:
        ldrh    r3, [r12, #2]
        ldrh    r9, [r6, +lr]
        ldrh    r2, [r12, #4]
        ldrh    r8, [r12, #-2]
        add     r3, r3, r9
        ldrh    r9, [r12, #-4]
        add     r3, r3, r3, lsl #2
        add     r2, r2, r8
        ldrh    r8, [r12, #6]
        add     r2, r2, r2, lsl #2
        add     r9, r9, r8
        add     r3, r9, r3, lsl #2
        rsb     r3, r2, r3
        add     r2, r3, #0x10
        mov     r2, r2, asr #5
        cmp     r2, #0
        movle   r2, #0
        ble     LKZH2
        cmp     r1, r2
        movlt   r2, r1
LKZH2:
        strh    r2, [r5, +lr]
        ldr     r2, [r0, #0x18]
        add     r4, r4, #1
        add     lr, lr, #2
        cmp     r4, r2
        add     r12, r12, #2
        blt     LKZH1
        ldr     r3, [r0, #0x1C]
LKZH3:
        ldr     lr, [r0, #0xC]
        ldr     r12, [r0, #4]
        add     r7, r7, #1
        cmp     r7, r3
        add     r5, r5, lr, lsl #1
        add     r6, r6, r12, lsl #1
        blt     LKZH0
LKZH4:
        ldmia   sp!, {r4 - r9, pc}


