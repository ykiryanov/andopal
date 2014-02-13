        .text
        .align  4
        .globl  _ippsNorm_L2_64f


_ippsNorm_L2_64f:
        stmdb   sp!, {r4 - r11, lr}
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r6, r2
        beq     LBBW3
        cmp     r6, #0
        beq     LBBW3
        cmp     r7, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r7, #6
        mov     r11, #0
        movlt   r5, r11
        movlt   r4, r5
        blt     LBBW1
        mov     r5, r11
        mov     r4, r5
        sub     r10, r7, #6
        sub     r9, r8, #4
LBBW0:
        ldr     r0, [r9, #4]
        ldr     r1, [r9, #8]
        add     r11, r11, #5
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r9, #0xC]
        mov     r5, r1
        ldr     r1, [r9, #0x10]
        mov     r4, r0
        mov     r0, r2
        mov     r3, r1
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [r9, #0x14]
        mov     r5, r1
        ldr     r1, [r9, #0x18]
        mov     r4, r0
        mov     r0, r2
        mov     r3, r1
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [r9, #0x1C]
        ldr     r3, [r9, #0x20]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r2, [r9, #0x24]
        ldr     r3, [r9, #0x28]!
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        cmp     r11, r10
        mov     r5, r0
        mov     r4, r1
        ble     LBBW0
LBBW1:
        mov     r12, r11, lsl #3
        sub     r12, r12, #4
        add     r8, r12, r8
LBBW2:
        ldr     r2, [r8, #4]
        ldr     r3, [r8, #8]!
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        add     r11, r11, #1
        cmp     r11, r7
        mov     r5, r0
        mov     r4, r1
        blt     LBBW2
        mov     r0, r5
        mov     r1, r4
        bl      sqrt
        str     r0, [r6]
        mov     r0, #0
        str     r1, [r6, #4]
        ldmia   sp!, {r4 - r11, pc}
LBBW3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


