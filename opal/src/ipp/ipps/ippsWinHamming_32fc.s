        .text
        .align  4
        .globl  _ippsWinHamming_32fc


_ippsWinHamming_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r6, r2
        beq     LALN4
        cmp     r8, #0
        beq     LALN4
        cmp     r6, #3
        blt     LALN2
        sub     r7, r6, #1
        mov     r0, r7
        bl      __floatsidf
        ldr     r5, [pc, #0x320]
        ldr     r4, [pc, #0x320]
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
        add     lr, r9, r6, lsl #3
        movs    r12, r12, asr #1
        add     r6, r8, r6, lsl #3
        sub     r11, lr, #8
        sub     r10, r6, #8
        sub     r2, r12, #1
        moveq   r7, r3
        moveq   r6, r4
        beq     LALN1
        mov     r7, r3
        mov     r6, r4
        mov     r12, r7
        mov     lr, r12
        str     r5, [sp, #8]
        str     r8, [sp, #0x10]
        str     lr, [sp, #0x18]
        str     r3, [sp, #0x14]
        str     r1, [sp, #4]
        str     r0, [sp, #0xC]
        mov     r8, r2
        mov     r5, r12
LALN0:
        ldr     r2, [pc, #0x264]
        ldr     r3, [pc, #0x264]
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        ldr     r6, [pc, #0x258]
        ldr     r7, [pc, #0x258]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        ldr     r2, [r9]
        mov     r6, r0
        mov     r7, r1
        sub     r8, r8, #1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        bl      __truncdfsf2
        ldr     lr, [sp, #0x10]
        str     r0, [lr]
        ldr     r0, [r9, #4]
        add     r9, r9, #8
        bl      __extendsfdf2
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        bl      __truncdfsf2
        ldr     lr, [sp, #0x10]
        str     r0, [lr, #4]
        ldr     r0, [r11]
        add     lr, lr, #8
        str     lr, [sp, #0x10]
        bl      __extendsfdf2
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r10]
        ldr     r0, [r11, #4]
        sub     r11, r11, #8
        bl      __extendsfdf2
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r10, #4]
        ldr     r2, [sp, #8]
        ldr     r3, [sp]
        mov     r0, r5
        mov     r1, r4
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #4]
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r7
        bl      __subdf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #4]
        mov     r7, r0
        mov     r6, r1
        mov     r0, r5
        mov     r1, r4
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        ldr     r2, [sp, #8]
        ldr     r3, [sp]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        cmn     r8, #1
        sub     r10, r10, #8
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        mov     r5, r7
        mov     r4, r6
        bne     LALN0
        ldr     r8, [sp, #0x10]
LALN1:
        cmp     r8, r10
        beq     LALN3
        ldr     r2, [pc, #0xEC]
        ldr     r3, [pc, #0xEC]
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        ldr     r5, [pc, #0xE0]
        ldr     r4, [pc, #0xE0]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
        bl      __subdf3
        ldr     r2, [r9]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8]
        ldr     r0, [r9, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8, #4]
        ldr     r0, [r11]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r10]
        ldr     r0, [r11, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r10, #4]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALN2:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALN3:
        ldr     r2, [r9]
        str     r2, [r8]
        ldr     r9, [r9, #4]
        str     r9, [r8, #4]
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LALN4:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   0xd70a3d71
        .long   0x3fdd70a3
        .long   0x147ae148
        .long   0x3fe147ae


