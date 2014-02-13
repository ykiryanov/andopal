        .text
        .align  4
        .globl  _ippsSubC_8u_ISfs


_ippsSubC_8u_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r3, #8
        bgt     LATF8
        cmp     r1, #0
        beq     LATF15
        cmp     r2, #0
        ble     LATF16
        cmp     r3, #0
        mov     lr, #0
        bne     LATF3
        cmp     r0, #0
        beq     LATF7
        cmp     r2, #6
        movlt   r12, #0
        blt     LATF1
        mov     r12, #0
        sub     r6, r2, #6
        mov     r5, r12
        sub     r4, r1, #1
LATF0:
        ldrb    r8, [r4, #1]
        ldrb    r7, [r4, #2]
        ldrb    r3, [r4, #3]
        sub     r8, r8, r0
        cmp     r8, #0
        mov     r9, r5
        movgt   r9, r8
        sub     r7, r7, r0
        cmp     r7, #0
        mov     r8, r5
        movgt   r8, r7
        ldrb    r7, [r4, #4]
        sub     r3, r3, r0
        strb    r8, [r4, #2]
        cmp     r3, #0
        mov     r8, r5
        movgt   r8, r3
        ldrb    r3, [r4, #5]
        sub     r7, r7, r0
        strb    r8, [r4, #3]
        cmp     r7, #0
        mov     r8, r5
        movgt   r8, r7
        sub     r3, r3, r0
        cmp     r3, #0
        mov     r7, r5
        movgt   r7, r3
        add     r12, r12, #5
        strb    r9, [r4, #1]
        strb    r8, [r4, #4]
        strb    r7, [r4, #5]!
        cmp     r12, r6
        ble     LATF0
LATF1:
        add     r1, r12, r1
LATF2:
        ldrb    r3, [r1]
        add     r12, r12, #1
        mov     r4, lr
        sub     r3, r3, r0
        cmp     r3, #0
        movgt   r4, r3
        strb    r4, [r1], #1
        cmp     r12, r2
        blt     LATF2
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LATF3:
        cmp     r3, #0
        ble     LATF9
        sub     r12, r3, #1
        mov     r4, #1
        mov     r12, r4, lsl r12
        cmp     r2, #5
        sub     r12, r12, #1
        movlt   r7, #0
        blt     LATF5
        mov     r7, #0
        sub     r6, r2, #5
        mov     r4, r7
        sub     r5, r1, #1
        str     r1, [sp, #4]
        str     r2, [sp]
LATF4:
        ldrb    r2, [r5, #1]
        ldrb    r1, [r5, #2]
        add     r7, r7, #4
        sub     lr, r2, r0
        mov     r2, #0
        cmp     lr, #0
        movgt   r2, lr
        ldrb    lr, [r5, #3]
        mov     r4, #0
        sub     r1, r1, r0
        cmp     r1, #0
        movgt   r4, r1
        ldrb    r1, [r5, #4]
        sub     lr, lr, r0
        mov     r11, #0
        cmp     lr, #0
        movgt   r11, lr
        sub     lr, r1, r0
        mov     r1, #0
        cmp     lr, #0
        movgt   r1, lr
        add     r9, r12, r2
        mov     lr, r4, asr r3
        mov     r8, r11, asr r3
        mov     r10, r1, asr r3
        mov     r2, r2, asr r3
        and     r2, r2, #1
        and     lr, lr, #1
        and     r8, r8, #1
        and     r10, r10, #1
        add     r4, r12, r4
        add     r11, r12, r11
        add     r1, r12, r1
        add     r2, r9, r2
        add     lr, r4, lr
        add     r8, r11, r8
        add     r10, r1, r10
        mov     r2, r2, asr r3
        mov     lr, lr, asr r3
        mov     r8, r8, asr r3
        mov     r10, r10, asr r3
        strb    r2, [r5, #1]
        strb    lr, [r5, #2]
        strb    r8, [r5, #3]
        strb    r10, [r5, #4]!
        cmp     r7, r6
        ble     LATF4
        ldr     r1, [sp, #4]
        ldr     r2, [sp]
        mov     lr, #0
LATF5:
        add     r1, r7, r1
LATF6:
        ldrb    r4, [r1]
        add     r7, r7, #1
        sub     r5, r4, r0
        cmp     r5, #0
        mov     r4, lr
        movgt   r4, r5
        mov     r5, r4, asr r3
        and     r5, r5, #1
        add     r4, r12, r4
        add     r5, r4, r5
        mov     r4, r5, asr r3
        strb    r4, [r1], #1
        cmp     r7, r2
        blt     LATF6
LATF7:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LATF8:
        mov     r0, r1
        mov     r1, r2
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_8u
LATF9:
        cmn     r3, #7
        mov     r12, #0xFF
        bge     LATF11
        cmp     r2, #0
        ble     LATF7
        mov     r3, #0
LATF10:
        ldrb    r12, [r1]
        cmp     r12, r0
        movle   r12, #0
        movgt   r12, #0xFF
        add     r3, r3, #1
        strb    r12, [r1], #1
        cmp     r3, r2
        blt     LATF10
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LATF11:
        cmp     r2, #5
        rsb     r3, r3, #0
        movlt   r7, #0
        blt     LATF13
        mov     r7, #0
        sub     r6, r2, #5
        mov     r5, r7
        sub     r4, r1, #1
LATF12:
        ldrb    r8, [r4, #1]
        mov     r9, r5
        add     r7, r7, #4
        sub     r8, r8, r0
        cmp     r8, #0
        movgt   r9, r8
        mov     r8, r9, lsl r3
        cmp     r8, #0xFF
        mov     r9, r12
        movlt   r9, r8
        strb    r9, [r4, #1]
        ldrb    r9, [r4, #2]
        ldrb    r8, [r4, #3]
        mov     r10, r5
        sub     r9, r9, r0
        cmp     r9, #0
        movgt   r10, r9
        mov     r9, r10, lsl r3
        cmp     r9, #0xFF
        mov     r10, r12
        movlt   r10, r9
        sub     r8, r8, r0
        cmp     r8, #0
        mov     r9, r5
        movgt   r9, r8
        mov     r8, r9, lsl r3
        cmp     r8, #0xFF
        mov     r9, r12
        movlt   r9, r8
        ldrb    r8, [r4, #4]
        strb    r9, [r4, #3]
        strb    r10, [r4, #2]
        sub     r8, r8, r0
        cmp     r8, #0
        mov     r9, r5
        movgt   r9, r8
        mov     r8, r9, lsl r3
        cmp     r8, #0xFF
        mov     r9, r12
        movlt   r9, r8
        strb    r9, [r4, #4]!
        cmp     r7, r6
        ble     LATF12
LATF13:
        add     r1, r7, r1
LATF14:
        ldrb    r4, [r1]
        add     r7, r7, #1
        mov     r5, lr
        sub     r4, r4, r0
        cmp     r4, #0
        movgt   r5, r4
        mov     r4, r5, lsl r3
        cmp     r4, #0xFF
        mov     r5, r12
        movlt   r5, r4
        strb    r5, [r1], #1
        cmp     r7, r2
        blt     LATF14
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LATF15:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LATF16:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


