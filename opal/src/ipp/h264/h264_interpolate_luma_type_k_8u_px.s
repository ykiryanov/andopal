        .text
        .align  4
        .globl  h264_interpolate_luma_type_k_8u_px


h264_interpolate_luma_type_k_8u_px:
        stmdb   sp!, {r4 - r6, lr}
        sub     sp, sp, #0x42, 30
        mov     r4, r0
        ldr     r2, [r4]
        ldr     r6, [r4, #8]
        ldr     r5, [r4, #0xC]
        add     r2, r2, #1
        str     r2, [r4]
        bl      h264_interpolate_luma_type_h_8u_px
        ldr     r3, [r4]
        add     r2, sp, #8
        str     r2, [r4, #8]
        sub     r3, r3, #1
        mov     r2, #0x10
        str     r3, [r4]
        str     r2, [r4, #0xC]
        mov     r0, r4
        bl      h264_interpolate_luma_type_j_8u_px
        ldr     r2, [r4, #0x1C]
        mov     r1, r5
        mov     r0, r6
        str     r2, [sp, #4]
        ldr     r4, [r4, #0x18]
        add     r2, sp, #8
        str     r4, [sp]
        mov     r3, #0x10
        bl      h264_interpolate_luma_get_average_8u_px
        add     sp, sp, #0x42, 30
        ldmia   sp!, {r4 - r6, pc}


