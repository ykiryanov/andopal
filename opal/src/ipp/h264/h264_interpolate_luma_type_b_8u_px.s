        .text
        .align  4
        .globl  h264_interpolate_luma_type_b_8u_px


h264_interpolate_luma_type_b_8u_px:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r5, [r0, #0x1C]
        ldr     r4, [r0]
        ldr     lr, [r0, #8]
        cmp     r5, #0
        ble     LKZG3
        ldr     r1, [r0, #0x18]
        mov     r12, #0
        mov     r3, r12
        mov     r2, #0xFF
LKZG0:
        cmp     r1, #0
        ble     LKZG2
        mov     r6, #0
        add     r5, r4, #2
LKZG1:
        ldrb    r8, [r6, +r4]
        ldrb    r1, [r5]
        ldrb    r7, [r5, #-1]
        ldrb    r9, [r5, #-3]
        add     r8, r7, r8
        ldrb    r7, [r5, #-4]
        add     r8, r8, r8, lsl #2
        add     r1, r1, r9
        ldrb    r9, [r5, #1]!
        add     r1, r1, r1, lsl #2
        add     r9, r7, r9
        add     r8, r9, r8, lsl #2
        rsb     r8, r1, r8
        add     r1, r8, #0x10
        mov     r7, r3
        mov     r1, r1, asr #5
        cmp     r1, #0xFF
        movgt   r1, r2
        cmp     r1, #0
        movgt   r7, r1
        strb    r7, [lr, +r6]
        ldr     r1, [r0, #0x18]
        add     r6, r6, #1
        cmp     r6, r1
        blt     LKZG1
        ldr     r5, [r0, #0x1C]
LKZG2:
        ldr     r7, [r0, #0xC]
        ldr     r6, [r0, #4]
        add     r12, r12, #1
        cmp     r12, r5
        add     lr, r7, lr
        add     r4, r6, r4
        blt     LKZG0
LKZG3:
        ldmia   sp!, {r4 - r9, pc}


