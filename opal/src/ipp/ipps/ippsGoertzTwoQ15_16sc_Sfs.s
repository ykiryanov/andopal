        .text
        .align  4
        .globl  _ippsGoertzTwoQ15_16sc_Sfs


_ippsGoertzTwoQ15_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        mov     r4, r3
        ldrsh   r3, [r4]
        ldr     r6, [sp, #0x70]
        mov     r5, r0
        cmp     r3, #0
        mov     r10, r1
        mov     r11, r2
        blt     LBSJ13
        ldrsh   r9, [r4, #2]
        cmp     r9, #0
        blt     LBSJ13
        mov     r0, r3
        bl      __floatsidf
        ldr     r2, [pc, #0x684]
        ldr     r8, [pc, #0x684]
        mov     r3, r8
        bl      __muldf3
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        mov     r7, r0
        mov     r4, r1
        bl      sin
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x14]
        mov     r1, r4
        mov     r0, r7
        bl      cos
        str     r0, [sp, #8]
        str     r1, [sp, #0xC]
        mov     r0, r9
        bl      __floatsidf
        ldr     r2, [pc, #0x638]
        mov     r3, r8
        bl      __muldf3
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        mov     r4, r0
        mov     r7, r1
        bl      sin
        str     r0, [sp, #4]
        str     r1, [sp]
        mov     r1, r7
        mov     r0, r4
        bl      cos
        subs    r3, r10, #1
        bmi     LBSJ12
        mov     r7, #0
        str     r7, [sp, #0x30]
        mov     r8, r7
        mov     r9, r8
        mov     r10, r9
        mov     r4, r10
        mov     r12, r3, lsl #2
        add     r12, r12, #2
        mov     r2, r4
        str     r4, [sp, #0x34]
        str     r2, [sp, #0x28]
        add     r5, r12, r5
        str     r3, [sp, #0x2C]
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x24]
        str     r6, [sp, #0x1C]
        str     r11, [sp, #0x18]
LBSJ0:
        ldrsh   r0, [r5]
        bl      __floatsidf
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        mov     r11, r1
        mov     r6, r0
        mov     r0, r9
        mov     r1, r10
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        str     r0, [sp, #0x38]
        str     r1, [sp, #0x3C]
        mov     r1, r8
        mov     r0, r7
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r1, [sp, #0x3C]
        ldr     r0, [sp, #0x38]
        bl      __subdf3
        mov     r3, r11
        mov     r2, r6
        bl      __adddf3
        ldrsh   r2, [r5, #-2]
        str     r0, [sp, #0x3C]
        str     r1, [sp, #0x38]
        mov     r0, r2
        bl      __floatsidf
        ldr     r2, [sp, #8]
        ldr     r3, [sp, #0xC]
        str     r0, [sp, #0x40]
        str     r1, [sp, #0x44]
        mov     r0, r7
        mov     r1, r8
        bl      __muldf3
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x14]
        mov     r8, r1
        mov     r7, r0
        mov     r0, r9
        mov     r1, r10
        bl      __muldf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        bl      __adddf3
        mov     r7, r0
        ldr     r0, [sp, #0x28]
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x20]
        mov     r8, r1
        ldr     r1, [sp, #0x30]
        bl      __muldf3
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        mov     r9, r1
        ldr     r1, [sp, #0x34]
        str     r0, [sp, #0x48]
        mov     r0, r4
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x48]
        mov     r3, r1
        mov     r1, r9
        bl      __subdf3
        mov     r3, r11
        mov     r2, r6
        bl      __adddf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x20]
        mov     r6, r1
        ldr     r1, [sp, #0x34]
        str     r0, [sp, #0x48]
        mov     r0, r4
        bl      __muldf3
        mov     r9, r1
        mov     r4, r0
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x30]
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        bl      __muldf3
        mov     r3, r9
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [sp, #0x40]
        ldr     r3, [sp, #0x44]
        bl      __adddf3
        ldr     r3, [sp, #0x2C]
        ldr     r9, [sp, #0x3C]
        ldr     r10, [sp, #0x38]
        sub     r5, r5, #4
        subs    r3, r3, #1
        str     r3, [sp, #0x2C]
        ldr     r3, [sp, #0x48]
        str     r3, [sp, #0x28]
        ldr     r3, [sp, #0x2C]
        mov     r4, r0
        str     r1, [sp, #0x34]
        str     r6, [sp, #0x30]
        bpl     LBSJ0
        ldr     r6, [sp, #0x1C]
        ldr     r11, [sp, #0x18]
LBSJ1:
        cmp     r6, #0
        mov     r3, #1
        ble     LBSJ11
        mov     r0, r3, lsl r6
        bl      __floatsidf
        mov     r12, #0xFE, 12
        mov     r3, r1
        orr     r12, r12, #3, 4
        mov     r2, r0
        add     r1, r12, #1, 12
        mov     r0, #0
        bl      __divdf3
        mov     r5, r0
        mov     r6, r1
LBSJ2:
        mov     r0, r7
        mov     r1, r8
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        mov     r7, r0
        mov     r8, r1
        mov     r0, r9
        mov     r1, r10
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        mov     r9, r1
        ldr     r1, [sp, #0x34]
        mov     r10, r0
        mov     r2, r5
        mov     r3, r6
        mov     r0, r4
        bl      __muldf3
        str     r0, [sp]
        str     r1, [sp, #4]
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x30]
        mov     r2, r5
        mov     r3, r6
        bl      __muldf3
        mov     r6, r0
        mov     r5, r1
        mov     r0, r7
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        mov     r12, #0xFE, 12
        cmp     r0, #0
        orr     r4, r12, #3, 4
        ble     LBSJ3
        mov     r2, r7
        mov     r3, r8
        mov     r1, r4
        mov     r0, #0
        bl      __adddf3
        mov     r8, r1
        ldr     r1, [pc, #0x330]
        mov     r7, r0
        mov     r2, r7
        mov     r3, r8
        mov     r0, #0
        bl      __ltdf2
        cmp     r0, #0
        mov     r12, #0
        movlt   r7, r12
        ldr     r12, [pc, #0x30C]
        mov     r0, r7
        movlt   r8, r12
        mov     r1, r8
        bl      __fixdfsi
        b       LBSJ4
LBSJ3:
        mov     r0, r7
        mov     r1, r8
        mov     r3, r4
        mov     r2, #0
        bl      __subdf3
        mov     r7, r1
        sub     r1, r4, #0x7F, 8
        str     r1, [sp, #0x48]
        mov     r8, r0
        mov     r2, r8
        mov     r3, r7
        mov     r0, #0
        bl      __gtdf2
        cmp     r0, #0
        mov     r12, #0
        movgt   r8, r12
        ldr     r12, [sp, #0x48]
        mov     r0, r8
        movgt   r7, r12
        mov     r1, r7
        bl      __fixdfsi
LBSJ4:
        ldr     r7, [pc, #0x2A0]
        strh    r0, [r11]
        mov     r0, r10
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LBSJ5
        mov     r2, r10
        mov     r3, r9
        mov     r1, r4
        mov     r0, #0
        bl      __adddf3
        mov     r8, r0
        mov     r9, r1
        mov     r2, r8
        mov     r3, r9
        mov     r0, #0
        mov     r1, r7
        bl      __ltdf2
        cmp     r0, #0
        mov     r12, #0
        movlt   r8, r12
        movlt   r9, r7
        mov     r0, r8
        mov     r1, r9
        bl      __fixdfsi
        b       LBSJ6
LBSJ5:
        mov     r0, r10
        mov     r1, r9
        mov     r3, r4
        mov     r2, #0
        bl      __subdf3
        mov     r9, r0
        mov     r8, r1
        sub     r10, r4, #0x7F, 8
        mov     r2, r9
        mov     r3, r8
        mov     r0, #0
        mov     r1, r10
        bl      __gtdf2
        cmp     r0, #0
        mov     r12, #0
        movgt   r9, r12
        movgt   r8, r10
        mov     r0, r9
        mov     r1, r8
        bl      __fixdfsi
LBSJ6:
        strh    r0, [r11, #2]
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LBSJ7
        mov     r1, r4
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        mov     r0, #0
        bl      __adddf3
        mov     r8, r0
        mov     r9, r1
        mov     r2, r8
        mov     r3, r9
        mov     r0, #0
        mov     r1, r7
        bl      __ltdf2
        cmp     r0, #0
        mov     r12, #0
        movlt   r8, r12
        movlt   r9, r7
        mov     r0, r8
        mov     r1, r9
        bl      __fixdfsi
        b       LBSJ8
LBSJ7:
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        mov     r2, #0
        mov     r3, r4
        bl      __subdf3
        mov     r8, r0
        mov     r9, r1
        sub     r10, r4, #0x7F, 8
        mov     r2, r8
        mov     r3, r9
        mov     r0, #0
        mov     r1, r10
        bl      __gtdf2
        cmp     r0, #0
        mov     r12, #0
        movgt   r8, r12
        movgt   r9, r10
        mov     r0, r8
        mov     r1, r9
        bl      __fixdfsi
LBSJ8:
        strh    r0, [r11, #4]
        mov     r0, r6
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LBSJ9
        mov     r1, r4
        mov     r2, r6
        mov     r3, r5
        mov     r0, #0
        bl      __adddf3
        mov     r5, r0
        mov     r4, r1
        mov     r2, r5
        mov     r3, r4
        mov     r0, #0
        mov     r1, r7
        bl      __ltdf2
        cmp     r0, #0
        mov     r12, #0
        movlt   r5, r12
        movlt   r4, r7
        mov     r0, r5
        mov     r1, r4
        bl      __fixdfsi
        b       LBSJ10
LBSJ9:
        mov     r0, r6
        mov     r1, r5
        mov     r3, r4
        mov     r2, #0
        bl      __subdf3
        mov     r6, r0
        mov     r5, r1
        sub     r4, r4, #0x7F, 8
        mov     r2, r6
        mov     r3, r5
        mov     r0, #0
        mov     r1, r4
        bl      __gtdf2
        cmp     r0, #0
        mov     r12, #0
        movgt   r6, r12
        movgt   r5, r4
        mov     r0, r6
        mov     r1, r5
        bl      __fixdfsi
LBSJ10:
        strh    r0, [r11, #6]
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LBSJ11:
        rsb     r6, r6, #0
        mov     r0, r3, lsl r6
        bl      __floatsidf
        mov     r5, r0
        mov     r6, r1
        b       LBSJ2
LBSJ12:
        mov     r7, #0
        str     r7, [sp, #0x30]
        mov     r8, r7
        mov     r9, r8
        mov     r10, r9
        mov     r4, r10
        mov     r2, r4
        str     r2, [sp, #0x34]
        str     r2, [sp, #0x28]
        b       LBSJ1
LBSJ13:
        mvn     r0, #0x1A
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   0x40dfffc0


