        .text
        .align  4
        .globl  _ippsWinKaiser_64fc_I


_ippsWinKaiser_64fc_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r6, r0
        cmp     r6, #0
        mov     r8, r1
        mov     r7, r2
        beq     LBLE7
        cmp     r8, #0
        ble     LBLE6
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
        mov     r3, #1, 12
        orr     r11, r3, #1, 2
        sub     r3, r11, #3, 12
        mov     r2, #0
        bl      __muldf3
        ldr     r3, [pc, #0x658]
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLE5
        cmp     r5, #0
        add     r9, r6, r5, lsl #4
        bne     LBLE0
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBLE0:
        mov     r0, r5
        bl      __floatsisf
        mov     r1, r7
        bl      __mulsf3
        bl      __extendsfdf2
        sub     r3, r11, #3, 12
        mov     r2, #0
        bl      __muldf3
        bl      LBLE_ownsBessel_64f
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        mov     r7, r8, asr #1
        cmp     r7, #0
        ble     LBLE4
        mov     r8, #0
        str     r1, [sp, #0xC]
        str     r0, [sp, #4]
        str     r11, [sp, #8]
        str     r5, [sp, #0x10]
        str     r10, [sp]
        str     r4, [sp, #0x14]
LBLE1:
        ldr     r1, [sp, #0x10]
        rsb     r1, r8, r1
        mul     r0, r1, r8
        bl      __floatsidf
        bl      sqrt
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp]
        bl      __muldf3
        ldr     r3, [sp, #8]
        mov     r4, r0
        bic     r5, r1, #2, 2
        mov     r1, r5
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLE2
        mov     r0, r4
        mov     r1, r5
        mov     r12, #1, 12
        orr     r10, r12, #1, 2
        sub     r3, r10, #1, 10
        mov     r2, #0
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        ldr     r2, [pc, #0x564]
        ldr     r3, [pc, #0x564]
        mov     r5, r0
        mov     r4, r1
        bl      __muldf3
        ldr     r2, [pc, #0x558]
        ldr     r3, [pc, #0x558]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x548]
        ldr     r3, [pc, #0x548]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x538]
        ldr     r3, [pc, #0x538]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x528]
        ldr     r3, [pc, #0x528]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x518]
        sub     r3, r10, #3
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x504]
        mov     r3, r10
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x4F0]
        sub     r10, r10, #2, 12
        sub     r3, r10, #1
        bl      __adddf3
        b       LBLE3
LBLE2:
        mov     r12, #1, 12
        orr     r1, r12, #1, 2
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x4C8]
        ldr     r3, [pc, #0x4C8]
        mov     r10, r1
        mov     r11, r0
        bl      __muldf3
        ldr     r2, [pc, #0x4BC]
        ldr     r3, [pc, #0x4BC]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x4AC]
        ldr     r3, [pc, #0x4AC]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x49C]
        ldr     r3, [pc, #0x49C]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x48C]
        ldr     r3, [pc, #0x48C]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x47C]
        ldr     r3, [pc, #0x47C]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x46C]
        ldr     r3, [pc, #0x46C]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x45C]
        ldr     r3, [pc, #0x45C]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x44C]
        ldr     r3, [pc, #0x44C]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x43C]
        ldr     r3, [pc, #0x43C]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x42C]
        ldr     r3, [pc, #0x42C]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x41C]
        ldr     r3, [pc, #0x41C]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x40C]
        ldr     r3, [pc, #0x40C]
        bl      __adddf3
        str     r0, [sp, #0x18]
        mov     r10, r1
        mov     r0, r4
        mov     r1, r5
        bl      sqrt
        ldr     r2, [sp, #0x18]
        mov     r5, r0
        mov     r4, r1
        mov     r3, r10
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
LBLE3:
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xC]
        bl      __muldf3
        ldr     r2, [r6]
        ldr     r3, [r6, #4]
        mov     r4, r0
        mov     r5, r1
        bl      __muldf3
        str     r0, [r6]
        str     r1, [r6, #4]
        ldr     r0, [r6, #8]
        ldr     r1, [r6, #0xC]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        str     r0, [r6, #8]
        str     r1, [r6, #0xC]
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        str     r0, [r9]
        str     r1, [r9, #4]
        ldr     r0, [r9, #8]
        ldr     r1, [r9, #0xC]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        sub     r7, r7, #1
        str     r0, [r9, #8]
        str     r1, [r9, #0xC]
        cmp     r7, #0
        add     r8, r8, #1
        add     r6, r6, #0x10
        sub     r9, r9, #0x10
        bgt     LBLE1
LBLE4:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBLE5:
        mvn     r0, #0x26
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBLE6:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBLE7:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBLE_ownsBessel_64f:
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
        bge     LBLE8
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
        b       LBLE9
LBLE8:
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
LBLE9:
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


