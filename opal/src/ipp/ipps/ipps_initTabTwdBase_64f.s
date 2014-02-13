        .text
        .align  4
        .globl  _ipps_initTabTwdBase_64f


_ipps_initTabTwdBase_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r3, #1
        mov     r8, r3, lsl r0
        mov     r6, r1
        mov     r2, r8, asr #1
        cmp     r0, #0xA
        add     r2, r8, r2, lsr #30
        mov     r5, #0
        mov     r7, r2, asr #2
        add     r12, r7, #1
        add     r12, r6, r12, lsl #3
        and     lr, r12, #0x1F
        rsb     lr, lr, #0
        and     lr, lr, #0x1F
        add     r4, r12, lr
        bgt     LCEH4
        rsb     r0, r0, #0xA
        cmp     r7, #0
        mov     r0, r3, lsl r0
        ble     LCEH3
        cmp     r7, #6
        movlt   r10, r0, lsl #3
        blt     LCEH1
        ldr     r3, [pc, #0x1D4]
        rsb     lr, r0, r0, lsl #2
        mov     r10, r0, lsl #3
        add     r12, r3, r0, lsl #3
        add     r8, r3, lr, lsl #3
        add     lr, r3, r0, lsl #4
        add     r9, r3, r0, lsl #5
        sub     r8, r8, #1
        sub     lr, lr, #1
        sub     r12, r12, #1
        sub     r9, r9, #1
        sub     r3, r3, #1
        sub     r11, r7, #6
        add     r0, r10, r0, lsl #5
        sub     r1, r6, #4
        str     r2, [sp, #4]
        str     r6, [sp]
LCEH0:
        ldr     r2, [r3, #1]
        ldr     r6, [r3, #5]
        add     r3, r3, r0
        str     r2, [r1, #4]
        add     r5, r5, #5
        str     r6, [r1, #8]
        ldr     r2, [r12, #1]
        ldr     r6, [r12, #5]
        cmp     r5, r11
        str     r2, [r1, #0xC]
        add     r12, r12, r0
        str     r6, [r1, #0x10]
        ldr     r2, [lr, #1]
        ldr     r6, [lr, #5]
        add     lr, lr, r0
        str     r2, [r1, #0x14]
        str     r6, [r1, #0x18]
        ldr     r2, [r8, #1]
        ldr     r6, [r8, #5]
        add     r8, r8, r0
        str     r2, [r1, #0x1C]
        str     r6, [r1, #0x20]
        ldr     r2, [r9, #1]
        ldr     r6, [r9, #5]
        add     r9, r9, r0
        str     r2, [r1, #0x24]
        str     r6, [r1, #0x28]!
        ble     LCEH0
        ldr     r2, [sp, #4]
        ldr     r6, [sp]
LCEH1:
        mul     lr, r5, r10
        ldr     r12, [pc, #0x114]
        mov     r3, r5, lsl #3
        sub     r3, r3, #4
        add     lr, lr, #3
        add     r12, lr, r12
        add     r3, r3, r6
LCEH2:
        ldr     r8, [r12, #-3]
        ldr     lr, [r12, #1]
        add     r5, r5, #1
        str     r8, [r3, #4]
        cmp     r5, r7
        str     lr, [r3, #8]!
        add     r12, r12, r10
        blt     LCEH2
LCEH3:
        mov     r3, #0
        bic     r2, r2, #3
        str     r3, [r6, +r2, lsl #1]
        mov     r3, #0xFF, 12
        add     r2, r6, r2, lsl #1
        orr     r3, r3, #3, 4
        str     r3, [r2, #4]
        mov     r0, r4
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCEH4:
        mov     r0, r8
        bl      __floatsidf
        ldr     r9, [pc, #0xB0]
        ldr     r10, [pc, #0xB0]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r10
        bl      __divdf3
        mov     r12, r8, asr #2
        mov     r10, r0
        mov     r9, r1
        add     r12, r8, r12, lsr #29
        movs    r8, r12, asr #3
        bmi     LCEH6
        sub     r11, r6, #4
LCEH5:
        mov     r0, r5
        bl      __floatsidf
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        bl      sin
        add     r5, r5, #1
        str     r0, [r11, #4]
        str     r1, [r11, #8]!
        cmp     r5, r8
        ble     LCEH5
LCEH6:
        add     r8, r8, #1
        cmp     r8, r7
        bgt     LCEH8
        mov     r12, r8, lsl #3
        sub     r12, r12, #4
        add     r6, r12, r6
LCEH7:
        sub     r0, r7, r8
        bl      __floatsidf
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        bl      cos
        add     r8, r8, #1
        str     r0, [r6, #4]
        str     r1, [r6, #8]!
        cmp     r8, r7
        ble     LCEH7
LCEH8:
        mov     r0, r4
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   fft_fix_twiddle_table_64f
        .long   0x54442d18
        .long   0x401921fb


