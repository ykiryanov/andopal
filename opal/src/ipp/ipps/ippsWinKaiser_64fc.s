        .text
        .align  4
        .globl  _ippsWinKaiser_64fc


_ippsWinKaiser_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        mov     r6, r0
        cmp     r6, #0
        mov     r7, r1
        mov     r10, r2
        mov     r4, r3
        beq     LBLF7
        cmp     r7, #0
        beq     LBLF7
        cmp     r10, #0
        ble     LBLF8
        mov     r0, r4
        bl      __extendsfdf2
        mov     r8, r0
        sub     r5, r10, #1
        mov     r0, r5
        mov     r9, r1
        bl      __floatsidf
        bic     r3, r9, #2, 2
        mov     r2, r8
        bl      __muldf3
        mov     r12, #1, 12
        orr     r11, r12, #1, 2
        sub     r3, r11, #3, 12
        mov     r2, #0
        bl      __muldf3
        ldr     r3, [pc, #0x6EC]
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLF6
        add     r12, r6, r5, lsl #4
        str     r12, [sp]
        add     r12, r7, r5, lsl #4
        cmp     r5, #0
        str     r12, [sp, #4]
        bne     LBLF0
        ldr     r2, [r6, #4]
        ldr     r3, [r6]
        mov     r0, #0
        str     r2, [r7, #4]
        str     r3, [r7]
        ldr     r2, [r6, #8]
        ldr     r6, [r6, #0xC]
        str     r2, [r7, #8]
        str     r6, [r7, #0xC]
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBLF0:
        mov     r0, r5
        bl      __floatsisf
        mov     r1, r4
        bl      __mulsf3
        bl      __extendsfdf2
        sub     r3, r11, #3, 12
        mov     r2, #0
        bl      __muldf3
        bl      LBLF_ownsBessel_64f
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        mov     r12, r10, asr #1
        cmp     r12, #0
        ble     LBLF4
        str     r9, [sp, #0x10]
        str     r8, [sp, #0xC]
        ldr     r8, [sp, #4]
        ldr     r9, [sp]
        mov     r3, #0
        str     r3, [sp, #0x24]
        str     r12, [sp, #0x20]
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x18]
        str     r5, [sp, #0x14]
        str     r10, [sp, #8]
LBLF1:
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0x24]
        rsb     r3, r2, r3
        mul     r0, r3, r2
        mov     r2, #1, 12
        orr     r10, r2, #1, 2
        bl      __floatsidf
        bl      sqrt
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        bl      __muldf3
        mov     r4, r0
        bic     r5, r1, #2, 2
        mov     r3, r10
        mov     r1, r5
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLF2
        mov     r12, #1, 12
        orr     r10, r12, #1, 2
        sub     r3, r10, #1, 10
        mov     r2, #0
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r2, [pc, #0x5B0]
        ldr     r3, [pc, #0x5B0]
        mov     r5, r0
        mov     r4, r1
        bl      __muldf3
        ldr     r2, [pc, #0x5A4]
        ldr     r3, [pc, #0x5A4]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x594]
        ldr     r3, [pc, #0x594]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x584]
        ldr     r3, [pc, #0x584]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x574]
        ldr     r3, [pc, #0x574]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x564]
        sub     r3, r10, #3
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x550]
        mov     r3, r10
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x53C]
        sub     r10, r10, #2, 12
        sub     r3, r10, #1
        bl      __adddf3
        b       LBLF3
LBLF2:
        mov     r12, #1, 12
        orr     r1, r12, #1, 2
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x514]
        ldr     r3, [pc, #0x514]
        mov     r11, r0
        mov     r10, r1
        bl      __muldf3
        ldr     r2, [pc, #0x508]
        ldr     r3, [pc, #0x508]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x4F8]
        ldr     r3, [pc, #0x4F8]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x4E8]
        ldr     r3, [pc, #0x4E8]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x4D8]
        ldr     r3, [pc, #0x4D8]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x4C8]
        ldr     r3, [pc, #0x4C8]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x4B8]
        ldr     r3, [pc, #0x4B8]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x4A8]
        ldr     r3, [pc, #0x4A8]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x498]
        ldr     r3, [pc, #0x498]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x488]
        ldr     r3, [pc, #0x488]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x478]
        ldr     r3, [pc, #0x478]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x468]
        ldr     r3, [pc, #0x468]
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [pc, #0x458]
        ldr     r3, [pc, #0x458]
        bl      __adddf3
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x2C]
        mov     r0, r4
        mov     r1, r5
        bl      sqrt
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x2C]
        mov     r5, r0
        mov     r4, r1
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
LBLF3:
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        bl      __muldf3
        ldr     r12, [sp, #0x20]
        mov     r5, r0
        mov     r4, r1
        sub     r10, r12, #1
        str     r10, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        ldr     r2, [r6]
        ldr     r3, [r6, #4]
        add     r12, r12, #1
        str     r12, [sp, #0x24]
        bl      __muldf3
        str     r0, [r7]
        str     r1, [r7, #4]
        ldr     r0, [r6, #8]
        ldr     r1, [r6, #0xC]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r7, #8]
        str     r1, [r7, #0xC]
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r0, [r9, #8]
        ldr     r1, [r9, #0xC]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r8, #8]
        str     r1, [r8, #0xC]
        cmp     r10, #0
        add     r6, r6, #0x10
        add     r7, r7, #0x10
        sub     r8, r8, #0x10
        sub     r9, r9, #0x10
        bgt     LBLF1
        ldr     r10, [sp, #8]
        str     r9, [sp]
LBLF4:
        tst     r10, #1
        beq     LBLF5
        ldr     r0, [sp]
        ldr     r2, [r0, #4]
        ldr     r3, [r0]
        str     r2, [r7, #4]
        str     r3, [r7]
        ldr     r2, [r0, #8]
        ldr     r0, [r0, #0xC]
        str     r2, [r7, #8]
        str     r0, [r7, #0xC]
LBLF5:
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBLF6:
        mvn     r0, #0x26
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBLF7:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBLF8:
        mvn     r0, #5
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBLF_ownsBessel_64f:
        stmdb   sp!, {r4 - r7, lr}
        mov     r12, #1, 12
        mov     r4, r0
        bic     r5, r1, #2, 2
        orr     r6, r12, #1, 2
        mov     r1, r5
        mov     r2, #0
        mov     r3, r6
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLF9
        mov     r0, r4
        mov     r1, r5
        sub     r3, r6, #1, 10
        mov     r2, #0
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r2, [pc, #0x228]
        ldr     r3, [pc, #0x228]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        ldr     r2, [pc, #0x21C]
        ldr     r3, [pc, #0x21C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x20C]
        ldr     r3, [pc, #0x20C]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x1FC]
        ldr     r3, [pc, #0x1FC]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x1EC]
        ldr     r3, [pc, #0x1EC]
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x1DC]
        sub     r3, r6, #3
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x1C8]
        mov     r3, r6
        bl      __adddf3
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [pc, #0x1B4]
        mvn     r3, #1, 12
        bic     r3, r3, #3, 2
        bl      __adddf3
        b       LBLF10
LBLF9:
        mov     r1, r6
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x190]
        ldr     r3, [pc, #0x190]
        mov     r7, r0
        mov     r6, r1
        bl      __muldf3
        ldr     r2, [pc, #0x184]
        ldr     r3, [pc, #0x184]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x174]
        ldr     r3, [pc, #0x174]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x164]
        ldr     r3, [pc, #0x164]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x154]
        ldr     r3, [pc, #0x154]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x144]
        ldr     r3, [pc, #0x144]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x134]
        ldr     r3, [pc, #0x134]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x124]
        ldr     r3, [pc, #0x124]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x114]
        ldr     r3, [pc, #0x114]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0x104]
        ldr     r3, [pc, #0x104]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0xF4]
        ldr     r3, [pc, #0xF4]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0xE4]
        ldr     r3, [pc, #0xE4]
        bl      __adddf3
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [pc, #0xD4]
        ldr     r3, [pc, #0xD4]
        bl      __adddf3
        mov     r6, r0
        mov     r7, r1
        mov     r0, r4
        mov     r1, r5
        bl      sqrt
        mov     r4, r0
        mov     r5, r1
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __divdf3
LBLF10:
        ldmia   sp!, {r4 - r7, pc}
        .long   0x40734000
        .long   0xf76a6643
        .long   0x3f4b178b
        .long   0x86461cf3
        .long   0x3f7f1b32
        .long   0x870aae81
        .long   0x3fb245af
        .long   0xb35af8d9
        .long   0x3fdc6fb8
        .long   0xddb5b971
        .long   0x3ffc71e8
        .long   0xe0f7ef3e
        .long   0x0cfc4e00
        .long   0xff31d771
        .long   0xbd8f7e49
        .long   0x3f74fd88
        .long   0x766038e3
        .long   0xbfa2c657
        .long   0x7afcc9b5
        .long   0x3fbc8039
        .long   0x2c5260a3
        .long   0xbfc7e85a
        .long   0x083b6d26
        .long   0x3fc84319
        .long   0xd2c1d0bd
        .long   0xbfbef977
        .long   0x0b5c52dd
        .long   0x3fa962b2
        .long   0x63440193
        .long   0xbf8a4764
        .long   0x08506e73
        .long   0x3f62808f
        .long   0x7f38c543
        .long   0x3f310a13
        .long   0xf1406889
        .long   0x3f5cdfe6
        .long   0xa8ae0b4b
        .long   0x3f89882e
        .long   0x345d41df
        .long   0x3fd98845


