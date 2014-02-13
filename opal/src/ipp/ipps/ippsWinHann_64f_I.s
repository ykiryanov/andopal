        .text
        .align  4
        .globl  _ippsWinHann_64f_I


_ippsWinHann_64f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        beq     LAKI4
        cmp     r4, #3
        blt     LAKI3
        sub     r5, r4, #1
        mov     r0, r5
        bl      __floatsidf
        ldr     r8, [pc, #0x268]
        ldr     r6, [pc, #0x268]
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
        mov     r12, r2
        mov     lr, #1
        movlt   r12, lr
        add     r12, r4, r12
        sub     r12, r12, #1
        add     r4, r7, r4, lsl #3
        movs    r12, r12, asr #1
        mov     r3, r1
        sub     r8, r4, #8
        sub     r1, r12, #1
        moveq   r4, r2
        moveq   r6, r9
        beq     LAKI1
        mov     r4, r2
        mov     r6, r9
        str     r10, [sp, #0xC]
        mov     r12, r4
        str     r11, [sp]
        mov     r10, r9
        mov     r5, r12
        str     r12, [sp, #0x10]
        str     r3, [sp, #4]
        str     r0, [sp, #8]
        mov     r11, r1
        mov     r9, r2
LAKI0:
        mov     r0, r4
        mov     r2, #0
        mov     r3, #0xFF, 12
        orr     r3, r3, #3, 4
        mov     r1, r6
        sub     r4, r3, #1, 12
        mov     r3, r4
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r1, r4
        mov     r0, #0
        bl      __subdf3
        ldr     r2, [r7]
        ldr     r3, [r7, #4]
        mov     r4, r0
        mov     r6, r1
        bl      __muldf3
        str     r0, [r7]
        str     r1, [r7, #4]
        ldr     r3, [r8, #4]
        ldr     r2, [r8]
        mov     r0, r4
        mov     r1, r6
        bl      __muldf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        mov     r4, r0
        mov     r6, r1
        mov     r0, r5
        mov     r1, r9
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r6
        bl      __subdf3
        mov     r4, r0
        ldr     r0, [sp, #0x10]
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #4]
        mov     r6, r1
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0x10]
        mov     r10, r1
        mov     r0, r5
        mov     r1, r9
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        mov     r3, r10
        bl      __adddf3
        sub     r11, r11, #1
        cmn     r11, #1
        add     r7, r7, #8
        sub     r8, r8, #8
        mov     r5, r0
        mov     r9, r1
        str     r4, [sp, #0x10]
        mov     r10, r6
        bne     LAKI0
LAKI1:
        cmp     r7, r8
        beq     LAKI2
        mov     r0, r4
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
LAKI2:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAKI3:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LAKI4:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


