        .text
        .align  4
        .globl  _ippsWinKaiser_32fc_I


_ippsWinKaiser_32fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        mov     r6, r0
        cmp     r6, #0
        mov     r8, r1
        mov     r7, r2
        beq     LBLI7
        cmp     r8, #0
        ble     LBLI6
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
        bgt     LBLI5
        cmp     r5, #0
        add     r9, r6, r5, lsl #3
        bne     LBLI0
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLI0:
        mov     r0, r5
        bl      __floatsisf
        mov     r1, r7
        bl      __mulsf3
        bl      __extendsfdf2
        sub     r3, r11, #0x2E, 16
        mov     r2, #0
        bl      __muldf3
        bl      LBLI_ownsBessel_32f
        mov     r3, r1
        mov     r2, r0
        sub     r1, r11, #0x1E, 16
        mov     r0, #0
        bl      __divdf3
        mov     r7, r8, asr #1
        cmp     r7, #0
        ble     LBLI4
        mov     r8, #0
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x10]
        str     r11, [sp, #8]
        str     r5, [sp, #0xC]
        str     r10, [sp, #4]
        str     r4, [sp]
LBLI1:
        ldr     r1, [sp, #0xC]
        rsb     r1, r8, r1
        mul     r0, r1, r8
        bl      __floatsidf
        bl      sqrt
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        bl      __muldf3
        ldr     r3, [sp, #8]
        mov     r4, r0
        bic     r5, r1, #2, 2
        mov     r1, r5
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLI2
        mov     r0, r4
        mov     r1, r5
        ldr     r3, [pc, #0x4D4]
        mov     r12, #0xE, 16
        orr     r10, r12, #1, 2
        sub     r2, r3, #0xBB, 10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r2, [pc, #0x4B8]
        ldr     r3, [pc, #0x4B8]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        ldr     r2, [pc, #0x4AC]
        ldr     r3, [pc, #0x4AC]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x49C]
        ldr     r3, [pc, #0x49C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x48C]
        ldr     r3, [pc, #0x48C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x47C]
        ldr     r3, [pc, #0x47C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x46C]
        ldr     r3, [pc, #0x46C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        sub     r10, r10, #0x1E, 16
        mov     r3, r10
        mov     r2, #0
        bl      __adddf3
        b       LBLI3
LBLI2:
        mov     r12, #0xE, 16
        orr     r1, r12, #1, 2
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x430]
        ldr     r3, [pc, #0x430]
        mov     r10, r0
        mov     r11, r1
        bl      __muldf3
        ldr     r2, [pc, #0x424]
        ldr     r3, [pc, #0x424]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x414]
        ldr     r3, [pc, #0x414]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x404]
        ldr     r3, [pc, #0x404]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x3F4]
        ldr     r3, [pc, #0x3F4]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
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
LBLI3:
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
        str     r0, [r6]
        ldr     r0, [r6, #4]
        add     r8, r8, #1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r6, #4]
        ldr     r0, [r9]
        add     r6, r6, #8
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9]
        ldr     r0, [r9, #4]
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9, #4]
        cmp     r7, #0
        sub     r9, r9, #8
        bgt     LBLI1
LBLI4:
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLI5:
        mvn     r0, #0x26
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLI6:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLI7:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLI_ownsBessel_32f:
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
        bge     LBLI8
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
        b       LBLI9
LBLI8:
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
LBLI9:
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


