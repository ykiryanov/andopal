        .text
        .align  4
        .globl  _ippsWinKaiser_64f


_ippsWinKaiser_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        mov     r10, r0
        cmp     r10, #0
        mov     r6, r1
        mov     r7, r2
        mov     r8, r3
        beq     LBLH7
        cmp     r6, #0
        beq     LBLH7
        cmp     r7, #0
        ble     LBLH8
        mov     r0, r8
        bl      __extendsfdf2
        mov     r4, r0
        sub     r5, r7, #1
        mov     r0, r5
        mov     r11, r1
        bl      __floatsidf
        bic     r3, r11, #2, 2
        mov     r2, r4
        bl      __muldf3
        mov     r12, #1, 12
        orr     r9, r12, #1, 2
        sub     r3, r9, #3, 12
        mov     r2, #0
        bl      __muldf3
        ldr     r3, [pc, #0x688]
        mov     r2, #0
        bl      __gtdf2
        cmp     r0, #0
        bgt     LBLH6
        add     r12, r10, r5, lsl #3
        str     r12, [sp]
        add     r12, r6, r5, lsl #3
        cmp     r5, #0
        str     r12, [sp, #4]
        bne     LBLH0
        ldr     r2, [r10]
        ldr     r10, [r10, #4]
        mov     r0, #0
        str     r2, [r6]
        str     r10, [r6, #4]
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBLH0:
        mov     r0, r5
        bl      __floatsisf
        mov     r1, r8
        bl      __mulsf3
        bl      __extendsfdf2
        sub     r3, r9, #3, 12
        mov     r2, #0
        bl      __muldf3
        bl      LBLH_ownsBessel_64f
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        mov     r9, r7, asr #1
        cmp     r9, #0
        ble     LBLH4
        str     r7, [sp, #8]
        ldr     r7, [sp]
        mov     r8, #0
        str     r1, [sp, #0x1C]
        str     r0, [sp, #0x18]
        str     r5, [sp, #0x10]
        str     r11, [sp, #0xC]
        str     r4, [sp, #0x14]
        str     r10, [sp, #0x20]
LBLH1:
        ldr     r0, [sp, #0x10]
        mov     r2, #1, 12
        orr     r10, r2, #1, 2
        rsb     r0, r8, r0
        mul     r0, r0, r8
        bl      __floatsidf
        bl      sqrt
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0xC]
        bl      __muldf3
        mov     r4, r0
        bic     r5, r1, #2, 2
        mov     r3, r10
        mov     r1, r5
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBLH2
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
        ldr     r2, [pc, #0x568]
        ldr     r3, [pc, #0x568]
        mov     r5, r0
        mov     r4, r1
        bl      __muldf3
        ldr     r2, [pc, #0x55C]
        ldr     r3, [pc, #0x55C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x54C]
        ldr     r3, [pc, #0x54C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x53C]
        ldr     r3, [pc, #0x53C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x52C]
        ldr     r3, [pc, #0x52C]
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x51C]
        sub     r3, r10, #3
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x508]
        mov     r3, r10
        bl      __adddf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [pc, #0x4F4]
        sub     r10, r10, #2, 12
        sub     r3, r10, #1
        bl      __adddf3
        b       LBLH3
LBLH2:
        mov     r12, #1, 12
        orr     r1, r12, #1, 2
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __divdf3
        ldr     r2, [pc, #0x4CC]
        ldr     r3, [pc, #0x4CC]
        mov     r10, r1
        mov     r11, r0
        bl      __muldf3
        ldr     r2, [pc, #0x4C0]
        ldr     r3, [pc, #0x4C0]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x4B0]
        ldr     r3, [pc, #0x4B0]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x4A0]
        ldr     r3, [pc, #0x4A0]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x490]
        ldr     r3, [pc, #0x490]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x480]
        ldr     r3, [pc, #0x480]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x470]
        ldr     r3, [pc, #0x470]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x460]
        ldr     r3, [pc, #0x460]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x450]
        ldr     r3, [pc, #0x450]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x440]
        ldr     r3, [pc, #0x440]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x430]
        ldr     r3, [pc, #0x430]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x420]
        ldr     r3, [pc, #0x420]
        bl      __adddf3
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [pc, #0x410]
        ldr     r3, [pc, #0x410]
        bl      __adddf3
        str     r0, [sp, #0x24]
        mov     r10, r1
        mov     r0, r4
        mov     r1, r5
        bl      sqrt
        ldr     r2, [sp, #0x24]
        mov     r5, r0
        mov     r4, r1
        mov     r3, r10
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __divdf3
LBLH3:
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        sub     r9, r9, #1
        add     r8, r8, #1
        bl      __muldf3
        ldr     r12, [sp, #0x20]
        mov     r5, r0
        mov     r4, r1
        ldr     r2, [r12]
        ldr     r3, [r12, #4]
        add     r12, r12, #8
        str     r12, [sp, #0x20]
        bl      __muldf3
        str     r0, [r6]
        str     r1, [r6, #4]
        ldr     r0, [r7]
        ldr     r1, [r7, #4]
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #4]
        cmp     r9, #0
        str     r0, [r2]
        str     r1, [r2, #4]
        sub     r2, r2, #8
        str     r2, [sp, #4]
        sub     r7, r7, #8
        add     r6, r6, #8
        bgt     LBLH1
        str     r7, [sp]
        ldr     r7, [sp, #8]
LBLH4:
        tst     r7, #1
        beq     LBLH5
        ldr     r2, [sp]
        ldr     r0, [r2]
        ldr     r2, [r2, #4]
        str     r0, [r6]
        str     r2, [r6, #4]
LBLH5:
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBLH6:
        mvn     r0, #0x26
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBLH7:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBLH8:
        mvn     r0, #5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBLH_ownsBessel_64f:
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
        bge     LBLH9
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
        b       LBLH10
LBLH9:
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
LBLH10:
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


