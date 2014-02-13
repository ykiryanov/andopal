        .text
        .align  4
        .globl  _ippsUpdatePower_16s32s_I


_ippsUpdatePower_16s32s_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r4, [sp, #0x48]
        mov     r10, r0
        cmp     r10, #0
        mov     r8, r1
        mov     r11, r2
        beq     LANK10
        cmp     r11, #0
        beq     LANK10
        cmp     r8, #0
        ble     LANK11
        cmp     r3, #0x1F
        mov     r12, #0x1F
        movgt   r3, r12
        cmp     r3, #0
        mov     r7, #0
        mov     r9, r7
        movgt   r9, r3
        mov     r0, r4
        bl      __floatsidf
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x14]
        rsb     r0, r4, #1
        bl      __floatsidf
        ldr     r2, [r11]
        str     r1, [sp, #0x1C]
        mov     r6, r0
        mov     r0, r2
        bl      __floatsidf
        cmp     r9, #0
        mov     r4, r0
        mov     r5, r1
        bne     LANK3
        cmp     r8, #5
        blt     LANK1
        sub     r12, r8, #5
        mov     r9, r10
        str     r11, [sp, #4]
        str     r8, [sp, #8]
        str     r10, [sp, #0xC]
        ldr     r8, [sp, #0x1C]
        ldr     r11, [sp, #0x14]
        ldr     r10, [sp, #0x18]
        str     r12, [sp]
LANK0:
        ldrsh   r12, [r9]
        mov     r2, r4
        mov     r3, r5
        mul     r12, r12, r12
        mov     r0, r10
        mov     r1, r11
        add     r7, r7, #4
        str     r12, [sp, #0x20]
        bl      __muldf3
        mov     r4, r0
        ldr     r0, [sp, #0x20]
        mov     r5, r1
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r8
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldrsh   r12, [r9, #2]
        mul     r12, r12, r12
        mov     r2, r10
        mov     r3, r11
        str     r12, [sp, #0x20]
        bl      __muldf3
        mov     r4, r0
        ldr     r0, [sp, #0x20]
        mov     r5, r1
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r8
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldrsh   r12, [r9, #4]
        mov     r2, r10
        mov     r3, r11
        mul     r5, r12, r12
        bl      __muldf3
        mov     r4, r0
        mov     r0, r5
        mov     r5, r1
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r8
        bl      __muldf3
        mov     r3, r5
        mov     r2, r4
        bl      __adddf3
        ldrsh   r12, [r9, #6]
        mul     r5, r12, r12
        mov     r2, r10
        mov     r3, r11
        bl      __muldf3
        mov     r4, r0
        mov     r0, r5
        mov     r5, r1
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r8
        bl      __muldf3
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r12, [sp]
        mov     r4, r0
        mov     r5, r1
        cmp     r7, r12
        add     r9, r9, #8
        ble     LANK0
        ldr     r11, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r10, [sp, #0xC]
LANK1:
        str     r11, [sp, #4]
        ldr     r9, [sp, #0x14]
        ldr     r11, [sp, #0x18]
        add     r10, r10, r7, lsl #1
        mov     r2, r4
LANK2:
        ldrsh   r12, [r10], #2
        mov     r3, r5
        mov     r0, r11
        mul     r4, r12, r12
        mov     r1, r9
        bl      __muldf3
        mov     r5, r0
        mov     r0, r4
        mov     r4, r1
        bl      __floatsidf
        ldr     r3, [sp, #0x1C]
        mov     r2, r6
        bl      __muldf3
        mov     r2, r5
        mov     r3, r4
        bl      __adddf3
        add     r7, r7, #1
        cmp     r7, r8
        mov     r2, r0
        mov     r5, r1
        blt     LANK2
        mov     r4, r2
        ldr     r11, [sp, #4]
        b       LANK7
LANK3:
        cmp     r8, #5
        blt     LANK5
        sub     r12, r8, #5
        str     r8, [sp, #8]
        mov     r2, r4
        mov     r3, r5
        mov     r8, r7
        ldr     r4, [sp, #0x1C]
        ldr     r7, [sp, #0x14]
        ldr     r5, [sp, #0x18]
        mov     r0, r10
        str     r10, [sp, #0xC]
        str     r12, [sp]
        str     r11, [sp, #4]
        mov     r10, r0
LANK4:
        ldrsh   r12, [r10]
        add     r8, r8, #4
        mov     r0, r5
        mul     r11, r12, r12
        mov     r1, r7
        bl      __muldf3
        str     r0, [sp, #0x20]
        mov     r0, r11, asr r9
        mov     r11, r1
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        mov     r3, r11
        bl      __adddf3
        ldrsh   r12, [r10, #2]
        mov     r2, r5
        mov     r3, r7
        mul     r11, r12, r12
        bl      __muldf3
        mov     r11, r11, asr r9
        str     r0, [sp, #0x20]
        mov     r0, r11
        mov     r11, r1
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        mov     r3, r11
        bl      __adddf3
        ldrsh   r12, [r10, #4]
        mov     r2, r5
        mov     r3, r7
        mul     r11, r12, r12
        bl      __muldf3
        mov     r11, r11, asr r9
        str     r0, [sp, #0x20]
        mov     r0, r11
        mov     r11, r1
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        mov     r3, r11
        bl      __adddf3
        ldrsh   r12, [r10, #6]
        mul     r11, r12, r12
        mov     r2, r5
        mov     r3, r7
        bl      __muldf3
        str     r0, [sp, #0x20]
        mov     r0, r11, asr r9
        mov     r11, r1
        bl      __floatsidf
        mov     r2, r6
        mov     r3, r4
        bl      __muldf3
        ldr     r2, [sp, #0x20]
        mov     r3, r11
        bl      __adddf3
        ldr     r12, [sp]
        mov     r2, r0
        mov     r3, r1
        add     r10, r10, #8
        cmp     r8, r12
        ble     LANK4
        mov     r4, r2
        mov     r5, r3
        mov     r7, r8
        ldr     r11, [sp, #4]
        ldr     r8, [sp, #8]
        ldr     r10, [sp, #0xC]
LANK5:
        str     r6, [sp, #0x10]
        mov     r2, r4
        ldr     r4, [sp, #0x1C]
        ldr     r6, [sp, #0x18]
        add     r10, r10, r7, lsl #1
        str     r11, [sp, #4]
LANK6:
        ldrsh   r12, [r10], #2
        ldr     r1, [sp, #0x14]
        mov     r3, r5
        mul     r11, r12, r12
        mov     r0, r6
        bl      __muldf3
        mov     r5, r0
        mov     r0, r11, asr r9
        mov     r11, r1
        bl      __floatsidf
        ldr     r2, [sp, #0x10]
        mov     r3, r4
        bl      __muldf3
        mov     r2, r5
        mov     r3, r11
        bl      __adddf3
        add     r7, r7, #1
        cmp     r7, r8
        mov     r2, r0
        mov     r5, r1
        blt     LANK6
        mov     r4, r2
        ldr     r11, [sp, #4]
LANK7:
        mov     r0, r4
        mov     lr, #0
        mvn     r12, #0xE2, 12
        sub     r2, lr, #1, 10
        bic     r3, r12, #0xB, 4
        mov     r1, r5
        bl      __ledf2
        cmp     r0, #0
        mvngt   r0, #2, 2
        strgt   r0, [r11]
        bgt     LANK9
        mov     r0, r4
        mov     r12, #0x1E, 12
        orr     r3, r12, #3, 2
        mov     r1, r5
        mov     r2, #0
        bl      __gedf2
        cmp     r0, #0
        blt     LANK8
        mov     r0, r4
        mov     r1, r5
        bl      __fixdfsi
        str     r0, [r11]
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LANK8:
        mov     r0, #2, 2
        str     r0, [r11]
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LANK9:
        mov     r0, #0
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LANK10:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LANK11:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


