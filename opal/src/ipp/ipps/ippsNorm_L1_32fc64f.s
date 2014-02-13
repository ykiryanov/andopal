        .text
        .align  4
        .globl  _ippsNorm_L1_32fc64f


_ippsNorm_L1_32fc64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        cmp     r0, #0
        mov     r9, r1
        mov     r11, r2
        beq     LBBH4
        cmp     r11, #0
        beq     LBBH4
        cmp     r9, #0
        ble     LBBH5
        bic     r12, r9, #1
        cmp     r12, #0
        mov     r1, #0
        ble     LBBH3
        mov     r10, r1
        mov     r4, r10
        mov     r7, r4
        mov     r8, r7
        str     r7, [sp, #0x18]
        add     r6, r0, #0xC
        add     r5, r0, #4
        str     r10, [sp, #0x10]
        str     r8, [sp, #0x14]
        str     r12, [sp, #0xC]
        str     r11, [sp, #8]
        str     r9, [sp, #4]
        str     r0, [sp]
        mov     r7, r1
LBBH0:
        ldr     r0, [r5]
        add     r7, r7, #2
        bl      __extendsfdf2
        mov     r9, r0
        ldr     r0, [r5, #-4]
        mov     r8, r1
        add     r5, r5, #0x10
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r2, r9
        mov     r0, r9
        mov     r3, r8
        mov     r1, r8
        bl      __muldf3
        mov     r3, r11
        mov     r2, r10
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        str     r0, [sp, #0x1C]
        ldr     r0, [r6]
        bl      __extendsfdf2
        mov     r9, r0
        ldr     r0, [r6, #-4]
        mov     r8, r1
        add     r6, r6, #0x10
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        mov     r10, r0
        mov     r11, r1
        mov     r3, r8
        mov     r1, r8
        mov     r2, r9
        mov     r0, r9
        bl      __muldf3
        mov     r2, r10
        mov     r3, r11
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        mov     r8, r0
        ldr     r0, [sp, #0x1C]
        bl      __extendsfdf2
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x14]
        bl      __adddf3
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        mov     r0, r8
        bl      __extendsfdf2
        ldr     r2, [sp, #0x10]
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [sp, #0xC]
        str     r0, [sp, #0x10]
        mov     r4, r1
        cmp     r7, r2
        blt     LBBH0
        ldr     r10, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        ldr     r7, [sp, #0x18]
        ldr     r11, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r0, [sp]
LBBH1:
        tst     r9, #1
        beq     LBBH2
        sub     r5, r0, #8
        add     r12, r5, r9, lsl #3
        ldr     r0, [r12, #4]
        bl      __extendsfdf2
        ldr     r9, [r5, +r9, lsl #3]
        mov     r6, r0
        mov     r5, r1
        mov     r0, r9
        bl      __extendsfdf2
        mov     r2, r0
        mov     r3, r1
        bl      __muldf3
        str     r0, [sp, #0x1C]
        mov     r9, r1
        mov     r0, r6
        mov     r2, r6
        mov     r1, r5
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        mov     r3, r9
        bl      __adddf3
        bl      sqrt
        bl      __truncdfsf2
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        mov     r7, r0
        mov     r8, r1
LBBH2:
        mov     r0, r10
        mov     r1, r4
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        str     r0, [r11]
        mov     r0, #0
        str     r1, [r11, #4]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBBH3:
        mov     r10, r1
        mov     r4, r10
        mov     r7, r4
        mov     r8, r7
        b       LBBH1
LBBH4:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LBBH5:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


