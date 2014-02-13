        .text
        .align  4
        .globl  _ippsNorm_L2_32fc64f


_ippsNorm_L2_32fc64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        cmp     r0, #0
        mov     r8, r1
        mov     r11, r2
        beq     LBBF4
        cmp     r11, #0
        beq     LBBF4
        cmp     r8, #0
        ble     LBBF5
        bic     r12, r8, #1
        cmp     r12, #0
        mov     r1, #0
        ble     LBBF3
        mov     r10, r1
        mov     r9, r10
        mov     r6, r9
        mov     r7, r6
        str     r7, [sp, #0x1C]
        add     r5, r0, #0xC
        add     r4, r0, #4
        str     r9, [sp, #0x14]
        str     r10, [sp, #0x18]
        str     r6, [sp, #0x10]
        str     r12, [sp, #0xC]
        str     r11, [sp, #8]
        str     r8, [sp, #4]
        str     r0, [sp]
        mov     r7, r1
LBBF0:
        ldr     r0, [r4]
        add     r7, r7, #2
        bl      __extendsfdf2
        mov     r8, r0
        ldr     r0, [r4, #-4]
        mov     r6, r1
        add     r4, r4, #0x10
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r10, r1
        mov     r9, r0
        mov     r0, r8
        mov     r2, r8
        mov     r1, r6
        mov     r3, r6
        bl      __muldf3
        mov     r3, r10
        mov     r2, r9
        bl      __adddf3
        str     r1, [sp, #0x20]
        mov     r6, r0
        ldr     r0, [r5]
        bl      __extendsfdf2
        ldr     r2, [r5, #-4]
        mov     r9, r0
        mov     r8, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r0, r9
        mov     r1, r8
        mov     r2, r9
        mov     r3, r8
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        mov     r8, r0
        mov     r9, r1
        ldr     r0, [sp, #0x10]
        ldr     r1, [sp, #0x1C]
        ldr     r3, [sp, #0x20]
        mov     r2, r6
        bl      __adddf3
        str     r0, [sp, #0x10]
        str     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x14]
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        add     r5, r5, #0x10
        cmp     r7, r2
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        blt     LBBF0
        ldr     r9, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        ldr     r7, [sp, #0x1C]
        ldr     r6, [sp, #0x10]
        ldr     r11, [sp, #8]
        ldr     r8, [sp, #4]
        ldr     r0, [sp]
LBBF1:
        tst     r8, #1
        beq     LBBF2
        sub     r4, r0, #8
        add     r12, r4, r8, lsl #3
        ldr     r0, [r12, #4]
        bl      __extendsfdf2
        ldr     r8, [r4, +r8, lsl #3]
        mov     r5, r0
        mov     r4, r1
        mov     r0, r8
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        str     r0, [sp, #0x20]
        mov     r8, r1
        mov     r0, r5
        mov     r2, r5
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        mov     r3, r8
        bl      __adddf3
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        mov     r6, r0
        mov     r7, r1
LBBF2:
        mov     r0, r10
        mov     r1, r9
        mov     r2, r6
        mov     r3, r7
        bl      __adddf3
        bl      sqrt
        str     r0, [r11]
        mov     r0, #0
        str     r1, [r11, #4]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBBF3:
        mov     r10, r1
        mov     r9, r10
        mov     r6, r9
        mov     r7, r6
        b       LBBF1
LBBF4:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBBF5:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


