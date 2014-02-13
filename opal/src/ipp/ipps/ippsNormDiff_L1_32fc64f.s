        .text
        .align  4
        .globl  _ippsNormDiff_L1_32fc64f


_ippsNormDiff_L1_32fc64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        cmp     r0, #0
        mov     r8, r3
        beq     LBBN4
        cmp     r1, #0
        beq     LBBN4
        cmp     r8, #0
        beq     LBBN4
        cmp     r2, #0
        ble     LBBN5
        bic     lr, r2, #1
        cmp     lr, #0
        mov     r12, #0
        ble     LBBN3
        mov     r7, r12
        mov     r6, r7
        mov     r4, r6
        mov     r5, r4
        sub     r3, r1, #4
        str     r6, [sp, #0x14]
        str     r7, [sp, #0x18]
        sub     r11, r0, #4
        sub     r10, r1, #0xC
        sub     r9, r0, #0xC
        str     r5, [sp, #0x1C]
        str     r4, [sp, #0x20]
        str     lr, [sp, #0x10]
        str     r8, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
        mov     r6, r3
        mov     r7, r12
LBBN0:
        ldr     r1, [r10, #0xC]
        ldr     r0, [r9, #0xC]
        add     r7, r7, #2
        bl      __subsf3
        ldr     r1, [r9, #0x10]!
        ldr     r2, [r10, #0x10]!
        mov     r4, r0
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        ldr     r1, [r11, #0xC]
        ldr     r2, [r6, #0xC]
        mov     r8, r0
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        ldr     r2, [r6, #0x10]!
        ldr     r1, [r11, #0x10]!
        str     r0, [sp, #0x24]
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        str     r0, [sp, #0x28]
        mov     r0, r4
        bl      __extendsfdf2
        mov     r4, r0
        mov     r5, r1
        mov     r0, r8
        bl      __extendsfdf2
        str     r0, [sp, #0x2C]
        mov     r8, r1
        mov     r3, r5
        mov     r1, r5
        mov     r2, r4
        mov     r0, r4
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        mov     r1, r8
        mov     r3, r8
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        bl      sqrt
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x24]
        str     r1, [sp, #0x24]
        bl      __extendsfdf2
        mov     r8, r0
        ldr     r0, [sp, #0x28]
        mov     r5, r1
        bl      __extendsfdf2
        str     r0, [sp, #0x28]
        mov     r4, r1
        mov     r2, r8
        mov     r0, r8
        mov     r3, r5
        mov     r1, r5
        bl      __muldf3
        mov     r5, r0
        ldr     r0, [sp, #0x28]
        mov     r8, r1
        mov     r3, r4
        mov     r2, r0
        mov     r1, r4
        bl      __muldf3
        mov     r2, r5
        mov     r3, r8
        bl      __adddf3
        bl      sqrt
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x24]
        bl      __adddf3
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        str     r0, [sp, #0x18]
        cmp     r7, r2
        str     r1, [sp, #0x14]
        blt     LBBN0
        ldr     r6, [sp, #0x14]
        ldr     r7, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        ldr     r4, [sp, #0x20]
        ldr     r8, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBBN1:
        tst     r2, #1
        beq     LBBN2
        sub     lr, r0, #8
        ldr     r0, [lr, +r2, lsl #3]
        sub     r12, r1, #8
        ldr     r1, [r12, +r2, lsl #3]
        add     r10, r12, r2, lsl #3
        add     r9, lr, r2, lsl #3
        bl      __subsf3
        ldr     r1, [r9, #4]
        ldr     r10, [r10, #4]
        mov     r9, r0
        mov     r0, r1
        mov     r1, r10
        bl      __subsf3
        mov     r11, r0
        mov     r0, r9
        bl      __extendsfdf2
        mov     r9, r0
        mov     r0, r11
        mov     r10, r1
        bl      __extendsfdf2
        str     r0, [sp, #0x2C]
        mov     r11, r1
        mov     r0, r9
        mov     r2, r9
        mov     r1, r10
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        mov     r9, r0
        mov     r10, r1
        mov     r0, r2
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        bl      sqrt
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
LBBN2:
        mov     r0, r7
        mov     r1, r6
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        str     r0, [r8]
        mov     r0, #0
        str     r1, [r8, #4]
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBBN3:
        mov     r7, r12
        mov     r6, r7
        mov     r4, r6
        mov     r5, r4
        b       LBBN1
LBBN4:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBBN5:
        mvn     r0, #5
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}


