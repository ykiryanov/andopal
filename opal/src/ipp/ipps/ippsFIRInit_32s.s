        .text
        .align  4
        .globl  _ippsFIRInit_32s


_ippsFIRInit_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r12, [sp, #0x38]
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r2
        mov     r4, r3
        beq     LBTF9
        cmp     r1, #0
        beq     LBTF9
        cmp     r12, #0
        beq     LBTF9
        cmp     r5, #0
        ble     LBTF7
        add     r12, r12, #0xF
        mov     r11, r5, lsl #3
        bic     r12, r12, #0xF
        str     r12, [r6]
        add     r8, r11, #0xF
        add     lr, r12, #0x70
        str     lr, [r12, #4]
        ldr     r7, [r6]
        ldr     lr, [pc, #0x318]
        bic     r8, r8, #0xF
        add     r12, r12, r8
        add     r8, r5, r5, lsl #1
        add     r8, r8, #4
        add     r9, r12, #0x70
        str     r9, [r7, #8]
        ldr     r7, [r6]
        mov     r8, r8, lsl #3
        add     r8, r8, #0xF
        bic     r8, r8, #0xF
        add     r8, r12, r8
        add     r12, r8, #0x70
        str     r12, [r7, #0x54]
        ldr     r7, [r6]
        mov     r0, #0
        cmp     r5, #5
        str     r0, [r7, #0x34]
        ldr     r7, [r6]
        str     r0, [r7, #0x20]
        ldr     r8, [r6]
        add     r7, r5, #3
        bic     r7, r7, #3
        str     r0, [r8, #0x30]
        ldr     r8, [r6]
        str     lr, [r8]
        ldr     lr, [r6]
        str     r5, [lr, #0xC]
        ldr     r8, [r6]
        add     lr, r7, #1
        mvn     r7, #0
        str     r0, [r8, #0x4C]
        ldr     r8, [r6]
        str     r5, [r8, #0x40]
        ldr     r8, [r6]
        str     r0, [r8, #0x2C]
        ldr     r8, [r6]
        str     r0, [r8, #0x58]
        ldr     r8, [r6]
        str     lr, [r8, #0x14]
        ldr     r8, [r6]
        sub     lr, r5, #1
        str     r0, [r8, #0x48]
        ldr     r8, [r6]
        str     r7, [r8, #0x28]
        ldr     r7, [r6]
        str     r0, [r7, #0x24]
        ldr     r7, [r6]
        str     r12, [r7, #0x44]
        ldr     r7, [r6]
        ldr     r12, [r7, #0x44]
        str     r12, [r7, #0x50]
        addlt   r7, r1, lr, lsl #2
        movlt   r8, r0
        blt     LBTF1
        add     r7, r1, lr, lsl #2
        sub     r12, r5, #5
        mov     r1, #8
        str     r11, [sp, #4]
        str     r4, [sp, #8]
        mov     r8, r0
        mov     r9, #0x10
        mov     r10, #0x18
        str     r12, [sp]
        str     r5, [sp, #0xC]
        mov     r4, r0
        mov     r11, r1
LBTF0:
        rsb     r2, r8, #0
        ldr     r0, [r7, +r2, lsl #2]
        bl      __floatsidf
        ldr     r2, [r6]
        mvn     r3, #0
        rsb     r3, r8, r3
        ldr     r2, [r2, #4]
        mvn     r12, #1
        rsb     r12, r8, r12
        str     r12, [sp, #0x10]
        str     r0, [r2, +r8, lsl #3]
        mvn     r12, #2
        rsb     r5, r8, r12
        add     r2, r2, r4
        str     r1, [r2, #4]
        ldr     r0, [r7, +r3, lsl #2]
        add     r4, r4, #0x20
        add     r8, r8, #4
        bl      __floatsidf
        ldr     r2, [r6]
        ldr     r2, [r2, #4]
        str     r0, [r2, +r11]
        add     r2, r2, r11
        str     r1, [r2, #4]
        ldr     r2, [sp, #0x10]
        add     r11, r11, #0x20
        ldr     r0, [r7, +r2, lsl #2]
        bl      __floatsidf
        ldr     r2, [r6]
        ldr     r2, [r2, #4]
        str     r0, [r2, +r9]
        add     r2, r2, r9
        str     r1, [r2, #4]
        ldr     r0, [r7, +r5, lsl #2]
        add     r9, r9, #0x20
        bl      __floatsidf
        ldr     r2, [sp]
        cmp     r8, r2
        ldr     r2, [r6]
        ldr     r2, [r2, #4]
        str     r0, [r2, +r10]
        add     r2, r2, r10
        str     r1, [r2, #4]
        add     r10, r10, #0x20
        ble     LBTF0
        ldr     r11, [sp, #4]
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #0xC]
LBTF1:
        mov     r9, r8, lsl #3
LBTF2:
        rsb     r12, r8, #0
        ldr     r0, [r7, +r12, lsl #2]
        bl      __floatsidf
        ldr     r12, [r6]
        ldr     r12, [r12, #4]
        str     r0, [r12, +r8, lsl #3]
        add     r8, r8, #1
        cmp     r8, r5
        add     r12, r12, r9
        str     r1, [r12, #4]
        add     r9, r9, #8
        blt     LBTF2
        ldr     r6, [r6]
        cmp     r4, #0
        ldr     r0, [r6, #8]
        beq     LBTF8
        cmp     r5, #0
        ble     LBTF6
        cmp     r5, #6
        mov     r10, #0
        sublt   r7, r0, #8
        blt     LBTF4
        sub     r7, r0, #8
        sub     r9, r5, #6
        add     r8, r4, #4
LBTF3:
        ldr     r0, [r8, #-4]
        sub     r6, r5, r10
        add     r10, r10, #5
        bl      __floatsidf
        str     r0, [r7, +r6, lsl #3]
        add     r0, r7, r6, lsl #3
        str     r1, [r0, #4]
        ldr     r0, [r8]
        mov     r6, r6, lsl #3
        sub     r11, r6, #0x10
        bl      __floatsidf
        sub     r12, r6, #8
        str     r0, [r7, +r12]
        add     r12, r7, r12
        str     r1, [r12, #4]
        ldr     r0, [r8, #4]
        bl      __floatsidf
        str     r0, [r7, +r11]
        add     r11, r7, r11
        str     r1, [r11, #4]
        ldr     r0, [r8, #8]
        sub     r11, r6, #0x18
        sub     r6, r6, #0x20
        bl      __floatsidf
        str     r0, [r7, +r11]
        add     r11, r7, r11
        str     r1, [r11, #4]
        ldr     r0, [r8, #0xC]
        add     r8, r8, #0x14
        bl      __floatsidf
        str     r0, [r7, +r6]
        add     r6, r7, r6
        cmp     r10, r9
        str     r1, [r6, #4]
        ble     LBTF3
LBTF4:
        add     r4, r4, r10, lsl #2
LBTF5:
        ldr     r0, [r4], #4
        bl      __floatsidf
        sub     r3, r5, r10
        str     r0, [r7, +r3, lsl #3]
        add     r10, r10, #1
        add     r3, r7, r3, lsl #3
        cmp     r10, r5
        str     r1, [r3, #4]
        blt     LBTF5
LBTF6:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBTF7:
        mvn     r0, #0x19
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBTF8:
        mov     r1, r11
        bl      _ippsZero_8u
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBTF9:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   0x46493231


