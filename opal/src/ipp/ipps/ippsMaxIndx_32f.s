        .text
        .align  4
        .globl  _ippsMaxIndx_32f


_ippsMaxIndx_32f:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        mov     r4, r1
        mov     r5, r2
        mov     r8, r3
        beq     LBFR3
        cmp     r5, #0
        beq     LBFR3
        cmp     r4, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r8, #0
        beq     LBFR2
        ldr     r7, [r0]
        cmp     r4, #1
        mov     r11, #0
        ble     LBFR1
        add     r9, r0, #4
        mov     r10, #1
LBFR0:
        ldr     r6, [r9], #4
        mov     r1, r7
        mov     r0, r6
        bl      __gtsf2
        cmp     r0, #0
        movgt   r7, r6
        movgt   r11, r10
        add     r10, r10, #1
        cmp     r10, r4
        blt     LBFR0
LBFR1:
        str     r7, [r5]
        mov     r0, #0
        str     r11, [r8]
        ldmia   sp!, {r4 - r11, pc}
LBFR2:
        mov     r2, r5
        mov     r1, r4
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsMax_32f
LBFR3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


