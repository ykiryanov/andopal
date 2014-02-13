        .text
        .align  4
        .globl  _ipps_initDctFwd_Conv_32f


_ipps_initDctFwd_Conv_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        mov     r9, r0
        ldr     r6, [r9, #4]
        mov     r5, r2
        mov     r4, r6, lsl #1
        sub     r12, r4, #1
        cmp     r12, #1
        mov     r11, #0
        mov     r7, #1
        movle   r8, r11
        ble     LCSI1
        mov     r8, r11
LCSI0:
        mov     r7, r7, lsl #1
        cmp     r7, r12
        add     r8, r8, #1
        blt     LCSI0
LCSI1:
        str     r7, [r9, #0x30]
        str     r1, [r9, #0x44]
        add     r10, r1, r6, lsl #3
        str     r10, [r9, #0x48]
        mov     r12, r7, lsl #3
        str     r12, [sp, #0x14]
        add     r12, r10, r12
        str     r12, [r9, #0x40]
        add     r12, r12, r6, lsl #3
        str     r12, [r9, #0x3C]
        add     r12, r12, r6, lsl #3
        str     r12, [sp, #0x10]
        mov     r1, r10
        mov     r0, r4
        bl      LCSI_initTabTwdDft
        cmp     r6, #0
        ble     LCSI3
        mov     r12, r11
        mov     r0, r12
        mov     lr, r0
LCSI2:
        ldr     r3, [r10, +r12, lsl #3]
        ldr     r2, [r9, #0x44]
        add     r1, r10, r12, lsl #3
        add     r12, r12, r11
        add     r12, r12, #1
        str     r3, [r2, +r0, lsl #3]
        ldr     r1, [r1, #4]
        add     r2, r2, lr
        cmp     r12, r4
        str     r1, [r2, #4]
        subge   r12, r12, r4
        add     r0, r0, #1
        cmp     r0, r6
        add     lr, lr, #8
        add     r11, r11, #2
        blt     LCSI2
LCSI3:
        ldr     r1, [r9, #0x48]
        ldr     r0, [r9, #0x44]
        mov     r2, r6
        bl      _ipps_cbConj2_32fc
        ldr     r12, [r9, #0x48]
        sub     r1, r7, r6
        add     r0, r12, r6, lsl #3
        bl      _ipps_cbZero_32fc
        cmp     r6, #1
        ble     LCSI7
        sub     r12, r6, #1
        cmp     r12, #5
        mov     r0, #1
        blt     LCSI5
        sub     r1, r6, #5
        mov     r11, #8
        mov     r10, #0x10
        mov     lr, #0x18
        mov     r12, #0x20
        str     r8, [sp, #0xC]
        str     r1, [sp, #8]
        str     r4, [sp, #0x18]
        str     r6, [sp, #0x1C]
        str     r5, [sp, #0x20]
LCSI4:
        ldr     r5, [r9, #0x48]
        sub     r2, r7, r0
        ldr     r6, [r5, +r0, lsl #3]
        add     r1, r5, r11
        add     r3, r5, r2, lsl #3
        mov     r4, r2, lsl #3
        str     r6, [r5, +r2, lsl #3]
        ldr     r5, [r1, #4]
        sub     r1, r4, #8
        sub     r2, r4, #0x10
        str     r5, [r3, #4]
        ldr     r3, [r9, #0x48]
        sub     r4, r4, #0x18
        add     r11, r11, #0x20
        ldr     r8, [r3, +r10]
        add     r6, r3, r10
        add     r5, r3, r1
        add     r10, r10, #0x20
        str     r8, [r3, +r1]
        ldr     r6, [r6, #4]
        ldr     r1, [sp, #8]
        add     r0, r0, #4
        str     r6, [r5, #4]
        ldr     r5, [r9, #0x48]
        cmp     r0, r1
        ldr     r6, [r5, +lr]
        add     r3, r5, lr
        add     r1, r5, r2
        add     lr, lr, #0x20
        str     r6, [r5, +r2]
        ldr     r3, [r3, #4]
        str     r3, [r1, #4]
        ldr     r1, [r9, #0x48]
        ldr     r2, [r1, +r12]
        str     r2, [r1, +r4]
        add     r4, r1, r4
        add     r1, r1, r12
        ldr     r1, [r1, #4]
        add     r12, r12, #0x20
        str     r1, [r4, #4]
        ble     LCSI4
        ldr     r8, [sp, #0xC]
        ldr     r4, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
LCSI5:
        mov     r12, r0, lsl #3
LCSI6:
        ldr     r10, [r9, #0x48]
        sub     r11, r7, r0
        ldr     lr, [r10, +r0, lsl #3]
        add     r0, r0, #1
        cmp     r0, r6
        str     lr, [r10, +r11, lsl #3]
        add     lr, r10, r11, lsl #3
        add     r10, r10, r12
        ldr     r10, [r10, #4]
        add     r12, r12, #8
        str     r10, [lr, #4]
        blt     LCSI6
LCSI7:
        ldr     r12, [sp, #0x10]
        add     r0, r9, #0x50
        str     r5, [sp, #4]
        str     r12, [sp]
        mov     r1, r8
        mov     r3, #0
        mov     r2, #8
        bl      _ippsFFTInit_C_32fc
        cmp     r0, #0
        addne   sp, sp, #0x28
        ldmneia sp!, {r4 - r11, pc}
        ldr     r1, [r9, #0x48]
        ldr     r2, [r9, #0x50]
        mov     r3, r5
        mov     r0, r1
        bl      _ippsFFTFwd_CToC_32fc
        cmp     r0, #0
        addne   sp, sp, #0x28
        ldmneia sp!, {r4 - r11, pc}
        ldr     r5, [r9, #0x48]
        ldr     r3, [pc, #0x6EC]
        mov     r0, r7
        mov     r8, r7, lsl #1
        ldr     r7, [r3]
        bl      __floatsisf
        mov     r1, r0
        mov     r0, r7
        bl      __divsf3
        mov     r2, r8
        mov     r1, r5
        bl      _ipps_rbMpy1_32f
        ldr     r0, [r9, #0x50]
        add     r1, sp, #0x24
        mov     r3, #0xFF, 12
        orr     r5, r3, #3, 4
        bl      _ippsFFTGetBufSize_C_32fc
        ldr     r12, [sp, #0x24]
        ldr     r3, [sp, #0x14]
        ldr     r1, [r9, #0x40]
        mov     r0, r4
        add     r3, r12, r3
        str     r3, [r9, #0xC]
        bl      LCSI_initTabDctFwdRec
        mov     r0, r4
        bl      __floatsidf
        ldr     r7, [pc, #0x68C]
        ldr     r4, [pc, #0x68C]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r4
        bl      __divdf3
        mov     r7, r0
        mov     r0, r6
        mov     r8, r1
        bl      __floatsidf
        bl      sqrt
        mov     r4, r1
        mov     r10, r0
        mov     r1, r5
        mov     r3, r4
        mov     r0, #0
        mov     r2, r10
        bl      __divdf3
        bl      __truncdfsf2
        ldr     lr, [r9, #0x3C]
        ldr     r12, [pc, #0x640]
        str     r0, [lr]
        ldr     lr, [r9, #0x3C]
        ldr     r12, [r12]
        ldr     r0, [pc, #0x634]
        ldr     r1, [pc, #0x634]
        mov     r2, r10
        str     r12, [lr, #4]
        mov     r3, r4
        bl      __divdf3
        cmp     r6, #1
        mov     r5, r0
        mov     r4, r1
        ble     LCSI9
        mov     r10, #1
        mov     r11, #0xC
        str     r8, [sp, #0x20]
        str     r6, [sp, #0x1C]
LCSI8:
        mov     r0, r10
        bl      __floatsidf
        ldr     r3, [sp, #0x20]
        mov     r2, r7
        bl      __muldf3
        mov     r8, r0
        mov     r6, r1
        bl      cos
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r9, #0x3C]
        mov     r1, r6
        str     r0, [r12, +r10, lsl #3]
        mov     r0, r8
        bl      sin
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r9, #0x3C]
        add     r10, r10, #1
        str     r0, [r12, +r11]
        ldr     r12, [sp, #0x1C]
        add     r11, r11, #8
        cmp     r10, r12
        blt     LCSI8
LCSI9:
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LCSI_initTabDctFwdRec:
        stmdb   sp!, {r0, r4 - r11, lr}
        mov     r6, r0
        mov     r5, r1
        bl      __floatsidf
        ldr     r7, [pc, #0x564]
        ldr     r4, [pc, #0x574]
        mov     r3, r1
        mov     r2, r0
        mov     r0, r7
        mov     r1, r4
        bl      __divdf3
        cmp     r6, #0
        mov     r4, #0
        mov     r3, r4
        mov     r12, #1
        movlt   r3, r12
        add     r6, r6, r3
        mov     r9, r0
        mov     r10, r6, asr #1
        cmp     r10, #0
        ble     LCSI11
        mov     r3, #0xFE, 12
        orr     r6, r3, #3, 4
        add     r11, r5, #4
        str     r1, [sp]
LCSI10:
        mov     r0, r4
        bl      __floatsidf
        ldr     r3, [sp]
        mov     r2, r9
        bl      __muldf3
        mov     r8, r0
        mov     r7, r1
        bl      cos
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r5], #8
        mov     r1, r7
        mov     r0, r8
        bl      sin
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r1, r6
        mov     r0, #0
        bl      __subdf3
        bl      __truncdfsf2
        add     r4, r4, #1
        str     r0, [r11], #8
        cmp     r4, r10
        blt     LCSI10
LCSI11:
        ldmia   sp!, {r0, r4 - r11, pc}
LCSI_initTabTwdDft:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r6, r0
        mov     r7, r1
        bl      __floatsidf
        ldr     r5, [pc, #0x484]
        ldr     r4, [pc, #0x494]
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
        beq     LCSI13
        cmp     r6, #0
        mov     r9, r8
        movlt   r9, r0
        add     r9, r6, r9
        movs    r9, r9, asr #1
        bmi     LCSI25
        sub     r10, r7, #4
        str     r6, [sp]
        str     r12, [sp, #8]
        str     lr, [sp, #4]
LCSI12:
        mov     r0, r8
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r11, r0
        mov     r6, r1
        bl      cos
        bl      __truncdfsf2
        str     r0, [r10, #4]
        mov     r1, r6
        mov     r0, r11
        bl      sin
        eor     r1, r1, #2, 2
        bl      __truncdfsf2
        add     r8, r8, #1
        str     r0, [r10, #8]!
        cmp     r8, r9
        ble     LCSI12
        ldr     r6, [sp]
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #4]
        b       LCSI25
LCSI13:
        tst     r6, #2
        beq     LCSI15
        mov     r9, r6, asr #1
        add     r9, r6, r9, lsr #30
        movs    r9, r9, asr #2
        bmi     LCSI21
        mov     r11, r8
        sub     r10, r7, #4
        str     r7, [sp, #0xC]
        str     r6, [sp]
        str     r12, [sp, #8]
        str     lr, [sp, #4]
LCSI14:
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        bl      cos
        bl      __truncdfsf2
        str     r0, [r10, #4]
        mov     r1, r6
        mov     r0, r7
        bl      sin
        eor     r1, r1, #2, 2
        bl      __truncdfsf2
        add     r11, r11, #1
        str     r0, [r10, #8]!
        cmp     r11, r9
        ble     LCSI14
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp]
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #4]
        mov     r0, #1
        b       LCSI21
LCSI15:
        mov     r9, r6, asr #2
        add     r9, r6, r9, lsr #29
        movs    r9, r9, asr #3
        bmi     LCSI17
        mov     r11, r8
        sub     r10, r7, #4
        str     r7, [sp, #0xC]
        str     r6, [sp]
        str     r12, [sp, #8]
        str     lr, [sp, #4]
LCSI16:
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        bl      cos
        bl      __truncdfsf2
        str     r0, [r10, #4]
        mov     r1, r6
        mov     r0, r7
        bl      sin
        eor     r1, r1, #2, 2
        bl      __truncdfsf2
        add     r11, r11, #1
        str     r0, [r10, #8]!
        cmp     r11, r9
        ble     LCSI16
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp]
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #4]
        mov     r0, #1
LCSI17:
        mov     r2, r6, asr #1
        add     r3, r9, #1
        add     r2, r6, r2, lsr #30
        mov     r9, r2, asr #2
        cmp     r3, r9
        bgt     LCSI21
        sub     r2, r9, r3
        cmp     r2, #4
        addlt   r5, r7, r9, lsl #3
        blt     LCSI19
        mov     r2, r3, lsl #3
        sub     r2, r2, #4
        add     r2, r2, r7
        sub     r4, r9, #4
        add     r5, r7, r9, lsl #3
        str     r6, [sp]
LCSI18:
        rsb     r0, r3, #0
        rsb     r6, r3, r12
        add     r10, r5, r0, lsl #3
        ldr     r1, [r10, #4]
        add     r10, r5, r6, lsl #3
        rsb     r11, r3, lr
        eor     r1, r1, #2, 2
        str     r1, [r2, #4]
        ldr     r1, [r5, +r0, lsl #3]
        add     r0, r5, r11, lsl #3
        add     r3, r3, #3
        eor     r1, r1, #2, 2
        str     r1, [r2, #8]
        ldr     r10, [r10, #4]
        cmp     r3, r4
        eor     r10, r10, #2, 2
        str     r10, [r2, #0xC]
        ldr     r6, [r5, +r6, lsl #3]
        eor     r6, r6, #2, 2
        str     r6, [r2, #0x10]
        ldr     r0, [r0, #4]
        eor     r0, r0, #2, 2
        str     r0, [r2, #0x14]
        ldr     r11, [r5, +r11, lsl #3]
        eor     r11, r11, #2, 2
        str     r11, [r2, #0x18]!
        ble     LCSI18
        ldr     r6, [sp]
        mov     r0, #1
LCSI19:
        mov     r2, r3, lsl #3
        sub     r2, r2, #4
        add     r2, r2, r7
LCSI20:
        rsb     r4, r3, #0
        add     r3, r3, #1
        add     r10, r5, r4, lsl #3
        ldr     r10, [r10, #4]
        cmp     r3, r9
        eor     r10, r10, #2, 2
        str     r10, [r2, #4]
        ldr     r4, [r5, +r4, lsl #3]
        eor     r4, r4, #2, 2
        str     r4, [r2, #8]!
        ble     LCSI20
LCSI21:
        cmp     r6, #0
        movlt   r8, r0
        add     r3, r9, #1
        add     r8, r6, r8
        mov     r9, r8, asr #1
        cmp     r3, r9
        bgt     LCSI25
        sub     r2, r9, r3
        cmp     r2, #4
        addlt   r5, r7, r9, lsl #3
        blt     LCSI23
        mov     r2, r3, lsl #3
        sub     r2, r2, #4
        add     r2, r2, r7
        add     r5, r7, r9, lsl #3
        sub     r4, r9, #4
LCSI22:
        rsb     r8, r3, #0
        ldr     r10, [r5, +r8, lsl #3]
        add     r8, r5, r8, lsl #3
        eor     r10, r10, #2, 2
        str     r10, [r2, #4]
        ldr     r10, [r8, #4]
        rsb     r8, r3, r12
        str     r10, [r2, #8]
        ldr     r10, [r5, +r8, lsl #3]
        add     r8, r5, r8, lsl #3
        eor     r10, r10, #2, 2
        str     r10, [r2, #0xC]
        ldr     r10, [r8, #4]
        rsb     r8, r3, lr
        add     r3, r3, #3
        str     r10, [r2, #0x10]
        ldr     r10, [r5, +r8, lsl #3]
        add     r8, r5, r8, lsl #3
        cmp     r3, r4
        eor     r10, r10, #2, 2
        str     r10, [r2, #0x14]
        ldr     r8, [r8, #4]
        str     r8, [r2, #0x18]!
        ble     LCSI22
LCSI23:
        mov     r2, r3, lsl #3
        sub     r2, r2, #4
        add     r2, r2, r7
LCSI24:
        rsb     r4, r3, #0
        ldr     r8, [r5, +r4, lsl #3]
        add     r4, r5, r4, lsl #3
        add     r3, r3, #1
        eor     r8, r8, #2, 2
        str     r8, [r2, #4]
        ldr     r4, [r4, #4]
        cmp     r3, r9
        str     r4, [r2, #8]!
        ble     LCSI24
LCSI25:
        add     r9, r9, #1
        cmp     r9, r6
        bge     LCSI29
        sub     r2, r6, r9
        cmp     r2, #5
        addlt   r5, r7, r6, lsl #3
        blt     LCSI27
        mov     r2, r9, lsl #3
        sub     r2, r2, #4
        add     r2, r2, r7
        mvn     r4, #2
        add     r5, r7, r6, lsl #3
        sub     r3, r6, #5
LCSI26:
        rsb     r10, r9, #0
        ldr     r8, [r5, +r10, lsl #3]
        add     r10, r5, r10, lsl #3
        rsb     r11, r9, r12
        str     r8, [r2, #4]
        ldr     r10, [r10, #4]
        rsb     r8, r9, r4
        eor     r10, r10, #2, 2
        str     r10, [r2, #8]
        ldr     r10, [r5, +r11, lsl #3]
        add     r11, r5, r11, lsl #3
        str     r10, [r2, #0xC]
        ldr     r11, [r11, #4]
        rsb     r10, r9, lr
        add     r9, r9, #4
        eor     r11, r11, #2, 2
        str     r11, [r2, #0x10]
        ldr     r11, [r5, +r10, lsl #3]
        add     r10, r5, r10, lsl #3
        cmp     r9, r3
        str     r11, [r2, #0x14]
        ldr     r11, [r10, #4]
        add     r10, r5, r8, lsl #3
        eor     r11, r11, #2, 2
        str     r11, [r2, #0x18]
        ldr     r8, [r5, +r8, lsl #3]
        str     r8, [r2, #0x1C]
        ldr     r10, [r10, #4]
        eor     r8, r10, #2, 2
        str     r8, [r2, #0x20]!
        ble     LCSI26
LCSI27:
        mov     r2, r9, lsl #3
        sub     r2, r2, #4
        add     r7, r2, r7
LCSI28:
        rsb     r2, r9, #0
        ldr     r1, [r5, +r2, lsl #3]
        add     r2, r5, r2, lsl #3
        add     r9, r9, #1
        str     r1, [r7, #4]
        ldr     r2, [r2, #4]
        cmp     r9, r6
        eor     r2, r2, #2, 2
        str     r2, [r7, #8]!
        blt     LCSI28
LCSI29:
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   LCSI__2il0floatpacket.1
        .long   0x54442d18
        .long   0x400921fb
        .long   LCSI__2il0floatpacket.2
        .long   0x667f3bcc
        .long   0x3ff6a09e
        .long   0x401921fb


        .data
        .align  4


LCSI__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LCSI__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


