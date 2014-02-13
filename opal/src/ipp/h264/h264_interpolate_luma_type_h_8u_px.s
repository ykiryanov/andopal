        .text
        .align  4
        .globl  h264_interpolate_luma_type_h_8u_px


h264_interpolate_luma_type_h_8u_px:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r2, [r0, #0x1C]
        ldr     r3, [r0, #4]
        ldr     r1, [r0]
        ldr     r10, [r0, #8]
        cmp     r2, #0
        mov     r11, r3
        ble     LKYU3
        ldr     r8, [r0, #0x18]
        mov     lr, #0
        mov     r9, #0
        mov     r7, r3, lsl #1
        add     r6, r3, r3, lsl #1
        mov     r12, #0xFF
LKYU0:
        cmp     r8, #0
        ble     LKYU2
        add     r2, r1, r6
        mov     r5, #0
        sub     r4, r1, r7
        add     lr, r1, r7
        sub     r12, r1, r11
        add     r3, r1, r11
        str     r6, [sp, #0xC]
        str     r7, [sp, #8]
        str     r9, [sp, #4]
        str     r10, [sp, #0x10]
        str     r11, [sp]
LKYU1:
        ldrb    r10, [r3], #1
        ldrb    r11, [r5, +r1]
        ldrb    r6, [lr], #1
        ldrb    r7, [r12], #1
        ldrb    r8, [r4], #1
        ldrb    r9, [r2], #1
        add     r10, r10, r11
        add     r7, r6, r7
        add     r10, r10, r10, lsl #2
        add     r9, r8, r9
        add     r7, r7, r7, lsl #2
        add     r10, r9, r10, lsl #2
        rsb     r10, r7, r10
        add     r6, r10, #0x10
        mov     r6, r6, asr #5
        cmp     r6, #0xFF
        mov     r7, #0xFF
        movgt   r6, r7
        mov     r7, #0
        cmp     r6, #0
        movgt   r7, r6
        ldr     r6, [sp, #0x10]
        strb    r7, [r6, +r5]
        ldr     r8, [r0, #0x18]
        add     r5, r5, #1
        cmp     r5, r8
        blt     LKYU1
        ldr     r6, [sp, #0xC]
        ldr     r7, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp]
        ldr     r3, [r0, #4]
        ldr     r2, [r0, #0x1C]
LKYU2:
        ldr     r12, [r0, #0xC]
        add     r9, r9, #1
        cmp     r9, r2
        add     r1, r1, r3
        add     r10, r12, r10
        blt     LKYU0
LKYU3:
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


