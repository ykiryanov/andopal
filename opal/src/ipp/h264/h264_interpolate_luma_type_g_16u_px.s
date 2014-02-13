        .text
        .align  4
        .globl  h264_interpolate_luma_type_g_16u_px


h264_interpolate_luma_type_g_16u_px:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #0x82, 30
        mov     r6, r0
        ldr     r4, [r6, #8]
        ldr     r5, [r6, #0xC]
        bl      h264_interpolate_luma_type_b_16u_px
        ldr     r3, [r6]
        add     r2, sp, #8
        str     r2, [r6, #8]
        add     r3, r3, #2
        mov     r2, #0x10
        str     r3, [r6]
        str     r2, [r6, #0xC]
        mov     r0, r6
        bl      h264_interpolate_luma_type_h_16u_px
        ldr     r2, [r6, #0x1C]
        mov     r1, r5
        mov     r0, r4
        str     r2, [sp, #4]
        ldr     r6, [r6, #0x18]
        add     r2, sp, #8
        str     r6, [sp]
        mov     r3, #0x10
        bl      h264_interpolate_luma_get_average_16u_px
        add     sp, sp, #0x82, 30
        ldmia   sp!, {r4 - r6, pc}


