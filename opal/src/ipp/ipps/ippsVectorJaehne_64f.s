        .text
        .align  4
        .globl  _ippsVectorJaehne_64f


_ippsVectorJaehne_64f:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r9, r0
        cmp     r9, #0
        mov     r10, r1
        mov     r5, r2
        mov     r4, r3
        beq     LBMB4
        cmp     r10, #0
        ble     LBMB5
        mov     r0, r5
        mov     r1, r4
        mov     r2, #0
        mov     r3, #0
        bl      __ltdf2
        cmp     r0, #0
        blt     LBMB2
        cmp     r10, #1
        mov     r8, #0
        beq     LBMB3
        mov     r0, r10
        bl      __floatsidf
        ldr     r7, [pc, #0xAC]
        ldr     r6, [pc, #0xAC]
        mov     r2, r0
        mov     r3, r1
        mov     r0, r7
        mov     r1, r6
        bl      __divdf3
        cmp     r10, #0
        mov     r7, r0
        mov     r6, r1
        ble     LBMB1
        sub     r9, r9, #4
        str     r10, [sp]
LBMB0:
        mov     r0, r8
        bl      __floatsidf
        mov     r11, r0
        mov     r10, r1
        mov     r2, r7
        mov     r3, r6
        bl      __muldf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        bl      sin
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        str     r0, [r9, #4]
        str     r1, [r9, #8]!
        ldr     r12, [sp]
        add     r8, r8, #1
        cmp     r8, r12
        blt     LBMB0
LBMB1:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBMB2:
        mvn     r0, #0x25
        ldmia   sp!, {r1, r4 - r11, pc}
LBMB3:
        str     r8, [r9]
        str     r8, [r9, #4]
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LBMB4:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}
LBMB5:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
        .long   0x54442d18
        .long   0x3ff921fb


