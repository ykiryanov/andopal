        .text
        .align  4
        .globl  _ipps_initDctInv_Conv_32f


_ipps_initDctInv_Conv_32f:
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
        ble     LCSH1
        mov     r8, r11
LCSH0:
        mov     r7, r7, lsl #1
        cmp     r7, r12
        add     r8, r8, #1
        blt     LCSH0
LCSH1:
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
        bl      LCSH_initTabTwdDft
        cmp     r6, #0
        ble     LCSH3
        mov     r12, r11
        mov     r0, r12
        mov     lr, r0
LCSH2:
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
        blt     LCSH2
LCSH3:
        ldr     r1, [r9, #0x48]
        ldr     r0, [r9, #0x44]
        mov     r2, r6
        bl      _ipps_cbConj2_32fc
        ldr     r12, [r9, #0x48]
        sub     r1, r7, r6
        add     r0, r12, r6, lsl #3
        bl      _ipps_cbZero_32fc
        cmp     r6, #1
        ble     LCSH7
        sub     r12, r6, #1
        cmp     r12, #5
        mov     r0, #1
        blt     LCSH5
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
LCSH4:
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
        ble     LCSH4
        ldr     r8, [sp, #0xC]
        ldr     r4, [sp, #0x18]
        ldr     r6, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
LCSH5:
        mov     r12, r0, lsl #3
LCSH6:
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
        blt     LCSH6
LCSH7:
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
        ldr     r3, [pc, #0x6BC]
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
        bl      LCSH_initTabDctInvRec
        mov     r0, r4
        bl      __floatsidf
        ldr     r7, [pc, #0x65C]
        ldr     r4, [pc, #0x65C]
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
        ldr     r12, [pc, #0x610]
        str     r0, [lr]
        ldr     lr, [r9, #0x3C]
        ldr     r12, [r12]
        ldr     r0, [pc, #0x604]
        ldr     r1, [pc, #0x604]
        mov     r2, r10
        str     r12, [lr, #4]
        mov     r3, r4
        bl      __divdf3
        cmp     r6, #1
        mov     r5, r0
        mov     r4, r1
        ble     LCSH9
        mov     r10, #1
        mov     r11, #0xC
        str     r8, [sp, #0x20]
        str     r6, [sp, #0x1C]
LCSH8:
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
        blt     LCSH8
LCSH9:
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LCSH_initTabDctInvRec:
        stmdb   sp!, {r4 - r11, lr}
        mov     r6, r0
        mov     r5, r1
        bl      __floatsidf
        ldr     r7, [pc, #0x534]
        ldr     r4, [pc, #0x544]
        mov     r3, r1
        mov     r2, r0
        mov     r0, r7
        mov     r1, r4
        bl      __divdf3
        cmp     r6, #0
        mov     r4, #0
        mov     r12, r4
        mov     lr, #1
        movlt   r12, lr
        add     r6, r6, r12
        mov     r9, r0
        mov     r8, r1
        mov     r10, r6, asr #1
        cmp     r10, #0
        ble     LCSH11
        add     r11, r5, #4
LCSH10:
        mov     r0, r4
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        bl      cos
        bl      __truncdfsf2
        str     r0, [r5], #8
        mov     r1, r6
        mov     r0, r7
        bl      sin
        eor     r1, r1, #2, 2
        bl      __truncdfsf2
        add     r4, r4, #1
        str     r0, [r11], #8
        cmp     r4, r10
        blt     LCSH10
LCSH11:
        ldmia   sp!, {r4 - r11, pc}
LCSH_initTabTwdDft:
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
        beq     LCSH13
        cmp     r6, #0
        mov     r9, r8
        movlt   r9, r0
        add     r9, r6, r9
        movs    r9, r9, asr #1
        bmi     LCSH25
        sub     r10, r7, #4
        str     r6, [sp]
        str     r12, [sp, #8]
        str     lr, [sp, #4]
LCSH12:
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
        ble     LCSH12
        ldr     r6, [sp]
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #4]
        b       LCSH25
LCSH13:
        tst     r6, #2
        beq     LCSH15
        mov     r9, r6, asr #1
        add     r9, r6, r9, lsr #30
        movs    r9, r9, asr #2
        bmi     LCSH21
        mov     r11, r8
        sub     r10, r7, #4
        str     r7, [sp, #0xC]
        str     r6, [sp]
        str     r12, [sp, #8]
        str     lr, [sp, #4]
LCSH14:
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
        ble     LCSH14
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp]
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #4]
        mov     r0, #1
        b       LCSH21
LCSH15:
        mov     r9, r6, asr #2
        add     r9, r6, r9, lsr #29
        movs    r9, r9, asr #3
        bmi     LCSH17
        mov     r11, r8
        sub     r10, r7, #4
        str     r7, [sp, #0xC]
        str     r6, [sp]
        str     r12, [sp, #8]
        str     lr, [sp, #4]
LCSH16:
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
        ble     LCSH16
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp]
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #4]
        mov     r0, #1
LCSH17:
        mov     r2, r6, asr #1
        add     r3, r9, #1
        add     r2, r6, r2, lsr #30
        mov     r9, r2, asr #2
        cmp     r3, r9
        bgt     LCSH21
        sub     r2, r9, r3
        cmp     r2, #4
        addlt   r5, r7, r9, lsl #3
        blt     LCSH19
        mov     r2, r3, lsl #3
        sub     r2, r2, #4
        add     r2, r2, r7
        sub     r4, r9, #4
        add     r5, r7, r9, lsl #3
        str     r6, [sp]
LCSH18:
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
        ble     LCSH18
        ldr     r6, [sp]
        mov     r0, #1
LCSH19:
        mov     r2, r3, lsl #3
        sub     r2, r2, #4
        add     r2, r2, r7
LCSH20:
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
        ble     LCSH20
LCSH21:
        cmp     r6, #0
        movlt   r8, r0
        add     r3, r9, #1
        add     r8, r6, r8
        mov     r9, r8, asr #1
        cmp     r3, r9
        bgt     LCSH25
        sub     r2, r9, r3
        cmp     r2, #4
        addlt   r5, r7, r9, lsl #3
        blt     LCSH23
        mov     r2, r3, lsl #3
        sub     r2, r2, #4
        add     r2, r2, r7
        add     r5, r7, r9, lsl #3
        sub     r4, r9, #4
LCSH22:
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
        ble     LCSH22
LCSH23:
        mov     r2, r3, lsl #3
        sub     r2, r2, #4
        add     r2, r2, r7
LCSH24:
        rsb     r4, r3, #0
        ldr     r8, [r5, +r4, lsl #3]
        add     r4, r5, r4, lsl #3
        add     r3, r3, #1
        eor     r8, r8, #2, 2
        str     r8, [r2, #4]
        ldr     r4, [r4, #4]
        cmp     r3, r9
        str     r4, [r2, #8]!
        ble     LCSH24
LCSH25:
        add     r9, r9, #1
        cmp     r9, r6
        bge     LCSH29
        sub     r2, r6, r9
        cmp     r2, #5
        addlt   r5, r7, r6, lsl #3
        blt     LCSH27
        mov     r2, r9, lsl #3
        sub     r2, r2, #4
        add     r2, r2, r7
        mvn     r4, #2
        add     r5, r7, r6, lsl #3
        sub     r3, r6, #5
LCSH26:
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
        ble     LCSH26
LCSH27:
        mov     r2, r9, lsl #3
        sub     r2, r2, #4
        add     r7, r2, r7
LCSH28:
        rsb     r2, r9, #0
        ldr     r1, [r5, +r2, lsl #3]
        add     r2, r5, r2, lsl #3
        add     r9, r9, #1
        str     r1, [r7, #4]
        ldr     r2, [r2, #4]
        cmp     r9, r6
        eor     r2, r2, #2, 2
        str     r2, [r7, #8]!
        blt     LCSH28
LCSH29:
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   LCSH__2il0floatpacket.1
        .long   0x54442d18
        .long   0x400921fb
        .long   LCSH__2il0floatpacket.2
        .long   0x667f3bcc
        .long   0x3fe6a09e
        .long   0x401921fb


        .data
        .align  4


LCSH__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F
LCSH__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x00


