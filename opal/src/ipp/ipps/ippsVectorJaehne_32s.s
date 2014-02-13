        .text
        .align  4
        .globl  _ippsVectorJaehne_32s


_ippsVectorJaehne_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r11, r0
        cmp     r11, #0
        mov     r7, r1
        mov     r4, r2
        beq     LBMD6
        cmp     r7, #0
        ble     LBMD5
        cmp     r4, #0
        blt     LBMD7
        cmp     r7, #1
        mov     r10, #0
        beq     LBMD4
        mov     r0, r7
        bl      __floatsidf
        ldr     r6, [pc, #0x11C]
        ldr     r5, [pc, #0x11C]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r5
        bl      __divdf3
        cmp     r7, #0
        mov     r8, r0
        mov     r9, r1
        ble     LBMD3
        mov     r0, r4
        bl      __floatsidf
        mov     r12, #0xFE, 12
        orr     r4, r12, #3, 4
        mov     r6, r0
        mov     r5, r1
        str     r9, [sp, #4]
        str     r8, [sp]
LBMD0:
        mov     r0, r10
        bl      __floatsidf
        ldr     r2, [sp]
        ldr     r3, [sp, #4]
        mov     r9, r0
        mov     r8, r1
        bl      __muldf3
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        bl      sin
        mov     r2, r6
        mov     r3, r5
        bl      __muldf3
        mov     r9, r0
        mov     r8, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBMD1
        mov     r0, r9
        mov     r1, r8
        mov     r3, r4
        mov     r2, #0
        bl      __subdf3
        bl      __fixdfsi
        b       LBMD2
LBMD1:
        mov     r2, r9
        mov     r3, r8
        mov     r1, r4
        mov     r0, #0
        bl      __adddf3
        bl      __fixdfsi
LBMD2:
        add     r10, r10, #1
        str     r0, [r11], #4
        cmp     r10, r7
        blt     LBMD0
LBMD3:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBMD4:
        str     r10, [r11]
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBMD5:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBMD6:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LBMD7:
        mvn     r0, #0x25
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x3ff921fb


