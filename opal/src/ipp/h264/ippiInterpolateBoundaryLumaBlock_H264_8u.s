        .text
        .align  4
        .globl  ippiInterpolateBoundaryLumaBlock_H264_8u


ippiInterpolateBoundaryLumaBlock_H264_8u:
        stmdb   sp!, {r4 - r8, lr}
        sub     sp, sp, #0xB, 26
        mov     r4, r1
        ldr     r2, [r4, #0x2C]
        mov     r12, sp
        ldr     r7, [r4, #8]
        ldr     r8, [r4, #0xC]
        rsb     r12, r12, #0x20
        mov     r3, sp
        and     r12, r12, #0x1F
        add     r2, r2, #0xF
        add     r6, r3, r12
        bic     r5, r2, #0xF
        str     r6, [r4, #8]
        str     r5, [r4, #0xC]
        bl      ippiReadDataBlockThroughBoundary_8u
        ldr     r2, [r4, #0x20]
        mov     r3, #1
        tst     r2, #0xC
        moveq   r12, #0
        movne   r12, r3
        tst     r2, #3
        moveq   r3, #0
        mov     r12, r12, lsl #1
        mla     r6, r5, r12, r6
        str     r5, [r4, #4]
        str     r7, [r4, #8]
        str     r8, [r4, #0xC]
        add     r3, r6, r3, lsl #1
        str     r3, [r4]
        ldr     r3, [pc, #0x14]
        mov     r0, r4
        ldr     r2, [r3, +r2, lsl #2]
        blx     r2
        mov     r0, #0
        add     sp, sp, #0xB, 26
        ldmia   sp!, {r4 - r8, pc}
        .long   h264_interpolate_luma_type_table_8u_pxmx


