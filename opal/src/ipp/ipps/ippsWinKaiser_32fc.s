        .text
        .align  4
        .globl  _ippsWinKaiser_32fc


_ippsWinKaiser_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        mov     r4, r0
        cmp     r4, #0
        mov     r10, r1
        mov     r9, r2
        mov     r5, r3
        beq     LBLJ7
        cmp     r10, #0
        beq     LBLJ7
        cmp     r9, #0
        ble     LBLJ8
        mov     r0, r5
        bl      __extendsfdf2
        mov     r7, r0
        sub     r8, r9, #1
        mov     r0, r8
        mov     r11, r1
        bl      __floatsidf
        bic     r3, r11, #2, 2
        mov     r2, r7
        bl      __muldf3
        mov     r12, #0xE, 16
        orr     r6, r12, #1, 2
        sub     r3, r6, #0x2E, 16
        mov     r2, #0
        bl      __muldf3
        add     r3, r6, #0x35, 16
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLJ6
        add     r12, r4, r8, lsl #3
        str     r12, [sp]
        add     r12, r10, r8, lsl #3
        cmp     r8, #0
        str     r12, [sp, #4]
        bne     LBLJ0
        ldr     r2, [r4]
        mov     r0, #0
        str     r2, [r10]
        ldr     r4, [r4, #4]
        str     r4, [r10, #4]
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLJ0:
        mov     r0, r8
        bl      __floatsisf
        mov     r1, r5
        bl      __mulsf3
        bl      __extendsfdf2
        sub     r3, r6, #0x2E, 16
        mov     r2, #0
        bl      __muldf3
        bl      LBLJ_ownsBessel_32f
        mov     r3, r1
        mov     r2, r0
        sub     r6, r6, #0x1E, 16
        mov     r1, r6
        mov     r0, #0
        bl      __divdf3
        mov     r6, r9, asr #1
        cmp     r6, #0
        ble     LBLJ4
        str     r11, [sp, #0x1C]
        ldr     r11, [sp]
        mov     r5, #0
        str     r1, [sp, #0x14]
        str     r0, [sp, #0x10]
        str     r8, [sp, #0x18]
        str     r7, [sp, #0xC]
        str     r9, [sp, #8]
        str     r10, [sp, #0x20]
LBLJ1:
        ldr     r1, [sp, #0x18]
        rsb     r1, r5, r1
        mul     r0, r1, r5
        mov     r1, #0xE, 16
        orr     r7, r1, #1, 2
        bl      __floatsidf
        bl      sqrt
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x1C]
        bl      __muldf3
        mov     r9, r0
        bic     r10, r1, #2, 2
        mov     r3, r7
        mov     r1, r10
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLJ2
        ldr     r3, [pc, #0x518]
        mov     r0, r9
        mov     r1, r10
        sub     r2, r3, #0xBB, 10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r2, [pc, #0x4FC]
        ldr     r3, [pc, #0x4FC]
        mov     r8, r0
        mov     r7, r1
        bl      __muldf3
        ldr     r2, [pc, #0x4F0]
        ldr     r3, [pc, #0x4F0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [pc, #0x4E0]
        ldr     r3, [pc, #0x4E0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [pc, #0x4D0]
        ldr     r3, [pc, #0x4D0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [pc, #0x4C0]
        ldr     r3, [pc, #0x4C0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [pc, #0x4B0]
        ldr     r3, [pc, #0x4B0]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        mov     r2, #0xE, 16
        orr     r2, r2, #1, 2
        sub     r3, r2, #0x1E, 16
        mov     r2, #0
        bl      __adddf3
        b       LBLJ3
LBLJ2:
        mov     r12, #0xE, 16
        orr     r1, r12, #1, 2
        mov     r2, r9
        mov     r3, r10
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x470]
        ldr     r3, [pc, #0x470]
        mov     r7, r0
        mov     r8, r1
        bl      __muldf3
        ldr     r2, [pc, #0x464]
        ldr     r3, [pc, #0x464]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [pc, #0x454]
        ldr     r3, [pc, #0x454]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [pc, #0x444]
        ldr     r3, [pc, #0x444]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [pc, #0x434]
        ldr     r3, [pc, #0x434]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [pc, #0x424]
        ldr     r3, [pc, #0x424]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [pc, #0x414]
        ldr     r3, [pc, #0x414]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [pc, #0x404]
        ldr     r3, [pc, #0x404]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [pc, #0x3F4]
        ldr     r3, [pc, #0x3F4]
        bl      __adddf3
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x28]
        mov     r1, r10
        mov     r0, r9
        bl      exp
        str     r0, [sp, #0x2C]
        str     r1, [sp, #0x30]
        mov     r0, r9
        mov     r1, r10
        bl      sqrt
        mov     r8, r0
        mov     r7, r1
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __muldf3
        mov     r2, r8
        mov     r3, r7
        bl      __divdf3
LBLJ3:
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        sub     r6, r6, #1
        add     r5, r5, #1
        bl      __muldf3
        ldr     r2, [r4]
        mov     r8, r0
        mov     r7, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r9, [sp, #0x20]
        str     r0, [r9]
        ldr     r0, [r4, #4]
        add     r4, r4, #8
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9, #4]
        ldr     r0, [r11]
        add     r9, r9, #8
        str     r9, [sp, #0x20]
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r9, [sp, #4]
        str     r0, [r9]
        ldr     r0, [r11, #4]
        sub     r11, r11, #8
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        bl      __truncdfsf2
        str     r0, [r9, #4]
        sub     r9, r9, #8
        cmp     r6, #0
        str     r9, [sp, #4]
        bgt     LBLJ1
        ldr     r9, [sp, #8]
        ldr     r10, [sp, #0x20]
        str     r11, [sp]
LBLJ4:
        tst     r9, #1
        beq     LBLJ5
        ldr     r0, [sp]
        ldr     r2, [r0]
        str     r2, [r10]
        ldr     r0, [r0, #4]
        str     r0, [r10, #4]
LBLJ5:
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLJ6:
        mvn     r0, #0x26
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLJ7:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLJ8:
        mvn     r0, #5
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLJ_ownsBessel_32f:
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
        bge     LBLJ9
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
        b       LBLJ10
LBLJ9:
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
LBLJ10:
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


