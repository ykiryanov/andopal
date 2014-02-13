        .text
        .align  4
        .globl  _ippsSubC_8u_Sfs


_ippsSubC_8u_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        mov     r4, r1
        mov     r1, r2
        cmp     r12, #0
        mov     r2, r3
        bne     LATE0
        cmp     r4, #0
        ldmeqia sp!, {r4 - r11, lr}
        beq     _ippsCopy_8u
        b       LATE1
LATE0:
        cmp     r12, #8
        ble     LATE1
        cmp     r0, #0
        beq     LATE16
        mov     r0, r1
        mov     r1, r2
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_8u
LATE1:
        cmp     r0, #0
        beq     LATE16
        cmp     r1, #0
        beq     LATE16
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        cmp     r12, #0
        mov     lr, #0
        bne     LATE5
        cmp     r2, #6
        movlt   r12, #0
        blt     LATE3
        mov     r12, #0
        sub     r8, r2, #6
        mov     r7, r12
        sub     r6, r0, #1
        sub     r5, r1, #1
LATE2:
        ldrb    r9, [r6, #1]
        add     r12, r12, #5
        mov     r10, r7
        sub     r9, r9, r4
        cmp     r9, #0
        movgt   r10, r9
        strb    r10, [r5, #1]
        ldrb    r9, [r6, #2]
        mov     r10, r7
        sub     r9, r9, r4
        cmp     r9, #0
        movgt   r10, r9
        strb    r10, [r5, #2]
        ldrb    r9, [r6, #3]
        mov     r10, r7
        sub     r9, r9, r4
        cmp     r9, #0
        movgt   r10, r9
        strb    r10, [r5, #3]
        ldrb    r9, [r6, #4]
        mov     r10, r7
        sub     r9, r9, r4
        cmp     r9, #0
        movgt   r10, r9
        strb    r10, [r5, #4]
        ldrb    r9, [r6, #5]!
        mov     r10, r7
        sub     r9, r9, r4
        cmp     r9, #0
        movgt   r10, r9
        strb    r10, [r5, #5]!
        cmp     r12, r8
        ble     LATE2
LATE3:
        add     r0, r12, r0
        add     r1, r12, r1
LATE4:
        ldrb    r5, [r0], #1
        add     r12, r12, #1
        sub     r5, r5, r4
        cmp     r5, #0
        mov     r6, lr
        movgt   r6, r5
        strb    r6, [r1], #1
        cmp     r12, r2
        blt     LATE4
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LATE5:
        cmp     r12, #0
        ble     LATE10
        sub     r6, r12, #1
        mov     r5, #1
        mov     r6, r5, lsl r6
        cmp     r2, #5
        sub     r5, r6, #1
        movlt   r6, #0
        blt     LATE7
        mov     r6, #0
        sub     r9, r2, #5
        sub     r8, r0, #1
        sub     r7, r1, #1
LATE6:
        ldrb    r10, [r8, #1]
        add     r6, r6, #4
        sub     r11, r10, r4
        cmp     r11, #0
        mov     r10, lr
        movgt   r10, r11
        mov     r11, r10, asr r12
        add     r10, r5, r10
        and     r11, r11, #1
        add     r11, r10, r11
        mov     r10, r11, asr r12
        strb    r10, [r7, #1]
        ldrb    r10, [r8, #2]
        sub     r11, r10, r4
        cmp     r11, #0
        mov     r10, lr
        movgt   r10, r11
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r5, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        strb    r10, [r7, #2]
        ldrb    r10, [r8, #3]
        sub     r11, r10, r4
        cmp     r11, #0
        mov     r10, lr
        movgt   r10, r11
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r5, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        strb    r10, [r7, #3]
        ldrb    r10, [r8, #4]!
        sub     r11, r10, r4
        cmp     r11, #0
        mov     r10, lr
        movgt   r10, r11
        mov     r11, r10, asr r12
        and     r11, r11, #1
        add     r10, r5, r10
        add     r11, r10, r11
        mov     r10, r11, asr r12
        strb    r10, [r7, #4]!
        cmp     r6, r9
        ble     LATE6
LATE7:
        add     r0, r6, r0
        add     r1, r6, r1
        mov     lr, #0
LATE8:
        ldrb    r7, [r0], #1
        add     r6, r6, #1
        sub     r8, r7, r4
        cmp     r8, #0
        mov     r7, lr
        movgt   r7, r8
        mov     r8, r7, asr r12
        and     r8, r8, #1
        add     r7, r5, r7
        add     r8, r7, r8
        mov     r7, r8, asr r12
        strb    r7, [r1], #1
        cmp     r6, r2
        blt     LATE8
LATE9:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LATE10:
        cmn     r12, #7
        mov     r5, #0xFF
        bge     LATE12
        cmp     r2, #0
        ble     LATE9
        mov     r12, #0
LATE11:
        ldrb    lr, [r0], #1
        cmp     lr, r4
        movle   lr, #0
        movgt   lr, #0xFF
        add     r12, r12, #1
        strb    lr, [r1], #1
        cmp     r12, r2
        blt     LATE11
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LATE12:
        cmp     r2, #5
        rsb     r12, r12, #0
        movlt   r9, #0
        blt     LATE14
        mov     r9, #0
        sub     r8, r2, #5
        sub     r7, r0, #1
        sub     r6, r1, #1
LATE13:
        ldrb    r10, [r7, #1]
        add     r9, r9, #4
        mov     r11, lr
        sub     r10, r10, r4
        cmp     r10, #0
        movgt   r11, r10
        mov     r10, r11, lsl r12
        cmp     r10, #0xFF
        mov     r11, r5
        movlt   r11, r10
        strb    r11, [r6, #1]
        ldrb    r10, [r7, #2]
        mov     r11, lr
        sub     r10, r10, r4
        cmp     r10, #0
        movgt   r11, r10
        mov     r10, r11, lsl r12
        cmp     r10, #0xFF
        mov     r11, r5
        movlt   r11, r10
        strb    r11, [r6, #2]
        ldrb    r10, [r7, #3]
        mov     r11, lr
        sub     r10, r10, r4
        cmp     r10, #0
        movgt   r11, r10
        mov     r10, r11, lsl r12
        cmp     r10, #0xFF
        mov     r11, r5
        movlt   r11, r10
        strb    r11, [r6, #3]
        ldrb    r10, [r7, #4]!
        mov     r11, lr
        sub     r10, r10, r4
        cmp     r10, #0
        movgt   r11, r10
        mov     r10, r11, lsl r12
        cmp     r10, #0xFF
        mov     r11, r5
        movlt   r11, r10
        strb    r11, [r6, #4]!
        cmp     r9, r8
        ble     LATE13
LATE14:
        add     r0, r9, r0
        add     r1, r9, r1
        mov     r5, #0xFF
        mov     lr, #0
LATE15:
        ldrb    r6, [r0], #1
        add     r9, r9, #1
        sub     r6, r6, r4
        cmp     r6, #0
        mov     r7, lr
        movgt   r7, r6
        mov     r6, r7, lsl r12
        cmp     r6, #0xFF
        mov     r7, r5
        movlt   r7, r6
        strb    r7, [r1], #1
        cmp     r9, r2
        blt     LATE15
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LATE16:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


