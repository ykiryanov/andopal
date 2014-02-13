        .text
        .align  4
        .globl  _ipps_createTabDftBase_64f


_ipps_createTabDftBase_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r6, r0
        mov     r0, r6, lsl #4
        bl      _ippsMalloc_8u
        mov     r7, r0
        cmp     r7, #0
        beq     LCQE18
        mov     r0, r6
        bl      __floatsidf
        ldr     r5, [pc, #0x580]
        ldr     r4, [pc, #0x580]
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
        beq     LCQE1
        cmp     r6, #0
        mov     r10, r8
        movlt   r10, lr
        add     r10, r6, r10
        movs    r10, r10, asr #1
        bmi     LCQE13
        sub     r11, r7, #4
        str     r12, [sp, #8]
        str     r7, [sp, #4]
        str     r6, [sp]
LCQE0:
        mov     r0, r8
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        bl      cos
        str     r0, [r11, #4]
        str     r1, [r11, #8]
        mov     r1, r6
        mov     r0, r7
        bl      sin
        eor     r1, r1, #2, 2
        add     r8, r8, #1
        str     r0, [r11, #0xC]
        str     r1, [r11, #0x10]!
        cmp     r8, r10
        ble     LCQE0
        ldr     r12, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r6, [sp]
        b       LCQE13
LCQE1:
        tst     r6, #2
        beq     LCQE3
        mov     r10, r6, asr #1
        add     r10, r6, r10, lsr #30
        movs    r10, r10, asr #2
        bmi     LCQE9
        mov     r0, r8
        str     r9, [sp, #0xC]
        sub     r11, r7, #4
        str     r12, [sp, #8]
        str     r7, [sp, #4]
        str     r6, [sp]
        mov     r9, r0
LCQE2:
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        bl      cos
        str     r0, [r11, #4]
        str     r1, [r11, #8]
        mov     r1, r6
        mov     r0, r7
        bl      sin
        eor     r1, r1, #2, 2
        add     r9, r9, #1
        str     r0, [r11, #0xC]
        str     r1, [r11, #0x10]!
        cmp     r9, r10
        ble     LCQE2
        ldr     r9, [sp, #0xC]
        ldr     r12, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r6, [sp]
        mov     lr, #1
        b       LCQE9
LCQE3:
        mov     r10, r6, asr #2
        add     r10, r6, r10, lsr #29
        movs    r10, r10, asr #3
        bmi     LCQE5
        mov     r0, r8
        str     r9, [sp, #0xC]
        sub     r11, r7, #4
        str     r12, [sp, #8]
        str     r7, [sp, #4]
        str     r6, [sp]
        mov     r9, r0
LCQE4:
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        bl      cos
        str     r0, [r11, #4]
        str     r1, [r11, #8]
        mov     r1, r6
        mov     r0, r7
        bl      sin
        eor     r1, r1, #2, 2
        add     r9, r9, #1
        str     r0, [r11, #0xC]
        str     r1, [r11, #0x10]!
        cmp     r9, r10
        ble     LCQE4
        ldr     r9, [sp, #0xC]
        ldr     r12, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r6, [sp]
        mov     lr, #1
LCQE5:
        mov     r1, r6, asr #1
        add     r2, r10, #1
        add     r1, r6, r1, lsr #30
        mov     r10, r1, asr #2
        cmp     r2, r10
        bgt     LCQE9
        sub     r1, r10, r2
        cmp     r1, #4
        addlt   r4, r7, r10, lsl #4
        blt     LCQE7
        mov     r1, r2, lsl #4
        sub     r1, r1, #4
        add     r1, r1, r7
        sub     r3, r10, #4
        add     r4, r7, r10, lsl #4
        str     r7, [sp, #4]
        str     r6, [sp]
LCQE6:
        rsb     r11, r2, #0
        rsb     r5, r2, r9
        add     r6, r4, r11, lsl #4
        ldr     r0, [r6, #0xC]
        ldr     r7, [r6, #8]
        add     lr, r4, r5, lsl #4
        eor     r0, r0, #2, 2
        str     r0, [r1, #8]
        str     r7, [r1, #4]
        ldr     r6, [r6, #4]
        ldr     r7, [r4, +r11, lsl #4]
        rsb     r11, r2, r12
        eor     r6, r6, #2, 2
        str     r6, [r1, #0x10]
        str     r7, [r1, #0xC]
        ldr     r0, [lr, #0xC]
        ldr     r6, [lr, #8]
        add     r7, r4, r11, lsl #4
        eor     r0, r0, #2, 2
        str     r0, [r1, #0x18]
        str     r6, [r1, #0x14]
        ldr     lr, [lr, #4]
        ldr     r5, [r4, +r5, lsl #4]
        add     r2, r2, #3
        eor     lr, lr, #2, 2
        str     lr, [r1, #0x20]
        str     r5, [r1, #0x1C]
        ldr     r5, [r7, #0xC]
        ldr     lr, [r7, #8]
        cmp     r2, r3
        eor     r5, r5, #2, 2
        str     r5, [r1, #0x28]
        str     lr, [r1, #0x24]
        ldr     r7, [r7, #4]
        ldr     r11, [r4, +r11, lsl #4]
        eor     r7, r7, #2, 2
        str     r7, [r1, #0x30]
        str     r11, [r1, #0x2C]
        add     r1, r1, #0x30
        ble     LCQE6
        ldr     r7, [sp, #4]
        ldr     r6, [sp]
        mov     lr, #1
LCQE7:
        mov     r1, r2, lsl #4
        sub     r1, r1, #4
        add     r1, r1, r7
LCQE8:
        rsb     r5, r2, #0
        add     r2, r2, #1
        add     r3, r4, r5, lsl #4
        ldr     r0, [r3, #0xC]
        ldr     r11, [r3, #8]
        cmp     r2, r10
        eor     r0, r0, #2, 2
        str     r0, [r1, #8]
        str     r11, [r1, #4]
        ldr     r3, [r3, #4]
        ldr     r5, [r4, +r5, lsl #4]
        eor     r3, r3, #2, 2
        str     r3, [r1, #0x10]
        str     r5, [r1, #0xC]
        add     r1, r1, #0x10
        ble     LCQE8
LCQE9:
        cmp     r6, #0
        movlt   r8, lr
        add     r1, r10, #1
        add     r8, r6, r8
        mov     r10, r8, asr #1
        cmp     r1, r10
        bgt     LCQE13
        sub     r2, r10, r1
        cmp     r2, #4
        addlt   r2, r7, r10, lsl #4
        blt     LCQE11
        mov     r2, r1, lsl #4
        sub     r2, r2, #4
        add     r3, r2, r7
        add     r2, r7, r10, lsl #4
        sub     lr, r10, #4
LCQE10:
        rsb     r5, r1, #0
        ldr     r4, [r2, +r5, lsl #4]
        add     r5, r2, r5, lsl #4
        ldr     r8, [r5, #4]
        str     r4, [r3, #4]
        rsb     r4, r1, r9
        eor     r8, r8, #2, 2
        str     r8, [r3, #8]
        ldr     r8, [r5, #8]
        ldr     r5, [r5, #0xC]
        str     r8, [r3, #0xC]
        str     r5, [r3, #0x10]
        add     r5, r2, r4, lsl #4
        ldr     r8, [r5, #4]
        ldr     r4, [r2, +r4, lsl #4]
        eor     r8, r8, #2, 2
        str     r8, [r3, #0x18]
        str     r4, [r3, #0x14]
        ldr     r8, [r5, #0xC]
        ldr     r11, [r5, #8]
        rsb     r4, r1, r12
        str     r8, [r3, #0x20]
        add     r5, r2, r4, lsl #4
        str     r11, [r3, #0x1C]
        ldr     r8, [r5, #4]
        ldr     r4, [r2, +r4, lsl #4]
        add     r1, r1, #3
        eor     r8, r8, #2, 2
        str     r8, [r3, #0x28]
        str     r4, [r3, #0x24]
        ldr     r4, [r5, #8]
        ldr     r5, [r5, #0xC]
        cmp     r1, lr
        str     r4, [r3, #0x2C]
        str     r5, [r3, #0x30]!
        ble     LCQE10
LCQE11:
        mov     r3, r1, lsl #4
        sub     r3, r3, #4
        add     r3, r3, r7
LCQE12:
        rsb     lr, r1, #0
        ldr     r4, [r2, +lr, lsl #4]
        add     lr, r2, lr, lsl #4
        ldr     r5, [lr, #4]
        str     r4, [r3, #4]
        add     r1, r1, #1
        cmp     r1, r10
        eor     r5, r5, #2, 2
        str     r5, [r3, #8]
        ldr     r4, [lr, #8]
        ldr     lr, [lr, #0xC]
        str     r4, [r3, #0xC]
        str     lr, [r3, #0x10]!
        ble     LCQE12
LCQE13:
        add     r10, r10, #1
        cmp     r10, r6
        bge     LCQE17
        sub     r1, r6, r10
        cmp     r1, #5
        addlt   lr, r7, r6, lsl #4
        blt     LCQE15
        mov     r1, r10, lsl #4
        sub     r1, r1, #4
        add     r1, r1, r7
        mvn     r3, #2
        add     lr, r7, r6, lsl #4
        sub     r2, r6, #5
LCQE14:
        rsb     r5, r10, #0
        ldr     r4, [lr, +r5, lsl #4]
        add     r5, lr, r5, lsl #4
        ldr     r8, [r5, #4]
        str     r4, [r1, #4]
        rsb     r4, r10, r3
        str     r8, [r1, #8]
        ldr     r8, [r5, #0xC]
        ldr     r5, [r5, #8]
        eor     r8, r8, #2, 2
        str     r8, [r1, #0x10]
        str     r5, [r1, #0xC]
        rsb     r5, r10, r9
        ldr     r8, [lr, +r5, lsl #4]
        add     r5, lr, r5, lsl #4
        ldr     r11, [r5, #4]
        str     r8, [r1, #0x14]
        str     r11, [r1, #0x18]
        ldr     r8, [r5, #0xC]
        ldr     r5, [r5, #8]
        eor     r8, r8, #2, 2
        str     r8, [r1, #0x20]
        str     r5, [r1, #0x1C]
        rsb     r5, r10, r12
        ldr     r8, [lr, +r5, lsl #4]
        add     r5, lr, r5, lsl #4
        ldr     r11, [r5, #4]
        str     r8, [r1, #0x24]
        add     r10, r10, #4
        cmp     r10, r2
        str     r11, [r1, #0x28]
        ldr     r8, [r5, #0xC]
        ldr     r5, [r5, #8]
        eor     r8, r8, #2, 2
        str     r8, [r1, #0x30]
        str     r5, [r1, #0x2C]
        add     r5, lr, r4, lsl #4
        ldr     r4, [lr, +r4, lsl #4]
        ldr     r8, [r5, #4]
        str     r4, [r1, #0x34]
        str     r8, [r1, #0x38]
        ldr     r4, [r5, #0xC]
        ldr     r5, [r5, #8]
        eor     r4, r4, #2, 2
        str     r4, [r1, #0x40]
        str     r5, [r1, #0x3C]
        add     r1, r1, #0x40
        ble     LCQE14
LCQE15:
        mov     r1, r10, lsl #4
        sub     r1, r1, #4
        add     r1, r1, r7
LCQE16:
        rsb     r2, r10, #0
        ldr     r3, [lr, +r2, lsl #4]
        add     r2, lr, r2, lsl #4
        ldr     r12, [r2, #4]
        str     r3, [r1, #4]
        add     r10, r10, #1
        cmp     r10, r6
        str     r12, [r1, #8]
        ldr     r3, [r2, #0xC]
        ldr     r2, [r2, #8]
        eor     r3, r3, #2, 2
        str     r3, [r1, #0x10]
        str     r2, [r1, #0xC]
        add     r1, r1, #0x10
        blt     LCQE16
LCQE17:
        mov     r0, r7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCQE18:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


