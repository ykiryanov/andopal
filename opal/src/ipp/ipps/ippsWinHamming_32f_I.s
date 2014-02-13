        .text
        .align  4
        .globl  _ippsWinHamming_32f_I


_ippsWinHamming_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        beq     LALO4
        cmp     r4, #3
        blt     LALO3
        sub     r5, r4, #1
        mov     r0, r5
        bl      __floatsidf
        ldr     r8, [pc, #0x26C]
        ldr     r6, [pc, #0x26C]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r8
        mov     r1, r6
        bl      __divdf3
        bl      cos
        mov     r10, r0
        mov     r11, r1
        mov     r2, r10
        mov     r3, r11
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
        mov     r12, #0
        mov     lr, r12
        mov     r5, #1
        movlt   lr, r5
        add     lr, r4, lr
        sub     lr, lr, #1
        add     r4, r7, r4, lsl #2
        movs    lr, lr, asr #1
        mov     r2, r1
        sub     r8, r4, #4
        sub     r1, lr, #1
        moveq   r6, r12
        moveq   r5, r9
        beq     LALO1
        mov     r6, r12
        mov     r5, r9
        mov     r3, r6
        str     r11, [sp, #8]
        str     r10, [sp, #0xC]
        mov     r4, r3
        str     r12, [sp, #0x10]
        str     r2, [sp]
        str     r0, [sp, #4]
        mov     r11, r1
        mov     r10, r3
LALO0:
        ldr     r2, [pc, #0x1B8]
        ldr     r3, [pc, #0x1B8]
        mov     r1, r5
        mov     r0, r6
        bl      __muldf3
        ldr     r5, [pc, #0x1AC]
        ldr     r6, [pc, #0x1AC]
        mov     r3, r1
        mov     r2, r0
        mov     r1, r6
        mov     r0, r5
        bl      __subdf3
        ldr     r2, [r7]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r6
        mov     r2, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7], #4
        ldr     r0, [r8]
        sub     r11, r11, #1
        bl      __extendsfdf2
        mov     r3, r6
        mov     r2, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8], #-4
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        mov     r0, r10
        mov     r1, r9
        bl      __muldf3
        mov     r6, r1
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        mov     r5, r0
        mov     r0, r4
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r6
        mov     r0, r5
        bl      __subdf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        mov     r6, r0
        mov     r5, r1
        mov     r0, r10
        mov     r1, r9
        bl      __muldf3
        mov     r10, r1
        ldr     r1, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #8]
        mov     r9, r0
        mov     r0, r4
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        cmn     r11, #1
        mov     r4, r0
        str     r1, [sp, #0x10]
        mov     r10, r6
        mov     r9, r5
        bne     LALO0
LALO1:
        cmp     r7, r8
        beq     LALO2
        ldr     r2, [pc, #0x98]
        ldr     r3, [pc, #0x98]
        mov     r0, r6
        mov     r1, r5
        bl      __muldf3
        ldr     r5, [pc, #0x8C]
        ldr     r4, [pc, #0x8C]
        mov     r2, r0
        mov     r3, r1
        mov     r1, r4
        mov     r0, r5
        bl      __subdf3
        ldr     r2, [r7]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r7]
        ldr     r0, [r8]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r8]
LALO2:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LALO3:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LALO4:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   0xd70a3d71
        .long   0x3fdd70a3
        .long   0x147ae148
        .long   0x3fe147ae

