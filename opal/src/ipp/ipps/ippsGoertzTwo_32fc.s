        .text
        .align  4
        .globl  _ippsGoertzTwo_32fc


_ippsGoertzTwo_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        mov     r5, r0
        cmp     r5, #0
        mov     r10, r1
        mov     r4, r2
        mov     r8, r3
        beq     LBSQ4
        cmp     r4, #0
        beq     LBSQ4
        cmp     r8, #0
        beq     LBSQ4
        cmp     r10, #0
        ble     LBSQ5
        ldr     r0, [r8]
        bl      __extendsfdf2
        mov     r6, r0
        mov     r7, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBSQ2
        mov     r0, r6
        mov     r12, #0xFF, 12
        orr     r11, r12, #3, 4
        mov     r1, r7
        mov     r2, #0
        mov     r3, r11
        bl      __gedf2
        cmp     r0, #0
        bge     LBSQ2
        ldr     r0, [r8, #4]
        bl      __extendsfdf2
        mov     r8, r0
        mov     r9, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBSQ2
        mov     r0, r8
        mov     r3, r11
        mov     r1, r9
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LBSQ2
        ldr     r11, [pc, #0x314]
        ldr     r2, [pc, #0x314]
        mov     r0, r6
        mov     r1, r7
        mov     r3, r11
        bl      __muldf3
        mov     r7, r0
        mov     r6, r1
        bl      sin
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x14]
        mov     r1, r6
        mov     r0, r7
        bl      cos
        ldr     r2, [pc, #0x2E0]
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        mov     r0, r8
        mov     r1, r9
        mov     r3, r11
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        bl      sin
        str     r0, [sp]
        str     r1, [sp, #4]
        mov     r1, r7
        mov     r0, r6
        bl      cos
        subs    r3, r10, #1
        mov     r12, r1
        bmi     LBSQ3
        mov     r9, #0
        mov     r2, r9
        mov     r1, r2
        mov     r7, r1
        mov     lr, r3, lsl #3
        mov     r6, r7
        mov     r8, r6
        add     lr, lr, #4
        mov     r10, r8
        add     r5, lr, r5
        str     r9, [sp, #0x2C]
        mov     r11, r10
        str     r4, [sp, #0x18]
        mov     r9, r5
        str     r10, [sp, #0x30]
        str     r11, [sp, #0x24]
        str     r3, [sp, #0x28]
        str     r12, [sp, #0x1C]
        str     r0, [sp, #0x20]
        mov     r4, r1
        mov     r5, r2
LBSQ0:
        ldr     r0, [r9]
        bl      __extendsfdf2
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        mov     r10, r0
        mov     r11, r1
        mov     r0, r7
        mov     r1, r6
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x38]
        mov     r1, r4
        mov     r0, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x34]
        mov     r3, r1
        ldr     r1, [sp, #0x38]
        bl      __subdf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r2, [r9, #-4]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x34]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x40]
        mov     r1, r4
        mov     r0, r5
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        mov     r5, r1
        mov     r4, r0
        mov     r1, r6
        mov     r0, r7
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        mov     r5, r0
        ldr     r0, [sp, #0x24]
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        mov     r4, r1
        ldr     r1, [sp, #0x2C]
        bl      __muldf3
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        mov     r6, r1
        ldr     r1, [sp, #0x30]
        str     r0, [sp, #0x44]
        mov     r0, r8
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x44]
        mov     r3, r1
        mov     r1, r6
        bl      __subdf3
        mov     r3, r11
        mov     r2, r10
        bl      __adddf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        mov     r10, r1
        ldr     r1, [sp, #0x30]
        str     r0, [sp, #0x44]
        mov     r0, r8
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x2C]
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x3C]
        ldr     r3, [sp, #0x40]
        bl      __adddf3
        ldr     r3, [sp, #0x28]
        ldr     r7, [sp, #0x38]
        ldr     r6, [sp, #0x34]
        sub     r9, r9, #8
        subs    r3, r3, #1
        str     r3, [sp, #0x28]
        ldr     r3, [sp, #0x44]
        str     r3, [sp, #0x24]
        ldr     r3, [sp, #0x28]
        mov     r8, r0
        str     r1, [sp, #0x30]
        str     r10, [sp, #0x2C]
        bpl     LBSQ0
        mov     r1, r4
        mov     r2, r5
        ldr     r10, [sp, #0x30]
        ldr     r9, [sp, #0x2C]
        ldr     r11, [sp, #0x24]
        ldr     r4, [sp, #0x18]
LBSQ1:
        mov     r0, r2
        bl      __truncdfsf2
        str     r0, [r4]
        mov     r0, r7
        mov     r1, r6
        bl      __truncdfsf2
        str     r0, [r4, #4]
        mov     r0, r8
        mov     r1, r10
        bl      __truncdfsf2
        str     r0, [r4, #8]
        mov     r0, r11
        mov     r1, r9
        bl      __truncdfsf2
        str     r0, [r4, #0xC]
        mov     r0, #0
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBSQ2:
        mvn     r0, #0x1A
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBSQ3:
        mov     r9, #0
        mov     r2, r9
        mov     r1, r2
        mov     r7, r1
        mov     r6, r7
        mov     r8, r6
        mov     r10, r8
        mov     r11, r10
        b       LBSQ1
LBSQ4:
        mvn     r0, #7
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LBSQ5:
        mvn     r0, #5
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
        .long   0x401921fb
        .long   0x54442d18


