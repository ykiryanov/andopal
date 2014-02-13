        .text
        .align  4
        .globl  _ippsVectorJaehne_8u


_ippsVectorJaehne_8u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        mov     r9, r0
        cmp     r9, #0
        mov     r6, r1
        mov     r10, r2
        beq     LBLZ9
        cmp     r6, #0
        ble     LBLZ8
        cmp     r6, #1
        mov     r8, #0
        bne     LBLZ0
        strb    r8, [r9]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBLZ0:
        mov     r0, r6
        bl      __floatsidf
        ldr     r5, [pc, #0x368]
        ldr     r4, [pc, #0x368]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        mov     r11, r0
        mov     r0, r6
        mov     r5, r1
        bl      _ippsMalloc_64f
        mov     r7, r0
        cmp     r7, #0
        beq     LBLZ10
        cmp     r6, #0
        ble     LBLZ2
        mov     r0, r10
        bl      __floatunssidf
        str     r10, [sp, #0xC]
        mov     r2, r8
        str     r8, [sp, #8]
        str     r9, [sp, #0x10]
        mov     r10, r11
        sub     r4, r7, #4
        str     r1, [sp]
        str     r7, [sp, #4]
        mov     r8, r0
        mov     r11, r2
        mov     r9, r5
LBLZ1:
        mov     r0, r11
        bl      __floatsidf
        mov     r7, r0
        mov     r5, r1
        mov     r2, r10
        mov     r3, r9
        bl      __muldf3
        mov     r2, r7
        mov     r3, r5
        bl      __muldf3
        bl      sin
        ldr     r3, [sp]
        mov     r2, r8
        bl      __muldf3
        add     r11, r11, #1
        str     r0, [r4, #4]
        str     r1, [r4, #8]!
        cmp     r11, r6
        blt     LBLZ1
        ldr     r7, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r10, [sp, #0xC]
        ldr     r9, [sp, #0x10]
LBLZ2:
        add     r2, sp, #0x18
        mov     r1, r6
        mov     r0, r7
        bl      _ippsMax_64f
        add     r2, sp, #0x20
        mov     r1, r6
        mov     r0, r7
        bl      _ippsMin_64f
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x1C]
        ldr     r5, [sp, #0x20]
        ldr     r4, [sp, #0x24]
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        str     r1, [sp]
        mov     r11, r0
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        movle   r0, r8
        movle   r1, r0
        ble     LBLZ3
        mov     r0, r10
        bl      __floatunssidf
        ldr     r3, [sp]
        mov     r2, r11
        bl      __divdf3
LBLZ3:
        cmp     r6, #0
        ble     LBLZ7
        cmp     r6, #6
        blt     LBLZ5
        sub     r12, r6, #6
        sub     r10, r7, #4
        str     r7, [sp, #4]
        str     r6, [sp, #0x14]
        sub     r11, r9, #1
        str     r9, [sp, #0x10]
        mov     r7, r5
        mov     r6, r4
        str     r12, [sp, #0xC]
        mov     r5, r0
        mov     r4, r1
        mov     r9, r8
LBLZ4:
        ldr     r0, [r10, #4]
        ldr     r1, [r10, #8]
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r12, #0xFE, 12
        orr     r8, r12, #3, 4
        mov     r3, r8
        bl      __adddf3
        bl      __fixunsdfsi
        strb    r0, [r11, #1]
        ldr     r0, [r10, #0xC]
        ldr     r1, [r10, #0x10]
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r8
        bl      __adddf3
        bl      __fixunsdfsi
        strb    r0, [r11, #2]
        ldr     r0, [r10, #0x14]
        ldr     r1, [r10, #0x18]
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r8
        bl      __adddf3
        bl      __fixunsdfsi
        strb    r0, [r11, #3]
        ldr     r0, [r10, #0x1C]
        ldr     r1, [r10, #0x20]
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r8
        bl      __adddf3
        bl      __fixunsdfsi
        strb    r0, [r11, #4]
        ldr     r0, [r10, #0x24]
        ldr     r1, [r10, #0x28]!
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r2, #0
        mov     r3, r8
        bl      __adddf3
        bl      __fixunsdfsi
        ldr     r12, [sp, #0xC]
        add     r9, r9, #5
        strb    r0, [r11, #5]!
        cmp     r9, r12
        ble     LBLZ4
        mov     r1, r4
        mov     r4, r6
        mov     r0, r5
        mov     r5, r7
        mov     r8, r9
        ldr     r7, [sp, #4]
        ldr     r6, [sp, #0x14]
        ldr     r9, [sp, #0x10]
LBLZ5:
        mov     r12, r8, lsl #3
        sub     r12, r12, #4
        add     r11, r12, r7
        str     r7, [sp, #4]
        str     r6, [sp, #0x14]
        mov     lr, #0xFE, 12
        mov     r7, r5
        mov     r6, r4
        orr     r10, lr, #3, 4
        add     r9, r8, r9
        mov     r5, r0
        mov     r4, r1
LBLZ6:
        ldr     r0, [r11, #4]
        ldr     r1, [r11, #8]!
        mov     r2, r7
        mov     r3, r6
        bl      __subdf3
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        mov     r3, r10
        mov     r2, #0
        bl      __adddf3
        bl      __fixunsdfsi
        strb    r0, [r9], #1
        ldr     r12, [sp, #0x14]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LBLZ6
        ldr     r7, [sp, #4]
LBLZ7:
        mov     r0, r7
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBLZ8:
        mvn     r0, #5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBLZ9:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBLZ10:
        mvn     r0, #8
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x3ff921fb


