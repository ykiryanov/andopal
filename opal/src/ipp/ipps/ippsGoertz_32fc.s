        .text
        .align  4
        .globl  _ippsGoertz_32fc


_ippsGoertz_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        mov     r10, r0
        cmp     r10, #0
        mov     r4, r1
        mov     r6, r2
        mov     r0, r3
        beq     LBSM7
        cmp     r6, #0
        beq     LBSM7
        cmp     r4, #0
        ble     LBSM8
        bl      __extendsfdf2
        mov     r7, r0
        mov     r5, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBSM4
        mov     r0, r7
        mov     r3, #0xFF, 12
        orr     r3, r3, #3, 4
        mov     r1, r5
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        bge     LBSM4
        ldr     r2, [pc, #0x560]
        ldr     r3, [pc, #0x560]
        mov     r0, r7
        mov     r1, r5
        bl      __muldf3
        mov     r9, r0
        mov     r8, r1
        bl      sin
        mov     r7, r0
        mov     r5, r1
        mov     r1, r8
        mov     r0, r9
        bl      cos
        subs    r2, r4, #1
        mov     r11, #0
        bmi     LBSM6
        cmp     r2, #5
        blt     LBSM5
        mov     r9, r11
        mov     r12, r2, lsl #3
        mov     r8, r9
        add     r12, r12, #4
        mov     r4, r8
        add     r3, r12, r10
        str     r4, [sp, #0x14]
        str     r6, [sp, #8]
        str     r10, [sp, #0xC]
        str     r2, [sp, #0x10]
        mov     r4, r0
        mov     r6, r1
        mov     r10, r3
LBSM0:
        ldr     r12, [sp, #0x10]
        ldr     r0, [sp, #0x14]
        mov     r1, r11
        sub     r12, r12, #4
        str     r12, [sp, #0x10]
        mov     r2, r4
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        mov     r1, r8
        mov     r0, r9
        mov     r2, r7
        mov     r3, r5
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x1C]
        mov     r2, r0
        ldr     r0, [sp, #0x18]
        bl      __subdf3
        ldr     r2, [r10]
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x18]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r3, [sp, #0x18]
        ldr     r2, [sp, #0x1C]
        bl      __adddf3
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x1C]
        mov     r1, r8
        mov     r0, r9
        mov     r2, r4
        mov     r3, r6
        bl      __muldf3
        mov     r8, r0
        ldr     r0, [sp, #0x14]
        mov     r9, r1
        mov     r2, r7
        mov     r3, r5
        mov     r1, r11
        bl      __muldf3
        mov     r3, r9
        mov     r2, r8
        bl      __adddf3
        ldr     r2, [r10, #-4]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        mov     r11, r0
        ldr     r0, [sp, #0x1C]
        mov     r9, r1
        ldr     r1, [sp, #0x18]
        mov     r2, r4
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x14]
        mov     r8, r1
        mov     r2, r7
        mov     r3, r5
        mov     r0, r11
        mov     r1, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x14]
        mov     r3, r1
        mov     r1, r8
        bl      __subdf3
        ldr     r2, [r10, #-8]
        str     r0, [sp, #0x14]
        mov     r8, r1
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [sp, #0x14]
        mov     r3, r8
        bl      __adddf3
        str     r0, [sp, #0x14]
        mov     r8, r1
        mov     r0, r11
        mov     r1, r9
        mov     r2, r4
        mov     r3, r6
        bl      __muldf3
        mov     r11, r1
        mov     r9, r0
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        mov     r2, r7
        mov     r3, r5
        bl      __muldf3
        mov     r3, r11
        mov     r2, r9
        bl      __adddf3
        ldr     r2, [r10, #-0xC]
        mov     r9, r0
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r9
        mov     r3, r11
        bl      __adddf3
        mov     r9, r0
        ldr     r0, [sp, #0x14]
        mov     r11, r1
        mov     r2, r4
        mov     r3, r6
        mov     r1, r8
        bl      __muldf3
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x18]
        mov     r2, r7
        mov     r3, r5
        mov     r0, r9
        mov     r1, r11
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x18]
        mov     r2, r0
        ldr     r0, [sp, #0x1C]
        bl      __subdf3
        ldr     r2, [r10, #-0x10]
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x18]
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        bl      __adddf3
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x1C]
        mov     r1, r11
        mov     r2, r4
        mov     r3, r6
        mov     r0, r9
        bl      __muldf3
        mov     r9, r0
        ldr     r0, [sp, #0x14]
        mov     r11, r1
        mov     r2, r7
        mov     r3, r5
        mov     r1, r8
        bl      __muldf3
        mov     r3, r11
        mov     r2, r9
        bl      __adddf3
        ldr     r2, [r10, #-0x14]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        mov     r8, r0
        ldr     r0, [sp, #0x1C]
        mov     r9, r1
        ldr     r1, [sp, #0x18]
        mov     r2, r4
        mov     r3, r6
        bl      __muldf3
        str     r0, [sp, #0x14]
        mov     r11, r1
        mov     r0, r8
        mov     r1, r9
        mov     r2, r7
        mov     r3, r5
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x14]
        mov     r3, r1
        mov     r1, r11
        bl      __subdf3
        ldr     r2, [r10, #-0x18]
        str     r1, [sp, #0x14]
        mov     r11, r0
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r3, [sp, #0x14]
        mov     r2, r11
        bl      __adddf3
        str     r0, [sp, #0x14]
        mov     r11, r1
        mov     r0, r8
        mov     r1, r9
        mov     r2, r4
        mov     r3, r6
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        mov     r2, r7
        mov     r3, r5
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [r10, #-0x1C]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r12, [sp, #0x10]
        sub     r10, r10, #0x20
        mov     r9, r0
        cmp     r12, #5
        mov     r8, r1
        bge     LBSM0
        mov     r0, r4
        mov     r1, r6
        ldr     r4, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        ldr     r6, [sp, #8]
        ldr     r10, [sp, #0xC]
LBSM1:
        mov     r12, r2, lsl #3
        str     r6, [sp, #8]
        add     r12, r12, #4
        str     r7, [sp, #4]
        mov     r6, r5
        add     r10, r12, r10
        str     r1, [sp]
        mov     r5, r0
        mov     r7, r2
LBSM2:
        mov     r0, r4
        mov     r1, r11
        mov     r2, r5
        ldr     r3, [sp]
        bl      __muldf3
        ldr     r2, [sp, #4]
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x1C]
        mov     r1, r8
        mov     r0, r9
        mov     r3, r6
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x18]
        mov     r2, r0
        ldr     r0, [sp, #0x1C]
        bl      __subdf3
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x1C]
        ldr     r0, [r10]
        bl      __extendsfdf2
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        bl      __adddf3
        ldr     r3, [sp]
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x1C]
        mov     r1, r8
        mov     r0, r9
        mov     r2, r5
        bl      __muldf3
        ldr     r2, [sp, #4]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r4
        mov     r1, r11
        mov     r3, r6
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [r10, #-4]
        ldr     r4, [sp, #0x1C]
        mov     r8, r0
        mov     r0, r2
        mov     r9, r1
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r11, [sp, #0x18]
        subs    r7, r7, #1
        mov     r9, r0
        mov     r8, r1
        sub     r10, r10, #8
        bpl     LBSM2
        ldr     r6, [sp, #8]
LBSM3:
        mov     r0, r9
        mov     r1, r8
        bl      __truncdfsf2
        str     r0, [r6]
        mov     r0, r4
        mov     r1, r11
        bl      __truncdfsf2
        str     r0, [r6, #4]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBSM4:
        mvn     r0, #0x1A
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBSM5:
        mov     r9, r11
        mov     r8, r9
        mov     r4, r8
        b       LBSM1
LBSM6:
        mov     r9, r11
        mov     r8, r9
        mov     r4, r8
        b       LBSM3
LBSM7:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBSM8:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb


