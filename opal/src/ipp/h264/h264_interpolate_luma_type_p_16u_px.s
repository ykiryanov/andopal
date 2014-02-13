        .text
        .align  4
        .globl  h264_interpolate_luma_type_p_16u_px


h264_interpolate_luma_type_p_16u_px:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #0x82, 30
        mov     r4, r0
        ldr     r3, [r4, #4]
        ldr     r2, [r4]
        ldr     r6, [r4, #8]
        ldr     r5, [r4, #0xC]
        add     r3, r2, r3, lsl #1
        str     r3, [r4]
        bl      h264_interpolate_luma_type_b_16u_px
        ldr     r3, [r4]
        ldr     r2, [r4, #4]
        mov     r0, r4
        sub     r3, r3, r2, lsl #1
        add     r2, sp, #8
        str     r2, [r4, #8]
        mov     r2, #0x10
        str     r3, [r4]
        str     r2, [r4, #0xC]
        bl      h264_interpolate_luma_type_h_16u_px
        ldr     r2, [r4, #0x1C]
        mov     r1, r5
        mov     r0, r6
        str     r2, [sp, #4]
        ldr     r4, [r4, #0x18]
        add     r2, sp, #8
        str     r4, [sp]
        mov     r3, #0x10
        bl      h264_interpolate_luma_get_average_16u_px
        add     sp, sp, #0x82, 30
        ldmia   sp!, {r4 - r6, pc}


