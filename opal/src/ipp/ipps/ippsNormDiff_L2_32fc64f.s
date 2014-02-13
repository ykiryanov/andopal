        .text
        .align  4
        .globl  _ippsNormDiff_L2_32fc64f


_ippsNormDiff_L2_32fc64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        cmp     r0, #0
        mov     r11, r3
        beq     LBBL4
        cmp     r1, #0
        beq     LBBL4
        cmp     r11, #0
        beq     LBBL4
        cmp     r2, #0
        ble     LBBL5
        bic     lr, r2, #1
        cmp     lr, #0
        mov     r12, #0
        ble     LBBL3
        mov     r10, r12
        mov     r9, r10
        mov     r7, r9
        mov     r8, r7
        sub     r3, r1, #4
        str     r9, [sp, #0x20]
        str     r10, [sp, #0x1C]
        sub     r6, r0, #4
        sub     r5, r1, #0xC
        sub     r4, r0, #0xC
        str     r8, [sp, #0x18]
        str     r7, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r11, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
        mov     r9, r3
        mov     r10, r12
LBBL0:
        ldr     r0, [r4, #0xC]
        ldr     r1, [r5, #0xC]
        add     r10, r10, #2
        bl      __subsf3
        ldr     r1, [r4, #0x10]!
        ldr     r2, [r5, #0x10]!
        mov     r7, r0
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        ldr     r1, [r6, #0xC]
        ldr     r2, [r9, #0xC]
        mov     r11, r0
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        ldr     r1, [r9, #0x10]!
        ldr     r2, [r6, #0x10]!
        str     r0, [sp, #0x24]
        mov     r0, r2
        bl      __subsf3
        str     r0, [sp, #0x28]
        mov     r0, r7
        bl      __extendsfdf2
        mov     r7, r0
        mov     r0, r11
        mov     r8, r1
        bl      __extendsfdf2
        str     r0, [sp, #0x2C]
        mov     r11, r1
        mov     r0, r7
        mov     r2, r7
        mov     r1, r8
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        mov     r7, r0
        mov     r8, r1
        mov     r0, r2
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        mov     r3, r8
        mov     r2, r7
        bl      __adddf3
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x24]
        str     r1, [sp, #0x24]
        bl      __extendsfdf2
        mov     r11, r0
        ldr     r0, [sp, #0x28]
        mov     r8, r1
        bl      __extendsfdf2
        str     r0, [sp, #0x28]
        mov     r7, r1
        mov     r1, r8
        mov     r3, r8
        mov     r0, r11
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x28]
        mov     r8, r0
        mov     r11, r1
        mov     r0, r2
        mov     r1, r7
        mov     r3, r7
        bl      __muldf3
        mov     r2, r8
        mov     r3, r11
        bl      __adddf3
        mov     r7, r0
        mov     r8, r1
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x24]
        bl      __adddf3
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x18]
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        str     r0, [sp, #0x1C]
        cmp     r10, r2
        str     r1, [sp, #0x20]
        blt     LBBL0
        ldr     r9, [sp, #0x20]
        ldr     r10, [sp, #0x1C]
        ldr     r8, [sp, #0x18]
        ldr     r7, [sp, #0x14]
        ldr     r11, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBBL1:
        tst     r2, #1
        beq     LBBL2
        sub     r12, r1, #8
        ldr     r1, [r12, +r2, lsl #3]
        sub     lr, r0, #8
        ldr     r0, [lr, +r2, lsl #3]
        add     r5, r12, r2, lsl #3
        add     r4, lr, r2, lsl #3
        bl      __subsf3
        ldr     r2, [r4, #4]
        ldr     r1, [r5, #4]
        mov     r4, r0
        mov     r0, r2
        bl      __subsf3
        mov     r5, r0
        mov     r0, r4
        bl      __extendsfdf2
        mov     r6, r0
        mov     r0, r5
        mov     r5, r1
        bl      __extendsfdf2
        str     r0, [sp, #0x2C]
        mov     r4, r1
        mov     r1, r5
        mov     r3, r5
        mov     r0, r6
        mov     r2, r6
        bl      __muldf3
        ldr     r2, [sp, #0x2C]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r2
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        mov     r7, r0
        mov     r8, r1
LBBL2:
        mov     r0, r10
        mov     r1, r9
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        bl      sqrt
        str     r0, [r11]
        mov     r0, #0
        str     r1, [r11, #4]
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBBL3:
        mov     r10, r12
        mov     r9, r10
        mov     r7, r9
        mov     r8, r7
        b       LBBL1
LBBL4:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LBBL5:
        mvn     r0, #5
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}


