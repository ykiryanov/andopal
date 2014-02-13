        .data
        .align  4
        .globl  h264_interpolate_chroma_type_table_8u_pxmx
        .globl  h264_interpolate_chroma_type_table_16u_pxmx


h264_interpolate_chroma_type_table_8u_pxmx:
        .long   h264_interpolate_chroma_type_00_8u_px
        .long   h264_interpolate_chroma_type_0x_8u_px
        .long   h264_interpolate_chroma_type_y0_8u_px
        .long   h264_interpolate_chroma_type_yx_8u_px
h264_interpolate_chroma_type_table_16u_pxmx:
        .long   h264_interpolate_chroma_type_00_16u_px
        .long   h264_interpolate_chroma_type_0x_16u_px
        .long   h264_interpolate_chroma_type_y0_16u_px
        .long   h264_interpolate_chroma_type_yx_16u_px


