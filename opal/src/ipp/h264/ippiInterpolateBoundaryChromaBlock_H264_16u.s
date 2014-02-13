        .text
        .align  4
        .globl  ippiInterpolateBoundaryChromaBlock_H264_16u


ippiInterpolateBoundaryChromaBlock_H264_16u:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0x26, 28
        mov     r4, r1
        ldr     r2, [r4, #0x2C]
        mov     r12, sp
        ldr     r10, [r4, #0xC]
        ldr     r8, [r4, #8]
        rsb     r12, r12, #0x40
        ldr     r9, [r4, #4]
        mov     r3, sp
        and     r12, r12, #0x3F
        add     r7, r3, r12
        add     r2, r2, #0xF
        mov     r5, r0
        bic     r6, r2, #0xF
        str     r7, [r4, #8]
        str     r6, [r4, #0xC]
        bl      ippiReadDataBlockThroughBoundary_16u
        str     r8, [r4, #8]
        ldr     r2, [r4, #0x20]
        ldr     r8, [pc, #0x64]
        str     r7, [r4]
        str     r6, [r4, #4]
        str     r10, [r4, #0xC]
        ldr     r2, [r8, +r2, lsl #2]
        mov     r0, r4
        blx     r2
        ldr     r2, [r4, #0x3C]
        str     r9, [r4, #4]
        str     r7, [r4, #8]
        str     r2, [r4]
        str     r6, [r4, #0xC]
        mov     r0, r5
        mov     r1, r4
        bl      ippiReadDataBlockThroughBoundary_16u
        ldr     r2, [r4, #0x40]
        str     r7, [r4]
        str     r6, [r4, #4]
        str     r2, [r4, #8]
        ldr     r2, [r4, #0x20]
        str     r10, [r4, #0xC]
        mov     r0, r4
        ldr     r2, [r8, +r2, lsl #2]
        blx     r2
        mov     r0, #0
        add     sp, sp, #0x26, 28
        ldmia   sp!, {r4 - r10, pc}
        .long   h264_interpolate_chroma_type_table_16u_pxmx


