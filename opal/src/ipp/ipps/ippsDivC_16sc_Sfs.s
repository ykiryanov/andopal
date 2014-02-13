        .text
        .align  4
        .globl  _ippsDivC_16sc_Sfs


_ippsDivC_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r8, [sp, #0x50]
        str     r0, [sp, #4]
        cmp     r0, #0
        str     r1, [sp, #0x28]
        mov     r10, r2
        mov     r11, r3
        beq     LCIC20
        cmp     r10, #0
        beq     LCIC20
        cmp     r11, #0
        ble     LCIC21
        ldrsh   r0, [sp, #0x28]
        bl      __floatsidf
        ldrsh   r2, [sp, #0x2A]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r6, r0
        mov     r9, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        str     r0, [sp, #0x18]
        mov     r7, r1
        mov     r0, r6
        mov     r1, r9
        mov     r2, r6
        mov     r3, r9
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        mov     r3, r7
        bl      __adddf3
        str     r1, [sp]
        mov     r7, r0
        mov     r2, #0
        mov     r3, #0
        bl      __nedf2
        cmp     r0, #0
        beq     LCIC19
        mov     r12, #0xFE, 12
        cmp     r8, #0
        orr     r12, r12, #3, 4
        ble     LCIC16
        cmp     r8, #6
        blt     LCIC15
        mov     r2, #0
        sub     r3, r8, #6
        str     r11, [sp, #0x14]
        str     r10, [sp, #8]
        add     r1, r12, #1, 12
        mov     r0, r2
        str     r8, [sp, #0x1C]
        mov     r10, r2
        mov     r11, r3
LCIC0:
        mov     r12, #0xFE, 12
        orr     r8, r12, #3, 4
        mov     r2, #0
        mov     r3, r8
        bl      __muldf3
        mov     r2, #0
        mov     r3, r8
        bl      __muldf3
        mov     r2, #0
        mov     r3, r8
        bl      __muldf3
        mov     r2, #0
        mov     r3, r8
        bl      __muldf3
        mov     r2, #0
        mov     r3, r8
        bl      __muldf3
        add     r10, r10, #5
        cmp     r10, r11
        ble     LCIC0
        mov     r2, r10
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r10, [sp, #8]
LCIC1:
        str     r10, [sp, #8]
        mov     r10, r8
        mov     r8, r2
LCIC2:
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __muldf3
        add     r8, r8, #1
        cmp     r8, r10
        blt     LCIC2
        ldr     r10, [sp, #8]
LCIC3:
        mov     r2, r7
        ldr     r3, [sp]
        bl      __divdf3
        mov     r8, r0
        mov     r7, r1
        mov     r3, r5
        mov     r2, r4
        bl      __muldf3
        mov     r5, r1
        str     r5, [sp]
        mov     r4, r0
        eor     r9, r9, #2, 2
        mov     r3, r7
        mov     r0, r6
        mov     r2, r8
        mov     r1, r9
        bl      __muldf3
        mov     r7, r1
        mov     r6, r0
        mov     r1, r5
        mov     r3, r5
        mov     r0, r4
        mov     r2, r4
        bl      __muldf3
        mov     r5, r0
        mov     r8, r1
        mov     r0, r6
        mov     r1, r7
        mov     r2, r6
        mov     r3, r7
        bl      __muldf3
        mov     r2, r5
        mov     r3, r8
        bl      __adddf3
        mov     r12, #0xFE, 12
        orr     r5, r12, #3, 4
        mov     r2, #0
        mov     r3, r5
        bl      __ltdf2
        cmp     r0, #0
        mov     r0, #0
        bge     LCIC7
        cmp     r11, #0
        addle   sp, sp, #0x2C
        ldmleia sp!, {r4 - r11, pc}
        str     r7, [sp, #0x18]
        ldr     r7, [sp, #4]
        sub     r10, r10, #2
        str     r10, [sp, #0xC]
        str     r11, [sp, #0x14]
LCIC4:
        ldrsh   r0, [r7]
        sub     r1, r5, #0x7F, 8
        str     r1, [sp, #8]
        bl      __floatsidf
        mov     r10, r1
        ldrsh   r1, [r7, #2]
        mov     r11, r0
        mov     r0, r1
        bl      __floatsidf
        ldr     r3, [sp]
        mov     r9, r0
        mov     r8, r1
        mov     r2, r4
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        ldr     r3, [sp, #0x18]
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x24]
        mov     r1, r8
        mov     r0, r9
        mov     r2, r6
        bl      __muldf3
        mov     r3, r1
        ldr     r1, [sp, #0x24]
        mov     r2, r0
        ldr     r0, [sp, #0x20]
        bl      __subdf3
        ldr     r3, [sp, #0x18]
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x20]
        mov     r2, r6
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        ldr     r3, [sp]
        mov     r11, r1
        mov     r10, r0
        mov     r1, r8
        mov     r0, r9
        mov     r2, r4
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        ldr     r3, [sp, #8]
        mov     r11, r0
        mov     r10, r1
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x20]
        mov     r2, #0
        bl      __subdf3
        mov     r2, #0
        mov     r3, r5
        bl      __adddf3
        str     r1, [sp, #8]
        mov     r8, r0
        bl      __fixdfsi
        mov     r9, r0
        tst     r9, #1
        beq     LCIC5
        mov     r0, r9
        bl      __floatsidf
        ldr     r3, [sp, #8]
        mov     r2, r8
        bl      __eqdf2
        cmp     r0, #0
        subeq   r9, r9, #1
LCIC5:
        mov     r0, r11
        mov     r1, r10
        mov     r12, #0xFE, 12
        sub     r8, r9, #2, 18
        orr     r9, r12, #3, 4
        sub     r3, r9, #0x7F, 8
        mov     r2, #0
        bl      __subdf3
        mov     r3, r9
        mov     r2, #0
        bl      __adddf3
        mov     r9, r0
        mov     r10, r1
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCIC6
        mov     r0, r11
        bl      __floatsidf
        mov     r2, r9
        mov     r3, r10
        bl      __eqdf2
        cmp     r0, #0
        subeq   r11, r11, #1
LCIC6:
        ldr     r1, [sp, #0xC]
        sub     r11, r11, #2, 18
        add     r7, r7, #4
        strh    r8, [r1, #2]
        strh    r11, [r1, #4]!
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0x14]
        subs    r1, r1, #1
        str     r1, [sp, #0x14]
        bne     LCIC4
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCIC7:
        cmp     r11, #0
        addle   sp, sp, #0x2C
        ldmleia sp!, {r4 - r11, pc}
        str     r7, [sp, #0x18]
        ldr     r7, [sp, #4]
        sub     r10, r10, #2
        str     r0, [sp, #0xC]
        str     r10, [sp, #8]
        str     r5, [sp, #0x10]
        str     r6, [sp, #0x1C]
        str     r11, [sp, #0x14]
LCIC8:
        ldr     r1, [sp, #0x10]
        ldrsh   r0, [r7]
        sub     r1, r1, #0x7F, 8
        str     r1, [sp, #0x24]
        bl      __floatsidf
        mov     r9, r0
        ldrsh   r0, [r7, #2]
        mov     r8, r1
        bl      __floatsidf
        ldr     r3, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r4
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r6
        bl      __subdf3
        ldr     r2, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r9
        mov     r1, r8
        bl      __muldf3
        ldr     r3, [sp]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r11
        mov     r1, r10
        mov     r2, r4
        bl      __muldf3
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r3, [sp, #0x24]
        mov     r9, r0
        mov     r8, r1
        mov     r0, r5
        mov     r1, r6
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        ldrlt   r3, [sp, #0xC]
        sublt   r10, r3, #2, 18
        blt     LCIC11
        ldr     r3, [pc, #0x22C]
        mov     r0, r5
        mov     r1, r6
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        bgt     LCIC10
        mov     r0, r5
        mov     r1, r6
        mov     r3, #0xFE, 12
        orr     r5, r3, #3, 4
        sub     r3, r5, #0x7F, 8
        mov     r2, #0
        bl      __subdf3
        mov     r3, r5
        mov     r2, #0
        bl      __adddf3
        mov     r5, r0
        mov     r6, r1
        bl      __fixdfsi
        mov     r10, r0
        tst     r10, #1
        beq     LCIC9
        mov     r0, r10
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r6
        bl      __eqdf2
        cmp     r0, #0
        subeq   r10, r10, #1
LCIC9:
        sub     r10, r10, #2, 18
        b       LCIC11
LCIC10:
        mvn     r3, #0xFF
        bic     r3, r3, #0x7F, 24
        mvn     r10, r3
LCIC11:
        mov     r0, r9
        mov     r3, #0xFE, 12
        orr     r3, r3, #3, 4
        sub     r3, r3, #0x7F, 8
        mov     r1, r8
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        movlt   r1, #0
        sublt   r5, r1, #2, 18
        blt     LCIC14
        ldr     r3, [pc, #0x174]
        mov     r0, r9
        mov     r1, r8
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        bgt     LCIC13
        mov     r0, r9
        mov     r1, r8
        mov     r3, #0xFE, 12
        orr     r5, r3, #3, 4
        sub     r3, r5, #0x7F, 8
        mov     r2, #0
        bl      __subdf3
        mov     r3, r5
        mov     r2, #0
        bl      __adddf3
        mov     r6, r0
        mov     r8, r1
        bl      __fixdfsi
        mov     r5, r0
        tst     r5, #1
        beq     LCIC12
        mov     r0, r5
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r8
        bl      __eqdf2
        cmp     r0, #0
        subeq   r5, r5, #1
LCIC12:
        sub     r5, r5, #2, 18
        b       LCIC14
LCIC13:
        mvn     r1, #0xFF
        bic     r1, r1, #0x7F, 24
        mvn     r5, r1
LCIC14:
        ldr     r1, [sp, #8]
        add     r7, r7, #4
        strh    r10, [r1, #2]
        strh    r5, [r1, #4]!
        str     r1, [sp, #8]
        ldr     r1, [sp, #0x14]
        subs    r1, r1, #1
        str     r1, [sp, #0x14]
        bne     LCIC8
        mov     r0, #0
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCIC15:
        mov     r2, #0
        add     r1, r12, #1, 12
        mov     r0, r2
        b       LCIC1
LCIC16:
        cmp     r8, #0
        addge   r1, r12, #1, 12
        movge   r0, #0
        bge     LCIC3
        rsb     lr, r8, #0
        cmp     lr, #6
        addlt   r1, r12, #1, 12
        movlt   r0, #0
        blt     LCIC18
        add     r1, r12, #1, 12
        mov     r0, #0
LCIC17:
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
        add     r8, r8, #5
        cmn     r8, #6
        blt     LCIC17
LCIC18:
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        adds    r8, r8, #1
        bmi     LCIC18
        b       LCIC3
LCIC19:
        mvn     r0, #9
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCIC20:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCIC21:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x40dfffc0


