        .text
        .align  4
        .globl  h264_interpolate_luma_type_r_16u_px


h264_interpolate_luma_type_r_16u_px:
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
        ldr     r3, [r4, #4]
        ldr     r2, [r4]
        add     r12, sp, #8
        rsb     r3, r3, #1
        str     r12, [r4, #8]
        mov     r12, #0x10
        add     r3, r2, r3, lsl #1
        str     r3, [r4]
        str     r12, [r4, #0xC]
        mov     r0, r4
        bl      h264_interpolate_luma_type_h_16u_px
        ldr     r3, [r4, #0x1C]
        add     r2, sp, #8
        mov     r1, r5
        str     r3, [sp, #4]
        ldr     r4, [r4, #0x18]
        mov     r0, r6
        str     r4, [sp]
        mov     r3, #0x10
        bl      h264_interpolate_luma_get_average_16u_px
        add     sp, sp, #0x82, 30
        ldmia   sp!, {r4 - r6, pc}


