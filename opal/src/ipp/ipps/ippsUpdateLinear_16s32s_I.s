        .text
        .align  4
        .globl  _ippsUpdateLinear_16s32s_I


_ippsUpdateLinear_16s32s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r4, [sp, #0x44]
        mov     r7, r0
        cmp     r7, #0
        mov     r10, r1
        mov     r11, r2
        beq     LANL10
        cmp     r11, #0
        beq     LANL10
        cmp     r10, #0
        ble     LANL11
        cmp     r3, #0xF
        mov     r12, #0xF
        movgt   r3, r12
        cmp     r3, #0
        mov     r9, #0
        mov     r8, r9
        mov     r0, r4
        movgt   r8, r3
        bl      __floatsidf
        str     r0, [sp, #0x14]
        str     r1, [sp, #0x10]
        rsb     r0, r4, #1
        bl      __floatsidf
        ldr     r2, [r11]
        str     r1, [sp, #0x18]
        mov     r4, r0
        mov     r0, r2
        bl      __floatsidf
        cmp     r8, #0
        mov     r5, r0
        mov     r6, r1
        bne     LANL3
        cmp     r10, #6
        blt     LANL1
        sub     r12, r10, #6
        mov     r8, r7
        str     r11, [sp, #4]
        str     r10, [sp, #8]
        str     r7, [sp, #0xC]
        ldr     r7, [sp, #0x18]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        str     r12, [sp]
LANL0:
        mov     r2, r5
        mov     r3, r6
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        ldrsh   r2, [r8]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r7
        bl      __muldf3
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldrsh   r2, [r8, #2]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r7
        bl      __muldf3
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldrsh   r2, [r8, #4]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r7
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldrsh   r2, [r8, #6]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r7
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        mov     r2, r11
        mov     r3, r10
        bl      __muldf3
        ldrsh   r2, [r8, #8]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r2
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r7
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp]
        add     r9, r9, #5
        add     r8, r8, #0xA
        cmp     r9, r12
        mov     r5, r0
        mov     r6, r1
        ble     LANL0
        ldr     r11, [sp, #4]
        ldr     r10, [sp, #8]
        ldr     r7, [sp, #0xC]
LANL1:
        str     r11, [sp, #4]
        ldr     r8, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        add     r7, r7, r9, lsl #1
LANL2:
        mov     r0, r11
        mov     r2, r5
        mov     r3, r6
        mov     r1, r8
        bl      __muldf3
        mov     r5, r0
        ldrsh   r0, [r7], #2
        mov     r6, r1
        add     r9, r9, #1
        bl      __floatsidf
        ldr     r3, [sp, #0x18]
        mov     r2, r4
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        cmp     r9, r10
        mov     r5, r0
        mov     r6, r1
        blt     LANL2
        ldr     r11, [sp, #4]
        b       LANL7
LANL3:
        cmp     r10, #6
        blt     LANL5
        sub     r12, r10, #6
        str     r10, [sp, #8]
        mov     r0, r7
        str     r7, [sp, #0xC]
        mov     r2, r5
        mov     r10, r8
        ldr     r5, [sp, #0x18]
        ldr     r7, [sp, #0x10]
        ldr     r8, [sp, #0x14]
        str     r11, [sp, #4]
        mov     r11, r9
        str     r12, [sp]
        mov     r9, r0
LANL4:
        mov     r3, r6
        mov     r0, r8
        mov     r1, r7
        bl      __muldf3
        ldrsh   r12, [r9]
        str     r0, [sp, #0x1C]
        mov     r0, r12, asr r10
        mov     r6, r1
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        mov     r3, r6
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        ldrsh   r12, [r9, #2]
        str     r0, [sp, #0x1C]
        mov     r0, r12, asr r10
        mov     r6, r1
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        mov     r3, r6
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        ldrsh   r12, [r9, #4]
        str     r0, [sp, #0x1C]
        mov     r6, r1
        mov     r0, r12, asr r10
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        mov     r3, r6
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        ldrsh   r12, [r9, #6]
        str     r0, [sp, #0x1C]
        mov     r6, r1
        mov     r0, r12, asr r10
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r2, [sp, #0x1C]
        mov     r3, r6
        bl      __adddf3
        mov     r2, r8
        mov     r3, r7
        bl      __muldf3
        ldrsh   r12, [r9, #8]
        mov     r6, r0
        mov     r0, r12, asr r10
        str     r1, [sp, #0x1C]
        bl      __floatsidf
        mov     r2, r4
        mov     r3, r5
        bl      __muldf3
        ldr     r3, [sp, #0x1C]
        mov     r2, r6
        bl      __adddf3
        ldr     r12, [sp]
        add     r11, r11, #5
        add     r9, r9, #0xA
        mov     r2, r0
        cmp     r11, r12
        mov     r6, r1
        ble     LANL4
        mov     r5, r2
        mov     r8, r10
        mov     r9, r11
        ldr     r11, [sp, #4]
        ldr     r10, [sp, #8]
        ldr     r7, [sp, #0xC]
LANL5:
        str     r11, [sp, #4]
        str     r10, [sp, #8]
        ldr     r10, [sp, #0x10]
        ldr     r11, [sp, #0x14]
        add     r7, r7, r9, lsl #1
LANL6:
        mov     r2, r5
        mov     r3, r6
        mov     r0, r11
        mov     r1, r10
        bl      __muldf3
        ldrsh   r12, [r7], #2
        mov     r5, r0
        add     r9, r9, #1
        mov     r0, r12, asr r8
        mov     r6, r1
        bl      __floatsidf
        ldr     r3, [sp, #0x18]
        mov     r2, r4
        bl      __muldf3
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp, #8]
        mov     r5, r0
        cmp     r9, r12
        mov     r6, r1
        blt     LANL6
        ldr     r11, [sp, #4]
LANL7:
        mov     r0, r5
        mov     lr, #0
        mvn     r12, #0xE2, 12
        sub     r2, lr, #1, 10
        bic     r3, r12, #0xB, 4
        mov     r1, r6
        bl      __ledf2
        cmp     r0, #0
        mvngt   r0, #2, 2
        strgt   r0, [r11]
        bgt     LANL9
        mov     r0, r5
        mov     r12, #0x1E, 12
        orr     r3, r12, #3, 2
        mov     r1, r6
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LANL8
        mov     r0, r5
        mov     r1, r6
        bl      __fixdfsi
        str     r0, [r11]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LANL8:
        mov     r0, #2, 2
        str     r0, [r11]
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LANL9:
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LANL10:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LANL11:
        mvn     r0, #5
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


