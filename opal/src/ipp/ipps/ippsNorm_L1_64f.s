        .text
        .align  4
        .globl  _ippsNorm_L1_64f


_ippsNorm_L1_64f:
        stmdb   sp!, {r4 - r9, lr}
        mov     r7, r0
        cmp     r7, #0
        mov     r5, r1
        mov     r4, r2
        beq     LBCB3
        cmp     r4, #0
        beq     LBCB3
        cmp     r5, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        cmp     r5, #6
        mov     r6, #0
        movlt   r0, r6
        movlt   r1, r0
        blt     LBCB1
        mov     r0, r6
        mov     r1, r0
        sub     r9, r5, #6
        sub     r8, r7, #4
LBCB0:
        ldr     r3, [r8, #8]
        ldr     r2, [r8, #4]
        add     r6, r6, #5
        bic     r3, r3, #2, 2
        bl      __adddf3
        ldr     r3, [r8, #0x10]
        ldr     r2, [r8, #0xC]
        bic     r3, r3, #2, 2
        bl      __adddf3
        ldr     r3, [r8, #0x18]
        ldr     r2, [r8, #0x14]
        bic     r3, r3, #2, 2
        bl      __adddf3
        ldr     r3, [r8, #0x20]
        ldr     r2, [r8, #0x1C]
        bic     r3, r3, #2, 2
        bl      __adddf3
        ldr     r3, [r8, #0x28]
        ldr     r2, [r8, #0x24]
        bic     r3, r3, #2, 2
        bl      __adddf3
        cmp     r6, r9
        add     r8, r8, #0x28
        ble     LBCB0
LBCB1:
        mov     r3, r6, lsl #3
        sub     r3, r3, #4
        add     r7, r3, r7
LBCB2:
        ldr     r3, [r7, #8]
        ldr     r2, [r7, #4]
        add     r7, r7, #8
        bic     r3, r3, #2, 2
        bl      __adddf3
        add     r6, r6, #1
        cmp     r6, r5
        blt     LBCB2
        str     r0, [r4]
        mov     r0, #0
        str     r1, [r4, #4]
        ldmia   sp!, {r4 - r9, pc}
LBCB3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


