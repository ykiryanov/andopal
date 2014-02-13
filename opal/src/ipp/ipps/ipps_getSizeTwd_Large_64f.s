        .text
        .align  4
        .globl  _ipps_getSizeTwd_Large_64f


_ipps_getSizeTwd_Large_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r12, [pc, #0x268]
        mov     r6, r0
        mov     r5, r1
        mov     r4, r2
        add     lr, r12, r6, lsl #2
        ldr     r8, [lr, #-0x24]
        mov     lr, #0x20
        orr     lr, lr, #2, 20
        mov     r7, r3
        cmp     r8, #0
        mov     r11, #0
        mov     r9, #1
        bne     LCEI0
        mov     r6, r9, lsl r6
        mov     r0, r6, asr #1
        add     r0, r6, r0, lsr #30
        mov     r0, r0, asr #2
        mov     r0, r0, lsl #4
        add     r0, r0, #0x1F
        bic     r0, r0, #0x1F
        add     lr, r0, lr
        str     lr, [r5]
        str     r11, [r4]
        str     r11, [r7]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCEI0:
        sub     r0, r6, r8
        cmp     r0, #9
        mov     r10, r9, lsl r8
        bgt     LCEI1
        mov     r0, r9, lsl r0
        add     r0, r0, #1
        mov     r0, r0, lsl #4
        add     r0, r0, #0x1F
        bic     r0, r0, #0x1F
        str     r0, [r5]
        str     r11, [r4]
        str     r11, [r7]
        b       LCEI3
LCEI1:
        add     r12, r12, r0, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LCEI2
        mov     r0, r9, lsl r0
        mov     r12, r0, asr #1
        add     r12, r0, r12, lsr #30
        mov     r12, r12, asr #2
        mov     r12, r12, lsl #4
        add     r12, r12, #0x1F
        bic     r12, r12, #0x1F
        add     lr, r12, lr
        str     lr, [r5]
        str     r11, [r4]
        str     r11, [r7]
        b       LCEI3
LCEI2:
        str     r7, [sp]
        mov     r3, r4
        mov     r2, r5
        mov     r1, #1
        bl      LCEI_getSizeTwd_Step
LCEI3:
        ldr     r12, [r5]
        mov     r8, r9, lsl r8
        add     r0, r8, #1
        mov     r6, r9, lsl r6
        mov     r1, r8, asr #1
        mov     r0, r0, lsl #4
        add     r0, r0, #0x1F
        bic     r0, r0, #0x1F
        add     r1, r8, r1, lsr #30
        add     r6, r0, r6, lsl #4
        add     r12, r6, r12
        str     r12, [r5]
        ldr     r0, [r4]
        bic     r1, r1, #3
        add     r1, r1, #0x23
        bic     r12, r1, #0x1F
        mov     r1, r10, lsl #6
        add     r12, r12, r1
        add     r0, r12, r0
        str     r0, [r4]
        ldr     r0, [r7]
        cmp     r0, r10, lsl #6
        strlt   r1, [r7]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCEI_getSizeTwd_Step:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #8
        ldr     r12, [pc, #0x10C]
        mov     r6, r0
        ldr     r9, [sp, #0x24]
        add     lr, r12, r6, lsl #2
        ldr     lr, [lr, #-0x24]
        mov     r8, #1
        mov     r5, r2
        sub     r0, r6, lr
        mov     r7, r8, lsl lr
        cmp     r0, #9
        mov     r4, r3
        mov     lr, #0
        bgt     LCEI4
        mov     r0, r8, lsl r0
        add     r0, r0, #1
        mov     r0, r0, lsl #4
        add     r0, r0, #0x1F
        bic     r0, r0, #0x1F
        str     r0, [r5]
        str     lr, [r4]
        str     lr, [r9]
        b       LCEI6
LCEI4:
        add     r12, r12, r0, lsl #2
        ldr     r12, [r12, #-0x24]
        cmp     r12, #0
        bne     LCEI5
        mov     r0, r8, lsl r0
        mov     r1, #0x20
        mov     r12, r0, asr #1
        orr     r1, r1, #2, 20
        add     r0, r0, r12, lsr #30
        mov     r0, r0, asr #2
        mov     r0, r0, lsl #4
        add     r0, r0, #0x1F
        bic     r0, r0, #0x1F
        add     r1, r0, r1
        str     r1, [r5]
        str     lr, [r4]
        str     lr, [r9]
        b       LCEI6
LCEI5:
        add     r1, r1, #1
        str     r9, [sp]
        mov     r3, r4
        mov     r2, r5
        bl      LCEI_getSizeTwd_Step
LCEI6:
        ldr     r1, [r5]
        add     r0, r7, #1
        mov     r6, r8, lsl r6
        mov     r2, r7, asr #1
        mov     r0, r0, lsl #4
        add     r0, r0, #0x1F
        bic     r0, r0, #0x1F
        add     r6, r0, r6, lsl #4
        add     r2, r7, r2, lsr #30
        add     r1, r6, r1
        str     r1, [r5]
        ldr     r1, [r4]
        bic     r2, r2, #3
        add     r2, r2, #0x23
        bic     r2, r2, #0x1F
        mov     r0, r7, lsl #6
        add     r2, r2, r0
        add     r1, r2, r1
        str     r1, [r4]
        ldr     r1, [r9]
        cmp     r1, r7, lsl #6
        strlt   r0, [r9]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r9, pc}
        .long   LCEI_tbl_blk_order


        .data
        .align  4


LCEI_tbl_blk_order:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00
        .byte   0x05,0x00,0x00,0x00,0x06,0x00,0x00,0x00,0x07,0x00,0x00,0x00,0x07,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00
        .byte   0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00
        .byte   0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00
        .byte   0x09,0x00,0x00,0x00,0x09,0x00,0x00,0x00


