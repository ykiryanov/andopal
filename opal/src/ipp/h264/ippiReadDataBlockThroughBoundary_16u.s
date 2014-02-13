        .text
        .align  4
        .globl  ippiReadDataBlockThroughBoundary_16u


ippiReadDataBlockThroughBoundary_16u:
        stmdb   sp!, {lr}
        ldr     r3, [pc, #0x14]
        mov     r2, r0
        mov     r0, r1
        ldr     r2, [r3, +r2, lsl #2]
        blx     r2
        mov     r0, #0
        ldr     pc, [sp], #4
        .long   read_data_through_boundary_table_16u_pxmx


