        .text
        .align  4
        .globl  _ippsNorm_L2_64fc64f


_ippsNorm_L2_64fc64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        cmp     r0, #0
        mov     r11, r2
        beq     LBBE4
        cmp     r11, #0
        beq     LBBE4
        cmp     r1, #0
        ble     LBBE5
        bic     r12, r1, #1
        cmp     r12, #0
        mov     r6, #0
        ble     LBBE3
        mov     r10, r6
        mov     r9, r10
        mov     r7, r9
        mov     r8, r7
        sub     r5, r0, #0xC
        sub     r4, r0, #0x1C
        str     r9, [sp, #0x10]
        str     r10, [sp, #0x14]
        str     r8, [sp, #0x18]
        str     r7, [sp, #0x1C]
        str     r12, [sp, #0xC]
        str     r11, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LBBE0:
        ldr     r8, [r4, #0x24]
        ldr     r7, [r4, #0x28]
        ldr     r2, [r4, #0x1C]
        ldr     r3, [r4, #0x20]!
        add     r6, r6, #2
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        mov     r9, r0
        mov     r10, r1
        mov     r0, r8
        mov     r1, r7
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        mov     r3, r10
        mov     r2, r9
        bl      __adddf3
        ldr     r2, [r5, #0x1C]
        ldr     r3, [r5, #0x20]
        ldr     r11, [r5, #0x24]
        ldr     r10, [r5, #0x28]
        mov     r8, r0
        mov     r7, r1
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [sp, #0x20]
        mov     r9, r1
        mov     r1, r10
        mov     r3, r10
        mov     r0, r11
        mov     r2, r11
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        mov     r3, r9
        bl      __adddf3
        mov     r9, r0
        mov     r10, r1
        ldr     r0, [sp, #0x1C]
        ldr     r1, [sp, #0x18]
        mov     r2, r8
        mov     r3, r7
        bl      __adddf3
        str     r0, [sp, #0x1C]
        str     r1, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x10]
        mov     r2, r9
        mov     r3, r10
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        add     r5, r5, #0x20
        cmp     r6, r2
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        blt     LBBE0
        ldr     r9, [sp, #0x10]
        ldr     r10, [sp, #0x14]
        ldr     r8, [sp, #0x18]
        ldr     r7, [sp, #0x1C]
        ldr     r11, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LBBE1:
        tst     r1, #1
        beq     LBBE2
        sub     r0, r0, #0x10
        add     r12, r0, r1, lsl #4
        ldr     r2, [r0, +r1, lsl #4]
        ldr     r3, [r12, #4]
        ldr     r6, [r12, #8]
        ldr     r4, [r12, #0xC]
        mov     r0, r2
        mov     r1, r3
        bl      __muldf3
        str     r0, [sp, #0x20]
        mov     r5, r1
        mov     r0, r6
        mov     r2, r6
        mov     r1, r4
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        mov     r3, r5
        bl      __adddf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        mov     r7, r0
        mov     r8, r1
LBBE2:
        mov     r0, r10
        mov     r1, r9
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        bl      sqrt
        str     r0, [r11]
        mov     r0, #0
        str     r1, [r11, #4]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBBE3:
        mov     r10, r6
        mov     r9, r10
        mov     r7, r9
        mov     r8, r7
        b       LBBE1
LBBE4:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBBE5:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


