        .text
        .align  4
        .globl  _ippsNormDiff_L2_32f


_ippsNormDiff_L2_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        cmp     r0, #0
        mov     r7, r2
        mov     r6, r3
        beq     LBCL3
        cmp     r1, #0
        beq     LBCL3
        cmp     r6, #0
        beq     LBCL3
        cmp     r7, #0
        ble     LBCL4
        cmp     r7, #5
        mov     r8, #0
        movlt   r5, r8
        movlt   r4, r5
        blt     LBCL1
        mov     r5, r8
        mov     r4, r5
        sub     r11, r7, #5
        add     r10, r1, #4
        add     r9, r0, #4
        str     r6, [sp]
        str     r7, [sp, #0xC]
        str     r1, [sp, #8]
        str     r0, [sp, #4]
LBCL0:
        ldr     r0, [r9, #-4]
        add     r8, r8, #4
        bl      __extendsfdf2
        mov     r6, r0
        ldr     r0, [r10, #-4]
        mov     r7, r1
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r1, r7
        mov     r0, r6
        bl      __subdf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r3, r4
        mov     r2, r5
        bl      __adddf3
        mov     r6, r0
        ldr     r0, [r10]
        mov     r7, r1
        bl      __extendsfdf2
        ldr     r2, [r9]
        mov     r5, r0
        mov     r4, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        mov     r6, r0
        ldr     r0, [r10, #4]
        mov     r7, r1
        bl      __extendsfdf2
        ldr     r2, [r9, #4]
        mov     r5, r0
        mov     r4, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        mov     r6, r0
        ldr     r0, [r10, #8]
        mov     r7, r1
        add     r10, r10, #0x10
        bl      __extendsfdf2
        mov     r5, r0
        ldr     r0, [r9, #8]
        mov     r4, r1
        add     r9, r9, #0x10
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __subdf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        cmp     r8, r11
        mov     r5, r0
        mov     r4, r1
        ble     LBCL0
        ldr     r6, [sp]
        ldr     r7, [sp, #0xC]
        ldr     r1, [sp, #8]
        ldr     r0, [sp, #4]
LBCL1:
        add     r10, r0, r8, lsl #2
        add     r9, r1, r8, lsl #2
        str     r6, [sp]
LBCL2:
        ldr     r0, [r10], #4
        add     r8, r8, #1
        bl      __extendsfdf2
        ldr     r2, [r9], #4
        mov     r6, r0
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        mov     r0, r6
        mov     r1, r11
        bl      __subdf3
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        cmp     r8, r7
        mov     r5, r0
        mov     r4, r1
        blt     LBCL2
        ldr     r6, [sp]
        mov     r0, r5
        mov     r1, r4
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r6]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBCL3:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LBCL4:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


