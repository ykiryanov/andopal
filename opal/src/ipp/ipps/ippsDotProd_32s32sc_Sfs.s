        .text
        .align  4
        .globl  _ippsDotProd_32s32sc_Sfs


_ippsDotProd_32s32sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r8, [sp, #0x50]
        mov     r9, r0
        cmp     r9, #0
        mov     r0, r1
        mov     r7, r3
        beq     LCGX16
        cmp     r0, #0
        beq     LCGX16
        cmp     r7, #0
        beq     LCGX16
        cmp     r2, #0
        ble     LCGX17
        cmp     r2, #5
        mov     r11, #0
        blt     LCGX15
        mov     r4, r11
        mov     r1, r4
        mov     r6, r1
        mov     r5, r6
        sub     lr, r2, #5
        mov     r12, r9
        str     r4, [sp, #0x18]
        sub     r10, r0, #0x1C
        str     r1, [sp, #0xC]
        str     r5, [sp, #0x1C]
        str     r6, [sp, #0x20]
        str     r12, [sp, #0x14]
        str     lr, [sp, #0x10]
        str     r8, [sp, #8]
        str     r7, [sp]
        str     r2, [sp, #4]
        mov     r4, r0
LCGX0:
        ldr     r2, [sp, #0x14]
        add     r7, r11, #1
        add     r6, r11, #2
        ldr     r0, [r2], #0x10
        str     r2, [sp, #0x14]
        bl      __floatsidf
        ldr     r2, [r10, #0x1C]
        mov     r8, r0
        add     r12, r4, r7, lsl #3
        str     r12, [sp, #0x24]
        mov     r0, r2
        mov     r5, r1
        bl      __floatsidf
        mov     r3, r5
        mov     r2, r8
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        ldr     r2, [r10, #0x20]!
        str     r0, [sp, #0x18]
        str     r1, [sp, #0xC]
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r8
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        ldr     r2, [r9, +r7, lsl #2]
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        mov     r0, r2
        bl      __floatsidf
        ldr     r2, [r4, +r7, lsl #3]
        add     r5, r11, #3
        add     r12, r4, r6, lsl #3
        mov     r7, r0
        str     r12, [sp, #0x28]
        mov     r0, r2
        mov     r8, r1
        bl      __floatsidf
        mov     r3, r8
        mov     r2, r7
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0xC]
        bl      __adddf3
        ldr     r12, [sp, #0x24]
        ldr     r2, [r12, #4]
        str     r0, [sp, #0x24]
        str     r1, [sp, #0x18]
        add     r12, r4, r5, lsl #3
        str     r12, [sp, #0xC]
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        ldr     r3, [sp, #0x1C]
        bl      __adddf3
        ldr     r2, [r9, +r6, lsl #2]
        str     r0, [sp, #0x20]
        mov     r7, r1
        mov     r0, r2
        bl      __floatsidf
        ldr     r2, [r4, +r6, lsl #3]
        mov     r6, r0
        mov     r8, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r3, r8
        mov     r2, r6
        bl      __muldf3
        ldr     r2, [sp, #0x24]
        ldr     r3, [sp, #0x18]
        bl      __adddf3
        ldr     r12, [sp, #0x28]
        add     r11, r11, #4
        ldr     r2, [r12, #4]
        str     r0, [sp, #0x28]
        str     r1, [sp, #0x24]
        mov     r0, r2
        bl      __floatsidf
        mov     r3, r8
        mov     r2, r6
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [r9, +r5, lsl #2]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r2
        bl      __floatsidf
        ldr     r2, [r4, +r5, lsl #3]
        mov     r5, r0
        mov     r8, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r8
        bl      __muldf3
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x24]
        bl      __adddf3
        ldr     r12, [sp, #0xC]
        ldr     r2, [r12, #4]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0xC]
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r8
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x10]
        cmp     r11, r2
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x1C]
        ble     LCGX0
        mov     r0, r4
        ldr     r1, [sp, #0xC]
        ldr     r4, [sp, #0x18]
        ldr     r5, [sp, #0x1C]
        ldr     r6, [sp, #0x20]
        ldr     r8, [sp, #8]
        ldr     r7, [sp]
        ldr     r2, [sp, #4]
LCGX1:
        mov     r12, r11, lsl #3
        sub     r12, r12, #4
        add     r10, r12, r0
        add     r9, r9, r11, lsl #2
        str     r1, [sp, #0xC]
        str     r8, [sp, #8]
        str     r7, [sp]
        str     r2, [sp, #4]
LCGX2:
        ldr     r0, [r9], #4
        add     r11, r11, #1
        bl      __floatsidf
        ldr     r2, [r10, #4]
        mov     r7, r0
        mov     r8, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        ldr     r3, [sp, #0xC]
        mov     r2, r4
        bl      __adddf3
        str     r1, [sp, #0xC]
        mov     r4, r0
        ldr     r0, [r10, #8]!
        bl      __floatsidf
        mov     r2, r7
        mov     r3, r8
        bl      __muldf3
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #4]
        mov     r6, r0
        mov     r5, r1
        cmp     r11, r12
        blt     LCGX2
        ldr     r8, [sp, #8]
        ldr     r1, [sp, #0xC]
        ldr     r7, [sp]
        mov     r12, #0xFE, 12
        cmp     r8, #0
        orr     r11, r12, #3, 4
        mov     r0, #0
        ble     LCGX11
        cmp     r8, #6
        movlt   r10, r0
        addlt   r9, r11, #1, 12
        blt     LCGX4
        mov     r10, r0
        str     r0, [sp, #0x28]
        mov     r0, r10
        sub     r2, r8, #6
        str     r7, [sp]
        mov     r10, r8
        ldr     r8, [sp, #0x28]
        add     r9, r11, #1, 12
        mov     r7, r1
        mov     r1, r9
        mov     r9, r2
LCGX3:
        mov     r2, #0
        mov     r3, r11
        bl      __muldf3
        mov     r2, #0
        mov     r3, r11
        bl      __muldf3
        mov     r2, #0
        mov     r3, r11
        bl      __muldf3
        mov     r2, #0
        mov     r3, r11
        bl      __muldf3
        mov     r2, #0
        mov     r3, r11
        bl      __muldf3
        add     r8, r8, #5
        cmp     r8, r9
        ble     LCGX3
        str     r0, [sp, #0x24]
        mov     r0, r8
        mov     r9, r1
        mov     r8, r10
        ldr     r10, [sp, #0x24]
        mov     r1, r7
        ldr     r7, [sp]
LCGX4:
        str     r0, [sp, #0x28]
        str     r1, [sp, #0xC]
        mov     r0, r10
        mov     r1, r9
        mov     r10, r8
        ldr     r8, [sp, #0x28]
        mov     r9, r7
        ldr     r7, [sp, #0xC]
LCGX5:
        mov     r2, #0
        mov     r3, r11
        bl      __muldf3
        add     r8, r8, #1
        cmp     r8, r10
        blt     LCGX5
        mov     r10, r0
        str     r1, [sp, #0x14]
        mov     r1, r7
        mov     r7, r9
        ldr     r9, [sp, #0x14]
LCGX6:
        mov     r0, r4
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r8, r0
        mov     r4, r1
        mov     r2, r10
        mov     r0, r6
        mov     r1, r5
        mov     r3, r9
        bl      __muldf3
        mov     r10, #0
        mvn     r12, #0xE2, 12
        sub     r2, r10, #1, 10
        bic     r6, r12, #0xB, 4
        mov     r5, r0
        mov     r9, r1
        mov     r0, r8
        mov     r1, r4
        mov     r3, r6
        bl      __gtdf2
        cmp     r0, #0
        subgt   r8, r10, #1, 10
        movgt   r4, r6
        bgt     LCGX7
        sub     r1, r11, #0x7E, 8
        str     r1, [sp, #0x28]
        mov     r2, r8
        mov     r3, r4
        mov     r0, #0
        bl      __gtdf2
        ldr     r12, [sp, #0x28]
        cmp     r0, #0
        movgt   r4, r12
        movgt   r8, r10
LCGX7:
        mov     r0, r5
        sub     r2, r10, #1, 10
        mov     r1, r9
        mov     r3, r6
        bl      __gtdf2
        cmp     r0, #0
        subgt   r5, r10, #1, 10
        bgt     LCGX8
        sub     r1, r11, #0x7E, 8
        str     r1, [sp, #0x28]
        mov     r2, r5
        mov     r0, #0
        mov     r3, r9
        bl      __gtdf2
        ldr     r12, [sp, #0x28]
        cmp     r0, #0
        mov     r6, r9
        movgt   r5, r10
        movgt   r6, r12
LCGX8:
        mov     r0, r8
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        mvn     r10, #0
        mov     r9, #1
        movge   r3, r11
        strge   r10, [sp, #4]
        sublt   r3, r11, #2, 2
        strlt   r9, [sp, #4]
        mov     r0, r8
        mov     r1, r4
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #8]
        mov     r4, r0
        bl      __fixdfsi
        mov     r8, r0
        tst     r8, #1
        beq     LCGX9
        mov     r0, r8
        bl      __floatsidf
        ldr     r3, [sp, #8]
        mov     r2, r4
        bl      __eqdf2
        cmp     r0, #0
        ldreq   r12, [sp, #4]
        addeq   r8, r8, r12
LCGX9:
        str     r8, [r7]
        mov     r0, r5
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        movge   r9, r10
        sublt   r11, r11, #2, 2
        mov     r0, r5
        mov     r1, r6
        mov     r3, r11
        mov     r2, #0
        bl      __adddf3
        mov     r6, r0
        mov     r5, r1
        bl      __fixdfsi
        mov     r4, r0
        tst     r4, #1
        beq     LCGX10
        mov     r0, r4
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r5
        bl      __eqdf2
        cmp     r0, #0
        addeq   r4, r4, r9
LCGX10:
        mov     r0, #0
        str     r4, [r7, #4]
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCGX11:
        cmp     r8, #0
        movge   r10, r0
        addge   r9, r11, #1, 12
        bge     LCGX6
        rsb     r2, r8, #0
        cmp     r2, #0
        movle   r10, r0
        addle   r9, r11, #1, 12
        ble     LCGX6
        cmp     r2, #6
        movlt   r10, r0
        addlt   r9, r11, #1, 12
        blt     LCGX13
        add     r9, r11, #1, 12
        mvn     r12, #5
        rsb     r8, r8, r12
        str     r7, [sp]
        mov     r7, r1
        mov     r10, r0
        mov     r1, r9
        mov     r9, r8
        mov     r8, r0
        mov     r0, r10
        mov     r10, r2
LCGX12:
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
        cmp     r8, r9
        ble     LCGX12
        mov     r2, r10
        mov     r10, r0
        mov     r0, r8
        mov     r9, r1
        mov     r1, r7
        ldr     r7, [sp]
LCGX13:
        mov     r8, r0
        mov     r0, r10
        mov     r10, r2
        str     r1, [sp, #0xC]
        mov     r1, r9
        mov     r9, r7
        ldr     r7, [sp, #0xC]
LCGX14:
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        add     r8, r8, #1
        cmp     r8, r10
        blt     LCGX14
        mov     r10, r0
        str     r1, [sp, #0x14]
        mov     r1, r7
        mov     r7, r9
        ldr     r9, [sp, #0x14]
        b       LCGX6
LCGX15:
        mov     r4, r11
        mov     r1, r4
        mov     r6, r1
        mov     r5, r6
        b       LCGX1
LCGX16:
        mvn     r0, #7
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LCGX17:
        mvn     r0, #5
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}


