        .text
        .align  4
        .globl  h264_interpolate_luma_type_f_8u_px


h264_interpolate_luma_type_f_8u_px:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #0x42, 30
        mov     r6, r0
        ldr     r5, [r6, #8]
        ldr     r4, [r6, #0xC]
        bl      h264_interpolate_luma_type_b_8u_px
        add     r2, sp, #8
        str     r2, [r6, #8]
        mov     r2, #0x10
        str     r2, [r6, #0xC]
        mov     r0, r6
        bl      h264_interpolate_luma_type_j_8u_px
        ldr     r2, [r6, #0x1C]
        mov     r1, r4
        mov     r0, r5
        str     r2, [sp, #4]
        ldr     r6, [r6, #0x18]
        add     r2, sp, #8
        str     r6, [sp]
        mov     r3, #0x10
        bl      h264_interpolate_luma_get_average_8u_px
        add     sp, sp, #0x42, 30
        ldmia   sp!, {r4 - r6, pc}


