        .text
        .align  4
        .globl  _ippsConvert_32s64f_Sfs


_ippsConvert_32s64f_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r6, r0
        cmp     r6, #0
        add     r12, sp, #0xC
        mov     r5, r1
        mov     r4, r2
        beq     LCWY9
        cmp     r5, #0
        beq     LCWY9
        cmp     r4, #0
        ble     LCWY10
        cmp     r3, #0
        mov     r7, #0
        bne     LCWY3
        cmp     r4, #6
        blt     LCWY1
        sub     r10, r4, #6
        sub     r9, r5, #0x24
        mov     r8, r6
        str     r4, [sp, #8]
LCWY0:
        ldr     r0, [r8], #0x14
        add     r4, r7, #1
        bl      __floatsidf
        str     r0, [r9, #0x24]
        str     r1, [r9, #0x28]!
        ldr     r0, [r6, +r4, lsl #2]
        bl      __floatsidf
        str     r0, [r5, +r4, lsl #3]
        add     r4, r5, r4, lsl #3
        str     r1, [r4, #4]
        add     r4, r7, #2
        ldr     r0, [r6, +r4, lsl #2]
        add     r11, r5, r4, lsl #3
        bl      __floatsidf
        str     r0, [r5, +r4, lsl #3]
        str     r1, [r11, #4]
        add     r4, r7, #3
        ldr     r0, [r6, +r4, lsl #2]
        add     r11, r5, r4, lsl #3
        bl      __floatsidf
        str     r0, [r5, +r4, lsl #3]
        str     r1, [r11, #4]
        add     r4, r7, #4
        ldr     r0, [r6, +r4, lsl #2]
        add     r7, r7, #5
        bl      __floatsidf
        str     r0, [r5, +r4, lsl #3]
        add     r4, r5, r4, lsl #3
        cmp     r7, r10
        str     r1, [r4, #4]
        ble     LCWY0
        ldr     r4, [sp, #8]
LCWY1:
        mov     r3, r7, lsl #3
        sub     r3, r3, #4
        add     r5, r3, r5
        add     r6, r6, r7, lsl #2
LCWY2:
        ldr     r0, [r6], #4
        add     r7, r7, #1
        bl      __floatsidf
        str     r0, [r5, #4]
        str     r1, [r5, #8]!
        cmp     r7, r4
        blt     LCWY2
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWY3:
        mov     lr, #0xFF
        cmp     r3, #0
        orr     lr, lr, #3, 24
        ble     LCWY8
        sub     r8, lr, #1
        cmp     r3, r8
        movlt   r8, r3
LCWY4:
        rsb     lr, r8, lr
        cmp     r4, #6
        mov     r3, lr, lsl #20
        str     r3, [r12, #4]
        str     r7, [r12]
        ldrlt   r9, [sp, #0xC]
        ldrlt   r8, [sp, #0x10]
        blt     LCWY6
        ldr     r9, [sp, #0xC]
        ldr     r8, [sp, #0x10]
        sub     r12, r4, #6
        mov     lr, r6
        sub     r10, r5, #0x24
        str     lr, [sp]
        str     r12, [sp, #4]
        str     r4, [sp, #8]
LCWY5:
        ldr     r12, [sp]
        add     r11, r7, #1
        add     r4, r7, #2
        ldr     r0, [r12], #0x14
        str     r12, [sp]
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        str     r0, [r10, #0x24]
        str     r1, [r10, #0x28]!
        ldr     r0, [r6, +r11, lsl #2]
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        str     r0, [r5, +r11, lsl #3]
        add     r11, r5, r11, lsl #3
        str     r1, [r11, #4]
        ldr     r0, [r6, +r4, lsl #2]
        add     r11, r5, r4, lsl #3
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        str     r0, [r5, +r4, lsl #3]
        str     r1, [r11, #4]
        add     r4, r7, #3
        ldr     r0, [r6, +r4, lsl #2]
        add     r11, r5, r4, lsl #3
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        str     r0, [r5, +r4, lsl #3]
        str     r1, [r11, #4]
        add     r4, r7, #4
        ldr     r0, [r6, +r4, lsl #2]
        add     r7, r7, #5
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        str     r0, [r5, +r4, lsl #3]
        ldr     r12, [sp, #4]
        add     r4, r5, r4, lsl #3
        cmp     r7, r12
        str     r1, [r4, #4]
        ble     LCWY5
        ldr     r4, [sp, #8]
LCWY6:
        mov     r12, r7, lsl #3
        sub     r12, r12, #4
        add     r5, r12, r5
        add     r6, r6, r7, lsl #2
LCWY7:
        ldr     r0, [r6], #4
        add     r7, r7, #1
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        str     r0, [r5, #4]
        str     r1, [r5, #8]!
        cmp     r7, r4
        blt     LCWY7
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWY8:
        sub     r8, r7, #0x3E, 28
        cmp     r3, r8
        movgt   r8, r3
        b       LCWY4
LCWY9:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCWY10:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


