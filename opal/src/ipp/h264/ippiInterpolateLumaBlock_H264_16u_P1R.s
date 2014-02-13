        .text
        .align  4
        .globl  _ippiInterpolateLumaBlock_H264_16u_P1R


_ippiInterpolateLumaBlock_H264_16u_P1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        cmp     r0, #0
        beq     LKZS3
        ldr     r2, [r0]
        cmp     r2, #0
        beq     LKZS3
        ldr     r12, [r0, #0xC]
        cmp     r12, #0
        beq     LKZS3
        ldr     r3, [r0, #0x20]
        ldr     r1, [r0, #0x24]
        bic     r4, r3, #0x1C
        and     lr, r1, #3
        orrs    r4, lr, r4
        bne     LKZS2
        ldr     r6, [r0, #0x30]
        ldr     r5, [r0, #0x34]
        ldr     lr, [r0, #0x14]
        str     r12, [sp, #8]
        ldr     r7, [r0, #8]
        ldr     r12, [r0, #0x38]
        str     r1, [sp, #0x1C]
        orrs    r1, r6, r5
        str     lr, [sp, #0xC]
        str     r7, [sp, #4]
        str     r3, [sp, #0x18]
        str     r12, [sp, #0x44]
        beq     LKZS1
        ands    r9, r6, #3
        mov     r12, #1
        mov     r3, #0
        moveq   r1, r3
        movne   r1, r12
        ldr     r4, [r0, #0x28]
        ldr     lr, [sp, #0x18]
        add     r8, r1, r1, lsl #2
        add     r11, r4, r6, asr #2
        sub     r1, r11, r1, lsl #1
        add     r8, lr, r8
        ands    r11, r5, #3
        str     r1, [sp, #0x24]
        str     r8, [sp, #0x2C]
        movne   r3, r12
        ldr     lr, [r0, #0x2C]
        ldr     r8, [sp, #0x1C]
        orr     r9, r9, r11, lsl #2
        add     r11, r3, r3, lsl #2
        add     r10, lr, r5, asr #2
        add     r8, r8, r11
        cmp     r1, #0
        sub     r3, r10, r3, lsl #1
        str     r3, [sp, #0x28]
        str     r8, [sp, #0x30]
        str     r9, [sp, #0x20]
        movlt   r9, r12
        movge   r9, #0
        ldr     r10, [sp, #0x2C]
        ldr     r8, [r0, #0x18]
        add     r10, r1, r10
        cmp     r8, r10
        movge   r12, #0
        cmp     r3, #0
        orr     r12, r9, r12, lsl #1
        movlt   r1, #1
        movge   r1, #0
        orr     r1, r12, r1, lsl #2
        ldr     r12, [r0, #0x1C]
        ldr     r0, [sp, #0x30]
        add     r0, r3, r0
        cmp     r12, r0
        movge   r0, #0
        movlt   r0, #1
        orrs    r0, r1, r0, lsl #3
        mov     r1, sp
        bne     LKZS0
        add     r5, lr, r5, asr #2
        ldr     r12, [pc, #0x88]
        ldr     lr, [sp, #0x20]
        add     r6, r4, r6, asr #2
        mla     r7, r5, r7, r6
        mov     r0, r1
        ldr     r12, [r12, +lr, lsl #2]
        add     r2, r2, r7, lsl #1
        str     r2, [sp]
        blx     r12
        mov     r0, #0
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LKZS0:
        str     r2, [sp]
        str     r12, [sp, #0x38]
        str     r8, [sp, #0x34]
        bl      ippiInterpolateBoundaryLumaBlock_H264_16u
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LKZS1:
        ldr     lr, [r0, #0x28]
        ldr     r12, [r0, #0x2C]
        ldr     r3, [pc, #0x38]
        mov     r0, sp
        mla     lr, r7, r12, lr
        ldr     r3, [r3]
        add     lr, r2, lr, lsl #1
        str     lr, [sp]
        blx     r3
        mov     r0, #0
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LKZS2:
        mvn     r0, #5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LKZS3:
        mvn     r0, #7
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
        .long   h264_interpolate_luma_type_table_16u_pxmx


