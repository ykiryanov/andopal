        .text
        .align  4
        .globl  _ippsFIRInitAlloc_32s


_ippsFIRInitAlloc_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r7, r0
        cmp     r7, #0
        mov     r8, r1
        mov     r6, r2
        mov     r5, r3
        beq     LBTG10
        cmp     r8, #0
        beq     LBTG10
        cmp     r6, #0
        ble     LBTG0
        add     r12, r6, r6, lsl #1
        add     r12, r12, #4
        mov     r4, r6, lsl #3
        mov     r12, r12, lsl #3
        add     lr, r4, #0xF
        add     r12, r12, #0xF
        bic     r9, lr, #0xF
        bic     r10, r12, #0xF
        add     r12, r9, #0x10
        mov     lr, #0x70
        add     r12, r12, r10
        orr     lr, lr, #2, 18
        add     r0, r12, lr
        bl      _ippsMalloc_8u
        mov     r1, r0
        cmp     r1, #0
        bne     LBTG1
        mvn     r0, #8
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBTG0:
        mvn     r0, #0x19
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBTG1:
        str     r1, [r7]
        ldr     r12, [pc, #0x33C]
        add     lr, r1, #0x70
        str     lr, [r1, #4]
        ldr     r0, [r7]
        add     r11, r1, r9
        add     r1, r1, #0x10
        add     r1, r9, r1
        add     lr, r10, r1
        add     r10, r11, r10
        add     r11, r11, #0x70
        str     r11, [r0, #8]
        ldr     r9, [r7]
        add     r10, r10, #0x70
        mov     r0, #0
        str     r10, [r9, #0x54]
        ldr     r9, [r7]
        add     lr, lr, #0x70
        cmp     r6, #5
        str     r0, [r9, #0x34]
        ldr     r9, [r7]
        str     r0, [r9, #0x20]
        ldr     r9, [r7]
        str     r0, [r9, #0x30]
        ldr     r10, [r7]
        mov     r9, #1
        str     r12, [r10]
        ldr     r10, [r7]
        sub     r12, r6, #1
        str     r6, [r10, #0xC]
        ldr     r10, [r7]
        str     r0, [r10, #0x4C]
        ldr     r10, [r7]
        str     r6, [r10, #0x40]
        ldr     r10, [r7]
        str     r0, [r10, #0x2C]
        ldr     r10, [r7]
        str     r9, [r10, #0x58]
        ldr     r9, [r7]
        str     lr, [r9, #0x44]
        ldr     r9, [r7]
        str     lr, [r9, #0x50]
        addlt   r8, r8, r12, lsl #2
        movlt   r9, r0
        blt     LBTG3
        add     r8, r8, r12, lsl #2
        sub     r1, r6, #5
        mov     r12, #8
        str     r4, [sp, #0xC]
        str     r5, [sp, #4]
        mov     r9, r0
        mov     r10, #0x10
        mov     r11, #0x18
        str     r12, [sp, #0x10]
        str     r6, [sp, #8]
        str     r7, [sp]
        mov     r5, r0
        mov     r4, r1
LBTG2:
        rsb     r2, r9, #0
        ldr     r0, [r8, +r2, lsl #2]
        bl      __floatsidf
        ldr     r2, [sp]
        ldr     r3, [r2]
        mvn     r12, #1
        rsb     r6, r9, r12
        mvn     r12, #2
        ldr     r3, [r3, #4]
        rsb     r7, r9, r12
        mvn     r2, #0
        rsb     r2, r9, r2
        str     r0, [r3, +r9, lsl #3]
        add     r3, r3, r5
        str     r1, [r3, #4]
        ldr     r0, [r8, +r2, lsl #2]
        add     r5, r5, #0x20
        add     r9, r9, #4
        bl      __floatsidf
        ldr     r2, [sp]
        ldr     r3, [sp, #0x10]
        ldr     r2, [r2]
        ldr     r2, [r2, #4]
        str     r0, [r2, +r3]
        add     r3, r2, r3
        str     r1, [r3, #4]
        ldr     r2, [sp, #0x10]
        add     r2, r2, #0x20
        str     r2, [sp, #0x10]
        ldr     r0, [r8, +r6, lsl #2]
        bl      __floatsidf
        ldr     r2, [sp]
        ldr     r2, [r2]
        ldr     r2, [r2, #4]
        str     r0, [r2, +r10]
        add     r2, r2, r10
        str     r1, [r2, #4]
        ldr     r0, [r8, +r7, lsl #2]
        add     r10, r10, #0x20
        bl      __floatsidf
        ldr     r2, [sp]
        cmp     r9, r4
        ldr     r2, [r2]
        ldr     r2, [r2, #4]
        str     r0, [r2, +r11]
        add     r2, r2, r11
        str     r1, [r2, #4]
        add     r11, r11, #0x20
        ble     LBTG2
        ldr     r4, [sp, #0xC]
        ldr     r5, [sp, #4]
        ldr     r6, [sp, #8]
        ldr     r7, [sp]
LBTG3:
        mov     r10, r9, lsl #3
LBTG4:
        rsb     r12, r9, #0
        ldr     r0, [r8, +r12, lsl #2]
        bl      __floatsidf
        ldr     r12, [r7]
        ldr     r12, [r12, #4]
        str     r0, [r12, +r9, lsl #3]
        add     r9, r9, #1
        cmp     r9, r6
        add     r12, r12, r10
        str     r1, [r12, #4]
        add     r10, r10, #8
        blt     LBTG4
        cmp     r5, #0
        mov     r8, #0
        beq     LBTG9
        ldr     r1, [r7]
        cmp     r6, #0
        ldr     r12, [r1, #8]
        ble     LBTG8
        cmp     r6, #6
        sublt   r4, r12, #8
        movlt   r11, #0
        blt     LBTG6
        sub     r4, r12, #8
        mov     r11, #0
        sub     r10, r6, #6
        add     r9, r5, #4
        str     r5, [sp, #4]
        str     r7, [sp]
LBTG5:
        ldr     r0, [r9, #-4]
        sub     r5, r6, r11
        add     r11, r11, #5
        bl      __floatsidf
        str     r0, [r4, +r5, lsl #3]
        add     r0, r4, r5, lsl #3
        str     r1, [r0, #4]
        ldr     r0, [r9]
        mov     r5, r5, lsl #3
        sub     r7, r5, #0x10
        bl      __floatsidf
        sub     r3, r5, #8
        str     r0, [r4, +r3]
        add     r3, r4, r3
        str     r1, [r3, #4]
        ldr     r0, [r9, #4]
        bl      __floatsidf
        str     r0, [r4, +r7]
        add     r7, r4, r7
        str     r1, [r7, #4]
        ldr     r0, [r9, #8]
        sub     r7, r5, #0x18
        sub     r5, r5, #0x20
        bl      __floatsidf
        str     r0, [r4, +r7]
        add     r7, r4, r7
        str     r1, [r7, #4]
        ldr     r0, [r9, #0xC]
        add     r9, r9, #0x14
        bl      __floatsidf
        str     r0, [r4, +r5]
        add     r5, r4, r5
        cmp     r11, r10
        str     r1, [r5, #4]
        ble     LBTG5
        ldr     r5, [sp, #4]
        ldr     r7, [sp]
LBTG6:
        add     r5, r5, r11, lsl #2
LBTG7:
        ldr     r0, [r5], #4
        bl      __floatsidf
        sub     r3, r6, r11
        str     r0, [r4, +r3, lsl #3]
        add     r11, r11, #1
        add     r3, r4, r3, lsl #3
        cmp     r11, r6
        str     r1, [r3, #4]
        blt     LBTG7
        ldr     r1, [r7]
LBTG8:
        add     r6, r6, #3
        bic     r6, r6, #3
        add     r6, r6, #1
        str     r6, [r1, #0x14]
        ldr     r2, [r7]
        mvn     r1, #0
        mov     r0, #0
        str     r1, [r2, #0x28]
        ldr     r7, [r7]
        str     r8, [r7, #0x24]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBTG9:
        ldr     r3, [r7]
        mov     r1, r4
        ldr     r0, [r3, #8]
        bl      _ippsZero_8u
        ldr     r1, [r7]
        b       LBTG8
LBTG10:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   0x46493231


