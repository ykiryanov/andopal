        .text
        .align  4
        .globl  _ippsNorm_L1_64fc64f


_ippsNorm_L1_64fc64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        cmp     r0, #0
        mov     r11, r2
        beq     LBBG4
        cmp     r11, #0
        beq     LBBG4
        cmp     r1, #0
        ble     LBBG5
        bic     r12, r1, #1
        cmp     r12, #0
        mov     r7, #0
        ble     LBBG3
        mov     r10, r7
        mov     r9, r10
        mov     r8, r9
        mov     r4, r8
        sub     r6, r0, #0xC
        sub     r5, r0, #0x1C
        str     r9, [sp, #0x10]
        str     r10, [sp, #0x18]
        str     r8, [sp, #0x14]
        str     r12, [sp, #0xC]
        str     r11, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LBBG0:
        ldr     r0, [r5, #0x1C]
        ldr     r1, [r5, #0x20]
        ldr     r9, [r5, #0x28]
        ldr     r8, [r5, #0x24]
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r3, r9
        mov     r1, r9
        mov     r2, r8
        mov     r0, r8
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        mov     r8, r0
        str     r1, [sp, #0x1C]
        ldr     r10, [r6, #0x28]
        ldr     r11, [r6, #0x24]
        ldr     r0, [r6, #0x1C]
        ldr     r1, [r6, #0x20]!
        add     r7, r7, #2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        str     r0, [sp, #0x20]
        mov     r9, r1
        mov     r3, r10
        mov     r1, r10
        mov     r2, r11
        mov     r0, r11
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        mov     r3, r9
        bl      __adddf3
        bl      sqrt
        mov     r10, r0
        ldr     r0, [sp, #0x14]
        ldr     r3, [sp, #0x1C]
        mov     r9, r1
        mov     r1, r4
        mov     r2, r8
        bl      __adddf3
        str     r0, [sp, #0x14]
        mov     r4, r1
        ldr     r0, [sp, #0x18]
        ldr     r1, [sp, #0x10]
        mov     r2, r10
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        add     r5, r5, #0x20
        cmp     r7, r2
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x10]
        blt     LBBG0
        ldr     r9, [sp, #0x10]
        ldr     r10, [sp, #0x18]
        ldr     r8, [sp, #0x14]
        ldr     r11, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBBG1:
        tst     r1, #1
        beq     LBBG2
        sub     r0, r0, #0x10
        add     r12, r0, r1, lsl #4
        ldr     r2, [r0, +r1, lsl #4]
        ldr     r3, [r12, #4]
        ldr     r7, [r12, #8]
        ldr     r5, [r12, #0xC]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [sp, #0x20]
        mov     r6, r1
        mov     r0, r7
        mov     r2, r7
        mov     r1, r5
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        mov     r3, r6
        bl      __adddf3
        bl      sqrt
        mov     r2, r8
        mov     r3, r4
        bl      __adddf3
        mov     r8, r0
        mov     r4, r1
LBBG2:
        mov     r0, r10
        mov     r1, r9
        mov     r2, r8
        mov     r3, r4
        bl      __adddf3
        str     r0, [r11]
        mov     r0, #0
        str     r1, [r11, #4]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBBG3:
        mov     r10, r7
        mov     r9, r10
        mov     r8, r9
        mov     r4, r8
        b       LBBG1
LBBG4:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBBG5:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


