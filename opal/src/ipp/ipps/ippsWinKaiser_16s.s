        .text
        .align  4
        .globl  _ippsWinKaiser_16s


_ippsWinKaiser_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        mov     r6, r0
        cmp     r6, #0
        mov     r7, r1
        mov     r10, r2
        mov     r8, r3
        beq     LBLP13
        cmp     r7, #0
        beq     LBLP13
        cmp     r10, #0
        ble     LBLP14
        mov     r0, r8
        bl      __extendsfdf2
        mov     r4, r0
        sub     r5, r10, #1
        mov     r0, r5
        mov     r11, r1
        bl      __floatsidf
        bic     r3, r11, #2, 2
        mov     r2, r4
        bl      __muldf3
        mov     r12, #0xFE, 12
        orr     r9, r12, #3, 4
        mov     r2, #0
        mov     r3, r9
        bl      __muldf3
        ldr     r3, [pc, #0x734]
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLP12
        add     r12, r6, r5, lsl #1
        str     r12, [sp, #0x1C]
        add     r12, r7, r5, lsl #1
        cmp     r5, #0
        str     r12, [sp]
        bne     LBLP0
        ldrsh   r6, [r6]
        mov     r0, #0
        strh    r6, [r7]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LBLP0:
        mov     r0, r5
        bl      __floatsisf
        mov     r1, r8
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r3, r9
        mov     r2, #0
        bl      __muldf3
        bl      LBLP_ownsBessel_32f
        mov     r3, r1
        mov     r2, r0
        add     r1, r9, #1, 12
        mov     r0, #0
        bl      __divdf3
        mov     r9, r10, asr #1
        cmp     r9, #0
        ble     LBLP10
        mov     r8, #0
        str     r1, [sp, #8]
        str     r0, [sp, #0x10]
        str     r5, [sp, #0xC]
        str     r11, [sp, #0x18]
        str     r4, [sp, #0x14]
        str     r10, [sp, #4]
LBLP1:
        ldr     r2, [sp, #0xC]
        rsb     r2, r8, r2
        mul     r0, r2, r8
        mov     r2, #0xFE, 12
        orr     r2, r2, #3, 4
        add     r10, r2, #0x2E, 16
        bl      __floatsidf
        bl      sqrt
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        bl      __muldf3
        mov     r4, r0
        bic     r5, r1, #2, 2
        mov     r3, r10
        mov     r1, r5
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLP2
        ldr     r3, [pc, #0x64C]
        mov     r0, r4
        mov     r1, r5
        sub     r2, r3, #0xBB, 10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r2, [pc, #0x630]
        ldr     r3, [pc, #0x630]
        mov     r5, r0
        mov     r4, r1
        bl      __muldf3
        ldr     r2, [pc, #0x624]
        ldr     r3, [pc, #0x624]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x614]
        ldr     r3, [pc, #0x614]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x604]
        ldr     r3, [pc, #0x604]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x5F4]
        ldr     r3, [pc, #0x5F4]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x5E4]
        ldr     r3, [pc, #0x5E4]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0xFE, 12
        orr     r2, r2, #3, 4
        add     r3, r2, #1, 12
        mov     r2, #0
        bl      __adddf3
        b       LBLP3
LBLP2:
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        add     r1, r12, #0x2E, 16
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x5A0]
        ldr     r3, [pc, #0x5A0]
        mov     r10, r0
        mov     r11, r1
        bl      __muldf3
        ldr     r2, [pc, #0x594]
        ldr     r3, [pc, #0x594]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x584]
        ldr     r3, [pc, #0x584]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x574]
        ldr     r3, [pc, #0x574]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x564]
        ldr     r3, [pc, #0x564]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x554]
        ldr     r3, [pc, #0x554]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x544]
        ldr     r3, [pc, #0x544]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x534]
        ldr     r3, [pc, #0x534]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x524]
        ldr     r3, [pc, #0x524]
        bl      __adddf3
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x24]
        mov     r1, r5
        mov     r0, r4
        bl      exp
        str     r0, [sp, #0x28]
        mov     r10, r1
        mov     r0, r4
        mov     r1, r5
        bl      sqrt
        mov     r5, r0
        mov     r4, r1
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        ldr     r2, [sp, #0x28]
        mov     r3, r10
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
LBLP3:
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #8]
        bl      __muldf3
        mov     r5, r0
        ldrsh   r0, [r6]
        mov     r4, r1
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #0x7F, 8
        mov     r11, r0
        mov     r10, r1
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        movlt   r12, #0
        sublt   r0, r12, #2, 18
        blt     LBLP6
        ldr     r3, [pc, #0x47C]
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLP5
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLP4
        mov     r0, r11
        mov     r1, r10
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBLP6
LBLP4:
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBLP6
LBLP5:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r0, r12
LBLP6:
        strh    r0, [r7]
        ldr     r12, [sp, #0x1C]
        ldrsh   r0, [r12]
        mov     r12, #0xFE, 12
        orr     r10, r12, #3, 4
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        sub     r3, r10, #0x7F, 8
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        blt     LBLP9
        ldr     r3, [pc, #0x3A0]
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLP8
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLP7
        mov     r0, r4
        mov     r1, r5
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LBLP9
LBLP7:
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LBLP9
LBLP8:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LBLP9:
        ldr     r3, [sp]
        sub     r9, r9, #1
        cmp     r9, #0
        strh    r2, [r3], #-2
        ldr     r2, [sp, #0x1C]
        str     r3, [sp]
        sub     r2, r2, #2
        add     r6, r6, #2
        str     r2, [sp, #0x1C]
        add     r7, r7, #2
        add     r8, r8, #1
        bgt     LBLP1
        ldr     r10, [sp, #4]
LBLP10:
        tst     r10, #1
        beq     LBLP11
        ldr     r0, [sp, #0x1C]
        ldrsh   r0, [r0]
        strh    r0, [r7]
LBLP11:
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LBLP12:
        mvn     r0, #0x26
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LBLP13:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LBLP14:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LBLP_ownsBessel_32f:
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
        bge     LBLP15
        ldr     r3, [pc, #0x1EC]
        mov     r0, r6
        sub     r6, r4, #0x1E, 16
        mov     r1, r7
        sub     r2, r3, #0xBB, 10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r2, [pc, #0x1CC]
        ldr     r3, [pc, #0x1CC]
        mov     r5, r0
        mov     r4, r1
        bl      __muldf3
        ldr     r2, [pc, #0x1C0]
        ldr     r3, [pc, #0x1C0]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x1B0]
        ldr     r3, [pc, #0x1B0]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x1A0]
        ldr     r3, [pc, #0x1A0]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x190]
        ldr     r3, [pc, #0x190]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x180]
        ldr     r3, [pc, #0x180]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r3, r6
        mov     r2, #0
        bl      __adddf3
        b       LBLP16
LBLP15:
        mov     r1, r4
        mov     r2, r6
        mov     r3, r7
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x14C]
        ldr     r3, [pc, #0x14C]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        ldr     r2, [pc, #0x140]
        ldr     r3, [pc, #0x140]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x130]
        ldr     r3, [pc, #0x130]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x120]
        ldr     r3, [pc, #0x120]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x110]
        ldr     r3, [pc, #0x110]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x100]
        ldr     r3, [pc, #0x100]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0xF0]
        ldr     r3, [pc, #0xF0]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0xE0]
        ldr     r3, [pc, #0xE0]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0xD0]
        ldr     r3, [pc, #0xD0]
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
LBLP16:
        ldmia   sp!, {r4 - r9, pc}
        .long   0x40734000
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
        .long   0x40dfffc0


