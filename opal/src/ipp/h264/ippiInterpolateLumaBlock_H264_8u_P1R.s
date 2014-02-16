        .text
        .align  4
        .globl  ippiInterpolateLumaBlock_H264_8u_P1R


ippiInterpolateLumaBlock_H264_8u_P1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        cmp     r0, #0
        beq     LKZR3
        ldr     r7, [r0]
        cmp     r7, #0
        beq     LKZR3
        ldr     r3, [r0, #0xC]
        cmp     r3, #0
        beq     LKZR3
        ldr     r1, [r0, #0x20]
        ldr     r2, [r0, #0x24]
        bic     lr, r1, #0x1C
        and     r12, r2, #3
        orrs    lr, r12, lr
        bne     LKZR2
        ldr     r5, [r0, #0x30]
        ldr     r4, [r0, #0x34]
        ldr     r12, [r0, #0x14]
        ldr     r6, [r0, #8]
        str     r3, [sp, #8]
        orrs    r3, r5, r4
        str     r12, [sp, #0xC]
        str     r6, [sp, #4]
        str     r1, [sp, #0x18]
        str     r2, [sp, #0x1C]
        beq     LKZR1
        ands    r9, r5, #3
        mov     r3, #1
        mov     r2, #0
        moveq   r1, r2
        movne   r1, r3
        ldr     lr, [r0, #0x28]
        ldr     r12, [sp, #0x18]
        add     r8, r1, r1, lsl #2
        add     r11, lr, r5, asr #2
        add     r8, r12, r8
        ands    r12, r4, #3
        sub     r1, r11, r1, lsl #1
        str     r1, [sp, #0x24]
        str     r8, [sp, #0x2C]
        movne   r2, r3
        orr     r9, r9, r12, lsl #2
        ldr     r12, [r0, #0x2C]
        ldr     r8, [sp, #0x1C]
        add     r11, r2, r2, lsl #2
        add     r10, r12, r4, asr #2
        cmp     r1, #0
        add     r8, r8, r11
        sub     r2, r10, r2, lsl #1
        str     r2, [sp, #0x28]
        str     r8, [sp, #0x30]
        str     r9, [sp, #0x20]
        movlt   r9, r3
        movge   r9, #0
        ldr     r10, [sp, #0x2C]
        ldr     r8, [r0, #0x18]
        add     r10, r1, r10
        cmp     r8, r10
        movge   r3, #0
        cmp     r2, #0
        orr     r3, r9, r3, lsl #1
        movlt   r1, #1
        movge   r1, #0
        orr     r1, r3, r1, lsl #2
        ldr     r3, [r0, #0x1C]
        ldr     r0, [sp, #0x30]
        add     r0, r2, r0
        cmp     r3, r0
        movge   r0, #0
        movlt   r0, #1
        orrs    r0, r1, r0, lsl #3
        mov     r1, sp
        bne     LKZR0
        ldr     r2, [sp, #0x20]
        add     r4, r12, r4, asr #2
        ldr     r12, [pc, #0x84]
        add     lr, r7, lr
        add     r5, lr, r5, asr #2
        mla     r6, r4, r6, r5
        ldr     r2, [r12, +r2, lsl #2]
        mov     r0, r1
        str     r6, [sp]
        blx     r2
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LKZR0:
        str     r3, [sp, #0x38]
        str     r7, [sp]
        str     r8, [sp, #0x34]
        bl      ippiInterpolateBoundaryLumaBlock_H264_8u
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LKZR1:
        ldr     r2, [r0, #0x2C]
        ldr     r1, [r0, #0x28]
        ldr     r3, [pc, #0x38]
        mla     r7, r6, r2, r7
        mov     r0, sp
        ldr     r3, [r3]
        add     r1, r7, r1
        str     r1, [sp]
        blx     r3
        mov     r0, #0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LKZR2:
        mvn     r0, #5
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
LKZR3:
        mvn     r0, #7
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
        .long   h264_interpolate_luma_type_table_8u_pxmx


