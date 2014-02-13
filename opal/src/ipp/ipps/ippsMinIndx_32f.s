        .text
        .align  4
        .globl  _ippsMinIndx_32f


_ippsMinIndx_32f:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        mov     r4, r1
        mov     r5, r2
        mov     r8, r3
        beq     LBFP3
        cmp     r5, #0
        beq     LBFP3
        cmp     r4, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r8, #0
        beq     LBFP2
        ldr     r7, [r0]
        cmp     r4, #1
        mov     r11, #0
        ble     LBFP1
        add     r9, r0, #4
        mov     r10, #1
LBFP0:
        ldr     r6, [r9], #4
        mov     r1, r7
        mov     r0, r6
        bl      __ltsf2
        cmp     r0, #0
        movlt   r7, r6
        movlt   r11, r10
        add     r10, r10, #1
        cmp     r10, r4
        blt     LBFP0
LBFP1:
        str     r7, [r5]
        mov     r0, #0
        str     r11, [r8]
        ldmia   sp!, {r4 - r11, pc}
LBFP2:
        mov     r2, r5
        mov     r1, r4
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsMin_32f
LBFP3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


