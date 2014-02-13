        .text
        .align  4
        .globl  _ippsPolarToCart_32sc


_ippsPolarToCart_32sc:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r9, [sp, #0x24]
        mov     r4, r2
        mov     r12, #1
        mov     r7, r0
        mov     r0, r12, lsl r4
        mov     r8, r3
        mov     r6, r1
        bl      __floatsidf
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        bl      __truncdfsf2
        cmp     r8, #0
        beq     LBAP3
        cmp     r7, #0
        beq     LBAP3
        cmp     r6, #0
        beq     LBAP3
        cmp     r9, #1
        blt     LBAP2
        cmp     r4, #0
        blt     LBAP2
        cmp     r4, #0x1F
        bgt     LBAP2
        cmp     r9, #0
        ble     LBAP1
        bl      __extendsfdf2
        mov     r5, r0
        mov     r4, r1
        sub     r8, r8, #4
LBAP0:
        ldr     r0, [r6]
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      cos
        ldr     r2, [r7]
        mov     r11, r0
        mov     r10, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [r8, #4]
        ldr     r0, [r6], #4
        bl      __floatsidf
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        bl      sin
        ldr     r2, [r7], #4
        mov     r11, r0
        mov     r10, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        bl      __fixdfsi
        str     r0, [r8, #8]!
        subs    r9, r9, #1
        bne     LBAP0
LBAP1:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBAP2:
        mvn     r0, #5
        ldmia   sp!, {r4 - r11, pc}
LBAP3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


