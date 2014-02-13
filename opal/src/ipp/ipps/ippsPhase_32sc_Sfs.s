        .text
        .align  4
        .globl  _ippsPhase_32sc_Sfs


_ippsPhase_32sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        mov     r7, r0
        cmp     r7, #0
        mov     r6, r1
        mov     r8, r2
        beq     LBAV10
        cmp     r6, #0
        beq     LBAV10
        cmp     r8, #1
        blt     LBAV9
        mov     r12, #0xFE, 12
        cmp     r3, #0
        orr     r4, r12, #3, 4
        mov     r9, #0
        bne     LBAV3
        cmp     r8, #0
        ble     LBAV8
LBAV0:
        ldr     r0, [r7]
        bl      __floatsisf
        ldr     r1, [r7, #4]
        mov     r5, r0
        mov     r0, r1
        bl      __floatsisf
        mov     r1, r5
        bl      Arctan2
        bl      __extendsfdf2
        mov     r5, r0
        mov     r10, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBAV1
        mov     r0, r5
        mov     r1, r10
        mov     r3, r4
        mov     r2, #0
        bl      __subdf3
        b       LBAV2
LBAV1:
        mov     r1, r4
        mov     r2, r5
        mov     r3, r10
        mov     r0, #0
        bl      __adddf3
LBAV2:
        bl      __fixdfsi
        add     r9, r9, #1
        str     r0, [r6], #4
        cmp     r9, r8
        add     r7, r7, #8
        blt     LBAV0
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBAV3:
        rsb     r0, r3, #0
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r1, #1, 2
        mov     r0, #0
        bl      pow
        cmp     r8, #0
        ble     LBAV8
        mvn     r12, #0xE2, 12
        bic     r5, r12, #0xB, 4
        mvn     r12, #2, 2
        mov     lr, #2, 2
        str     r12, [sp, #8]
        str     r1, [sp]
        str     r0, [sp, #4]
LBAV4:
        ldr     r0, [r7]
        bl      __floatsidf
        mov     r11, r0
        ldr     r0, [r7, #4]
        mov     r10, r1
        bl      __floatsidf
        mov     r3, r10
        mov     r2, r11
        bl      atan2
        ldr     r2, [sp, #4]
        ldr     r3, [sp]
        bl      __muldf3
        mov     r11, r0
        mov     r10, r1
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        bge     LBAV5
        mov     r0, r11
        mov     r1, r10
        mov     r3, r4
        mov     r2, #0
        bl      __subdf3
        mov     r11, r0
        mov     r10, r1
        b       LBAV6
LBAV5:
        mov     r2, r11
        mov     r3, r10
        mov     r1, r4
        mov     r0, #0
        bl      __adddf3
        mov     r11, r0
        mov     r10, r1
LBAV6:
        mov     r3, r5
        mov     r0, r11
        mov     r12, #0
        sub     r2, r12, #1, 10
        mov     r1, r10
        bl      __gtdf2
        cmp     r0, #0
        ldrgt   r12, [sp, #8]
        strgt   r12, [r6]
        bgt     LBAV7
        mov     r0, r11
        sub     r3, r4, #0x7E, 8
        mov     r1, r10
        mov     r2, #0
        bl      __ltdf2
        cmp     r0, #0
        movlt   r12, #2, 2
        strlt   r12, [r6]
        blt     LBAV7
        mov     r0, r11
        mov     r1, r10
        bl      __fixdfsi
        str     r0, [r6]
LBAV7:
        add     r9, r9, #1
        cmp     r9, r8
        add     r7, r7, #8
        add     r6, r6, #4
        blt     LBAV4
LBAV8:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBAV9:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LBAV10:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


