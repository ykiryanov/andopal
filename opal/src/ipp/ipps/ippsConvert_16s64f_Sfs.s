        .text
        .align  4
        .globl  _ippsConvert_16s64f_Sfs


_ippsConvert_16s64f_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r6, r2
        beq     LCXB9
        cmp     r7, #0
        beq     LCXB9
        cmp     r6, #0
        ble     LCXB10
        cmp     r3, #0
        add     r12, sp, #0xC
        mov     r10, #0
        bne     LCXB3
        cmp     r6, #6
        blt     LCXB1
        sub     r3, r6, #6
        mov     r5, r8
        sub     r4, r7, #0x24
        str     r3, [sp, #4]
        str     r6, [sp, #8]
LCXB0:
        ldrsh   r0, [r5], #0xA
        add     r6, r10, #1
        bl      __floatsidf
        str     r1, [r4, #0x28]
        str     r0, [r4, #0x24]
        mov     r2, r6, lsl #1
        ldrsh   r0, [r8, +r2]
        add     r4, r4, #0x28
        add     r9, r7, r6, lsl #3
        bl      __floatsidf
        str     r0, [r7, +r6, lsl #3]
        str     r1, [r9, #4]
        add     r9, r10, #2
        add     r6, r10, #3
        mov     r2, r9, lsl #1
        ldrsh   r0, [r8, +r2]
        add     r11, r7, r9, lsl #3
        bl      __floatsidf
        str     r0, [r7, +r9, lsl #3]
        str     r1, [r11, #4]
        mov     r2, r6, lsl #1
        ldrsh   r0, [r8, +r2]
        add     r9, r7, r6, lsl #3
        bl      __floatsidf
        str     r0, [r7, +r6, lsl #3]
        str     r1, [r9, #4]
        add     r6, r10, #4
        add     r10, r10, #5
        mov     r2, r6, lsl #1
        ldrsh   r0, [r8, +r2]
        add     r9, r7, r6, lsl #3
        bl      __floatsidf
        str     r0, [r7, +r6, lsl #3]
        ldr     r2, [sp, #4]
        str     r1, [r9, #4]
        cmp     r10, r2
        ble     LCXB0
        ldr     r6, [sp, #8]
LCXB1:
        mov     r3, r10, lsl #3
        sub     r3, r3, #4
        add     r7, r3, r7
        add     r8, r8, r10, lsl #1
LCXB2:
        ldrsh   r0, [r8], #2
        add     r10, r10, #1
        bl      __floatsidf
        str     r0, [r7, #4]
        str     r1, [r7, #8]!
        cmp     r10, r6
        blt     LCXB2
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCXB3:
        mov     lr, #0xFF
        cmp     r3, #0
        orr     lr, lr, #3, 24
        ble     LCXB8
        sub     r4, lr, #1
        cmp     r3, r4
        movlt   r4, r3
LCXB4:
        rsb     lr, r4, lr
        cmp     r6, #6
        mov     r3, lr, lsl #20
        str     r3, [r12, #4]
        str     r10, [r12]
        ldrlt   r5, [sp, #0xC]
        ldrlt   r4, [sp, #0x10]
        blt     LCXB6
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        sub     lr, r6, #6
        mov     r12, r8
        sub     r9, r7, #0x24
        str     r12, [sp]
        str     lr, [sp, #4]
        str     r6, [sp, #8]
LCXB5:
        ldr     r12, [sp]
        add     r11, r10, #1
        add     r6, r10, #2
        ldrsh   r0, [r12], #0xA
        str     r12, [sp]
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #0x24]
        str     r1, [r9, #0x28]!
        mov     r12, r11, lsl #1
        ldrsh   r0, [r8, +r12]
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7, +r11, lsl #3]
        add     r11, r7, r11, lsl #3
        str     r1, [r11, #4]
        mov     r12, r6, lsl #1
        ldrsh   r0, [r8, +r12]
        add     r11, r7, r6, lsl #3
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7, +r6, lsl #3]
        str     r1, [r11, #4]
        add     r11, r10, #3
        add     r6, r10, #4
        mov     r12, r11, lsl #1
        ldrsh   r0, [r8, +r12]
        add     r10, r10, #5
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7, +r11, lsl #3]
        add     r11, r7, r11, lsl #3
        str     r1, [r11, #4]
        mov     r12, r6, lsl #1
        ldrsh   r0, [r8, +r12]
        add     r11, r7, r6, lsl #3
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [sp, #4]
        str     r0, [r7, +r6, lsl #3]
        cmp     r10, r12
        str     r1, [r11, #4]
        ble     LCXB5
        ldr     r6, [sp, #8]
LCXB6:
        mov     r12, r10, lsl #3
        sub     r12, r12, #4
        add     r7, r12, r7
        add     r8, r8, r10, lsl #1
LCXB7:
        ldrsh   r0, [r8], #2
        add     r10, r10, #1
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7, #4]
        str     r1, [r7, #8]!
        cmp     r10, r6
        blt     LCXB7
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCXB8:
        sub     r4, r10, #0x3F, 28
        cmp     r3, r4
        movgt   r4, r3
        b       LCXB4
LCXB9:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCXB10:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


