        .text
        .align  4
        .globl  read_data_through_boundary_top_left_right_8u_px


read_data_through_boundary_top_left_right_8u_px:
        ldr     r1, [r0, #0x24]
        cmp     r1, #0
        blt     read_data_through_boundary_top_left_8u_px
        bge     read_data_through_boundary_top_right_8u_px


