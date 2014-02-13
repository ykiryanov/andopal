        .text
        .align  4
        .globl  _ippsRandGauss_Direct_64f


_ippsRandGauss_Direct_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        ldr     r12, [sp, #0x60]
        ldr     r11, [sp, #0x68]
        str     r12, [sp, #0x30]
        ldr     r12, [sp, #0x64]
        cmp     r0, #0
        str     r12, [sp, #0x34]
        str     r0, [sp, #0x1C]
        mov     r5, r1
        str     r2, [sp, #0x14]
        str     r3, [sp, #0x10]
        beq     LAZS5
        cmp     r11, #0
        beq     LAZS5
        cmp     r5, #0
        ble     LAZS6
        ldr     r8, [r11]
        ldr     r2, [pc, #0x3F4]
        ldr     r0, [pc, #0x3F4]
        ldr     r9, [pc, #0x3F4]
        mvn     r3, #0
        str     r3, [sp, #4]
        mul     r3, r8, r2
        str     r11, [sp, #0xC]
        str     r5, [sp, #0x18]
        add     r10, r3, r0
        mul     r2, r10, r2
        add     r0, r2, r0
        str     r0, [sp, #8]
LAZS0:
        ldr     r0, [pc, #0x3C4]
        ldr     r5, [pc, #0x3C4]
        ldr     r1, [sp, #8]
        mul     r9, r9, r0
        ldr     r2, [sp, #4]
        sub     r1, r10, r1
        str     r8, [sp, #8]
        add     r1, r2, r1
        add     r9, r9, r5
        mul     r7, r9, r0
        mov     r6, r1, asr #31
        and     r2, r6, #0x12
        sub     r11, r1, r2
        add     r0, r9, r11
        sub     r8, r8, r10
        mvn     r4, #0xF6
        bl      __floatsidf
        add     r6, r8, r6
        bic     r4, r4, #2, 24
        add     r9, r7, r5
        mov     r12, r6, asr #31
        mov     r2, r4
        mvn     r3, #0xC2, 8
        str     r12, [sp, #4]
        and     r8, r12, #0x12
        sub     r8, r6, r8
        bl      __muldf3
        add     r2, r9, r8
        mov     r7, r0
        str     r7, [sp]
        mov     r5, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mvn     r3, #0xC2, 8
        bl      __muldf3
        mov     r6, r0
        str     r6, [sp, #0x38]
        mov     r4, r1
        mov     r0, r7
        mov     r2, r7
        mov     r1, r5
        mov     r3, r5
        bl      __muldf3
        mov     r7, r0
        mov     r10, r1
        mov     r0, r6
        mov     r2, r6
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        mov     r2, r7
        mov     r3, r10
        bl      __adddf3
        mov     r12, #0xFF, 12
        orr     r3, r12, #3, 4
        mov     r7, r0
        mov     r6, r1
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        mov     r10, r11
        bge     LAZS0
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        cmp     r0, #0
        beq     LAZS0
        str     r5, [sp, #0x20]
        ldr     r5, [sp, #0x18]
        ldr     r11, [sp, #0xC]
        mov     r1, r6
        mov     r0, r7
        bl      log
        mov     r2, #0
        mov     r3, #3, 2
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __divdf3
        bl      sqrt
        cmp     r5, #1
        mov     r2, r0
        mov     r3, r1
        ble     LAZS3
        str     r9, [sp, #0x24]
        str     r10, [sp, #0x28]
        str     r8, [sp, #0x2C]
        str     r11, [sp, #0xC]
        ldr     r8, [sp, #0x20]
        ldr     r9, [sp, #0x10]
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #0x1C]
LAZS1:
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        mov     r6, r0
        mov     r7, r1
        mov     r3, r4
        bl      __muldf3
        mov     r3, r9
        mov     r2, r10
        bl      __adddf3
        str     r0, [r11]
        str     r1, [r11, #4]
        ldr     r2, [sp]
        mov     r0, r6
        mov     r1, r7
        mov     r3, r8
        bl      __muldf3
        mov     r3, r9
        mov     r2, r10
        bl      __adddf3
        str     r0, [r11, #8]
        str     r1, [r11, #0xC]
        str     r5, [sp, #0x18]
        str     r11, [sp, #0x1C]
        ldr     r9, [sp, #0x24]
        ldr     r11, [sp, #0x28]
        ldr     r5, [sp, #0x2C]
LAZS2:
        ldr     r0, [pc, #0x1D8]
        ldr     r1, [sp, #8]
        ldr     r6, [pc, #0x1D4]
        mul     r9, r9, r0
        ldr     r2, [sp, #4]
        sub     r1, r11, r1
        str     r5, [sp, #8]
        add     r9, r9, r6
        mul     r8, r9, r0
        add     r1, r2, r1
        sub     r5, r5, r11
        mov     r7, r1, asr #31
        and     r2, r7, #0x12
        sub     r10, r1, r2
        add     r0, r9, r10
        bl      __floatsidf
        mvn     r4, #0xF6
        add     r7, r5, r7
        mov     r12, r7, asr #31
        bic     r4, r4, #2, 24
        str     r12, [sp, #4]
        mvn     r3, #0xC2, 8
        mov     r2, r4
        add     r9, r8, r6
        and     r5, r12, #0x12
        sub     r5, r7, r5
        bl      __muldf3
        add     r2, r9, r5
        mov     r7, r0
        str     r7, [sp]
        mov     r8, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mvn     r3, #0xC2, 8
        bl      __muldf3
        mov     r6, r0
        str     r6, [sp, #0x38]
        mov     r4, r1
        mov     r0, r7
        mov     r2, r7
        mov     r1, r8
        mov     r3, r8
        bl      __muldf3
        mov     r7, r0
        mov     r11, r1
        mov     r0, r6
        mov     r2, r6
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        mov     r2, r7
        mov     r3, r11
        bl      __adddf3
        mov     r12, #0xFF, 12
        orr     r3, r12, #3, 4
        mov     r7, r0
        mov     r6, r1
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        mov     r11, r10
        bge     LAZS2
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        cmp     r0, #0
        beq     LAZS2
        str     r5, [sp, #0x2C]
        str     r11, [sp, #0x28]
        str     r9, [sp, #0x24]
        ldr     r5, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
        ldr     r9, [sp, #0x10]
        ldr     r10, [sp, #0x14]
        mov     r1, r6
        mov     r0, r7
        bl      log
        mov     r2, #0
        mov     r3, #3, 2
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __divdf3
        bl      sqrt
        sub     r5, r5, #2
        cmp     r5, #1
        mov     r2, r0
        mov     r3, r1
        add     r11, r11, #0x10
        bgt     LAZS1
        str     r11, [sp, #0x1C]
        ldr     r8, [sp, #0x2C]
        ldr     r11, [sp, #0xC]
LAZS3:
        cmp     r5, #0
        beq     LAZS4
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x34]
        bl      __muldf3
        ldr     r2, [sp, #0x38]
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x10]
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        str     r0, [r2]
        str     r1, [r2, #4]
LAZS4:
        mov     r0, #0
        str     r8, [r11]
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAZS5:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAZS6:
        mvn     r0, #5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x00010dcd
        .long   0x3c6ef373
        .long   0x436cbae9


