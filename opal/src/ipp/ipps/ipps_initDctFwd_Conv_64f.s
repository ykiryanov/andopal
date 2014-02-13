        .text
        .align  4
        .globl  _ipps_initDctFwd_Conv_64f


_ipps_initDctFwd_Conv_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        mov     r4, r0
        ldr     r5, [r4, #4]
        mov     r7, r2
        mov     r6, r5, lsl #1
        sub     r12, r6, #1
        cmp     r12, #1
        mov     r11, #0
        mov     r9, #1
        movle   r8, r11
        ble     LCTT1
        mov     r8, r11
LCTT0:
        mov     r9, r9, lsl #1
        cmp     r9, r12
        add     r8, r8, #1
        blt     LCTT0
LCTT1:
        str     r9, [r4, #0x3C]
        str     r1, [r4, #0x50]
        add     r10, r1, r5, lsl #4
        str     r10, [r4, #0x54]
        mov     r12, r9, lsl #4
        str     r12, [sp, #0x18]
        add     r12, r10, r12
        str     r12, [r4, #0x4C]
        add     r12, r12, r5, lsl #4
        str     r12, [r4, #0x48]
        add     r12, r12, r5, lsl #4
        str     r12, [sp, #0x14]
        mov     r1, r10
        mov     r0, r6
        bl      LCTT_initTabTwdDft
        cmp     r5, #0
        ble     LCTT3
        mov     r12, r11
        mov     r0, r12
        mov     lr, r0
        str     r7, [sp, #0x24]
        str     r9, [sp, #8]
LCTT2:
        ldr     r7, [r4, #0x50]
        ldr     r2, [r10, +r12, lsl #4]
        add     r3, r10, r12, lsl #4
        ldr     r9, [r3, #4]
        add     r1, r7, lr
        str     r2, [r7, +r0, lsl #4]
        add     r12, r12, r11
        str     r9, [r1, #4]
        ldr     r9, [r3, #8]
        ldr     r3, [r3, #0xC]
        add     r12, r12, #1
        cmp     r12, r6
        str     r9, [r1, #8]
        str     r3, [r1, #0xC]
        subge   r12, r12, r6
        add     r0, r0, #1
        cmp     r0, r5
        add     lr, lr, #0x10
        add     r11, r11, #2
        blt     LCTT2
        ldr     r7, [sp, #0x24]
        ldr     r9, [sp, #8]
LCTT3:
        ldr     r1, [r4, #0x54]
        ldr     r0, [r4, #0x50]
        mov     r2, r5
        bl      _ipps_cbConj2_64fc
        ldr     r12, [r4, #0x54]
        sub     r1, r9, r5
        add     r0, r12, r5, lsl #4
        bl      _ipps_cbZero_64fc
        cmp     r5, #1
        ble     LCTT7
        sub     r12, r5, #1
        cmp     r12, #5
        mov     r0, #1
        blt     LCTT5
        sub     r1, r5, #5
        mov     r11, #0x10
        mov     r10, #0x20
        mov     lr, #0x30
        mov     r12, #0x40
        str     r8, [sp, #0x10]
        str     r1, [sp, #0xC]
        str     r6, [sp, #0x1C]
        str     r5, [sp, #0x20]
        str     r7, [sp, #0x24]
        str     r9, [sp, #8]
LCTT4:
        ldr     r1, [sp, #8]
        ldr     r2, [r4, #0x54]
        sub     r6, r1, r0
        mov     r3, r6, lsl #4
        add     r1, r2, r11
        ldr     r8, [r1, #4]
        ldr     r9, [r2, +r0, lsl #4]
        add     r5, r2, r6, lsl #4
        add     r11, r11, #0x40
        str     r9, [r2, +r6, lsl #4]
        str     r8, [r5, #4]
        ldr     r8, [r1, #8]
        ldr     r6, [r1, #0xC]
        sub     r2, r3, #0x10
        str     r8, [r5, #8]
        sub     r1, r3, #0x20
        str     r6, [r5, #0xC]
        ldr     r5, [r4, #0x54]
        sub     r3, r3, #0x30
        add     r0, r0, #4
        ldr     r7, [r5, +r10]
        add     r6, r5, r10
        ldr     r9, [r6, #4]
        add     r8, r5, r2
        str     r7, [r5, +r2]
        add     r10, r10, #0x40
        str     r9, [r8, #4]
        ldr     r2, [r6, #8]
        ldr     r6, [r6, #0xC]
        str     r2, [r8, #8]
        ldr     r2, [sp, #0xC]
        str     r6, [r8, #0xC]
        ldr     r8, [r4, #0x54]
        cmp     r0, r2
        add     r5, r8, lr
        ldr     r6, [r5, #4]
        ldr     r9, [r8, +lr]
        add     r2, r8, r1
        add     lr, lr, #0x40
        str     r9, [r8, +r1]
        str     r6, [r2, #4]
        ldr     r1, [r5, #8]
        ldr     r5, [r5, #0xC]
        str     r1, [r2, #8]
        str     r5, [r2, #0xC]
        ldr     r6, [r4, #0x54]
        add     r2, r6, r12
        ldr     r5, [r2, #4]
        ldr     r8, [r6, +r12]
        add     r1, r6, r3
        add     r12, r12, #0x40
        str     r8, [r6, +r3]
        str     r5, [r1, #4]
        ldr     r3, [r2, #8]
        ldr     r2, [r2, #0xC]
        str     r3, [r1, #8]
        str     r2, [r1, #0xC]
        ble     LCTT4
        ldr     r8, [sp, #0x10]
        ldr     r6, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        ldr     r9, [sp, #8]
LCTT5:
        mov     r12, r0, lsl #4
LCTT6:
        ldr     r1, [r4, #0x54]
        sub     r2, r9, r0
        add     lr, r1, r12
        ldr     r11, [r1, +r0, lsl #4]
        ldr     r10, [lr, #4]
        add     r12, r12, #0x10
        add     r0, r0, #1
        str     r11, [r1, +r2, lsl #4]
        add     r11, r1, r2, lsl #4
        str     r10, [r11, #4]
        ldr     r10, [lr, #8]
        ldr     lr, [lr, #0xC]
        cmp     r0, r5
        str     r10, [r11, #8]
        str     lr, [r11, #0xC]
        blt     LCTT6
LCTT7:
        ldr     r12, [sp, #0x14]
        add     r0, r4, #0x5C
        str     r7, [sp, #4]
        str     r12, [sp]
        mov     r1, r8
        mov     r3, #0
        mov     r2, #8
        bl      _ippsFFTInit_C_64fc
        cmp     r0, #0
        addne   sp, sp, #0x2C
        ldmneia sp!, {r4 - r11, pc}
        ldr     r1, [r4, #0x54]
        ldr     r2, [r4, #0x5C]
        mov     r3, r7
        mov     r0, r1
        bl      _ippsFFTFwd_CToC_64fc
        cmp     r0, #0
        addne   sp, sp, #0x2C
        ldmneia sp!, {r4 - r11, pc}
        ldr     r10, [r4, #0x54]
        mov     r1, #0xFF, 12
        mov     r0, r9
        orr     r8, r1, #3, 4
        bl      __floatsidf
        mov     r3, r1
        mov     r2, r0
        mov     r7, r9, lsl #1
        mov     r1, r8
        mov     r0, #0
        bl      __divdf3
        mov     r3, r7
        mov     r2, r10
        bl      _ipps_rbMpy1_64f
        ldr     r0, [r4, #0x5C]
        add     r1, sp, #0x28
        bl      _ippsFFTGetBufSize_C_64fc
        ldr     r12, [sp, #0x28]
        ldr     r3, [sp, #0x18]
        ldr     r1, [r4, #0x4C]
        mov     r9, #0
        mov     r0, r6
        add     r3, r12, r3
        str     r3, [r4, #0xC]
        bl      LCTT_initTabDctFwdRec
        mov     r0, r6
        bl      __floatsidf
        ldr     r7, [pc, #0x790]
        ldr     r6, [pc, #0x790]
        mov     r3, r1
        mov     r2, r0
        mov     r0, r7
        mov     r1, r6
        bl      __divdf3
        mov     r6, r0
        mov     r0, r5
        mov     r7, r1
        bl      __floatsidf
        bl      sqrt
        mov     r10, r1
        mov     r11, r0
        mov     r1, r8
        mov     r0, #0
        mov     r2, r11
        mov     r3, r10
        bl      __divdf3
        ldr     r12, [r4, #0x48]
        str     r0, [r12]
        str     r1, [r12, #4]
        ldr     r12, [r4, #0x48]
        ldr     r0, [pc, #0x73C]
        ldr     r1, [pc, #0x73C]
        str     r9, [r12, #8]
        str     r9, [r12, #0xC]
        mov     r2, r11
        mov     r3, r10
        bl      __divdf3
        cmp     r5, #1
        mov     r8, r1
        ble     LCTT9
        str     r7, [sp, #0x1C]
        mov     r7, r4
        mov     r9, #1
        mov     r10, #0x10
        mov     r11, #0x18
        str     r6, [sp, #0x24]
        str     r5, [sp, #0x20]
        mov     r4, r0
LCTT8:
        mov     r0, r9
        bl      __floatsidf
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x1C]
        bl      __muldf3
        mov     r6, r0
        mov     r5, r1
        bl      cos
        mov     r2, r4
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [r7, #0x48]
        str     r0, [r12, +r9, lsl #4]
        add     r12, r12, r10
        str     r1, [r12, #4]
        mov     r1, r5
        mov     r0, r6
        bl      sin
        mov     r2, r4
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [r7, #0x48]
        add     r9, r9, #1
        str     r0, [r12, +r11]
        add     r12, r12, r11
        str     r1, [r12, #4]
        ldr     r12, [sp, #0x20]
        add     r10, r10, #0x10
        add     r11, r11, #0x10
        cmp     r9, r12
        blt     LCTT8
LCTT9:
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCTT_initTabDctFwdRec:
        stmdb   sp!, {r0, r4 - r11, lr}
        mov     r4, r0
        mov     r9, r1
        bl      __floatsidf
        ldr     r6, [pc, #0x654]
        ldr     r5, [pc, #0x660]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r5
        bl      __divdf3
        cmp     r4, #0
        mov     r7, #0
        mov     r12, r7
        mov     lr, #1
        movlt   r12, lr
        add     r4, r4, r12
        mov     r6, r0
        mov     r5, r1
        mov     r12, r4, asr #1
        cmp     r12, #0
        ble     LCTT11
        mov     lr, #0xFE, 12
        orr     r4, lr, #3, 4
        sub     r8, r9, #0xC
        sub     r11, r9, #4
        str     r12, [sp]
LCTT10:
        mov     r0, r7
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        mov     r10, r0
        mov     r9, r1
        bl      cos
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        str     r0, [r8, #0xC]
        str     r1, [r8, #0x10]!
        mov     r1, r9
        mov     r0, r10
        bl      sin
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r4
        mov     r0, #0
        bl      __subdf3
        str     r0, [r11, #0xC]
        str     r1, [r11, #0x10]!
        ldr     r12, [sp]
        add     r7, r7, #1
        cmp     r7, r12
        blt     LCTT10
LCTT11:
        ldmia   sp!, {r0, r4 - r11, pc}
LCTT_initTabTwdDft:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r6, r0
        mov     r7, r1
        bl      __floatsidf
        ldr     r5, [pc, #0x568]
        ldr     r4, [pc, #0x574]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        mov     r5, r0
        tst     r6, #1
        mov     r4, r1
        mvn     lr, #1
        mvn     r12, #0
        mov     r0, #1
        mov     r8, #0
        beq     LCTT13
        cmp     r6, #0
        mov     r9, r8
        movlt   r9, r0
        add     r9, r6, r9
        movs    r9, r9, asr #1
        bmi     LCTT25
        sub     r10, r7, #4
        str     r6, [sp]
        str     r12, [sp, #0xC]
        str     lr, [sp, #8]
LCTT12:
        mov     r0, r8
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r11, r0
        mov     r6, r1
        bl      cos
        str     r0, [r10, #4]
        str     r1, [r10, #8]
        mov     r1, r6
        mov     r0, r11
        bl      sin
        eor     r1, r1, #2, 2
        add     r8, r8, #1
        str     r0, [r10, #0xC]
        str     r1, [r10, #0x10]!
        cmp     r8, r9
        ble     LCTT12
        ldr     r6, [sp]
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #8]
        b       LCTT25
LCTT13:
        tst     r6, #2
        beq     LCTT15
        mov     r9, r6, asr #1
        add     r9, r6, r9, lsr #30
        movs    r9, r9, asr #2
        bmi     LCTT21
        mov     r11, r8
        sub     r10, r7, #4
        str     r7, [sp, #4]
        str     r6, [sp]
        str     r12, [sp, #0xC]
        str     lr, [sp, #8]
LCTT14:
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        bl      cos
        str     r0, [r10, #4]
        str     r1, [r10, #8]
        mov     r1, r6
        mov     r0, r7
        bl      sin
        eor     r1, r1, #2, 2
        add     r11, r11, #1
        str     r0, [r10, #0xC]
        str     r1, [r10, #0x10]!
        cmp     r11, r9
        ble     LCTT14
        ldr     r7, [sp, #4]
        ldr     r6, [sp]
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #8]
        mov     r0, #1
        b       LCTT21
LCTT15:
        mov     r9, r6, asr #2
        add     r9, r6, r9, lsr #29
        movs    r9, r9, asr #3
        bmi     LCTT17
        mov     r11, r8
        sub     r10, r7, #4
        str     r7, [sp, #4]
        str     r6, [sp]
        str     r12, [sp, #0xC]
        str     lr, [sp, #8]
LCTT16:
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        bl      cos
        str     r0, [r10, #4]
        str     r1, [r10, #8]
        mov     r1, r6
        mov     r0, r7
        bl      sin
        eor     r1, r1, #2, 2
        add     r11, r11, #1
        str     r0, [r10, #0xC]
        str     r1, [r10, #0x10]!
        cmp     r11, r9
        ble     LCTT16
        ldr     r7, [sp, #4]
        ldr     r6, [sp]
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #8]
        mov     r0, #1
LCTT17:
        mov     r2, r6, asr #1
        add     r3, r9, #1
        add     r2, r6, r2, lsr #30
        mov     r9, r2, asr #2
        cmp     r3, r9
        bgt     LCTT21
        sub     r2, r9, r3
        cmp     r2, #4
        addlt   r5, r7, r9, lsl #4
        blt     LCTT19
        mov     r2, r3, lsl #4
        sub     r2, r2, #4
        add     r2, r2, r7
        sub     r4, r9, #4
        add     r5, r7, r9, lsl #4
        str     r7, [sp, #4]
        str     r6, [sp]
LCTT18:
        rsb     r11, r3, #0
        rsb     r6, r3, r12
        add     r7, r5, r11, lsl #4
        ldr     r0, [r7, #0xC]
        ldr     r10, [r7, #8]
        add     r1, r5, r6, lsl #4
        eor     r0, r0, #2, 2
        str     r0, [r2, #8]
        str     r10, [r2, #4]
        ldr     r7, [r7, #4]
        ldr     r10, [r5, +r11, lsl #4]
        rsb     r11, r3, lr
        eor     r7, r7, #2, 2
        str     r7, [r2, #0x10]
        str     r10, [r2, #0xC]
        ldr     r0, [r1, #0xC]
        ldr     r7, [r1, #8]
        add     r10, r5, r11, lsl #4
        eor     r0, r0, #2, 2
        str     r0, [r2, #0x18]
        str     r7, [r2, #0x14]
        ldr     r1, [r1, #4]
        ldr     r6, [r5, +r6, lsl #4]
        add     r3, r3, #3
        eor     r1, r1, #2, 2
        str     r1, [r2, #0x20]
        str     r6, [r2, #0x1C]
        ldr     r6, [r10, #0xC]
        ldr     r1, [r10, #8]
        cmp     r3, r4
        eor     r6, r6, #2, 2
        str     r6, [r2, #0x28]
        str     r1, [r2, #0x24]
        ldr     r10, [r10, #4]
        ldr     r11, [r5, +r11, lsl #4]
        eor     r10, r10, #2, 2
        str     r10, [r2, #0x30]
        str     r11, [r2, #0x2C]
        add     r2, r2, #0x30
        ble     LCTT18
        ldr     r7, [sp, #4]
        ldr     r6, [sp]
        mov     r0, #1
LCTT19:
        mov     r2, r3, lsl #4
        sub     r2, r2, #4
        add     r2, r2, r7
LCTT20:
        rsb     r10, r3, #0
        add     r3, r3, #1
        add     r4, r5, r10, lsl #4
        ldr     r1, [r4, #0xC]
        ldr     r11, [r4, #8]
        cmp     r3, r9
        eor     r1, r1, #2, 2
        str     r1, [r2, #8]
        str     r11, [r2, #4]
        ldr     r4, [r4, #4]
        ldr     r10, [r5, +r10, lsl #4]
        eor     r4, r4, #2, 2
        str     r4, [r2, #0x10]
        str     r10, [r2, #0xC]
        add     r2, r2, #0x10
        ble     LCTT20
LCTT21:
        cmp     r6, #0
        movlt   r8, r0
        add     r2, r9, #1
        add     r8, r6, r8
        mov     r9, r8, asr #1
        cmp     r2, r9
        bgt     LCTT25
        sub     r3, r9, r2
        cmp     r3, #4
        addlt   r3, r7, r9, lsl #4
        blt     LCTT23
        mov     r3, r2, lsl #4
        sub     r3, r3, #4
        add     r4, r3, r7
        add     r3, r7, r9, lsl #4
        sub     r5, r9, #4
LCTT22:
        rsb     r10, r2, #0
        ldr     r8, [r3, +r10, lsl #4]
        add     r10, r3, r10, lsl #4
        ldr     r11, [r10, #4]
        str     r8, [r4, #4]
        rsb     r8, r2, r12
        eor     r11, r11, #2, 2
        str     r11, [r4, #8]
        ldr     r11, [r10, #8]
        ldr     r10, [r10, #0xC]
        str     r11, [r4, #0xC]
        str     r10, [r4, #0x10]
        add     r10, r3, r8, lsl #4
        ldr     r11, [r10, #4]
        ldr     r8, [r3, +r8, lsl #4]
        eor     r11, r11, #2, 2
        str     r11, [r4, #0x18]
        str     r8, [r4, #0x14]
        ldr     r11, [r10, #0xC]
        ldr     r0, [r10, #8]
        rsb     r8, r2, lr
        str     r11, [r4, #0x20]
        add     r10, r3, r8, lsl #4
        str     r0, [r4, #0x1C]
        ldr     r11, [r10, #4]
        ldr     r8, [r3, +r8, lsl #4]
        add     r2, r2, #3
        eor     r11, r11, #2, 2
        str     r11, [r4, #0x28]
        str     r8, [r4, #0x24]
        ldr     r8, [r10, #8]
        ldr     r10, [r10, #0xC]
        cmp     r2, r5
        str     r8, [r4, #0x2C]
        str     r10, [r4, #0x30]!
        ble     LCTT22
LCTT23:
        mov     r4, r2, lsl #4
        sub     r4, r4, #4
        add     r4, r4, r7
LCTT24:
        rsb     r5, r2, #0
        ldr     r8, [r3, +r5, lsl #4]
        add     r5, r3, r5, lsl #4
        ldr     r10, [r5, #4]
        str     r8, [r4, #4]
        add     r2, r2, #1
        cmp     r2, r9
        eor     r10, r10, #2, 2
        str     r10, [r4, #8]
        ldr     r8, [r5, #8]
        ldr     r5, [r5, #0xC]
        str     r8, [r4, #0xC]
        str     r5, [r4, #0x10]!
        ble     LCTT24
LCTT25:
        add     r9, r9, #1
        cmp     r9, r6
        bge     LCTT29
        sub     r2, r6, r9
        cmp     r2, #5
        addlt   r5, r7, r6, lsl #4
        blt     LCTT27
        mov     r2, r9, lsl #4
        sub     r2, r2, #4
        add     r2, r2, r7
        mvn     r4, #2
        add     r5, r7, r6, lsl #4
        sub     r3, r6, #5
LCTT26:
        rsb     r10, r9, #0
        ldr     r8, [r5, +r10, lsl #4]
        add     r10, r5, r10, lsl #4
        ldr     r11, [r10, #4]
        str     r8, [r2, #4]
        rsb     r8, r9, r4
        str     r11, [r2, #8]
        ldr     r11, [r10, #0xC]
        ldr     r10, [r10, #8]
        eor     r11, r11, #2, 2
        str     r11, [r2, #0x10]
        str     r10, [r2, #0xC]
        rsb     r10, r9, r12
        ldr     r11, [r5, +r10, lsl #4]
        add     r10, r5, r10, lsl #4
        ldr     r0, [r10, #4]
        str     r11, [r2, #0x14]
        str     r0, [r2, #0x18]
        ldr     r11, [r10, #0xC]
        ldr     r10, [r10, #8]
        eor     r11, r11, #2, 2
        str     r11, [r2, #0x20]
        str     r10, [r2, #0x1C]
        rsb     r10, r9, lr
        ldr     r11, [r5, +r10, lsl #4]
        add     r10, r5, r10, lsl #4
        ldr     r0, [r10, #4]
        str     r11, [r2, #0x24]
        add     r9, r9, #4
        cmp     r9, r3
        str     r0, [r2, #0x28]
        ldr     r11, [r10, #0xC]
        ldr     r10, [r10, #8]
        eor     r11, r11, #2, 2
        str     r11, [r2, #0x30]
        str     r10, [r2, #0x2C]
        add     r10, r5, r8, lsl #4
        ldr     r8, [r5, +r8, lsl #4]
        ldr     r11, [r10, #4]
        str     r8, [r2, #0x34]
        str     r11, [r2, #0x38]
        ldr     r8, [r10, #0xC]
        ldr     r10, [r10, #8]
        eor     r8, r8, #2, 2
        str     r8, [r2, #0x40]
        str     r10, [r2, #0x3C]
        add     r2, r2, #0x40
        ble     LCTT26
LCTT27:
        mov     r2, r9, lsl #4
        sub     r2, r2, #4
        add     r7, r2, r7
LCTT28:
        rsb     r1, r9, #0
        ldr     r2, [r5, +r1, lsl #4]
        add     r1, r5, r1, lsl #4
        ldr     r3, [r1, #4]
        str     r2, [r7, #4]
        add     r9, r9, #1
        cmp     r9, r6
        str     r3, [r7, #8]
        ldr     r2, [r1, #0xC]
        ldr     r1, [r1, #8]
        eor     r2, r2, #2, 2
        str     r2, [r7, #0x10]
        str     r1, [r7, #0xC]
        add     r7, r7, #0x10
        blt     LCTT28
LCTT29:
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x400921fb
        .long   0x667f3bcc
        .long   0x3ff6a09e
        .long   0x401921fb


