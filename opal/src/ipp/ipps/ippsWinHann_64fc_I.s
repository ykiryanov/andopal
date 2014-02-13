        .text
        .align  4
        .globl  _ippsWinHann_64fc_I


_ippsWinHann_64fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     r10, r0
        cmp     r10, #0
        mov     r5, r1
        beq     LAKG4
        cmp     r5, #3
        blt     LAKG3
        sub     r6, r5, #1
        mov     r0, r6
        bl      __floatsidf
        ldr     r7, [pc, #0x2D4]
        ldr     r4, [pc, #0x2D4]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r4
        bl      __divdf3
        bl      cos
        mov     r7, r0
        mov     r9, r1
        mov     r2, r7
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r12, #0xFF, 12
        orr     r4, r12, #3, 4
        mov     r0, #0
        mov     r1, r4
        bl      __subdf3
        bl      sqrt
        cmp     r6, #0
        mov     r12, #0
        mov     lr, r12
        mov     r6, #1
        movlt   lr, r6
        add     lr, r5, lr
        sub     lr, lr, #1
        add     r5, r10, r5, lsl #4
        movs    lr, lr, asr #1
        mov     r2, r1
        sub     r11, r5, #0x10
        sub     r1, lr, #1
        moveq   r6, r12
        moveq   r5, r4
        beq     LAKG1
        mov     r6, r12
        mov     r5, r4
        mov     r3, r6
        str     r9, [sp, #0xC]
        str     r7, [sp]
        mov     r8, r3
        str     r12, [sp, #0x10]
        str     r2, [sp, #4]
        str     r0, [sp, #8]
        mov     r9, r1
        mov     r7, r3
LAKG0:
        mov     r12, #0xFF, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #1, 12
        str     r3, [sp, #0x14]
        mov     r1, r5
        mov     r2, #0
        mov     r0, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r1, [sp, #0x14]
        mov     r0, #0
        bl      __subdf3
        ldr     r2, [r10]
        ldr     r3, [r10, #4]
        mov     r5, r0
        mov     r6, r1
        bl      __muldf3
        ldr     r2, [r10, #8]
        ldr     r3, [r10, #0xC]
        str     r0, [r10]
        str     r1, [r10, #4]
        mov     r1, r6
        mov     r0, r5
        bl      __muldf3
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        ldr     r3, [r11, #4]
        ldr     r2, [r11]
        mov     r1, r6
        mov     r0, r5
        bl      __muldf3
        ldr     r2, [r11, #8]
        ldr     r3, [r11, #0xC]
        str     r1, [r11, #4]
        str     r0, [r11]
        mov     r1, r6
        mov     r0, r5
        bl      __muldf3
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        mov     r0, r7
        mov     r1, r4
        bl      __muldf3
        mov     r6, r1
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        mov     r5, r0
        mov     r0, r8
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r6
        mov     r0, r5
        bl      __subdf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        mov     r6, r0
        mov     r5, r1
        mov     r0, r7
        mov     r1, r4
        bl      __muldf3
        mov     r7, r1
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        mov     r4, r0
        mov     r0, r8
        bl      __muldf3
        mov     r2, r4
        mov     r3, r7
        bl      __adddf3
        sub     r9, r9, #1
        cmn     r9, #1
        add     r10, r10, #0x10
        sub     r11, r11, #0x10
        mov     r8, r0
        str     r1, [sp, #0x10]
        mov     r7, r6
        mov     r4, r5
        bne     LAKG0
LAKG1:
        cmp     r10, r11
        beq     LAKG2
        mov     r0, r6
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0xFF, 12
        orr     r3, r3, #3, 4
        sub     r4, r3, #1, 12
        mov     r3, r4
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r4
        mov     r0, #0
        bl      __subdf3
        ldr     r2, [r10]
        ldr     r3, [r10, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        ldr     r2, [r10, #8]
        ldr     r3, [r10, #0xC]
        str     r0, [r10]
        str     r1, [r10, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r10, #8]
        str     r1, [r10, #0xC]
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        ldr     r2, [r11, #8]
        ldr     r3, [r11, #0xC]
        str     r0, [r11]
        str     r1, [r11, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
LAKG2:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAKG3:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LAKG4:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


