        .text
        .align  4
        .globl  _ippsDiv_32s16s_Sfs


_ippsDiv_32s16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r10, [sp, #0x38]
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r6, r2
        mov     r5, r3
        beq     LCHJ23
        cmp     r7, #0
        beq     LCHJ23
        cmp     r6, #0
        beq     LCHJ23
        cmp     r5, #0
        ble     LCHJ24
        mvn     r12, #0xFF
        cmn     r10, #0x1E
        bic     r9, r12, #0x7F, 24
        mov     r11, #0
        ble     LCHJ9
        cmp     r10, #0x20
        bge     LCHJ9
        mov     r12, #0xFE, 12
        cmp     r10, #0
        orr     r4, r12, #3, 4
        blt     LCHJ14
        cmp     r10, #0
        movle   r0, r11
        addle   r1, r4, #1, 12
        ble     LCHJ2
        cmp     r10, #6
        movlt   r0, r11
        addlt   r1, r4, #1, 12
        blt     LCHJ1
        mov     r0, r11
        sub     r2, r10, #6
        str     r5, [sp, #0x10]
        add     r1, r4, #1, 12
        mov     r5, r2
LCHJ0:
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        add     r11, r11, #5
        cmp     r11, r5
        ble     LCHJ0
        ldr     r5, [sp, #0x10]
LCHJ1:
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        add     r11, r11, #1
        cmp     r11, r10
        blt     LCHJ1
LCHJ2:
        cmp     r5, #0
        mov     r12, #0
        ble     LCHJ13
        mov     r4, #0
        mov     r10, r4
        mov     lr, r10
        str     r1, [sp, #4]
        str     r0, [sp]
        str     r9, [sp, #8]
LCHJ3:
        ldrsh   r0, [r8], #2
        cmp     r0, #0
        beq     LCHJ6
        bl      __floatsidf
        mov     r9, r0
        ldr     r0, [r7]
        mov     r11, r1
        bl      __floatsidf
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        bl      __muldf3
        mov     r2, r9
        mov     r3, r11
        bl      __divdf3
        ldr     r3, [pc, #0x2CC]
        mov     r11, r0
        mov     r9, r1
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        ldrgt   r12, [sp, #8]
        mvngt   r11, r12
        bgt     LCHJ5
        mov     r0, r11
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        sub     r3, r12, #0x7F, 8
        mov     r1, r9
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        movlt   r12, #0
        sublt   r11, r12, #2, 18
        blt     LCHJ5
        mov     r0, r11
        mov     r1, r9
        mov     r12, #0xFE, 12
        orr     r9, r12, #3, 4
        sub     r3, r9, #0x7F, 8
        mov     r2, #0
        bl      __subdf3
        mov     r3, r9
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #0xC]
        mov     r9, r0
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCHJ4
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp, #0xC]
        mov     r2, r9
        bl      __eqdf2
        cmp     r0, #0
        subeq   r11, r11, #1
LCHJ4:
        sub     r11, r11, #2, 18
LCHJ5:
        strh    r11, [r6]
        b       LCHJ8
LCHJ6:
        ldr     r12, [r7]
        cmp     r12, #0
        beq     LCHJ7
        cmp     r12, #0
        movle   r12, #0
        suble   r12, r12, #2, 18
        ldrgt   r12, [sp, #8]
        mvngt   r12, r12
        strh    r12, [r6]
        mov     r4, #6
        b       LCHJ8
LCHJ7:
        mov     r12, #0
        strh    r12, [r6]
        mov     r4, #6
LCHJ8:
        add     r10, r10, #1
        cmp     r10, r5
        add     r6, r6, #2
        add     r7, r7, #4
        blt     LCHJ3
        mov     r0, r4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCHJ9:
        cmp     r10, #0
        ble     LCHJ17
        mov     r4, r11
        mov     r12, r4
LCHJ10:
        ldrsh   lr, [r8], #2
        cmp     lr, #0
        strneh  r11, [r6]
        bne     LCHJ12
        ldr     lr, [r7]
        cmp     lr, #0
        streqh  r11, [r6]
        beq     LCHJ11
        cmp     lr, #0
        suble   lr, r11, #2, 18
        mvngt   lr, r9
        strh    lr, [r6]
LCHJ11:
        mov     r4, #6
LCHJ12:
        add     r12, r12, #1
        cmp     r12, r5
        add     r6, r6, #2
        add     r7, r7, #4
        blt     LCHJ10
        mov     r0, r4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCHJ13:
        mov     r4, #0
        mov     r0, r4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCHJ14:
        cmp     r10, #0
        movge   r0, r11
        addge   r1, r4, #1, 12
        bge     LCHJ2
        rsb     r12, r10, #0
        cmp     r12, #6
        movlt   r0, r11
        addlt   r1, r4, #1, 12
        blt     LCHJ16
        mov     r0, r11
        add     r1, r4, #1, 12
LCHJ15:
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
        add     r10, r10, #5
        cmn     r10, #6
        blt     LCHJ15
LCHJ16:
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        adds    r10, r10, #1
        bmi     LCHJ16
        b       LCHJ2
LCHJ17:
        mov     r4, r11
        mov     r12, r4
LCHJ18:
        ldrsh   lr, [r8], #2
        cmp     lr, #0
        ble     LCHJ20
        ldr     lr, [r7]
        cmp     lr, #0
        streqh  r11, [r6]
        beq     LCHJ19
        cmp     lr, #0
        suble   lr, r11, #2, 18
        mvngt   lr, r9
        strh    lr, [r6]
LCHJ19:
        add     r12, r12, #1
        cmp     r12, r5
        add     r6, r6, #2
        add     r7, r7, #4
        blt     LCHJ18
        mov     r0, r4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCHJ20:
        cmp     lr, #0
        blt     LCHJ22
        ldr     lr, [r7]
        cmp     lr, #0
        streqh  r11, [r6]
        beq     LCHJ21
        cmp     lr, #0
        suble   lr, r11, #2, 18
        mvngt   lr, r9
        strh    lr, [r6]
LCHJ21:
        mov     r4, #6
        b       LCHJ19
LCHJ22:
        ldr     lr, [r7]
        cmp     lr, #0
        streqh  r11, [r6]
        beq     LCHJ19
        cmp     lr, #0
        sublt   lr, r11, #2, 18
        mvnlt   lr, lr
        movge   lr, r9
        strh    lr, [r6]
        b       LCHJ19
LCHJ23:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCHJ24:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   0x40dfffc0


