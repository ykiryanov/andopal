        .text
        .align  4
        .globl  _ippsDiv_32s_Sfs


_ippsDiv_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r11, [sp, #0x3C]
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r6, r2
        mov     r4, r3
        beq     LCHH28
        cmp     r7, #0
        beq     LCHH28
        cmp     r6, #0
        beq     LCHH28
        cmp     r4, #0
        ble     LCHH29
        cmn     r11, #0x3E
        mvn     r10, #2, 2
        mov     r9, #0
        blt     LCHH7
        cmp     r11, #0x20
        bgt     LCHH7
        mov     r12, #0xFE, 12
        cmp     r11, #0
        orr     r5, r12, #3, 4
        ble     LCHH12
        cmp     r11, #6
        movlt   r0, r9
        addlt   r1, r5, #1, 12
        blt     LCHH1
        mov     r0, r9
        sub     r2, r11, #6
        str     r4, [sp]
        add     r1, r5, #1, 12
        mov     r4, r2
LCHH0:
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        add     r9, r9, #5
        cmp     r9, r4
        ble     LCHH0
        ldr     r4, [sp]
LCHH1:
        mov     r2, #0
        mov     r3, r5
        bl      __muldf3
        add     r9, r9, #1
        cmp     r9, r11
        blt     LCHH1
        cmp     r4, #0
        mov     r12, #0
        ble     LCHH11
        str     r10, [sp, #0x10]
        mov     r5, #0
        mov     r10, r4
        mov     r9, r5
        str     r5, [sp, #0x14]
        str     r1, [sp, #8]
        mov     r4, r0
LCHH2:
        ldr     r0, [r8], #4
        cmp     r0, #0
        beq     LCHH5
        bl      __floatsidf
        mov     r5, r0
        ldr     r0, [r7]
        mov     r11, r1
        bl      __floatsidf
        ldr     r3, [sp, #8]
        mov     r2, r4
        bl      __muldf3
        mov     r2, r5
        mov     r3, r11
        bl      __divdf3
        mov     r11, r0
        mov     r5, r1
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LCHH3
        mov     r2, r11
        mov     r3, r5
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __adddf3
        str     r1, [sp, #0xC]
        mov     r11, r0
        bl      __fixdfsi
        mov     r5, r0
        tst     r5, #1
        beq     LCHH4
        mov     r0, r5
        bl      __floatsidf
        ldr     r3, [sp, #0xC]
        mov     r2, r11
        bl      __eqdf2
        cmp     r0, #0
        subeq   r5, r5, #1
        b       LCHH4
LCHH3:
        mov     r0, r11
        mov     r1, r5
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        str     r1, [sp, #0xC]
        mov     r11, r0
        bl      __fixdfsi
        mov     r5, r0
        tst     r5, #1
        beq     LCHH4
        mov     r0, r5
        bl      __floatsidf
        ldr     r3, [sp, #0xC]
        mov     r2, r11
        bl      __eqdf2
        cmp     r0, #0
        addeq   r5, r5, #1
LCHH4:
        str     r5, [r6]
        b       LCHH6
LCHH5:
        ldr     lr, [r7]
        mov     r12, #6
        str     r12, [sp, #0x14]
        cmp     lr, #0
        moveq   r12, #0
        streq   r12, [r6]
        beq     LCHH6
        cmp     lr, #0
        movle   r12, #2, 2
        ldrgt   r12, [sp, #0x10]
        str     r12, [r6]
LCHH6:
        add     r9, r9, #1
        cmp     r9, r10
        add     r6, r6, #4
        add     r7, r7, #4
        blt     LCHH2
        ldr     r5, [sp, #0x14]
        mov     r0, r5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCHH7:
        cmp     r11, #0
        mov     r12, r9
        ble     LCHH22
        mov     r5, r9
LCHH8:
        ldr     lr, [r8], #4
        cmp     lr, #0
        strne   r12, [r6]
        bne     LCHH10
        ldr     lr, [r7]
        cmp     lr, #0
        streq   r12, [r6]
        beq     LCHH9
        cmp     lr, #0
        movle   lr, #2, 2
        movgt   lr, r10
        str     lr, [r6]
LCHH9:
        mov     r5, #6
LCHH10:
        add     r9, r9, #1
        cmp     r9, r4
        add     r6, r6, #4
        add     r7, r7, #4
        blt     LCHH8
        mov     r0, r5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCHH11:
        mov     r5, #0
        mov     r0, r5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCHH12:
        cmp     r11, #0
        addge   r1, r5, #1, 12
        movge   r0, r9
        bge     LCHH15
        rsb     r12, r11, #0
        cmp     r12, #6
        addlt   r1, r5, #1, 12
        movlt   r0, r9
        blt     LCHH14
        add     r1, r5, #1, 12
        mov     r0, r9
LCHH13:
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
        add     r11, r11, #5
        cmn     r11, #6
        blt     LCHH13
LCHH14:
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        adds    r11, r11, #1
        bmi     LCHH14
LCHH15:
        cmp     r4, #0
        ble     LCHH21
        mov     r5, r9
        mov     r11, r5
        str     r1, [sp, #8]
        str     r0, [sp, #4]
        str     r10, [sp, #0x10]
        str     r4, [sp]
LCHH16:
        ldr     r0, [r8], #4
        cmp     r0, #0
        beq     LCHH19
        bl      __floatsidf
        mov     r4, r0
        ldr     r0, [r7]
        mov     r10, r1
        bl      __floatsidf
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #8]
        bl      __muldf3
        mov     r2, r4
        mov     r3, r10
        bl      __divdf3
        mov     r10, r0
        mov     r4, r1
        mov     r2, #0
        mov     r3, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LCHH17
        mov     r0, r10
        mov     lr, #0
        mvn     r12, #0xE2, 12
        sub     r2, lr, #1, 10
        bic     r3, r12, #0xB, 4
        mov     r1, r4
        bl      __ledf2
        cmp     r0, #0
        mvngt   r4, #2, 2
        bgt     LCHH18
        mov     r2, r10
        mov     r3, r4
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __adddf3
        str     r1, [sp, #0xC]
        mov     r10, r0
        bl      __fixdfsi
        mov     r4, r0
        tst     r4, #1
        beq     LCHH18
        mov     r0, r4
        bl      __floatsidf
        ldr     r3, [sp, #0xC]
        mov     r2, r10
        bl      __eqdf2
        cmp     r0, #0
        subeq   r4, r4, #1
        b       LCHH18
LCHH17:
        mov     r0, r10
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #0x7E, 8
        mov     r1, r4
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        movlt   r4, #2, 2
        blt     LCHH18
        mov     r0, r10
        mov     r1, r4
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        mov     r2, #0
        bl      __subdf3
        str     r1, [sp, #0xC]
        mov     r10, r0
        bl      __fixdfsi
        mov     r4, r0
        tst     r4, #1
        beq     LCHH18
        mov     r0, r4
        bl      __floatsidf
        ldr     r3, [sp, #0xC]
        mov     r2, r10
        bl      __eqdf2
        cmp     r0, #0
        addeq   r4, r4, #1
LCHH18:
        str     r4, [r6]
        b       LCHH20
LCHH19:
        ldr     r3, [r7]
        cmp     r3, #0
        streq   r9, [r6]
        moveq   r5, #6
        beq     LCHH20
        cmp     r3, #0
        movle   r3, #2, 2
        ldrgt   r3, [sp, #0x10]
        str     r3, [r6]
        mov     r5, #6
LCHH20:
        ldr     r3, [sp]
        add     r11, r11, #1
        add     r6, r6, #4
        cmp     r11, r3
        add     r7, r7, #4
        blt     LCHH16
        mov     r0, r5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCHH21:
        mov     r5, r9
        mov     r0, r5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCHH22:
        mov     r5, r9
LCHH23:
        ldr     lr, [r8], #4
        cmp     lr, #0
        ble     LCHH25
        ldr     lr, [r7]
        cmp     lr, #0
        streq   r12, [r6]
        beq     LCHH24
        cmp     lr, #0
        movle   lr, #2, 2
        movgt   lr, r10
        str     lr, [r6]
LCHH24:
        add     r9, r9, #1
        cmp     r9, r4
        add     r6, r6, #4
        add     r7, r7, #4
        blt     LCHH23
        mov     r0, r5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCHH25:
        cmp     lr, #0
        blt     LCHH27
        ldr     lr, [r7]
        cmp     lr, #0
        streq   r12, [r6]
        beq     LCHH26
        cmp     lr, #0
        movle   lr, #2, 2
        movgt   lr, r10
        str     lr, [r6]
LCHH26:
        mov     r5, #6
        b       LCHH24
LCHH27:
        ldr     lr, [r7]
        cmp     lr, #0
        streq   r12, [r6]
        beq     LCHH24
        cmp     lr, #0
        movlt   lr, r10
        movge   lr, #2, 2
        str     lr, [r6]
        b       LCHH24
LCHH28:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCHH29:
        mvn     r0, #5
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


