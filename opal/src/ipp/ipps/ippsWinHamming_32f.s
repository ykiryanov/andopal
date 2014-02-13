        .text
        .align  4
        .globl  _ippsWinHamming_32f


_ippsWinHamming_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r10, r0
        cmp     r10, #0
        mov     r9, r1
        mov     r7, r2
        beq     LALP4
        cmp     r9, #0
        beq     LALP4
        cmp     r7, #3
        blt     LALP2
        sub     r8, r7, #1
        mov     r0, r8
        bl      __floatsidf
        ldr     r5, [pc, #0x2B4]
        ldr     r4, [pc, #0x2B4]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        bl      cos
        mov     r5, r0
        mov     r6, r1
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r12, #0xFF, 12
        orr     r4, r12, #3, 4
        mov     r0, #0
        mov     r1, r4
        bl      __subdf3
        bl      sqrt
        cmp     r8, #0
        mov     r2, #0
        mov     r12, r2
        mov     lr, #1
        movlt   r12, lr
        add     r12, r7, r12
        sub     r12, r12, #1
        movs    lr, r12, asr #1
        add     r12, r10, r7, lsl #2
        sub     r12, r12, #4
        add     r7, r9, r7, lsl #2
        str     r12, [sp, #4]
        sub     r11, r7, #4
        sub     r12, lr, #1
        moveq   r8, r2
        moveq   r7, r4
        beq     LALP1
        mov     r8, r2
        mov     r7, r4
        mov     lr, r8
        str     r6, [sp, #0x14]
        mov     r3, lr
        str     r5, [sp, #0x10]
        str     r9, [sp]
        mov     r6, r4
        str     r12, [sp, #8]
        str     r1, [sp, #0x18]
        str     r0, [sp, #0xC]
        mov     r5, r2
        mov     r4, r3
        mov     r9, lr
LALP0:
        ldr     r2, [pc, #0x1EC]
        ldr     r3, [pc, #0x1EC]
        mov     r1, r7
        mov     r0, r8
        bl      __muldf3
        ldr     r7, [pc, #0x1E0]
        ldr     r8, [pc, #0x1E0]
        mov     r3, r1
        mov     r2, r0
        mov     r0, r7
        mov     r1, r8
        bl      __subdf3
        ldr     r2, [r10], #4
        mov     r7, r0
        mov     r8, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [sp]
        str     r0, [r12], #4
        ldr     r1, [sp, #4]
        ldr     r0, [r1], #-4
        str     r12, [sp]
        str     r1, [sp, #4]
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11], #-4
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        mov     r0, r9
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x18]
        mov     r7, r0
        mov     r8, r1
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r8
        bl      __subdf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x18]
        mov     r8, r0
        mov     r7, r1
        mov     r0, r9
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        mov     r6, r0
        mov     r9, r1
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        mov     r2, r6
        mov     r3, r9
        bl      __adddf3
        ldr     r12, [sp, #8]
        mov     r4, r0
        sub     r12, r12, #1
        cmn     r12, #1
        str     r12, [sp, #8]
        mov     r5, r1
        mov     r9, r8
        mov     r6, r7
        bne     LALP0
        ldr     r9, [sp]
LALP1:
        cmp     r9, r11
        beq     LALP3
        ldr     r2, [pc, #0xB0]
        ldr     r3, [pc, #0xB0]
        mov     r0, r8
        mov     r1, r7
        bl      __muldf3
        ldr     r5, [pc, #0xA4]
        ldr     r4, [pc, #0xA4]
        mov     r3, r1
        mov     r2, r0
        mov     r1, r4
        mov     r0, r5
        bl      __subdf3
        ldr     r10, [r10]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r10
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9]
        ldr     r12, [sp, #4]
        ldr     r0, [r12]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r11]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALP2:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALP3:
        ldr     r10, [r10]
        str     r10, [r9]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALP4:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   0xd70a3d71
        .long   0x3fdd70a3
        .long   0x147ae148
        .long   0x3fe147ae


