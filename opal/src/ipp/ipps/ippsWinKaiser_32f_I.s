        .text
        .align  4
        .globl  _ippsWinKaiser_32f_I


_ippsWinKaiser_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        mov     r6, r0
        cmp     r6, #0
        mov     r8, r1
        mov     r7, r2
        beq     LBLK7
        cmp     r8, #0
        ble     LBLK6
        mov     r0, r7
        bl      __extendsfdf2
        mov     r4, r0
        sub     r5, r8, #1
        mov     r0, r5
        mov     r10, r1
        bl      __floatsidf
        bic     r3, r10, #2, 2
        mov     r2, r4
        bl      __muldf3
        mov     r3, #0xE, 16
        orr     r11, r3, #1, 2
        sub     r3, r11, #0x2E, 16
        mov     r2, #0
        bl      __muldf3
        add     r3, r11, #0x35, 16
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLK5
        cmp     r5, #0
        add     r9, r6, r5, lsl #2
        bne     LBLK0
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLK0:
        mov     r0, r5
        bl      __floatsisf
        mov     r1, r7
        bl      __mulsf3
        bl      __extendsfdf2
        sub     r3, r11, #0x2E, 16
        mov     r2, #0
        bl      __muldf3
        bl      LBLK_ownsBessel_32f
        mov     r3, r1
        mov     r2, r0
        sub     r1, r11, #0x1E, 16
        mov     r0, #0
        bl      __divdf3
        mov     r7, r8, asr #1
        cmp     r7, #0
        ble     LBLK4
        mov     r8, #0
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x10]
        str     r11, [sp, #4]
        str     r5, [sp, #8]
        str     r10, [sp, #0xC]
        str     r4, [sp]
LBLK1:
        ldr     r1, [sp, #8]
        rsb     r1, r8, r1
        mul     r0, r1, r8
        bl      __floatsidf
        bl      sqrt
        ldr     r2, [sp]
        ldr     r3, [sp, #0xC]
        bl      __muldf3
        ldr     r3, [sp, #4]
        mov     r4, r0
        bic     r5, r1, #2, 2
        mov     r1, r5
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLK2
        mov     r0, r4
        mov     r1, r5
        ldr     r3, [pc, #0x494]
        mov     r12, #0xE, 16
        orr     r10, r12, #1, 2
        sub     r2, r3, #0xBB, 10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r2, [pc, #0x478]
        ldr     r3, [pc, #0x478]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        ldr     r2, [pc, #0x46C]
        ldr     r3, [pc, #0x46C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x45C]
        ldr     r3, [pc, #0x45C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x44C]
        ldr     r3, [pc, #0x44C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x43C]
        ldr     r3, [pc, #0x43C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x42C]
        ldr     r3, [pc, #0x42C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        sub     r10, r10, #0x1E, 16
        mov     r3, r10
        mov     r2, #0
        bl      __adddf3
        b       LBLK3
LBLK2:
        mov     r12, #0xE, 16
        orr     r1, r12, #1, 2
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x3F0]
        ldr     r3, [pc, #0x3F0]
        mov     r10, r0
        mov     r11, r1
        bl      __muldf3
        ldr     r2, [pc, #0x3E4]
        ldr     r3, [pc, #0x3E4]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x3D4]
        ldr     r3, [pc, #0x3D4]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x3C4]
        ldr     r3, [pc, #0x3C4]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x3B4]
        ldr     r3, [pc, #0x3B4]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x3A4]
        ldr     r3, [pc, #0x3A4]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x394]
        ldr     r3, [pc, #0x394]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x384]
        ldr     r3, [pc, #0x384]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x374]
        ldr     r3, [pc, #0x374]
        bl      __adddf3
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        mov     r1, r5
        mov     r0, r4
        bl      exp
        str     r0, [sp, #0x20]
        mov     r10, r1
        mov     r0, r4
        mov     r1, r5
        bl      sqrt
        mov     r5, r0
        mov     r4, r1
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0x20]
        mov     r3, r10
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
LBLK3:
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        bl      __muldf3
        ldr     r2, [r6]
        mov     r4, r0
        mov     r5, r1
        sub     r7, r7, #1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r6], #4
        ldr     r0, [r9]
        add     r8, r8, #1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9], #-4
        cmp     r7, #0
        bgt     LBLK1
LBLK4:
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLK5:
        mvn     r0, #0x26
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLK6:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLK7:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLK_ownsBessel_32f:
        stmdb   sp!, {r4 - r9, lr}
        mov     r12, #0xE, 16
        mov     r6, r0
        bic     r7, r1, #2, 2
        orr     r4, r12, #1, 2
        mov     r1, r7
        mov     r2, #0
        mov     r3, r4
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLK8
        ldr     r3, [pc, #0x1E8]
        mov     r0, r6
        sub     r6, r4, #0x1E, 16
        mov     r1, r7
        sub     r2, r3, #0xBB, 10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r2, [pc, #0x1C8]
        ldr     r3, [pc, #0x1C8]
        mov     r5, r0
        mov     r4, r1
        bl      __muldf3
        ldr     r2, [pc, #0x1BC]
        ldr     r3, [pc, #0x1BC]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x1AC]
        ldr     r3, [pc, #0x1AC]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x19C]
        ldr     r3, [pc, #0x19C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x18C]
        ldr     r3, [pc, #0x18C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x17C]
        ldr     r3, [pc, #0x17C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r3, r6
        mov     r2, #0
        bl      __adddf3
        b       LBLK9
LBLK8:
        mov     r1, r4
        mov     r2, r6
        mov     r3, r7
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x148]
        ldr     r3, [pc, #0x148]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        ldr     r2, [pc, #0x13C]
        ldr     r3, [pc, #0x13C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x12C]
        ldr     r3, [pc, #0x12C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x11C]
        ldr     r3, [pc, #0x11C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x10C]
        ldr     r3, [pc, #0x10C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0xFC]
        ldr     r3, [pc, #0xFC]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0xEC]
        ldr     r3, [pc, #0xEC]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0xDC]
        ldr     r3, [pc, #0xDC]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0xCC]
        ldr     r3, [pc, #0xCC]
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        mov     r1, r7
        mov     r0, r6
        bl      exp
        mov     r8, r0
        mov     r9, r1
        mov     r0, r6
        mov     r1, r7
        bl      sqrt
        mov     r6, r0
        mov     r7, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __divdf3
LBLK9:
        ldmia   sp!, {r4 - r9, pc}
        .long   0x3fd11111
        .long   0x5ac54874
        .long   0x3f72c3d7
        .long   0x8849e5fd
        .long   0x3fa278a8
        .long   0x74e732aa
        .long   0x3fd105b4
        .long   0x3fc7962c
        .long   0x3ff34ed8
        .long   0xb89430a4
        .long   0x4008b833
        .long   0xe6248ca7
        .long   0x400c1ffe
        .long   0xfd3b7f88
        .long   0x3f70125e
        .long   0xca084c55
        .long   0xbf90df2b
        .long   0xf0e55ae3
        .long   0x3f9afce6
        .long   0x1efdc716
        .long   0xbf951227
        .long   0x8a50d154
        .long   0x3f82c3f3
        .long   0x4e13894a
        .long   0xbf59d0c1
        .long   0x2b92d5db
        .long   0x3f627548
        .long   0xff2d9d1c
        .long   0x3f8b35a5
        .long   0x3365de00
        .long   0x3fd98845


