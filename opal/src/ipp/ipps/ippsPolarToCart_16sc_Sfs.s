        .text
        .align  4
        .globl  _ippsPolarToCart_16sc_Sfs


_ippsPolarToCart_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     lr, [sp, #0x40]
        ldr     r12, [sp, #0x44]
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r9, r2
        mov     r8, r3
        beq     LCYC11
        cmp     r6, #0
        beq     LCYC11
        cmp     r9, #0
        beq     LCYC11
        cmp     r8, #0
        ble     LCYC10
        cmp     lr, #0x1F
        mov     r5, #0x1F
        mov     r10, r5
        movlt   r10, lr
        mvn     r4, #0x1E
        cmp     r10, r4
        mov     lr, r4
        movgt   lr, r10
        cmp     r12, #0x1F
        movlt   r5, r12
        cmp     r5, r4
        movgt   r4, r5
        mov     r12, #0xFE, 12
        cmp     lr, #0
        orr     r11, r12, #3, 4
        ble     LCYC9
        mov     r12, #1
        mov     r0, r12, lsl lr
        bl      __floatsidf
        mov     r3, r1
        mov     r2, r0
        add     r1, r11, #1, 12
        mov     r0, #0
        bl      __divdf3
        mov     r10, r0
        mov     r5, r1
LCYC0:
        cmp     r4, #0
        ble     LCYC8
        mov     r12, #1
        mov     r0, r12, lsl r4
        bl      __floatsidf
        mov     r3, r1
        mov     r2, r0
        add     r1, r11, #1, 12
        mov     r0, #0
        bl      __divdf3
LCYC1:
        cmp     r8, #0
        ble     LCYC7
        ldr     r12, [pc, #0x2A0]
        sub     r11, r11, #0x7F, 8
        mov     lr, #0
        str     r1, [sp, #0xC]
        str     r0, [sp, #4]
        str     r5, [sp, #0x10]
        str     r10, [sp]
        str     r11, [sp, #8]
LCYC2:
        ldrsh   r0, [r6], #2
        bl      __floatsidf
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xC]
        bl      __muldf3
        ldr     r3, [pc, #0x270]
        ldr     r10, [pc, #0x270]
        mov     r4, r0
        mov     r5, r1
        mov     r2, r10
        bl      __divdf3
        bl      floor
        ldr     r3, [pc, #0x254]
        mov     r2, r10
        bl      __muldf3
        mov     r2, r0
        mov     r3, r1
        mov     r0, r4
        mov     r1, r5
        bl      __subdf3
        mov     r11, r0
        mov     r10, r1
        bl      cos
        mov     r4, r0
        mov     r5, r1
        mov     r1, r10
        mov     r0, r11
        bl      sin
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x18]
        ldrsh   r0, [r7], #2
        bl      __floatsidf
        ldr     r2, [sp]
        ldr     r3, [sp, #0x10]
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r10
        mov     r1, r11
        bl      __muldf3
        mov     r11, r0
        mov     r10, r1
        mov     r0, r4
        mov     r1, r5
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LCYC3
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r2, r4
        mov     r3, r5
        mov     r0, #0
        bl      __adddf3
        ldr     r3, [pc, #0x188]
        mov     r4, r0
        mov     r5, r1
        mov     r2, #0
        bl      __ltdf2
        ldr     r1, [pc, #0x174]
        cmp     r0, #0
        mov     r0, #0
        movlt   r0, r4
        movlt   r1, r5
        bl      __fixdfsi
        b       LCYC4
LCYC3:
        mov     r0, r4
        mov     r1, r5
        mov     r12, #0xFE, 12
        orr     r3, r12, #3, 4
        str     r3, [sp, #0x18]
        mov     r2, #0
        bl      __subdf3
        ldr     r12, [sp, #0x18]
        mov     r4, r0
        mov     r5, r1
        sub     r3, r12, #0x7F, 8
        mov     r2, #0
        bl      __gtdf2
        ldr     r1, [sp, #8]
        cmp     r0, #0
        mov     r0, #0
        movgt   r0, r4
        movgt   r1, r5
        bl      __fixdfsi
LCYC4:
        strh    r0, [r9]
        mov     r0, r11
        mov     r1, r10
        mov     r2, #0
        mov     r3, #0
        bl      __gtdf2
        cmp     r0, #0
        ble     LCYC5
        mov     r2, r11
        mov     r3, r10
        mov     r12, #0xFE, 12
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __adddf3
        ldr     r3, [pc, #0xD4]
        mov     r4, r0
        mov     r5, r1
        mov     r2, #0
        bl      __ltdf2
        ldr     r1, [pc, #0xC0]
        cmp     r0, #0
        mov     r0, #0
        movlt   r0, r4
        movlt   r1, r5
        bl      __fixdfsi
        b       LCYC6
LCYC5:
        mov     r0, r11
        mov     r1, r10
        mov     r12, #0xFE, 12
        orr     r10, r12, #3, 4
        mov     r2, #0
        mov     r3, r10
        bl      __subdf3
        mov     r4, r0
        mov     r5, r1
        sub     r3, r10, #0x7F, 8
        mov     r2, #0
        bl      __gtdf2
        ldr     r1, [sp, #8]
        cmp     r0, #0
        mov     r0, #0
        movgt   r0, r4
        movgt   r1, r5
        bl      __fixdfsi
LCYC6:
        strh    r0, [r9, #2]
        subs    r8, r8, #1
        add     r9, r9, #4
        bne     LCYC2
LCYC7:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCYC8:
        mov     r12, #1
        rsb     r4, r4, #0
        mov     r0, r12, lsl r4
        bl      __floatsidf
        b       LCYC1
LCYC9:
        rsb     lr, lr, #0
        mov     r12, #1
        mov     r0, r12, lsl lr
        bl      __floatsidf
        mov     r10, r0
        mov     r5, r1
        b       LCYC0
LCYC10:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LCYC11:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x40dfffc0
        .long   0x401921fb
        .long   0x54442d18


