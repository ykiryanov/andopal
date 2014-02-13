        .text
        .align  4
        .globl  _ippsNorm_L2_32f


_ippsNorm_L2_32f:
        stmdb   sp!, {r4 - r11, lr}
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r6, r2
        beq     LBBX3
        cmp     r6, #0
        beq     LBBX3
        cmp     r7, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r7, #6
        mov     r11, #0
        movlt   r5, r11
        movlt   r4, r5
        blt     LBBX1
        mov     r5, r11
        mov     r4, r5
        sub     r10, r7, #6
        add     r9, r8, #4
LBBX0:
        ldr     r0, [r9, #-4]
        add     r11, r11, #5
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r9]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [r9, #4]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [r9, #8]
        mov     r5, r1
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [r9, #0xC]
        mov     r5, r1
        add     r9, r9, #0x14
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        cmp     r11, r10
        mov     r5, r0
        mov     r4, r1
        ble     LBBX0
LBBX1:
        add     r8, r8, r11, lsl #2
LBBX2:
        ldr     r0, [r8], #4
        add     r11, r11, #1
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        cmp     r11, r7
        mov     r5, r0
        mov     r4, r1
        blt     LBBX2
        mov     r0, r5
        mov     r1, r4
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [r6]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBBX3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


