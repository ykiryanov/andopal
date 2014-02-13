        .text
        .align  4
        .globl  _ippsWinHamming_64fc_I


_ippsWinHamming_64fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r10, r0
        cmp     r10, #0
        mov     r6, r1
        beq     LAKK4
        cmp     r6, #3
        blt     LAKK3
        sub     r7, r6, #1
        mov     r0, r7
        bl      __floatsidf
        ldr     r4, [pc, #0x2CC]
        ldr     r5, [pc, #0x2CC]
        mov     r3, r1
        mov     r2, r0
        mov     r1, r4
        mov     r0, r5
        bl      __divdf3
        bl      cos
        mov     r9, r0
        mov     r4, r1
        mov     r2, r9
        mov     r3, r4
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r12, #0xFF, 12
        orr     r5, r12, #3, 4
        mov     r0, #0
        mov     r1, r5
        bl      __subdf3
        bl      sqrt
        cmp     r7, #0
        mov     r2, #0
        mov     r12, r2
        mov     lr, #1
        movlt   r12, lr
        add     r12, r6, r12
        sub     r12, r12, #1
        add     r6, r10, r6, lsl #4
        movs    r12, r12, asr #1
        mov     r3, r1
        sub     r11, r6, #0x10
        sub     r1, r12, #1
        moveq   r7, r2
        moveq   r6, r5
        beq     LAKK1
        mov     r7, r2
        mov     r6, r5
        mov     r8, r7
        mov     r12, r8
        str     r4, [sp]
        str     r9, [sp, #0xC]
        str     r12, [sp, #0x10]
        str     r3, [sp, #8]
        str     r0, [sp, #4]
        mov     r9, r1
        mov     r4, r2
LAKK0:
        ldr     r2, [pc, #0x218]
        ldr     r3, [pc, #0x218]
        mov     r1, r6
        mov     r0, r7
        bl      __muldf3
        ldr     r6, [pc, #0x20C]
        ldr     r7, [pc, #0x20C]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        ldr     r3, [r10, #4]
        ldr     r2, [r10]
        mov     r6, r0
        mov     r7, r1
        bl      __muldf3
        ldr     r3, [r10, #0xC]
        ldr     r2, [r10, #8]
        str     r0, [r10]
        str     r1, [r10, #4]
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        str     r1, [r10, #0xC]
        str     r0, [r10, #8]
        ldr     r2, [r11]
        ldr     r3, [r11, #4]
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        ldr     r2, [r11, #8]
        ldr     r3, [r11, #0xC]
        str     r0, [r11]
        str     r1, [r11, #4]
        mov     r0, r6
        mov     r1, r7
        bl      __muldf3
        str     r1, [r11, #0xC]
        str     r0, [r11, #8]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp]
        mov     r1, r5
        mov     r0, r8
        bl      __muldf3
        mov     r6, r0
        ldr     r0, [sp, #0x10]
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        mov     r7, r1
        mov     r1, r4
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        mov     r6, r1
        mov     r7, r0
        mov     r1, r5
        mov     r0, r8
        bl      __muldf3
        mov     r5, r0
        ldr     r0, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp]
        mov     r8, r1
        mov     r1, r4
        bl      __muldf3
        mov     r2, r5
        mov     r3, r8
        bl      __adddf3
        sub     r9, r9, #1
        cmn     r9, #1
        add     r10, r10, #0x10
        sub     r11, r11, #0x10
        str     r0, [sp, #0x10]
        mov     r4, r1
        mov     r8, r7
        mov     r5, r6
        bne     LAKK0
LAKK1:
        cmp     r10, r11
        beq     LAKK2
        ldr     r2, [pc, #0xC4]
        ldr     r3, [pc, #0xC4]
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        ldr     r5, [pc, #0xB8]
        ldr     r4, [pc, #0xB8]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
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
LAKK2:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAKK3:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAKK4:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   0x401921fb
        .long   0x54442d18
        .long   0xd70a3d71
        .long   0x3fdd70a3
        .long   0x147ae148
        .long   0x3fe147ae


