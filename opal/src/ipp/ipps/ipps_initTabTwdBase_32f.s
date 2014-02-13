        .text
        .align  4
        .globl  _ipps_initTabTwdBase_32f


_ipps_initTabTwdBase_32f:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r3, #1
        mov     r5, r3, lsl r0
        mov     r7, r1
        mov     r2, r5, asr #1
        cmp     r0, #0xA
        add     r2, r5, r2, lsr #30
        mov     r6, #0
        mov     r8, r2, asr #2
        add     r12, r8, #1
        add     r12, r7, r12, lsl #2
        and     lr, r12, #0x1F
        rsb     lr, lr, #0
        and     lr, lr, #0x1F
        add     r4, r12, lr
        bgt     LBZA4
        rsb     r0, r0, #0xA
        cmp     r8, #0
        mov     r3, r3, lsl r0
        ble     LBZA3
        cmp     r8, #6
        movlt   r1, r3, lsl #2
        blt     LBZA1
        ldr     r11, [pc, #0x148]
        rsb     r12, r3, r3, lsl #2
        mov     r1, r3, lsl #2
        add     r10, r11, r3, lsl #2
        add     r9, r11, r3, lsl #3
        add     r5, r11, r3, lsl #4
        sub     r0, r8, #6
        add     r12, r11, r12, lsl #2
        add     r3, r1, r3, lsl #4
        add     lr, r7, #4
        str     r7, [sp]
LBZA0:
        ldr     r7, [r11], +r3
        add     r6, r6, #5
        str     r7, [lr, #-4]
        ldr     r7, [r10], +r3
        cmp     r6, r0
        str     r7, [lr]
        ldr     r7, [r9], +r3
        str     r7, [lr, #4]
        ldr     r7, [r12], +r3
        str     r7, [lr, #8]
        ldr     r7, [r5], +r3
        str     r7, [lr, #0xC]
        add     lr, lr, #0x14
        ble     LBZA0
        ldr     r7, [sp]
LBZA1:
        ldr     r12, [pc, #0xE0]
        add     r3, r7, r6, lsl #2
        mla     r12, r6, r1, r12
LBZA2:
        ldr     lr, [r12], +r1
        add     r6, r6, #1
        cmp     r6, r8
        str     lr, [r3], #4
        blt     LBZA2
LBZA3:
        ldr     r3, [pc, #0xC4]
        bic     r2, r2, #3
        ldr     r3, [r3]
        str     r3, [r7, +r2]
        mov     r0, r4
        ldmia   sp!, {r1, r4 - r11, pc}
LBZA4:
        mov     r0, r5
        bl      __floatsidf
        ldr     r9, [pc, #0xA8]
        ldr     r10, [pc, #0xA8]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r9
        mov     r1, r10
        bl      __divdf3
        mov     r12, r5, asr #2
        mov     r10, r0
        mov     r9, r1
        add     r12, r5, r12, lsr #29
        movs    r5, r12, asr #3
        bmi     LBZA6
        mov     r11, r7
LBZA5:
        mov     r0, r6
        bl      __floatsidf
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        bl      sin
        bl      __truncdfsf2
        add     r6, r6, #1
        str     r0, [r11], #4
        cmp     r6, r5
        ble     LBZA5
LBZA6:
        add     r5, r5, #1
        cmp     r5, r8
        bgt     LBZA8
        add     r7, r7, r5, lsl #2
LBZA7:
        sub     r0, r8, r5
        bl      __floatsidf
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        bl      cos
        bl      __truncdfsf2
        add     r5, r5, #1
        str     r0, [r7], #4
        cmp     r5, r8
        ble     LBZA7
LBZA8:
        mov     r0, r4
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   fft_fix_twiddle_table_32f
        .long   LBZA__2il0floatpacket.1
        .long   0x54442d18
        .long   0x401921fb


        .data
        .align  4


LBZA__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F


