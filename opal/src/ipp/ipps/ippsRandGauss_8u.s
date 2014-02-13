        .text
        .align  4
        .globl  _ippsRandGauss_8u


_ippsRandGauss_8u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r9, r0
        cmp     r9, #0
        mov     r8, r1
        mov     r5, r2
        beq     LAZH9
        cmp     r5, #0
        beq     LAZH9
        cmp     r8, #0
        ble     LAZH10
        ldr     r3, [r5]
        cmp     r3, #0x26
        beq     LAZH0
        mvn     r0, #0x10
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAZH0:
        ldr     r12, [r5, #0x30]
        ldr     r7, [r5, #0x28]
        ldr     r6, [r5, #0x2C]
        str     r12, [sp, #0x34]
        ldr     r12, [r5, #0x34]
        cmp     r8, #0
        str     r12, [sp, #0x38]
        ldr     r12, [r5, #0xC]
        ldrb    r11, [r5, #8]
        ldrb    r0, [r5, #9]
        str     r12, [sp, #8]
        ldr     r12, [r5, #0x10]
        str     r12, [sp, #4]
        ldr     r12, [r5, #0x14]
        str     r12, [sp]
        ldr     r12, [r5, #0x18]
        str     r12, [sp, #0x2C]
        ldr     r12, [r5, #0x1C]
        str     r12, [sp, #0x30]
        ldr     r10, [r5, #0x20]
        ble     LAZH6
        bl      __floatunssidf
        mov     r4, r0
        mov     r0, r11
        mov     r11, r1
        bl      __floatunssidf
        mov     r3, #0
        mov     r2, #0
        str     r8, [sp, #0x10]
        str     r9, [sp, #0xC]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x24]
        str     r11, [sp, #0x20]
        str     r4, [sp, #0x1C]
        str     r5, [sp, #0x14]
        mov     r8, r2
        mov     r9, r3
LAZH1:
        cmp     r10, #0
        beq     LAZH8
        str     r8, [sp, #0x18]
        ldr     r11, [sp]
        ldr     r8, [sp, #4]
        ldr     r9, [sp, #8]
LAZH2:
        ldr     r0, [pc, #0x2E0]
        ldr     r4, [pc, #0x2E0]
        ldr     r1, [sp, #0x2C]
        mul     r9, r9, r0
        ldr     r2, [sp, #0x30]
        sub     r1, r11, r1
        str     r8, [sp, #0x2C]
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
        str     r12, [sp, #0x30]
        and     r4, r12, #0x12
        bl      __muldf3
        sub     r8, r5, r4
        mov     r7, r0
        str     r7, [sp, #0x34]
        mov     r11, r1
        str     r11, [sp, #0x38]
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
        bge     LAZH2
        mov     r0, r7
        mov     r1, r6
        mov     r2, #0
        mov     r3, #0
        bl      __eqdf2
        cmp     r0, #0
        beq     LAZH2
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
        mov     r9, #0
        mov     r7, r0
        mov     r6, r1
        mov     r10, #0
LAZH3:
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x20]
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r4, r0
        mov     r5, r1
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        mov     r12, #0xFE, 12
        cmp     r0, #0
        orr     r3, r12, #3, 4
        ble     LAZH4
        mov     r1, r3
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __adddf3
        mov     r2, r0
        mov     r3, r1
        b       LAZH5
LAZH4:
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        bl      __subdf3
        mov     r2, r0
        mov     r3, r1
LAZH5:
        ldr     r0, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        mov     r5, r9
        add     r8, r8, #1
        bl      __adddf3
        bl      __fixdfsi
        bl      __floatsidf
        ldr     r3, [pc, #0xEC]
        mov     r11, r0
        mov     r4, r1
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        movlt   r5, r11
        ldr     r11, [pc, #0xD0]
        mov     r0, r5
        mov     r2, #0
        movlt   r11, r4
        mov     r1, r11
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        mov     r0, r9
        mov     r1, r9
        movgt   r0, r5
        movgt   r1, r11
        bl      __fixunsdfsi
        ldr     r12, [sp, #0xC]
        strb    r0, [r12], #1
        ldr     lr, [sp, #0x10]
        str     r12, [sp, #0xC]
        cmp     r8, lr
        blt     LAZH1
        ldr     r5, [sp, #0x14]
LAZH6:
        ldr     r12, [sp, #8]
        cmp     r10, #0
        str     r12, [r5, #0xC]
        ldr     r12, [sp, #4]
        str     r12, [r5, #0x10]
        ldr     r12, [sp]
        str     r12, [r5, #0x14]
        ldr     r12, [sp, #0x2C]
        str     r12, [r5, #0x18]
        ldr     r12, [sp, #0x30]
        str     r10, [r5, #0x20]
        str     r12, [r5, #0x1C]
        bne     LAZH7
        str     r7, [r5, #0x28]
        str     r6, [r5, #0x2C]
        ldr     r0, [sp, #0x34]
        str     r0, [r5, #0x30]
        ldr     r0, [sp, #0x38]
        str     r0, [r5, #0x34]
LAZH7:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAZH8:
        ldr     r5, [sp, #0x34]
        ldr     r4, [sp, #0x38]
        mov     r10, #1
        b       LAZH3
LAZH9:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LAZH10:
        mvn     r0, #5
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x00010dcd
        .long   0x3c6ef373
        .long   0x406fe000


