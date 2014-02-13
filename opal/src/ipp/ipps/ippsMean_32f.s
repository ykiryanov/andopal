        .text
        .align  4
        .globl  _ippsMean_32f


_ippsMean_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r9, r2
        beq     LBIA11
        cmp     r9, #0
        beq     LBIA11
        cmp     r7, #0
        ble     LBIA10
        subs    r3, r7, #4
        str     r3, [sp, #0x14]
        mov     r10, #0
        bmi     LBIA9
        sub     r3, r7, #4
        cmp     r3, #0x10
        blt     LBIA8
        mov     r11, r10
        add     r12, r8, #4
        str     r12, [sp, #8]
        add     r12, r8, #8
        str     r12, [sp, #0xC]
        mov     r4, r11
        add     r12, r8, #0xC
        sub     lr, r7, #0x14
        add     r0, r8, #0x10
        add     r1, r8, #0x14
        add     r2, r8, #0x18
        add     r3, r8, #0x1C
        mov     r6, r4
        str     r10, [sp]
        str     r9, [sp, #0x18]
        str     r7, [sp, #0x1C]
        str     r8, [sp, #0x20]
        mov     r5, r6
        str     r12, [sp, #0x10]
        str     lr, [sp, #4]
        mov     r10, r0
        mov     r9, r1
        mov     r8, r2
        mov     r7, r3
LBIA0:
        ldr     r0, [r10, #-0x10]
        ldr     r12, [sp]
        add     r12, r12, #0xC
        str     r12, [sp]
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r9, #-0x10]
        str     r0, [sp, #0x24]
        mov     r4, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r5
        mov     r2, r6
        bl      __adddf3
        ldr     r2, [r8, #-0x10]
        mov     r6, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [sp, #0x24]
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r7, #-0x10]
        str     r0, [sp, #0x24]
        mov     r4, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r5
        mov     r2, r6
        bl      __adddf3
        ldr     r2, [r10]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r2, [sp, #0x24]
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r9]
        mov     r4, r0
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        ldr     r2, [r8]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r11
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [r7]
        mov     r4, r0
        mov     r11, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r6
        mov     r2, r5
        bl      __adddf3
        ldr     r2, [r10, #0x10]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r3, r11
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [r9, #0x10]
        mov     r4, r0
        str     r1, [sp, #0x24]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r2, [r8, #0x10]
        mov     r5, r0
        mov     r6, r1
        mov     r0, r2
        bl      __extendsfdf2
        ldr     r3, [sp, #0x24]
        mov     r2, r4
        bl      __adddf3
        ldr     r2, [r7, #0x10]
        mov     r11, r0
        mov     r4, r1
        add     r10, r10, #0x30
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r6
        bl      __adddf3
        ldr     r12, [sp, #4]
        ldr     lr, [sp]
        add     r9, r9, #0x30
        add     r8, r8, #0x30
        add     r7, r7, #0x30
        cmp     lr, r12
        mov     r6, r0
        mov     r5, r1
        ble     LBIA0
        ldr     r12, [sp, #0x10]
        ldr     r10, [sp]
        ldr     r9, [sp, #0x18]
        ldr     r7, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
LBIA1:
        add     r0, r8, r10, lsl #2
        str     r7, [sp, #0x1C]
        str     r12, [sp, #0x10]
        str     r9, [sp, #0x18]
        str     r8, [sp, #0x20]
        mov     r7, r0
LBIA2:
        ldr     r0, [r7], #0x10
        bl      __extendsfdf2
        mov     r2, r11
        mov     r3, r4
        bl      __adddf3
        ldr     r12, [sp, #8]
        mov     r8, r1
        mov     r4, r0
        ldr     r2, [r12, +r10, lsl #2]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #0xC]
        mov     r6, r0
        mov     r5, r1
        ldr     r2, [r12, +r10, lsl #2]
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r8
        bl      __adddf3
        ldr     r12, [sp, #0x10]
        mov     r11, r0
        mov     r4, r1
        ldr     r2, [r12, +r10, lsl #2]
        add     r10, r10, #4
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp, #0x14]
        mov     r6, r0
        mov     r5, r1
        cmp     r10, r12
        ble     LBIA2
        ldr     r9, [sp, #0x18]
        ldr     r7, [sp, #0x1C]
        ldr     r8, [sp, #0x20]
LBIA3:
        mov     r0, r11
        mov     r1, r4
        mov     r2, r6
        mov     r3, r5
        bl      __adddf3
        cmp     r10, r7
        mov     r5, r0
        mov     r4, r1
        bge     LBIA7
        sub     r12, r7, r10
        cmp     r12, #6
        blt     LBIA5
        mov     r12, r10, lsl #2
        add     r12, r12, #4
        add     r6, r12, r8
        sub     r11, r7, #6
LBIA4:
        ldr     r0, [r6, #-4]
        add     r10, r10, #5
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        ldr     r2, [r6]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [r6, #4]
        mov     r5, r1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [r6, #8]
        mov     r5, r1
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        mov     r4, r0
        ldr     r0, [r6, #0xC]
        mov     r5, r1
        add     r6, r6, #0x14
        bl      __extendsfdf2
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        cmp     r10, r11
        mov     r5, r0
        mov     r4, r1
        ble     LBIA4
LBIA5:
        add     r8, r8, r10, lsl #2
LBIA6:
        ldr     r0, [r8], #4
        add     r10, r10, #1
        bl      __extendsfdf2
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        cmp     r10, r7
        mov     r5, r0
        mov     r4, r1
        blt     LBIA6
LBIA7:
        mov     r0, r7
        bl      __floatsidf
        mov     r2, r0
        mov     r3, r1
        mov     r0, r5
        mov     r1, r4
        bl      __divdf3
        bl      __truncdfsf2
        str     r0, [r9]
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBIA8:
        mov     r11, r10
        add     r12, r8, #4
        str     r12, [sp, #8]
        add     r12, r8, #8
        mov     r4, r11
        mov     r6, r4
        str     r12, [sp, #0xC]
        mov     r5, r6
        add     r12, r8, #0xC
        b       LBIA1
LBIA9:
        mov     r11, r10
        mov     r4, r11
        mov     r6, r4
        mov     r5, r6
        b       LBIA3
LBIA10:
        mvn     r0, #5
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LBIA11:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}


