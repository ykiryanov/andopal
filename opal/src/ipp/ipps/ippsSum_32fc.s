        .text
        .align  4
        .globl  _ippsSum_32fc


_ippsSum_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        cmp     r0, #0
        mov     r9, r1
        mov     r8, r2
        beq     LASP4
        cmp     r8, #0
        beq     LASP4
        cmp     r9, #0
        ble     LASP5
        cmp     r9, #6
        mov     r11, #0
        blt     LASP3
        mov     r7, r11
        mov     r6, r7
        mov     r5, r6
        sub     r12, r9, #6
        mov     r4, r5
        sub     r10, r0, #4
        str     r12, [sp, #0xC]
        str     r8, [sp, #8]
        str     r9, [sp, #4]
        str     r0, [sp]
LASP0:
        ldr     r0, [r10, #4]
        add     r11, r11, #5
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        mov     r8, r0
        ldr     r0, [r10, #8]
        mov     r9, r1
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r10, #0xC]
        mov     r7, r0
        mov     r6, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r9
        mov     r2, r8
        bl      __adddf3
        ldr     r2, [r10, #0x10]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r6
        mov     r2, r7
        bl      __adddf3
        ldr     r2, [r10, #0x14]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [r10, #0x18]
        mov     r8, r0
        mov     r9, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r7
        mov     r2, r6
        bl      __adddf3
        ldr     r2, [r10, #0x1C]
        mov     r5, r0
        mov     r4, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r8
        mov     r3, r9
        bl      __adddf3
        ldr     r2, [r10, #0x20]
        mov     r6, r0
        mov     r7, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r10, #0x24]
        mov     r5, r0
        mov     r4, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r7
        mov     r2, r6
        bl      __adddf3
        ldr     r2, [r10, #0x28]!
        mov     r7, r0
        mov     r6, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r12, [sp, #0xC]
        mov     r5, r0
        cmp     r11, r12
        mov     r4, r1
        ble     LASP0
        ldr     r8, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r0, [sp]
LASP1:
        mov     r12, r11, lsl #3
        sub     r12, r12, #4
        add     r10, r12, r0
LASP2:
        ldr     r0, [r10, #4]
        add     r11, r11, #1
        bl      __extendsfdf2
        mov     r2, r7
        mov     r3, r6
        bl      __adddf3
        mov     r7, r0
        ldr     r0, [r10, #8]!
        mov     r6, r1
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        cmp     r11, r9
        mov     r5, r0
        mov     r4, r1
        blt     LASP2
        mov     r0, r7
        mov     r1, r6
        bl      __truncdfsf2
        str     r0, [r8]
        mov     r0, r5
        mov     r1, r4
        bl      __truncdfsf2
        str     r0, [r8, #4]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LASP3:
        mov     r7, r11
        mov     r6, r7
        mov     r5, r6
        mov     r4, r5
        b       LASP1
LASP4:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LASP5:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


