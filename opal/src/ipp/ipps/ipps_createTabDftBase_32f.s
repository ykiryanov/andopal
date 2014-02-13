        .text
        .align  4
        .globl  _ipps_createTabDftBase_32f


_ipps_createTabDftBase_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r6, r0
        mov     r0, r6, lsl #3
        bl      _ippsMalloc_8u
        mov     r7, r0
        cmp     r7, #0
        beq     LCLT18
        mov     r0, r6
        bl      __floatsidf
        ldr     r5, [pc, #0x49C]
        ldr     r4, [pc, #0x49C]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        tst     r6, #1
        mov     r5, r0
        mov     r4, r1
        mvn     r12, #1
        mvn     r9, #0
        mov     lr, #1
        mov     r8, #0
        beq     LCLT1
        cmp     r6, #0
        mov     r10, r8
        movlt   r10, lr
        add     r10, r6, r10
        movs    r10, r10, asr #1
        bmi     LCLT13
        sub     r11, r7, #4
        str     r12, [sp, #8]
        str     r7, [sp, #4]
        str     r6, [sp]
LCLT0:
        mov     r0, r8
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        bl      cos
        bl      __truncdfsf2
        str     r0, [r11, #4]
        mov     r1, r6
        mov     r0, r7
        bl      sin
        eor     r1, r1, #2, 2
        bl      __truncdfsf2
        add     r8, r8, #1
        str     r0, [r11, #8]!
        cmp     r8, r10
        ble     LCLT0
        ldr     r12, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r6, [sp]
        b       LCLT13
LCLT1:
        tst     r6, #2
        beq     LCLT3
        mov     r10, r6, asr #1
        add     r10, r6, r10, lsr #30
        movs    r10, r10, asr #2
        bmi     LCLT9
        mov     r0, r8
        str     r9, [sp, #0xC]
        sub     r11, r7, #4
        str     r12, [sp, #8]
        str     r7, [sp, #4]
        str     r6, [sp]
        mov     r9, r0
LCLT2:
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        bl      cos
        bl      __truncdfsf2
        str     r0, [r11, #4]
        mov     r1, r6
        mov     r0, r7
        bl      sin
        eor     r1, r1, #2, 2
        bl      __truncdfsf2
        add     r9, r9, #1
        str     r0, [r11, #8]!
        cmp     r9, r10
        ble     LCLT2
        ldr     r9, [sp, #0xC]
        ldr     r12, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r6, [sp]
        mov     lr, #1
        b       LCLT9
LCLT3:
        mov     r10, r6, asr #2
        add     r10, r6, r10, lsr #29
        movs    r10, r10, asr #3
        bmi     LCLT5
        mov     r0, r8
        str     r9, [sp, #0xC]
        sub     r11, r7, #4
        str     r12, [sp, #8]
        str     r7, [sp, #4]
        str     r6, [sp]
        mov     r9, r0
LCLT4:
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        bl      cos
        bl      __truncdfsf2
        str     r0, [r11, #4]
        mov     r1, r6
        mov     r0, r7
        bl      sin
        eor     r1, r1, #2, 2
        bl      __truncdfsf2
        add     r9, r9, #1
        str     r0, [r11, #8]!
        cmp     r9, r10
        ble     LCLT4
        ldr     r9, [sp, #0xC]
        ldr     r12, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r6, [sp]
        mov     lr, #1
LCLT5:
        mov     r1, r6, asr #1
        add     r2, r10, #1
        add     r1, r6, r1, lsr #30
        mov     r10, r1, asr #2
        cmp     r2, r10
        bgt     LCLT9
        sub     r1, r10, r2
        cmp     r1, #4
        addlt   r4, r7, r10, lsl #3
        blt     LCLT7
        mov     r1, r2, lsl #3
        sub     r1, r1, #4
        add     r1, r1, r7
        sub     r3, r10, #4
        add     r4, r7, r10, lsl #3
        str     r7, [sp, #4]
        str     r6, [sp]
LCLT6:
        rsb     r11, r2, #0
        rsb     r5, r2, r9
        add     r6, r4, r11, lsl #3
        ldr     r0, [r6, #4]
        add     r6, r4, r5, lsl #3
        rsb     r7, r2, r12
        eor     r0, r0, #2, 2
        str     r0, [r1, #4]
        ldr     r0, [r4, +r11, lsl #3]
        add     r11, r4, r7, lsl #3
        add     r2, r2, #3
        eor     r0, r0, #2, 2
        str     r0, [r1, #8]
        ldr     r6, [r6, #4]
        cmp     r2, r3
        eor     r6, r6, #2, 2
        str     r6, [r1, #0xC]
        ldr     r5, [r4, +r5, lsl #3]
        eor     r5, r5, #2, 2
        str     r5, [r1, #0x10]
        ldr     r11, [r11, #4]
        eor     r11, r11, #2, 2
        str     r11, [r1, #0x14]
        ldr     r7, [r4, +r7, lsl #3]
        eor     r7, r7, #2, 2
        str     r7, [r1, #0x18]!
        ble     LCLT6
        ldr     r7, [sp, #4]
        ldr     r6, [sp]
LCLT7:
        mov     r1, r2, lsl #3
        sub     r1, r1, #4
        add     r1, r1, r7
LCLT8:
        rsb     r3, r2, #0
        add     r2, r2, #1
        add     r5, r4, r3, lsl #3
        ldr     r5, [r5, #4]
        cmp     r2, r10
        eor     r5, r5, #2, 2
        str     r5, [r1, #4]
        ldr     r3, [r4, +r3, lsl #3]
        eor     r3, r3, #2, 2
        str     r3, [r1, #8]!
        ble     LCLT8
LCLT9:
        cmp     r6, #0
        movlt   r8, lr
        add     r2, r10, #1
        add     r8, r6, r8
        mov     r10, r8, asr #1
        cmp     r2, r10
        bgt     LCLT13
        sub     r1, r10, r2
        cmp     r1, #4
        addlt   lr, r7, r10, lsl #3
        blt     LCLT11
        mov     r1, r2, lsl #3
        sub     r1, r1, #4
        add     r1, r1, r7
        add     lr, r7, r10, lsl #3
        sub     r3, r10, #4
LCLT10:
        rsb     r4, r2, #0
        ldr     r5, [lr, +r4, lsl #3]
        add     r4, lr, r4, lsl #3
        eor     r5, r5, #2, 2
        str     r5, [r1, #4]
        ldr     r5, [r4, #4]
        rsb     r4, r2, r9
        str     r5, [r1, #8]
        ldr     r5, [lr, +r4, lsl #3]
        add     r4, lr, r4, lsl #3
        eor     r5, r5, #2, 2
        str     r5, [r1, #0xC]
        ldr     r5, [r4, #4]
        rsb     r4, r2, r12
        add     r2, r2, #3
        str     r5, [r1, #0x10]
        ldr     r5, [lr, +r4, lsl #3]
        add     r4, lr, r4, lsl #3
        cmp     r2, r3
        eor     r5, r5, #2, 2
        str     r5, [r1, #0x14]
        ldr     r4, [r4, #4]
        str     r4, [r1, #0x18]!
        ble     LCLT10
LCLT11:
        mov     r1, r2, lsl #3
        sub     r1, r1, #4
        add     r1, r1, r7
LCLT12:
        rsb     r3, r2, #0
        ldr     r4, [lr, +r3, lsl #3]
        add     r3, lr, r3, lsl #3
        add     r2, r2, #1
        eor     r4, r4, #2, 2
        str     r4, [r1, #4]
        ldr     r3, [r3, #4]
        cmp     r2, r10
        str     r3, [r1, #8]!
        ble     LCLT12
LCLT13:
        add     r10, r10, #1
        cmp     r10, r6
        bge     LCLT17
        sub     r1, r6, r10
        cmp     r1, #5
        addlt   lr, r7, r6, lsl #3
        blt     LCLT15
        mov     r1, r10, lsl #3
        sub     r1, r1, #4
        add     r1, r1, r7
        mvn     r3, #2
        add     lr, r7, r6, lsl #3
        sub     r2, r6, #5
LCLT14:
        rsb     r5, r10, #0
        ldr     r4, [lr, +r5, lsl #3]
        add     r5, lr, r5, lsl #3
        rsb     r8, r10, r9
        str     r4, [r1, #4]
        ldr     r5, [r5, #4]
        rsb     r4, r10, r3
        eor     r5, r5, #2, 2
        str     r5, [r1, #8]
        ldr     r5, [lr, +r8, lsl #3]
        add     r8, lr, r8, lsl #3
        str     r5, [r1, #0xC]
        ldr     r8, [r8, #4]
        rsb     r5, r10, r12
        add     r10, r10, #4
        eor     r8, r8, #2, 2
        str     r8, [r1, #0x10]
        ldr     r8, [lr, +r5, lsl #3]
        add     r5, lr, r5, lsl #3
        cmp     r10, r2
        str     r8, [r1, #0x14]
        ldr     r8, [r5, #4]
        add     r5, lr, r4, lsl #3
        eor     r8, r8, #2, 2
        str     r8, [r1, #0x18]
        ldr     r4, [lr, +r4, lsl #3]
        str     r4, [r1, #0x1C]
        ldr     r5, [r5, #4]
        eor     r4, r5, #2, 2
        str     r4, [r1, #0x20]!
        ble     LCLT14
LCLT15:
        mov     r1, r10, lsl #3
        sub     r1, r1, #4
        add     r1, r1, r7
LCLT16:
        rsb     r3, r10, #0
        ldr     r2, [lr, +r3, lsl #3]
        add     r3, lr, r3, lsl #3
        add     r10, r10, #1
        str     r2, [r1, #4]
        ldr     r3, [r3, #4]
        cmp     r10, r6
        eor     r3, r3, #2, 2
        str     r3, [r1, #8]!
        blt     LCLT16
LCLT17:
        mov     r0, r7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCLT18:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


