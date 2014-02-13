        .text
        .align  4
        .globl  _ippsConvert_64f32s_Sfs


_ippsConvert_64f32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r10, [sp, #0x44]
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r6, r2
        mov     r9, r3
        beq     LCWH24
        cmp     r7, #0
        beq     LCWH24
        cmp     r6, #0
        ble     LCWH25
        mov     lr, #0xFE, 12
        mvn     r12, #0xE2, 12
        cmp     r10, #0
        orr     r4, lr, #3, 4
        bic     r5, r12, #0xB, 4
        mov     r11, #0
        bne     LCWH2
        cmp     r9, #1
        mov     r12, #0xFF, 12
        orr     r9, r12, #3, 4
        mvn     r12, #2, 2
        mov     lr, #2, 2
        beq     LCWH9
        str     r12, [sp, #4]
        str     r4, [sp, #0x10]
LCWH0:
        ldr     r10, [r8]
        ldr     r4, [r8, #4]
        mov     r2, r9, lsl #2
        mov     r0, r10
        mov     r1, r4
        mov     r3, r5
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [sp, #4]
        strge   r12, [r7]
        bge     LCWH1
        mov     r0, r10
        ldr     r12, [sp, #0x10]
        mov     r1, r4
        mov     r2, #0
        sub     r3, r12, #0x7E, 8
        bl      __ledf2
        cmp     r0, #0
        movle   r12, #2, 2
        strle   r12, [r7]
        ble     LCWH1
        mov     r0, r10
        mov     r1, r4
        bl      __fixdfsi
        str     r0, [r7]
LCWH1:
        add     r11, r11, #1
        cmp     r11, r6
        add     r8, r8, #8
        add     r7, r7, #4
        blt     LCWH0
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCWH2:
        cmp     r10, #0
        ble     LCWH21
        cmp     r10, #6
        movlt   r0, r11
        addlt   r1, r4, #1, 12
        blt     LCWH4
        mov     r0, r11
        sub     r2, r10, #6
        str     r6, [sp, #0x18]
        add     r1, r4, #1, 12
        mov     r6, r2
LCWH3:
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
        cmp     r11, r6
        ble     LCWH3
        ldr     r6, [sp, #0x18]
LCWH4:
        mov     r2, #0
        mov     r3, r4
        bl      __muldf3
        add     r11, r11, #1
        cmp     r11, r10
        blt     LCWH4
LCWH5:
        mov     r12, #0xFF, 12
        orr     r10, r12, #3, 4
        cmp     r9, #1
        mvn     r12, #2, 2
        mov     lr, #2, 2
        beq     LCWH15
        cmp     r6, #0
        ble     LCWH8
        str     r5, [sp, #0x14]
        str     r4, [sp, #0x10]
        mov     r9, r8
        str     r12, [sp, #0xC]
        mov     r4, r0
        mov     r5, r1
        mov     r11, r6
        mov     r8, r7
LCWH6:
        ldr     r0, [r9]
        ldr     r1, [r9, #4]
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r3, [sp, #0x14]
        mov     r7, r0
        mov     r6, r1
        mov     r2, r10, lsl #2
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [sp, #0xC]
        strge   r12, [r8]
        bge     LCWH7
        mov     r0, r7
        ldr     r12, [sp, #0x10]
        mov     r1, r6
        mov     r2, #0
        sub     r3, r12, #0x7E, 8
        bl      __ledf2
        cmp     r0, #0
        movle   r12, #2, 2
        strle   r12, [r8]
        ble     LCWH7
        mov     r0, r7
        mov     r1, r6
        bl      __fixdfsi
        str     r0, [r8]
LCWH7:
        subs    r11, r11, #1
        add     r9, r9, #8
        add     r8, r8, #4
        bne     LCWH6
LCWH8:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCWH9:
        str     r12, [sp, #4]
        str     r9, [sp]
LCWH10:
        ldr     r12, [sp]
        ldr     r10, [r8]
        ldr     r9, [r8, #4]
        mov     r2, r12, lsl #2
        mov     r0, r10
        mov     r1, r9
        mov     r3, r5
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [sp, #4]
        strge   r12, [r7]
        bge     LCWH14
        mov     r0, r10
        sub     r3, r4, #0x7E, 8
        mov     r1, r9
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        movle   r12, #2, 2
        strle   r12, [r7]
        ble     LCWH14
        mov     r0, r10
        mov     r1, r9
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LCWH11
        mov     r12, #1
        sub     r3, r4, #2, 2
        str     r12, [sp, #8]
        b       LCWH12
LCWH11:
        mov     r3, r4
        mvn     r12, #0
        str     r12, [sp, #8]
LCWH12:
        mov     r0, r10
        mov     r1, r9
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #0xC]
        mov     r9, r0
        bl      __fixdfsi
        mov     r10, r0
        tst     r10, #1
        beq     LCWH13
        mov     r0, r10
        bl      __floatsidf
        ldr     r3, [sp, #0xC]
        mov     r2, r9
        bl      __eqdf2
        cmp     r0, #0
        ldreq   r12, [sp, #8]
        addeq   r10, r10, r12
LCWH13:
        str     r10, [r7]
LCWH14:
        add     r11, r11, #1
        cmp     r11, r6
        add     r8, r8, #8
        add     r7, r7, #4
        blt     LCWH10
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCWH15:
        cmp     r6, #0
        ble     LCWH8
        mov     r9, r6
        mov     r6, r5
        mov     r5, r4
        str     r1, [sp, #0x1C]
        str     r10, [sp]
        str     r12, [sp, #0xC]
        mov     r4, r0
LCWH16:
        ldr     r3, [sp, #0x1C]
        ldr     r0, [r8]
        ldr     r1, [r8, #4]
        mov     r2, r4
        bl      __muldf3
        ldr     r12, [sp]
        mov     r11, r0
        mov     r10, r1
        mov     r2, r12, lsl #2
        mov     r3, r6
        bl      __gedf2
        cmp     r0, #0
        ldrge   r12, [sp, #0xC]
        strge   r12, [r7]
        bge     LCWH20
        mov     r0, r11
        sub     r3, r5, #0x7E, 8
        mov     r1, r10
        mov     r2, #0
        bl      __ledf2
        cmp     r0, #0
        movle   r12, #2, 2
        strle   r12, [r7]
        ble     LCWH20
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LCWH17
        mov     r12, #1
        sub     r3, r5, #2, 2
        str     r12, [sp, #4]
        b       LCWH18
LCWH17:
        mov     r3, r5
        mvn     r12, #0
        str     r12, [sp, #4]
LCWH18:
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        bl      __adddf3
        str     r1, [sp, #8]
        mov     r10, r0
        bl      __fixdfsi
        mov     r11, r0
        tst     r11, #1
        beq     LCWH19
        mov     r0, r11
        bl      __floatsidf
        ldr     r3, [sp, #8]
        mov     r2, r10
        bl      __eqdf2
        cmp     r0, #0
        ldreq   r12, [sp, #4]
        addeq   r11, r11, r12
LCWH19:
        str     r11, [r7]
LCWH20:
        subs    r9, r9, #1
        add     r8, r8, #8
        add     r7, r7, #4
        bne     LCWH16
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCWH21:
        cmp     r10, #0
        movge   r0, r11
        addge   r1, r4, #1, 12
        bge     LCWH5
        rsb     r12, r10, #0
        cmp     r12, #6
        movlt   r0, r11
        addlt   r1, r4, #1, 12
        blt     LCWH23
        mov     r0, r11
        add     r1, r4, #1, 12
LCWH22:
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
        blt     LCWH22
LCWH23:
        mov     r2, r0
        mov     r3, r1
        bl      __adddf3
        adds    r10, r10, #1
        bmi     LCWH23
        b       LCWH5
LCWH24:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCWH25:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


