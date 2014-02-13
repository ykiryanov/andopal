        .text
        .align  4
        .globl  _ippsWinHamming_64f


_ippsWinHamming_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r4, r2
        beq     LAKN4
        cmp     r8, #0
        beq     LAKN4
        cmp     r4, #3
        blt     LAKN2
        sub     r6, r4, #1
        mov     r0, r6
        bl      __floatsidf
        ldr     r7, [pc, #0x2A0]
        ldr     r5, [pc, #0x2A0]
        mov     r3, r1
        mov     r2, r0
        mov     r1, r5
        mov     r0, r7
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
        orr     r7, r12, #3, 4
        mov     r0, #0
        mov     r1, r7
        bl      __subdf3
        bl      sqrt
        cmp     r6, #0
        mov     r2, #0
        mov     r3, r2
        mov     r12, #1
        movlt   r3, r12
        add     r3, r4, r3
        sub     r3, r3, #1
        movs    r12, r3, asr #1
        add     r3, r9, r4, lsl #3
        add     r4, r8, r4, lsl #3
        sub     r11, r3, #8
        sub     r10, r4, #8
        sub     r3, r12, #1
        moveq   r6, r2
        moveq   r4, r7
        beq     LAKN1
        mov     r6, r2
        mov     r4, r7
        mov     lr, r6
        mov     r12, lr
        str     r7, [sp, #0x14]
        str     r5, [sp, #8]
        str     r8, [sp, #0x18]
        str     r3, [sp, #4]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
        mov     r7, r2
        mov     r5, r12
        mov     r8, lr
LAKN0:
        ldr     r2, [pc, #0x1E0]
        ldr     r3, [pc, #0x1E0]
        mov     r0, r6
        mov     r1, r4
        bl      __muldf3
        ldr     r4, [pc, #0x1D4]
        ldr     r6, [pc, #0x1D4]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r6
        bl      __subdf3
        ldr     r2, [r9]
        ldr     r3, [r9, #4]
        mov     r4, r0
        mov     r6, r1
        bl      __muldf3
        ldr     r3, [sp, #0x18]
        add     r9, r9, #8
        str     r0, [r3]
        str     r1, [r3, #4]
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        mov     r0, r4
        mov     r1, r6
        bl      __muldf3
        str     r1, [r10, #4]
        str     r0, [r10], #-8
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #8]
        ldr     r3, [sp]
        mov     r0, r8
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        mov     r4, r0
        mov     r6, r1
        mov     r0, r5
        mov     r1, r7
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r6
        bl      __subdf3
        mov     r4, r1
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        mov     r6, r0
        mov     r0, r8
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp]
        str     r1, [sp, #0x14]
        mov     r8, r0
        mov     r0, r5
        mov     r1, r7
        bl      __muldf3
        ldr     r3, [sp, #0x14]
        mov     r2, r8
        bl      __adddf3
        ldr     r3, [sp, #4]
        sub     r11, r11, #8
        mov     r5, r0
        sub     r3, r3, #1
        cmn     r3, #1
        str     r3, [sp, #4]
        ldr     r3, [sp, #0x18]
        mov     r7, r1
        add     r3, r3, #8
        str     r3, [sp, #0x18]
        mov     r8, r6
        str     r4, [sp, #0x14]
        bne     LAKN0
        ldr     r8, [sp, #0x18]
LAKN1:
        cmp     r8, r10
        beq     LAKN3
        ldr     r2, [pc, #0xA8]
        ldr     r3, [pc, #0xA8]
        mov     r1, r4
        mov     r0, r6
        bl      __muldf3
        ldr     r5, [pc, #0x9C]
        ldr     r4, [pc, #0x9C]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
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
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAKN2:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAKN3:
        ldr     r2, [r9]
        ldr     r9, [r9, #4]
        str     r2, [r8]
        str     r9, [r8, #4]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAKN4:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   0xd70a3d71
        .long   0x3fdd70a3
        .long   0x147ae148
        .long   0x3fe147ae


