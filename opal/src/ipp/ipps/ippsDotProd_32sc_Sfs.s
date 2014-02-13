        .text
        .align  4
        .globl  _ippsDotProd_32sc_Sfs


_ippsDotProd_32sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r12, [sp, #0x4C]
        mov     r4, r0
        cmp     r4, #0
        mov     r7, r3
        beq     LCGV15
        cmp     r1, #0
        beq     LCGV15
        cmp     r7, #0
        beq     LCGV15
        cmp     r2, #0
        ble     LCGV16
        cmp     r2, #0
        mov     r0, #0
        ble     LCGV14
        mov     r9, r0
        mov     r8, r9
        mov     r11, r8
        add     r5, r4, #4
        mov     r10, r11
        add     r4, r1, #4
        str     r8, [sp, #0x14]
        str     r9, [sp, #0x18]
        str     r10, [sp, #0x10]
        str     r11, [sp, #0xC]
        str     r0, [sp, #4]
        str     r12, [sp, #8]
        str     r7, [sp]
        str     r2, [sp, #0x1C]
LCGV0:
        ldr     r0, [r4]
        bl      __floatsidf
        mov     r7, r0
        ldr     r0, [r4, #-4]
        mov     r6, r1
        add     r4, r4, #8
        bl      __floatsidf
        mov     r11, r0
        ldr     r0, [r5]
        mov     r10, r1
        bl      __floatsidf
        ldr     r2, [r5, #-4]
        mov     r9, r0
        mov     r8, r1
        mov     r0, r2
        bl      __floatsidf
        str     r0, [sp, #0x20]
        ldr     r0, [sp, #0x20]
        str     r1, [sp, #0x24]
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        mov     r2, r7
        mov     r3, r6
        mov     r0, r9
        mov     r1, r8
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        bl      __subdf3
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        ldr     r0, [sp, #0x20]
        ldr     r1, [sp, #0x24]
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        bl      __adddf3
        mov     r6, r0
        mov     r7, r1
        mov     r0, r11
        mov     r1, r10
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        ldr     r2, [sp, #0x1C]
        add     r5, r5, #8
        subs    r2, r2, #1
        str     r2, [sp, #0x1C]
        str     r0, [sp, #0xC]
        ldr     r0, [sp, #0x1C]
        str     r1, [sp, #0x10]
        bne     LCGV0
        ldr     r8, [sp, #0x14]
        ldr     r9, [sp, #0x18]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0xC]
        ldr     r0, [sp, #4]
        ldr     r12, [sp, #8]
        ldr     r7, [sp]
LCGV1:
        mov     r2, #0xFE, 12
        cmp     r12, #0
        orr     r6, r2, #3, 4
        ble     LCGV10
        cmp     r12, #6
        movlt   r5, r0
        addlt   r4, r6, #1, 12
        blt     LCGV3
        mov     r5, r0
        sub     r1, r12, #6
        add     r4, r6, #1, 12
        str     r7, [sp]
        mov     r7, r1
        mov     r1, r4
        mov     r4, r0
        mov     r0, r5
        mov     r5, r12
LCGV2:
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        add     r4, r4, #5
        cmp     r4, r7
        ble     LCGV2
        mov     r12, r5
        mov     r5, r0
        mov     r0, r4
        mov     r4, r1
        ldr     r7, [sp]
LCGV3:
        mov     r1, r4
        mov     r4, r0
        mov     r0, r5
        mov     r5, r12
LCGV4:
        mov     r2, #0
        mov     r3, r6
        bl      __muldf3
        add     r4, r4, #1
        cmp     r4, r5
        blt     LCGV4
        mov     r5, r0
        mov     r4, r1
LCGV5:
        mov     r0, r9
        mov     r1, r8
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r9, r0
        mov     r8, r1
        mov     r0, r11
        mov     r2, r5
        mov     r1, r10
        mov     r3, r4
        bl      __muldf3
        mov     r11, #0
        mvn     r12, #0xE2, 12
        sub     r2, r11, #1, 10
        bic     r5, r12, #0xB, 4
        mov     r4, r0
        mov     r10, r1
        mov     r0, r9
        mov     r1, r8
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        subgt   r9, r11, #1, 10
        movgt   r8, r5
        bgt     LCGV6
        sub     r1, r6, #0x7E, 8
        str     r1, [sp, #0x24]
        mov     r2, r9
        mov     r3, r8
        mov     r0, #0
        bl      __gtdf2
        ldr     r12, [sp, #0x24]
        cmp     r0, #0
        movgt   r8, r12
        movgt   r9, r11
LCGV6:
        mov     r0, r4
        sub     r2, r11, #1, 10
        mov     r1, r10
        mov     r3, r5
        bl      __gtdf2
        cmp     r0, #0
        subgt   r4, r11, #1, 10
        bgt     LCGV7
        sub     r1, r6, #0x7E, 8
        str     r1, [sp, #0x24]
        mov     r2, r4
        mov     r0, #0
        mov     r3, r10
        bl      __gtdf2
        ldr     r12, [sp, #0x24]
        cmp     r0, #0
        mov     r5, r10
        movgt   r4, r11
        movgt   r5, r12
LCGV7:
        mov     r0, r9
        mov     r1, r8
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        mvn     r11, #0
        mov     r10, #1
        movge   r3, r6
        strge   r11, [sp, #8]
        sublt   r3, r6, #2, 2
        strlt   r10, [sp, #8]
        mov     r0, r9
        mov     r1, r8
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #4]
        mov     r8, r0
        bl      __fixdfsi
        mov     r9, r0
        tst     r9, #1
        beq     LCGV8
        mov     r0, r9
        bl      __floatsidf
        ldr     r3, [sp, #4]
        mov     r2, r8
        bl      __eqdf2
        cmp     r0, #0
        ldreq   r12, [sp, #8]
        addeq   r9, r9, r12
LCGV8:
        str     r9, [r7]
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        movge   r10, r11
        sublt   r6, r6, #2, 2
        mov     r0, r4
        mov     r1, r5
        mov     r3, r6
        mov     r2, #0
        bl      __adddf3
        mov     r5, r0
        mov     r6, r1
        bl      __fixdfsi
        mov     r4, r0
        tst     r4, #1
        beq     LCGV9
        mov     r0, r4
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r6
        bl      __eqdf2
        cmp     r0, #0
        addeq   r4, r4, r10
LCGV9:
        mov     r0, #0
        str     r4, [r7, #4]
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LCGV10:
        cmp     r12, #0
        movge   r5, r0
        addge   r4, r6, #1, 12
        bge     LCGV5
        rsb     r1, r12, #0
        cmp     r1, #0
        movle   r5, r0
        addle   r4, r6, #1, 12
        ble     LCGV5
        cmp     r1, #6
        movlt   r5, r0
        addlt   r4, r6, #1, 12
        blt     LCGV12
        mov     r5, r0
        str     r0, [sp, #4]
        add     r4, r6, #1, 12
        mov     r0, r5
        mov     r5, r1
        mov     r1, r4
        ldr     r4, [sp, #4]
        mvn     r2, #5
        rsb     r12, r12, r2
        str     r7, [sp]
        mov     r7, r12
LCGV11:
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
        add     r4, r4, #5
        cmp     r4, r7
        ble     LCGV11
        str     r0, [sp, #0x24]
        mov     r0, r4
        mov     r4, r1
        mov     r1, r5
        ldr     r5, [sp, #0x24]
        ldr     r7, [sp]
LCGV12:
        str     r0, [sp, #4]
        mov     r0, r5
        mov     r5, r1
        mov     r1, r4
        ldr     r4, [sp, #4]
LCGV13:
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        add     r4, r4, #1
        cmp     r4, r5
        blt     LCGV13
        mov     r5, r0
        mov     r4, r1
        b       LCGV5
LCGV14:
        mov     r9, r0
        mov     r8, r9
        mov     r11, r8
        mov     r10, r11
        b       LCGV1
LCGV15:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LCGV16:
        mvn     r0, #5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


