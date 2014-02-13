        .text
        .align  4
        .globl  h264_interpolate_luma_type_c_8u_px


h264_interpolate_luma_type_c_8u_px:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #8
        mov     r4, r0
        bl      h264_interpolate_luma_type_b_8u_px
        ldr     r1, [r4, #0x1C]
        str     r1, [sp, #4]
        ldr     r1, [r4, #0x18]
        str     r1, [sp]
        ldr     r2, [r4]
        ldr     r3, [r4, #4]
        ldr     r1, [r4, #0xC]
        ldr     r0, [r4, #8]
        add     r2, r2, #1
        bl      h264_interpolate_luma_get_average_8u_px
        add     sp, sp, #8
        ldmia   sp!, {r4, pc}


