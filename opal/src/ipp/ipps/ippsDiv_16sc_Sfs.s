        .text
        .align  4
        .globl  _ippsDiv_16sc_Sfs


_ippsDiv_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        ldr     r9, [sp, #0x5C]
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r4, r2
        mov     r11, r3
        beq     LCHO23
        cmp     r5, #0
        beq     LCHO23
        cmp     r4, #0
        beq     LCHO23
        cmp     r11, #0
        ble     LCHO24
        mov     r12, #0xFE, 12
        cmp     r9, #0
        orr     r7, r12, #3, 4
        mov     r8, #0
        ble     LCHO9
        cmp     r9, #6
        blt     LCHO8
        mov     r0, #0
        sub     r2, r9, #6
        str     r11, [sp, #8]
        add     r1, r7, #1, 12
        mov     r10, r0
        mov     r11, r2
LCHO0:
        mov     r2, #0
        mov     r3, r7
        bl      __muldf3
        mov     r2, #0
        mov     r3, r7
        bl      __muldf3
        mov     r2, #0
        mov     r3, r7
        bl      __muldf3
        mov     r2, #0
        mov     r3, r7
        bl      __muldf3
        mov     r2, #0
        mov     r3, r7
        bl      __muldf3
        add     r10, r10, #5
        cmp     r10, r11
        ble     LCHO0
        ldr     r11, [sp, #8]
LCHO1:
        mov     r2, #0
        mov     r3, r7
        bl      __muldf3
        add     r10, r10, #1
        cmp     r10, r9
        blt     LCHO1
        cmp     r11, #0
        ble     LCHO7
        mov     r2, #0
        mov     r12, r2
        str     r2, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     r1, [sp, #0xC]
        str     r0, [sp, #4]
        str     r11, [sp, #8]
LCHO2:
        ldrsh   r0, [r6]
        bl      __floatsidf
        ldrsh   r2, [r6, #2]
        mov     r9, r0
        mov     r8, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r11, r0
        mov     r10, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        str     r0, [sp, #0x18]
        mov     r7, r1
        mov     r0, r11
        mov     r1, r10
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0x18]
        str     r1, [sp]
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LCHO6
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp]
        mov     r12, #0xFE, 12
        orr     r7, r12, #3, 4
        add     r1, r7, #1, 12
        mov     r0, #0
        bl      __divdf3
        ldrsh   r2, [r5]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        mov     r0, r2
        bl      __floatsidf
        ldrsh   r2, [r5, #2]
        str     r0, [sp]
        sub     r12, r7, #0x7F, 8
        str     r12, [sp, #0x24]
        str     r1, [sp, #0x20]
        mov     r0, r2
        bl      __floatsidf
        str     r0, [sp, #0x28]
        ldr     r0, [sp]
        str     r1, [sp, #0x2C]
        ldr     r1, [sp, #0x20]
        mov     r3, r8
        mov     r2, r9
        bl      __muldf3
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x2C]
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x30]
        ldr     r3, [sp, #0x34]
        bl      __adddf3
        str     r0, [sp, #0x34]
        str     r1, [sp, #0x30]
        ldr     r0, [sp, #0x28]
        ldr     r1, [sp, #0x2C]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r8, r0
        ldr     r0, [sp]
        mov     r9, r1
        ldr     r1, [sp, #0x20]
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        mov     r3, r1
        mov     r2, r0
        mov     r0, r8
        mov     r1, r9
        bl      __subdf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        str     r0, [sp, #0x2C]
        ldr     r0, [sp, #0x34]
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x30]
        bl      __muldf3
        ldr     r10, [sp, #4]
        ldr     r11, [sp, #0xC]
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r3, [sp, #0x24]
        mov     r2, #0
        bl      __subdf3
        mov     r3, r7
        mov     r2, #0
        bl      __adddf3
        mov     r9, r1
        str     r9, [sp]
        mov     r8, r0
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        ldr     r0, [sp, #0x2C]
        ldr     r1, [sp, #0x28]
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        ldr     r3, [sp, #0x24]
        mov     r2, #0
        bl      __subdf3
        mov     r3, r7
        mov     r2, #0
        bl      __adddf3
        mov     r7, r1
        mov     r10, r0
        mov     r1, r9
        mov     r0, r8
        bl      __fixdfsi
        mov     r11, r0
        mov     r0, r10
        mov     r1, r7
        bl      __fixdfsi
        tst     r11, #1
        mov     r9, r0
        beq     LCHO3
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp]
        mov     r2, r8
        bl      __eqdf2
        cmp     r0, #0
        subeq   r11, r11, #1
LCHO3:
        tst     r9, #1
        beq     LCHO4
        mov     r0, r9
        bl      __floatsidf
        mov     r2, r10
        mov     r3, r7
        bl      __eqdf2
        cmp     r0, #0
        subeq   r9, r9, #1
LCHO4:
        sub     r11, r11, #2, 18
        sub     r9, r9, #2, 18
        strh    r11, [r4]
        strh    r9, [r4, #2]
LCHO5:
        ldr     r3, [sp, #0x10]
        ldr     r12, [sp, #8]
        add     r4, r4, #4
        add     r3, r3, #1
        str     r3, [sp, #0x10]
        cmp     r3, r12
        add     r5, r5, #4
        add     r6, r6, #4
        blt     LCHO2
        ldr     r2, [sp, #0x14]
        mov     r0, r2
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCHO6:
        mov     r3, #0
        strh    r3, [r4]
        strh    r3, [r4, #2]
        mov     r3, #6
        str     r3, [sp, #0x14]
        b       LCHO5
LCHO7:
        mov     r2, #0
        mov     r0, r2
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCHO8:
        mov     r0, #0
        add     r1, r7, #1, 12
        mov     r10, r0
        b       LCHO1
LCHO9:
        cmp     r9, #0
        addge   r1, r7, #1, 12
        movge   r0, #0
        bge     LCHO12
        rsb     r12, r9, #0
        cmp     r12, #6
        addlt   r1, r7, #1, 12
        movlt   r0, #0
        blt     LCHO11
        add     r1, r7, #1, 12
        mov     r0, #0
LCHO10:
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        add     r9, r9, #5
        cmn     r9, #6
        blt     LCHO10
LCHO11:
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        adds    r9, r9, #1
        bmi     LCHO11
LCHO12:
        cmp     r11, #0
        ble     LCHO22
        mov     r2, #0
        mov     r12, r2
        str     r1, [sp, #0x10]
        str     r0, [sp, #0xC]
        str     r12, [sp, #4]
        str     r2, [sp, #0x14]
        str     r11, [sp, #8]
LCHO13:
        ldrsh   r0, [r6]
        bl      __floatsidf
        ldrsh   r2, [r6, #2]
        mov     r11, r0
        mov     r10, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r9, r0
        mov     r8, r1
        mov     r0, r11
        mov     r1, r10
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        str     r0, [sp, #0x34]
        mov     r7, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x34]
        mov     r3, r7
        bl      __adddf3
        str     r1, [sp]
        mov     r7, r0
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LCHO21
        mov     r2, r7
        ldr     r3, [sp]
        ldr     r0, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        bl      __divdf3
        ldrsh   r2, [r5]
        str     r0, [sp, #0x34]
        mov     r7, r1
        mov     r0, r2
        bl      __floatsidf
        ldrsh   r2, [r5, #2]
        str     r0, [sp, #0x30]
        str     r1, [sp, #0x2C]
        mov     r0, r2
        bl      __floatsidf
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x24]
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x2C]
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x24]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x28]
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x24]
        mov     r3, r10
        mov     r2, r11
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        ldr     r0, [sp, #0x30]
        ldr     r1, [sp, #0x2C]
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r10
        mov     r1, r11
        bl      __subdf3
        mov     r10, r1
        mov     r11, r0
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        ldr     r2, [sp, #0x34]
        mov     r3, r7
        bl      __muldf3
        ldr     r2, [sp, #0x34]
        mov     r9, r1
        mov     r8, r0
        mov     r1, r10
        mov     r3, r7
        mov     r0, r11
        bl      __muldf3
        mov     r3, #0xFE, 12
        orr     r3, r3, #3, 4
        sub     r3, r3, #0x7F, 8
        mov     r10, r0
        mov     r7, r1
        mov     r0, r8
        mov     r1, r9
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        movlt   r3, #0
        sublt   r8, r3, #2, 18
        blt     LCHO16
        ldr     r3, [pc, #0x1B8]
        mov     r0, r8
        mov     r1, r9
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        bgt     LCHO15
        mov     r0, r8
        mov     r1, r9
        mov     r3, #0xFE, 12
        orr     r8, r3, #3, 4
        sub     r3, r8, #0x7F, 8
        mov     r2, #0
        bl      __subdf3
        mov     r3, r8
        mov     r2, #0
        bl      __adddf3
        mov     r8, r0
        mov     r9, r1
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCHO14
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r8
        mov     r3, r9
        bl      __eqdf2
        cmp     r0, #0
        subeq   r11, r11, #1
LCHO14:
        sub     r8, r11, #2, 18
        b       LCHO16
LCHO15:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r8, r3
LCHO16:
        mov     r0, r10
        mov     r3, #0xFE, 12
        orr     r3, r3, #3, 4
        sub     r3, r3, #0x7F, 8
        mov     r1, r7
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        movlt   r3, #0
        sublt   r10, r3, #2, 18
        blt     LCHO19
        ldr     r3, [pc, #0x100]
        mov     r0, r10
        mov     r1, r7
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        bgt     LCHO18
        mov     r0, r10
        mov     r1, r7
        mov     r3, #0xFE, 12
        orr     r7, r3, #3, 4
        sub     r3, r7, #0x7F, 8
        mov     r2, #0
        bl      __subdf3
        mov     r3, r7
        mov     r2, #0
        bl      __adddf3
        mov     r7, r0
        mov     r9, r1
        bl      __fixdfsi
        mov     r10, r0
        tst     r10, #1
        beq     LCHO17
        mov     r0, r10
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r9
        bl      __eqdf2
        cmp     r0, #0
        subeq   r10, r10, #1
LCHO17:
        sub     r10, r10, #2, 18
        b       LCHO19
LCHO18:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r10, r3
LCHO19:
        strh    r8, [r4]
        strh    r10, [r4, #2]
LCHO20:
        ldr     r3, [sp, #4]
        ldr     r12, [sp, #8]
        add     r4, r4, #4
        add     r3, r3, #1
        str     r3, [sp, #4]
        cmp     r3, r12
        add     r5, r5, #4
        add     r6, r6, #4
        blt     LCHO13
        ldr     r2, [sp, #0x14]
        mov     r0, r2
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCHO21:
        mov     r3, #0
        strh    r3, [r4]
        strh    r3, [r4, #2]
        mov     r3, #6
        str     r3, [sp, #0x14]
        b       LCHO20
LCHO22:
        mov     r2, #0
        mov     r0, r2
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCHO23:
        mvn     r0, #7
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
LCHO24:
        mvn     r0, #5
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   0x40dfffc0


