        .text
        .align  4
        .globl  _ippsRandGauss_16s


_ippsRandGauss_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        mov     r10, r0
        cmp     r10, #0
        mov     r8, r1
        mov     r5, r2
        beq     LAZI9
        cmp     r5, #0
        beq     LAZI9
        cmp     r8, #0
        ble     LAZI10
        ldr     r3, [r5]
        cmp     r3, #0x27
        beq     LAZI0
        mvn     r0, #0x10
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LAZI0:
        ldr     r12, [r5, #0x30]
        ldr     r7, [r5, #0x28]
        ldr     r6, [r5, #0x2C]
        str     r12, [sp, #0x38]
        ldr     r12, [r5, #0x34]
        cmp     r8, #0
        str     r12, [sp, #0x3C]
        ldr     r12, [r5, #0xC]
        ldrsh   r4, [r5, #8]
        ldrsh   r0, [r5, #0xA]
        str     r12, [sp, #8]
        ldr     r12, [r5, #0x10]
        str     r12, [sp, #4]
        ldr     r12, [r5, #0x14]
        str     r12, [sp]
        ldr     r12, [r5, #0x18]
        str     r12, [sp, #0x30]
        ldr     r12, [r5, #0x1C]
        str     r12, [sp, #0x34]
        ldr     r9, [r5, #0x20]
        ble     LAZI6
        bl      __floatsidf
        mov     r11, r0
        mov     r0, r4
        mov     r4, r1
        bl      __floatsidf
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        mov     r2, #0
        sub     r12, r12, #0x7F, 8
        str     r8, [sp, #0x10]
        str     r12, [sp, #0x2C]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x24]
        str     r4, [sp, #0x20]
        str     r11, [sp, #0x1C]
        str     r5, [sp, #0x14]
        str     r10, [sp, #0xC]
        mov     r8, r2
LAZI1:
        cmp     r9, #0
        beq     LAZI8
        str     r8, [sp, #0x18]
        ldr     r11, [sp]
        ldr     r8, [sp, #4]
        ldr     r9, [sp, #8]
LAZI2:
        ldr     r0, [pc, #0x2E0]
        ldr     r4, [pc, #0x2E0]
        ldr     r1, [sp, #0x30]
        mul     r9, r9, r0
        ldr     r2, [sp, #0x34]
        sub     r1, r11, r1
        str     r8, [sp, #0x30]
        add     r1, r1, r2
        add     r9, r9, r4
        mul     r7, r9, r0
        mov     r5, r1, asr #31
        and     r2, r5, #0x12
        sub     r10, r1, r2
        add     r0, r9, r10
        sub     r8, r8, r11
        add     r5, r8, r5
        bl      __floatsidf
        mov     r6, #1
        sub     r6, r6, #0xBE, 30
        mov     r2, r6
        mvn     r3, #0xC2, 8
        add     r9, r7, r4
        mov     r12, r5, asr #31
        str     r12, [sp, #0x34]
        and     r4, r12, #0x12
        bl      __muldf3
        sub     r8, r5, r4
        mov     r7, r0
        str     r7, [sp, #0x38]
        mov     r11, r1
        str     r11, [sp, #0x3C]
        add     r2, r9, r8
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r6
        mvn     r3, #0xC2, 8
        bl      __muldf3
        mov     r5, r0
        mov     r4, r1
        mov     r0, r7
        mov     r2, r7
        mov     r1, r11
        mov     r3, r11
        bl      __muldf3
        mov     r6, r0
        mov     r7, r1
        mov     r0, r5
        mov     r1, r4
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        mov     r12, #0xFE, 12
        orr     r12, r12, #3, 4
        add     r3, r12, #1, 12
        mov     r7, r0
        mov     r6, r1
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        mov     r11, r10
        bge     LAZI2
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        cmp     r0, #0
        beq     LAZI2
        str     r8, [sp, #4]
        ldr     r8, [sp, #0x18]
        str     r9, [sp, #8]
        str     r11, [sp]
        mov     r1, r6
        mov     r0, r7
        bl      log
        mov     r2, #0
        mov     r3, #3, 2
        bl      __muldf3
        mov     r2, r7
        mov     r3, r6
        bl      __divdf3
        bl      sqrt
        mov     r7, r0
        mov     r6, r1
        mov     r9, #0
LAZI3:
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r5, r0
        mov     r10, r1
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        mov     r12, #0xFE, 12
        cmp     r0, #0
        orr     r4, r12, #3, 4
        ble     LAZI4
        mov     r1, r4
        mov     r2, r5
        mov     r3, r10
        mov     r0, #0
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        b       LAZI5
LAZI4:
        mov     r0, r5
        mov     r1, r10
        mov     r3, r4
        mov     r2, #0
        bl      __subdf3
        mov     r2, r0
        mov     r3, r1
LAZI5:
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        mov     r10, #0
        bl      __adddf3
        bl      __fixdfsi
        bl      __floatsidf
        ldr     r3, [pc, #0xF0]
        mov     r11, r0
        mov     r5, r1
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        movlt   r10, r11
        ldr     r11, [pc, #0xD4]
        mov     r0, r10
        sub     r3, r4, #0x7F, 8
        movlt   r11, r5
        mov     r1, r11
        mov     r2, #0
        bl      __gtdf2
        ldr     r1, [sp, #0x2C]
        cmp     r0, #0
        mov     r0, #0
        movgt   r0, r10
        movgt   r1, r11
        bl      __fixdfsi
        ldr     r12, [sp, #0xC]
        add     r8, r8, #1
        strh    r0, [r12], #2
        ldr     lr, [sp, #0x10]
        str     r12, [sp, #0xC]
        cmp     r8, lr
        blt     LAZI1
        ldr     r5, [sp, #0x14]
LAZI6:
        ldr     r12, [sp, #8]
        cmp     r9, #0
        str     r12, [r5, #0xC]
        ldr     r12, [sp, #4]
        str     r12, [r5, #0x10]
        ldr     r12, [sp]
        str     r12, [r5, #0x14]
        ldr     r12, [sp, #0x30]
        str     r12, [r5, #0x18]
        ldr     r12, [sp, #0x34]
        str     r9, [r5, #0x20]
        str     r12, [r5, #0x1C]
        bne     LAZI7
        str     r7, [r5, #0x28]
        str     r6, [r5, #0x2C]
        ldr     r0, [sp, #0x38]
        str     r0, [r5, #0x30]
        ldr     r0, [sp, #0x3C]
        str     r0, [r5, #0x34]
LAZI7:
        mov     r0, #0
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LAZI8:
        ldr     r5, [sp, #0x38]
        ldr     r4, [sp, #0x3C]
        mov     r9, #1
        b       LAZI3
LAZI9:
        mvn     r0, #7
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
LAZI10:
        mvn     r0, #5
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
        .long   0x00010dcd
        .long   0x3c6ef373
        .long   0x40dfffc0


