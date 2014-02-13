        .text
        .align  4
        .globl  _ippsSplitScaled_24s32f_D2L


_ippsSplitScaled_24s32f_D2L:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r7, r0
        cmp     r7, #0
        mov     r5, r1
        mov     r6, r3
        beq     LBLU9
        cmp     r2, #0
        ble     LBLU8
        cmp     r6, #0
        ble     LBLU8
        cmp     r5, #0
        beq     LBLU9
        cmp     r2, #0
        ble     LBLU1
        mov     r4, r5
        mov     lr, r2
LBLU0:
        ldr     r12, [r4], #4
        cmp     r12, #0
        beq     LBLU10
        subs    lr, lr, #1
        bne     LBLU0
LBLU1:
        cmp     r2, #0
        add     r9, r2, r2, lsl #1
        ble     LBLU7
        mov     r12, #0xE7, 12
        orr     r4, r12, #3, 4
        sub     r12, r6, #4
        str     r12, [sp, #0x10]
LBLU2:
        ldr     r12, [r5], #4
        cmp     r6, #0
        ble     LBLU6
        cmp     r6, #4
        mov     r11, #0
        movlt   r10, r11
        blt     LBLU4
        mov     r10, r11
        add     r8, r12, #4
        str     r12, [sp, #0xC]
        str     r5, [sp, #8]
        str     r6, [sp, #4]
        str     r2, [sp]
LBLU3:
        ldrb    r2, [r11, +r7]
        add     r1, r7, r11
        ldrb    r12, [r1, #1]
        ldrsb   r1, [r1, #2]
        add     r10, r10, #3
        add     r11, r11, r9
        orr     r12, r2, r12, lsl #8
        orr     r0, r12, r1, lsl #16
        bl      __floatsidf
        mov     r2, #0xF1, 4
        mov     r3, #0xFA, 10
        bl      __muldf3
        add     r5, r11, r9
        mov     r2, #0xF1, 4
        mov     r3, r4
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r8, #-4]
        ldrb    r1, [r11, +r7]
        add     r11, r7, r11
        ldrb    r12, [r11, #1]
        ldrsb   r2, [r11, #2]
        add     r6, r7, r5
        add     r11, r5, r9
        orr     r12, r1, r12, lsl #8
        orr     r0, r12, r2, lsl #16
        bl      __floatsidf
        mov     r2, #0xF1, 4
        mov     r3, #0xFA, 10
        bl      __muldf3
        mov     r2, #0xF1, 4
        mov     r3, r4
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r8]
        ldrb    r1, [r6, #1]
        ldrb    r5, [r5, +r7]
        ldrsb   r6, [r6, #2]
        orr     r1, r5, r1, lsl #8
        orr     r0, r1, r6, lsl #16
        bl      __floatsidf
        mov     r2, #0xF1, 4
        mov     r3, #0xFA, 10
        bl      __muldf3
        mov     r2, #0xF1, 4
        mov     r3, r4
        bl      __adddf3
        bl      __truncdfsf2
        ldr     r1, [sp, #0x10]
        str     r0, [r8, #4]
        cmp     r10, r1
        add     r8, r8, #0xC
        ble     LBLU3
        ldr     r12, [sp, #0xC]
        ldr     r5, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r2, [sp]
LBLU4:
        add     r8, r12, r10, lsl #2
        str     r2, [sp]
LBLU5:
        add     r2, r7, r11
        ldrb    lr, [r2, #1]
        ldrb    r12, [r11, +r7]
        ldrsb   r2, [r2, #2]
        add     r10, r10, #1
        add     r11, r11, r9
        orr     lr, r12, lr, lsl #8
        orr     r0, lr, r2, lsl #16
        bl      __floatsidf
        mov     r2, #0xF1, 4
        mov     r3, #0xFA, 10
        bl      __muldf3
        mov     r2, #0xF1, 4
        mov     r3, r4
        bl      __adddf3
        bl      __truncdfsf2
        str     r0, [r8], #4
        cmp     r10, r6
        blt     LBLU5
        ldr     r2, [sp]
LBLU6:
        subs    r2, r2, #1
        add     r7, r7, #3
        bne     LBLU2
LBLU7:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBLU8:
        mvn     r0, #5
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBLU9:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LBLU10:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


