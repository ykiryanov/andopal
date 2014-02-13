        .text
        .align  4
        .globl  _ippsGoertzQ15_16sc_Sfs


_ippsGoertzQ15_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r9, [sp, #0x48]
        cmp     r3, #0
        mov     r11, r0
        mov     r4, r1
        str     r2, [sp, #0x10]
        blt     LBSK12
        mov     r0, r3
        bl      __floatsidf
        ldr     r2, [pc, #0x748]
        ldr     r3, [pc, #0x748]
        bl      __muldf3
        mov     r2, #0
        mov     r3, #0x3F, 8
        bl      __muldf3
        mov     r6, r0
        mov     r5, r1
        bl      sin
        mov     r7, r0
        mov     r10, r1
        mov     r0, r6
        mov     r1, r5
        bl      cos
        subs    r2, r4, #1
        mov     r6, #0
        bmi     LBSK11
        cmp     r2, #5
        blt     LBSK10
        mov     r4, r6
        mov     r12, r2, lsl #2
        add     r12, r12, #2
        mov     r5, r4
        add     r3, r12, r11
        mov     r8, r5
        str     r9, [sp, #8]
        str     r11, [sp, #0xC]
        str     r8, [sp, #0x18]
        mov     r11, r6
        mov     r9, r10
        str     r2, [sp, #0x14]
        mov     r6, r0
        mov     r8, r1
        mov     r10, r3
LBSK0:
        ldr     r12, [sp, #0x14]
        ldr     r0, [sp, #0x18]
        mov     r2, r6
        sub     r12, r12, #4
        str     r12, [sp, #0x14]
        mov     r3, r8
        mov     r1, r11
        bl      __muldf3
        str     r1, [sp, #0x20]
        str     r0, [sp, #0x1C]
        mov     r0, r4
        mov     r1, r5
        mov     r2, r7
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x1C]
        mov     r3, r1
        ldr     r1, [sp, #0x20]
        bl      __subdf3
        ldrsh   r2, [r10]
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        mov     r0, r2
        bl      __floatsidf
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        mov     r0, r4
        mov     r1, r5
        mov     r2, r6
        mov     r3, r8
        bl      __muldf3
        mov     r4, r0
        ldr     r0, [sp, #0x18]
        mov     r5, r1
        mov     r2, r7
        mov     r3, r9
        mov     r1, r11
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldrsh   r2, [r10, #-2]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        mov     r11, r0
        ldr     r0, [sp, #0x20]
        mov     r5, r1
        ldr     r1, [sp, #0x1C]
        mov     r2, r6
        mov     r3, r8
        bl      __muldf3
        str     r0, [sp, #0x18]
        mov     r4, r1
        mov     r0, r11
        mov     r1, r5
        mov     r2, r7
        mov     r3, r9
        bl      __muldf3
        mov     r2, r0
        ldr     r0, [sp, #0x18]
        mov     r3, r1
        mov     r1, r4
        bl      __subdf3
        ldrsh   r2, [r10, #-4]
        str     r0, [sp, #0x18]
        mov     r4, r1
        mov     r0, r2
        bl      __floatsidf
        ldr     r2, [sp, #0x18]
        mov     r3, r4
        bl      __adddf3
        str     r0, [sp, #0x18]
        mov     r4, r1
        mov     r0, r11
        mov     r1, r5
        mov     r2, r6
        mov     r3, r8
        bl      __muldf3
        mov     r5, r0
        ldr     r0, [sp, #0x20]
        mov     r11, r1
        ldr     r1, [sp, #0x1C]
        mov     r2, r7
        mov     r3, r9
        bl      __muldf3
        mov     r3, r11
        mov     r2, r5
        bl      __adddf3
        ldrsh   r2, [r10, #-6]
        mov     r5, r0
        mov     r11, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r11
        bl      __adddf3
        mov     r5, r0
        ldr     r0, [sp, #0x18]
        mov     r11, r1
        mov     r2, r6
        mov     r3, r8
        mov     r1, r4
        bl      __muldf3
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        mov     r2, r7
        mov     r3, r9
        mov     r0, r5
        mov     r1, r11
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x1C]
        mov     r2, r0
        ldr     r0, [sp, #0x20]
        bl      __subdf3
        ldrsh   r2, [r10, #-8]
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        mov     r0, r2
        bl      __floatsidf
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        mov     r2, r6
        mov     r3, r8
        mov     r0, r5
        mov     r1, r11
        bl      __muldf3
        mov     r5, r0
        ldr     r0, [sp, #0x18]
        mov     r11, r1
        mov     r1, r4
        mov     r2, r7
        mov     r3, r9
        bl      __muldf3
        mov     r3, r11
        mov     r2, r5
        bl      __adddf3
        ldrsh   r2, [r10, #-0xA]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [sp, #0x20]
        mov     r5, r1
        ldr     r1, [sp, #0x1C]
        mov     r2, r6
        mov     r3, r8
        bl      __muldf3
        mov     r11, r0
        str     r1, [sp, #0x18]
        mov     r0, r4
        mov     r1, r5
        mov     r2, r7
        mov     r3, r9
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x18]
        mov     r2, r0
        mov     r0, r11
        bl      __subdf3
        ldrsh   r2, [r10, #-0xC]
        str     r0, [sp, #0x18]
        mov     r11, r1
        mov     r0, r2
        bl      __floatsidf
        ldr     r2, [sp, #0x18]
        mov     r3, r11
        bl      __adddf3
        str     r0, [sp, #0x18]
        mov     r11, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r6
        mov     r3, r8
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        mov     r2, r7
        mov     r3, r9
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldrsh   r2, [r10, #-0xE]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #0x14]
        sub     r10, r10, #0x10
        mov     r4, r0
        cmp     r12, #5
        mov     r5, r1
        bge     LBSK0
        mov     r0, r6
        mov     r6, r11
        mov     r1, r8
        mov     r10, r9
        ldr     r8, [sp, #0x18]
        ldr     r2, [sp, #0x14]
        ldr     r9, [sp, #8]
        ldr     r11, [sp, #0xC]
LBSK1:
        mov     r12, r2, lsl #2
        str     r9, [sp, #8]
        add     r12, r12, #2
        str     r10, [sp, #4]
        mov     r9, r7
        add     r11, r12, r11
        str     r1, [sp]
        mov     r7, r0
        mov     r10, r2
LBSK2:
        mov     r0, r8
        mov     r1, r6
        mov     r2, r7
        ldr     r3, [sp]
        bl      __muldf3
        ldr     r3, [sp, #4]
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        mov     r0, r4
        mov     r1, r5
        mov     r2, r9
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x1C]
        mov     r2, r0
        ldr     r0, [sp, #0x20]
        bl      __subdf3
        ldrsh   r2, [r11]
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        mov     r0, r2
        bl      __floatsidf
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        ldr     r3, [sp]
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        mov     r0, r4
        mov     r1, r5
        mov     r2, r7
        bl      __muldf3
        ldr     r3, [sp, #4]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r8
        mov     r1, r6
        mov     r2, r9
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldrsh   r2, [r11, #-2]
        ldr     r8, [sp, #0x20]
        mov     r4, r0
        mov     r0, r2
        mov     r5, r1
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r6, [sp, #0x1C]
        subs    r10, r10, #1
        mov     r4, r0
        mov     r5, r1
        sub     r11, r11, #4
        bpl     LBSK2
        ldr     r9, [sp, #8]
LBSK3:
        mov     r2, #0xFE, 12
        orr     r7, r2, #3, 4
        cmp     r9, #0
        mov     r2, #1
        ble     LBSK9
        mov     r0, r2, lsl r9
        bl      __floatsidf
        mov     r3, r1
        mov     r2, r0
        add     r1, r7, #1, 12
        mov     r0, #0
        bl      __divdf3
        mov     r10, r0
        mov     r9, r1
LBSK4:
        ldr     r11, [pc, #0x208]
        mov     r0, r4
        mov     r1, r5
        mov     r3, r9
        mov     r2, r10
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r0, r8
        mov     r1, r6
        mov     r3, r9
        mov     r2, r10
        bl      __muldf3
        mov     r8, r0
        mov     r6, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        mov     r9, #0
        ble     LBSK5
        mov     r1, r7
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        mov     r1, r11
        bl      __ltdf2
        cmp     r0, #0
        movlt   r4, r9
        movlt   r5, r11
        mov     r0, r4
        mov     r1, r5
        bl      __fixdfsi
        b       LBSK6
LBSK5:
        mov     r0, r4
        mov     r1, r5
        mov     r3, r7
        mov     r2, #0
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        sub     r10, r7, #0x7F, 8
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        mov     r1, r10
        bl      __gtdf2
        cmp     r0, #0
        movgt   r4, r9
        movgt   r5, r10
        mov     r0, r4
        mov     r1, r5
        bl      __fixdfsi
LBSK6:
        ldr     r12, [sp, #0x10]
        mov     r1, r6
        mov     r2, #0
        strh    r0, [r12]
        mov     r0, r8
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LBSK7
        mov     r1, r7
        mov     r2, r8
        mov     r3, r6
        mov     r0, #0
        bl      __adddf3
        mov     r4, r0
        mov     r5, r1
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        mov     r1, r11
        bl      __ltdf2
        cmp     r0, #0
        movlt   r4, r9
        movlt   r5, r11
        mov     r0, r4
        mov     r1, r5
        bl      __fixdfsi
        b       LBSK8
LBSK7:
        mov     r0, r8
        mov     r1, r6
        mov     r3, r7
        mov     r2, #0
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        sub     r7, r7, #0x7F, 8
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        mov     r1, r7
        bl      __gtdf2
        cmp     r0, #0
        movgt   r4, r9
        movgt   r5, r7
        mov     r0, r4
        mov     r1, r5
        bl      __fixdfsi
LBSK8:
        ldr     r1, [sp, #0x10]
        strh    r0, [r1, #2]
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBSK9:
        rsb     r9, r9, #0
        mov     r0, r2, lsl r9
        bl      __floatsidf
        mov     r10, r0
        mov     r9, r1
        b       LBSK4
LBSK10:
        mov     r4, r6
        mov     r5, r4
        mov     r8, r5
        b       LBSK1
LBSK11:
        mov     r4, r6
        mov     r5, r4
        mov     r8, r5
        b       LBSK3
LBSK12:
        mvn     r0, #0x1A
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x401921fb
        .long   0x40dfffc0


