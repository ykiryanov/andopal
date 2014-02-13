        .text
        .align  4
        .globl  _ippsWinKaiserQ15_16s_I


_ippsWinKaiserQ15_16s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        mov     r6, r0
        cmp     r6, #0
        mov     r11, r1
        mov     r0, r2
        beq     LBLS13
        cmp     r11, #0
        ble     LBLS12
        bl      __floatsidf
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        mov     r4, r0
        sub     r10, r11, #1
        mov     r0, r10
        mov     r9, r1
        bl      __floatsidf
        mov     r8, r0
        mov     r7, r1
        bic     r3, r9, #2, 2
        mov     r2, r4
        bl      __muldf3
        mov     r12, #0xFE, 12
        orr     r5, r12, #3, 4
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        ldr     r3, [pc, #0x6F4]
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLS11
        add     r12, r6, r10, lsl #1
        cmp     r10, #0
        str     r12, [sp]
        bne     LBLS0
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLS0:
        mov     r0, r4
        mov     r2, r8
        mov     r3, r7
        mov     r1, r9
        bl      __muldf3
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        bl      LBLS_ownsBessel_32f
        mov     r3, r1
        mov     r2, r0
        add     r1, r5, #1, 12
        mov     r0, #0
        bl      __divdf3
        mov     r7, r11, asr #1
        cmp     r7, #0
        ble     LBLS10
        str     r9, [sp, #0xC]
        ldr     r9, [sp]
        mov     r8, #0
        str     r1, [sp, #0x18]
        str     r0, [sp, #8]
        str     r5, [sp, #0x10]
        str     r10, [sp, #0x14]
        str     r4, [sp, #4]
LBLS1:
        ldr     r1, [sp, #0x14]
        rsb     r1, r8, r1
        mul     r0, r1, r8
        ldr     r1, [sp, #0x10]
        add     r10, r1, #0x2E, 16
        bl      __floatsidf
        bl      sqrt
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xC]
        bl      __muldf3
        mov     r4, r0
        bic     r5, r1, #2, 2
        mov     r3, r10
        mov     r1, r5
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLS2
        mov     r0, r4
        mov     r1, r5
        ldr     r3, [pc, #0x614]
        mov     r12, #0xFE, 12
        orr     r10, r12, #3, 4
        sub     r2, r3, #0xBB, 10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r2, [pc, #0x5F8]
        ldr     r3, [pc, #0x5F8]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        ldr     r2, [pc, #0x5EC]
        ldr     r3, [pc, #0x5EC]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x5DC]
        ldr     r3, [pc, #0x5DC]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x5CC]
        ldr     r3, [pc, #0x5CC]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x5BC]
        ldr     r3, [pc, #0x5BC]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x5AC]
        ldr     r3, [pc, #0x5AC]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        add     r10, r10, #1, 12
        mov     r3, r10
        mov     r2, #0
        bl      __adddf3
        b       LBLS3
LBLS2:
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        add     r1, r12, #0x2E, 16
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x56C]
        ldr     r3, [pc, #0x56C]
        mov     r10, r0
        mov     r11, r1
        bl      __muldf3
        ldr     r2, [pc, #0x560]
        ldr     r3, [pc, #0x560]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x550]
        ldr     r3, [pc, #0x550]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x540]
        ldr     r3, [pc, #0x540]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x530]
        ldr     r3, [pc, #0x530]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x520]
        ldr     r3, [pc, #0x520]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x510]
        ldr     r3, [pc, #0x510]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x500]
        ldr     r3, [pc, #0x500]
        bl      __adddf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r2, [pc, #0x4F0]
        ldr     r3, [pc, #0x4F0]
        bl      __adddf3
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x20]
        mov     r1, r5
        mov     r0, r4
        bl      exp
        mov     r11, r0
        mov     r10, r1
        mov     r0, r4
        mov     r1, r5
        bl      sqrt
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
LBLS3:
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0x18]
        bl      __muldf3
        mov     r11, r0
        ldrsh   r0, [r6]
        mov     r10, r1
        bl      __floatsidf
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #0x7F, 8
        mov     r5, r0
        mov     r4, r1
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        movlt   r12, #0
        sublt   r0, r12, #2, 18
        blt     LBLS6
        ldr     r3, [pc, #0x448]
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLS5
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLS4
        mov     r0, r5
        mov     r1, r4
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBLS6
LBLS4:
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBLS6
LBLS5:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r0, r12
LBLS6:
        strh    r0, [r6]
        ldrsh   r0, [r9]
        bl      __floatsidf
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #0x7F, 8
        mov     r5, r0
        mov     r4, r1
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        movlt   r1, #0
        sublt   r0, r1, #2, 18
        blt     LBLS9
        ldr     r3, [pc, #0x370]
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLS8
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLS7
        mov     r0, r5
        mov     r1, r4
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBLS9
LBLS7:
        mov     r2, r5
        mov     r3, r4
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __adddf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBLS9
LBLS8:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r0, r1
LBLS9:
        sub     r7, r7, #1
        strh    r0, [r9], #-2
        cmp     r7, #0
        add     r6, r6, #2
        add     r8, r8, #1
        bgt     LBLS1
LBLS10:
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLS11:
        mvn     r0, #0x26
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLS12:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLS13:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBLS_ownsBessel_32f:
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
        bge     LBLS14
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
        b       LBLS15
LBLS14:
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
LBLS15:
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


