        .text
        .align  4
        .globl  ownsIIRGetDlyLine32sc_16sc


ownsIIRGetDlyLine32sc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r5, r0
        ldr     r3, [r5]
        ldr     r2, [pc, #0x194]
        ldr     r6, [r5, #0x2C]
        mov     r4, r1
        cmp     r2, r3
        moveq   r6, r6, lsl #1
        cmp     r6, #0
        ble     LBNS3
        cmp     r6, #5
        mov     r9, #0
        movlt   r10, r9
        blt     LBNS1
        mov     r10, r9
        sub     r2, r6, #5
        sub     r8, r4, #0x1C
        str     r2, [sp, #4]
        str     r6, [sp]
LBNS0:
        ldr     r2, [r5, #0x10]
        add     r11, r10, #1
        add     r6, r10, #2
        ldr     r0, [r2, +r10, lsl #4]
        add     r3, r2, r9
        ldr     r1, [r3, #4]
        add     r2, r4, r11, lsl #3
        str     r2, [sp, #8]
        bl      __floatdisf
        str     r0, [r8, #0x1C]
        ldr     r3, [r5, #0x10]
        add     r2, r4, r6, lsl #3
        str     r2, [sp, #0xC]
        add     r2, r3, r9
        ldr     r1, [r2, #0xC]
        ldr     r0, [r2, #8]
        add     r9, r9, #0x40
        add     r7, r10, #3
        bl      __floatdisf
        str     r0, [r8, #0x20]!
        ldr     r2, [r5, #0x10]
        add     r10, r10, #4
        ldr     r0, [r2, +r11, lsl #4]
        add     r2, r2, r11, lsl #4
        ldr     r1, [r2, #4]
        bl      __floatdisf
        str     r0, [r4, +r11, lsl #3]
        ldr     r2, [r5, #0x10]
        add     r11, r2, r11, lsl #4
        ldr     r1, [r11, #0xC]
        ldr     r0, [r11, #8]
        add     r11, r4, r7, lsl #3
        bl      __floatdisf
        ldr     r2, [sp, #8]
        str     r0, [r2, #4]
        ldr     r3, [r5, #0x10]
        add     r2, r3, r6, lsl #4
        ldr     r1, [r2, #4]
        ldr     r0, [r3, +r6, lsl #4]
        bl      __floatdisf
        str     r0, [r4, +r6, lsl #3]
        ldr     r2, [r5, #0x10]
        add     r6, r2, r6, lsl #4
        ldr     r0, [r6, #8]
        ldr     r1, [r6, #0xC]
        bl      __floatdisf
        ldr     r2, [sp, #0xC]
        str     r0, [r2, #4]
        ldr     r2, [r5, #0x10]
        add     r3, r2, r7, lsl #4
        ldr     r1, [r3, #4]
        ldr     r0, [r2, +r7, lsl #4]
        bl      __floatdisf
        str     r0, [r4, +r7, lsl #3]
        ldr     r2, [r5, #0x10]
        add     r7, r2, r7, lsl #4
        ldr     r0, [r7, #8]
        ldr     r1, [r7, #0xC]
        bl      __floatdisf
        ldr     r2, [sp, #4]
        str     r0, [r11, #4]
        cmp     r10, r2
        ble     LBNS0
        ldr     r6, [sp]
LBNS1:
        mov     r2, r10, lsl #3
        sub     r2, r2, #4
        add     r4, r2, r4
        mov     r7, r10, lsl #4
LBNS2:
        ldr     r2, [r5, #0x10]
        add     r1, r2, r7
        ldr     r1, [r1, #4]
        ldr     r0, [r2, +r10, lsl #4]
        add     r10, r10, #1
        bl      __floatdisf
        str     r0, [r4, #4]
        ldr     r1, [r5, #0x10]
        add     r1, r1, r7
        ldr     r0, [r1, #8]
        ldr     r1, [r1, #0xC]
        add     r7, r7, #0x10
        bl      __floatdisf
        str     r0, [r4, #8]!
        cmp     r10, r6
        blt     LBNS2
LBNS3:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   0x49493132


