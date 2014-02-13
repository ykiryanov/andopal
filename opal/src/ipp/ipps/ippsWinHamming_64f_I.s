        .text
        .align  4
        .globl  _ippsWinHamming_64f_I


_ippsWinHamming_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        beq     LAKM4
        cmp     r4, #3
        blt     LAKM3
        sub     r5, r4, #1
        mov     r0, r5
        bl      __floatsidf
        ldr     r8, [pc, #0x260]
        ldr     r6, [pc, #0x260]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r8
        mov     r1, r6
        bl      __divdf3
        bl      cos
        mov     r11, r0
        mov     r10, r1
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r12, #0xFF, 12
        orr     r9, r12, #3, 4
        mov     r0, #0
        mov     r1, r9
        bl      __subdf3
        bl      sqrt
        cmp     r5, #0
        mov     r2, #0
        mov     lr, r2
        mov     r5, #1
        movlt   lr, r5
        add     lr, r4, lr
        sub     lr, lr, #1
        add     r4, r7, r4, lsl #3
        movs    lr, lr, asr #1
        sub     r8, r4, #8
        mov     r12, r1
        sub     r3, lr, #1
        moveq   r1, r2
        moveq   r6, r9
        beq     LAKM1
        mov     r1, r2
        mov     r6, r9
        str     r10, [sp]
        mov     r5, r1
        str     r11, [sp, #0xC]
        mov     r10, r9
        mov     r4, r5
        str     r1, [sp, #0x10]
        str     r12, [sp, #8]
        str     r0, [sp, #4]
        mov     r9, r2
        mov     r11, r3
LAKM0:
        ldr     r2, [pc, #0x1A8]
        ldr     r3, [pc, #0x1A8]
        ldr     r0, [sp, #0x10]
        mov     r1, r6
        bl      __muldf3
        ldr     r6, [pc, #0x19C]
        mov     r2, r0
        ldr     r0, [pc, #0x198]
        mov     r3, r1
        mov     r1, r6
        bl      __subdf3
        ldr     r2, [r7]
        ldr     r3, [r7, #4]
        mov     r6, r0
        str     r1, [sp, #0x10]
        bl      __muldf3
        str     r0, [r7]
        str     r1, [r7, #4]
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        ldr     r1, [sp, #0x10]
        mov     r0, r6
        bl      __muldf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp]
        mov     r0, r5
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        str     r0, [sp, #0x10]
        mov     r6, r1
        mov     r0, r4
        mov     r1, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x10]
        mov     r3, r1
        mov     r1, r6
        bl      __subdf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        str     r0, [sp, #0x10]
        mov     r6, r1
        mov     r0, r5
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp]
        mov     r5, r0
        mov     r10, r1
        mov     r0, r4
        mov     r1, r9
        bl      __muldf3
        mov     r2, r5
        mov     r3, r10
        bl      __adddf3
        ldr     r5, [sp, #0x10]
        sub     r11, r11, #1
        cmn     r11, #1
        add     r7, r7, #8
        sub     r8, r8, #8
        mov     r4, r0
        mov     r9, r1
        mov     r10, r6
        bne     LAKM0
        ldr     r1, [sp, #0x10]
LAKM1:
        cmp     r7, r8
        beq     LAKM2
        ldr     r2, [pc, #0x8C]
        ldr     r3, [pc, #0x8C]
        mov     r0, r1
        mov     r1, r6
        bl      __muldf3
        ldr     r5, [pc, #0x84]
        ldr     r4, [pc, #0x7C]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        ldr     r2, [r7]
        ldr     r3, [r7, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r7]
        str     r1, [r7, #4]
        ldr     r2, [r8]
        ldr     r3, [r8, #4]
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        str     r0, [r8]
        str     r1, [r8, #4]
LAKM2:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAKM3:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAKM4:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   0xd70a3d71
        .long   0x3fdd70a3
        .long   0x3fe147ae
        .long   0x147ae148


