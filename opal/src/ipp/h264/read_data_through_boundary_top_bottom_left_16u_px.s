        .text
        .align  4
        .globl  read_data_through_boundary_top_bottom_left_16u_px


read_data_through_boundary_top_bottom_left_16u_px:
        ldr     r1, [r0, #0x28]
        cmp     r1, #0
        blt     read_data_through_boundary_top_left_16u_px
        bge     read_data_through_boundary_bottom_left_16u_px


