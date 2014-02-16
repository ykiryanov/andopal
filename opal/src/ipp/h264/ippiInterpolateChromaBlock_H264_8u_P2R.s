        .text
        .align  4
        .globl  ippiInterpolateChromaBlock_H264_8u_P2R


ippiInterpolateChromaBlock_H264_8u_P2R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        mov     r4, r0
        cmp     r4, #0
        beq     LLAG3
        ldr     r1, [r4]
        cmp     r1, #0
        beq     LLAG3
        ldr     r8, [r4, #4]
        cmp     r8, #0
        beq     LLAG3
        ldr     r7, [r4, #0xC]
        cmp     r7, #0
        beq     LLAG3
        ldr     r2, [r4, #0x10]
        cmp     r2, #0
        str     r2, [sp, #8]
        beq     LLAG3
        ldr     r2, [r4, #0x20]
        ldr     r3, [r4, #0x24]
        bic     lr, r2, #0xE
        and     r12, r3, #1
        orrs    lr, r12, lr
        bne     LLAG2
        ldr     r5, [r4, #0x30]
        ldr     lr, [r4, #0x34]
        ldr     r9, [r4, #0x14]
        ldr     r6, [r4, #8]
        str     r2, [sp, #0x24]
        orrs    r2, r5, lr
        str     r9, [sp, #0x18]
        str     r6, [sp, #0x10]
        str     r3, [sp, #0x28]
        beq     LLAG1
        ands    r12, r5, #7
        str     r12, [sp, #0x1C]
        moveq   r10, #0
        movne   r10, #1
        ldr     r3, [sp, #0x24]
        ldr     r9, [r4, #0x28]
        ands    r11, lr, #7
        add     r3, r3, r10
        str     r3, [sp, #0x38]
        add     r3, r9, r5, asr #3
        str     r11, [sp, #0x20]
        str     r3, [sp, #0x30]
        moveq   r10, #0
        movne   r10, #1
        ldr     r2, [r4, #0x2C]
        cmp     r11, #0
        ldr     r11, [sp, #0x28]
        str     r2, [sp]
        add     r2, r2, lr, asr #3
        str     r2, [sp, #0x34]
        add     r10, r11, r10
        str     r10, [sp, #0x3C]
        moveq   r10, #0
        movne   r10, #1
        cmp     r12, #0
        moveq   r11, #0
        movne   r11, #1
        orr     r10, r11, r10, lsl #1
        str     r10, [sp, #4]
        cmp     r3, #0
        str     r10, [sp, #0x2C]
        movlt   r10, #1
        movge   r10, #0
        ldr     r11, [sp, #0x38]
        ldr     r12, [r4, #0x18]
        add     r11, r3, r11
        cmp     r12, r11
        movge   r3, #0
        movlt   r3, #1
        cmp     r2, #0
        orr     r10, r10, r3, lsl #1
        movlt   r0, #1
        movge   r0, #0
        ldr     r11, [sp, #0x3C]
        ldr     r3, [r4, #0x1C]
        orr     r10, r10, r0, lsl #2
        add     r11, r2, r11
        cmp     r3, r11
        movge   r11, #0
        movlt   r11, #1
        orrs    r0, r10, r11, lsl #3
        str     r7, [sp, #0x14]
        bne     LLAG0
        ldr     r2, [sp]
        add     r5, r9, r5, asr #3
        add     r0, sp, #0xC
        add     lr, r2, lr, asr #3
        mla     r6, lr, r6, r5
        ldr     r5, [pc, #0xD4]
        add     r1, r1, r6
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #4]
        ldr     r1, [r5, +r1, lsl #2]
        blx     r1
        ldr     r2, [r4, #4]
        ldr     r12, [sp, #0x2C]
        ldr     r4, [r4, #0x10]
        add     r0, sp, #0xC
        add     r6, r2, r6
        ldr     r5, [r5, +r12, lsl #2]
        str     r6, [sp, #0xC]
        str     r4, [sp, #0x14]
        blx     r5
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LLAG0:
        str     r1, [sp, #0xC]
        str     r12, [sp, #0x40]
        str     r3, [sp, #0x44]
        str     r8, [sp, #0x48]
        ldr     r2, [sp, #8]
        add     r1, sp, #0xC
        str     r2, [sp, #0x4C]
        bl      ippiInterpolateBoundaryChromaBlock_H264_8u
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LLAG1:
        ldr     r12, [r4, #0x2C]
        ldr     lr, [r4, #0x28]
        ldr     r5, [pc, #0x5C]
        str     r7, [sp, #0x14]
        add     r0, sp, #0xC
        mla     r6, r6, r12, lr
        ldr     r3, [r5]
        add     r1, r1, r6
        str     r1, [sp, #0xC]
        blx     r3
        ldr     r1, [r4, #4]
        ldr     r4, [r4, #0x10]
        ldr     r5, [r5]
        add     r0, sp, #0xC
        add     r6, r1, r6
        str     r6, [sp, #0xC]
        str     r4, [sp, #0x14]
        blx     r5
        mov     r0, #0
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LLAG2:
        mvn     r0, #5
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LLAG3:
        mvn     r0, #7
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
        .long   h264_interpolate_chroma_type_table_8u_pxmx


