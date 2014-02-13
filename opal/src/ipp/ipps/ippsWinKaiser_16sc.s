        .text
        .align  4
        .globl  _ippsWinKaiser_16sc


_ippsWinKaiser_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x34
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r1
        mov     r10, r2
        mov     r6, r3
        beq     LBLN19
        cmp     r5, #0
        beq     LBLN19
        cmp     r10, #0
        ble     LBLN20
        mov     r0, r6
        bl      __extendsfdf2
        mov     r8, r0
        sub     r7, r10, #1
        mov     r0, r7
        mov     r9, r1
        bl      __floatsidf
        bic     r3, r9, #2, 2
        mov     r2, r8
        bl      __muldf3
        mov     r12, #0xFE, 12
        orr     r11, r12, #3, 4
        mov     r2, #0
        mov     r3, r11
        bl      __muldf3
        ldr     r3, [pc, #0x914]
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLN18
        add     r12, r4, r7, lsl #2
        str     r12, [sp]
        add     r12, r5, r7, lsl #2
        cmp     r7, #0
        str     r12, [sp, #4]
        bne     LBLN0
        ldrsh   r2, [r4]
        mov     r0, #0
        strh    r2, [r5]
        ldrsh   r4, [r4, #2]
        strh    r4, [r5, #2]
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLN0:
        mov     r0, r7
        bl      __floatsisf
        mov     r1, r6
        bl      __mulsf3
        bl      __extendsfdf2
        mov     r2, #0
        mov     r3, r11
        bl      __muldf3
        bl      LBLN_ownsBessel_32f
        mov     r3, r1
        mov     r2, r0
        add     r1, r11, #1, 12
        mov     r0, #0
        bl      __divdf3
        mov     r3, r10, asr #1
        cmp     r3, #0
        ble     LBLN16
        str     r7, [sp, #0x18]
        ldr     r7, [sp]
        mov     r6, #0
        str     r3, [sp, #0x20]
        str     r1, [sp, #0xC]
        str     r0, [sp, #0x10]
        str     r9, [sp, #0x14]
        str     r8, [sp, #0x1C]
        str     r10, [sp, #8]
LBLN1:
        ldr     r2, [sp, #0x18]
        rsb     r2, r6, r2
        mul     r0, r2, r6
        mov     r2, #0xFE, 12
        orr     r2, r2, #3, 4
        add     r8, r2, #0x2E, 16
        bl      __floatsidf
        bl      sqrt
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x14]
        bl      __muldf3
        mov     r10, r0
        bic     r11, r1, #2, 2
        mov     r3, r8
        mov     r1, r11
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLN2
        ldr     r3, [pc, #0x81C]
        mov     r0, r10
        mov     r1, r11
        sub     r2, r3, #0xBB, 10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r2, [pc, #0x800]
        ldr     r3, [pc, #0x800]
        mov     r9, r0
        mov     r8, r1
        bl      __muldf3
        ldr     r2, [pc, #0x7F4]
        ldr     r3, [pc, #0x7F4]
        bl      __adddf3
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [pc, #0x7E4]
        ldr     r3, [pc, #0x7E4]
        bl      __adddf3
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [pc, #0x7D4]
        ldr     r3, [pc, #0x7D4]
        bl      __adddf3
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [pc, #0x7C4]
        ldr     r3, [pc, #0x7C4]
        bl      __adddf3
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [pc, #0x7B4]
        ldr     r3, [pc, #0x7B4]
        bl      __adddf3
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r2, #0xFE, 12
        orr     r2, r2, #3, 4
        add     r3, r2, #1, 12
        mov     r2, #0
        bl      __adddf3
        b       LBLN3
LBLN2:
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        add     r1, r12, #0x2E, 16
        mov     r2, r10
        mov     r3, r11
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x770]
        ldr     r3, [pc, #0x770]
        mov     r8, r0
        mov     r9, r1
        bl      __muldf3
        ldr     r2, [pc, #0x764]
        ldr     r3, [pc, #0x764]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [pc, #0x754]
        ldr     r3, [pc, #0x754]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [pc, #0x744]
        ldr     r3, [pc, #0x744]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [pc, #0x734]
        ldr     r3, [pc, #0x734]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [pc, #0x724]
        ldr     r3, [pc, #0x724]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [pc, #0x714]
        ldr     r3, [pc, #0x714]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [pc, #0x704]
        ldr     r3, [pc, #0x704]
        bl      __adddf3
        mov     r2, r8
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [pc, #0x6F4]
        ldr     r3, [pc, #0x6F4]
        bl      __adddf3
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x28]
        mov     r1, r11
        mov     r0, r10
        bl      exp
        str     r0, [sp, #0x2C]
        str     r1, [sp, #0x30]
        mov     r0, r10
        mov     r1, r11
        bl      sqrt
        mov     r9, r0
        mov     r8, r1
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x30]
        bl      __muldf3
        mov     r2, r9
        mov     r3, r8
        bl      __divdf3
LBLN3:
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        bl      __muldf3
        mov     r9, r0
        ldrsh   r0, [r4]
        mov     r8, r1
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r8
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
        blt     LBLN6
        ldr     r3, [pc, #0x64C]
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLN5
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLN4
        mov     r0, r11
        mov     r1, r10
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBLN6
LBLN4:
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBLN6
LBLN5:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r0, r12
LBLN6:
        strh    r0, [r5]
        ldrsh   r0, [r4, #2]
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        str     r12, [sp, #0x30]
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [sp, #0x30]
        mov     r11, r0
        mov     r10, r1
        sub     r3, r12, #0x7F, 8
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        movlt   r12, #0
        sublt   r0, r12, #2, 18
        blt     LBLN9
        ldr     r3, [pc, #0x56C]
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLN8
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLN7
        mov     r0, r11
        mov     r1, r10
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBLN9
LBLN7:
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        b       LBLN9
LBLN8:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r0, r12
LBLN9:
        strh    r0, [r5, #2]
        ldrsh   r0, [r7]
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        str     r12, [sp, #0x30]
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r12, [sp, #0x30]
        mov     r11, r0
        mov     r10, r1
        sub     r3, r12, #0x7F, 8
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        movlt   r12, #0
        sublt   r12, r12, #2, 18
        blt     LBLN12
        ldr     r3, [pc, #0x48C]
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLN11
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLN10
        mov     r0, r11
        mov     r1, r10
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
        b       LBLN12
LBLN10:
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r11
        mov     r3, r10
        bl      __adddf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r12, r0, asr #16
        b       LBLN12
LBLN11:
        mvn     r12, #0xFF
        bic     r12, r12, #0x7F, 24
        mvn     r12, r12
LBLN12:
        ldr     lr, [sp, #4]
        strh    r12, [lr]
        ldrsh   r0, [r7, #2]
        mov     r12, #0xFE, 12
        orr     r10, r12, #3, 4
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        sub     r3, r10, #0x7F, 8
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        movlt   r2, #0
        sublt   r2, r2, #2, 18
        blt     LBLN15
        ldr     r3, [pc, #0x3B0]
        mov     r0, r8
        mov     r1, r9
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLN14
        mov     r0, r8
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLN13
        mov     r0, r8
        mov     r1, r9
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LBLN15
LBLN13:
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        bl      __fixdfsi
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        b       LBLN15
LBLN14:
        mvn     r2, #0xFF
        bic     r2, r2, #0x7F, 24
        mvn     r2, r2
LBLN15:
        ldr     r3, [sp, #0x20]
        ldr     r12, [sp, #4]
        add     r4, r4, #4
        sub     r3, r3, #1
        str     r3, [sp, #0x20]
        strh    r2, [r12, #2]
        sub     r12, r12, #4
        cmp     r3, #0
        sub     r7, r7, #4
        add     r5, r5, #4
        str     r12, [sp, #4]
        add     r6, r6, #1
        bgt     LBLN1
        ldr     r10, [sp, #8]
        str     r7, [sp]
LBLN16:
        tst     r10, #1
        beq     LBLN17
        ldr     r0, [sp]
        ldrsh   r2, [r0]
        strh    r2, [r5]
        ldrsh   r0, [r0, #2]
        strh    r0, [r5, #2]
LBLN17:
        mov     r0, #0
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLN18:
        mvn     r0, #0x26
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLN19:
        mvn     r0, #7
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLN20:
        mvn     r0, #5
        add     sp, sp, #0x34
        ldmia   sp!, {r4 - r11, pc}
LBLN_ownsBessel_32f:
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
        bge     LBLN21
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
        b       LBLN22
LBLN21:
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
LBLN22:
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


