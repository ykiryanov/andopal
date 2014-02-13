        .text
        .align  4
        .globl  _ippsWinHann_64f


_ippsWinHann_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r6, r2
        beq     LAKJ4
        cmp     r8, #0
        beq     LAKJ4
        cmp     r6, #3
        blt     LAKJ2
        sub     r7, r6, #1
        mov     r0, r7
        bl      __floatsidf
        ldr     r5, [pc, #0x294]
        ldr     r4, [pc, #0x294]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        bl      cos
        mov     r3, r1
        mov     r5, r0
        str     r3, [sp]
        mov     r2, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r12, #0xFF, 12
        orr     r4, r12, #3, 4
        mov     r0, #0
        mov     r1, r4
        bl      __subdf3
        bl      sqrt
        cmp     r7, #0
        mov     r3, #0
        mov     r12, r3
        mov     lr, #1
        movlt   r12, lr
        add     r12, r6, r12
        sub     r12, r12, #1
        movs    lr, r12, asr #1
        add     r12, r9, r6, lsl #3
        add     r6, r8, r6, lsl #3
        sub     r11, r12, #8
        sub     r10, r6, #8
        sub     r12, lr, #1
        moveq   r7, r3
        moveq   r6, r4
        beq     LAKJ1
        mov     r7, r3
        mov     r6, r4
        mov     r2, r7
        mov     lr, r2
        str     r5, [sp, #0xC]
        str     lr, [sp, #0x18]
        str     r12, [sp, #4]
        str     r3, [sp, #0x14]
        str     r1, [sp, #8]
        str     r0, [sp, #0x10]
        mov     r5, r2
LAKJ0:
        mov     r3, #0xFF, 12
        orr     r3, r3, #3, 4
        sub     r3, r3, #1, 12
        str     r3, [sp, #0x1C]
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r1, [sp, #0x1C]
        mov     r0, #0
        bl      __subdf3
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r6, r0
        mov     r7, r1
        bl      __muldf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        str     r0, [r10]
        str     r1, [r10, #4]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp]
        mov     r0, r5
        mov     r1, r4
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        ldr     r0, [sp, #0x18]
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #8]
        ldr     r1, [sp, #0x14]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #8]
        mov     r7, r0
        mov     r6, r1
        mov     r0, r5
        mov     r1, r4
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #4]
        sub     r2, r2, #1
        cmn     r2, #1
        str     r2, [sp, #4]
        add     r9, r9, #8
        sub     r11, r11, #8
        add     r8, r8, #8
        sub     r10, r10, #8
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        mov     r5, r7
        mov     r4, r6
        bne     LAKJ0
LAKJ1:
        cmp     r8, r10
        beq     LAKJ3
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0xFF, 12
        orr     r2, r2, #3, 4
        sub     r4, r2, #1, 12
        mov     r3, r4
        mov     r2, #0
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r4
        mov     r0, #0
        bl      __subdf3
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r10]
        str     r1, [r10, #4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAKJ2:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAKJ3:
        ldr     r2, [r9]
        ldr     r9, [r9, #4]
        str     r2, [r8]
        str     r9, [r8, #4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LAKJ4:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


