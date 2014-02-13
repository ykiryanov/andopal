        .text
        .align  4
        .globl  _ippsMinEvery_8u_I


_ippsMinEvery_8u_I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LBFU10
        cmp     r1, #0
        beq     LBFU10
        cmp     r2, #1
        mvnlt   r0, #5
        ldmltia sp!, {r4 - r8, pc}
        cmp     r2, #8
        ble     LBFU5
        mov     r5, r2, asr #3
        cmp     r5, #0
        and     r6, r2, #7
        ble     LBFU1
        sub     r4, r1, #1
        sub     lr, r0, #1
LBFU0:
        ldrb    r8, [r4, #1]
        ldrb    r12, [lr, #1]
        ldrb    r3, [r4, #2]
        ldrb    r7, [r4, #3]
        cmp     r12, r8
        movlt   r8, r12
        strb    r8, [r4, #1]
        ldrb    r8, [lr, #2]
        ldrb    r12, [r4, #4]
        cmp     r8, r3
        movlt   r3, r8
        strb    r3, [r4, #2]
        ldrb    r8, [lr, #3]
        ldrb    r3, [r4, #5]
        cmp     r8, r7
        movlt   r7, r8
        strb    r7, [r4, #3]
        ldrb    r8, [lr, #4]
        ldrb    r7, [r4, #6]
        cmp     r8, r12
        movlt   r12, r8
        strb    r12, [r4, #4]
        ldrb    r8, [lr, #5]
        ldrb    r12, [r4, #7]
        cmp     r8, r3
        movlt   r3, r8
        strb    r3, [r4, #5]
        ldrb    r8, [lr, #6]
        ldrb    r3, [r4, #8]
        cmp     r8, r7
        movlt   r7, r8
        strb    r7, [r4, #6]
        ldrb    r7, [lr, #7]
        cmp     r7, r12
        movlt   r12, r7
        strb    r12, [r4, #7]
        ldrb    r12, [lr, #8]!
        cmp     r12, r3
        movlt   r3, r12
        strb    r3, [r4, #8]!
        subs    r5, r5, #1
        bne     LBFU0
LBFU1:
        sub     r6, r2, r6
        cmp     r6, r2
        bge     LBFU9
        sub     r3, r2, r6
        cmp     r3, #6
        blt     LBFU3
        sub     r3, r6, #1
        add     r12, r3, r1
        sub     lr, r2, #6
        add     r3, r3, r0
LBFU2:
        ldrb    r5, [r12, #1]
        ldrb    r8, [r3, #1]
        ldrb    r7, [r12, #2]
        ldrb    r4, [r12, #3]
        add     r6, r6, #5
        cmp     r8, r5
        movlt   r5, r8
        strb    r5, [r12, #1]
        ldrb    r8, [r3, #2]
        ldrb    r5, [r12, #4]
        cmp     r8, r7
        movlt   r7, r8
        strb    r7, [r12, #2]
        ldrb    r8, [r3, #3]
        ldrb    r7, [r12, #5]
        cmp     r8, r4
        movlt   r4, r8
        strb    r4, [r12, #3]
        ldrb    r4, [r3, #4]
        cmp     r4, r5
        movlt   r5, r4
        strb    r5, [r12, #4]
        ldrb    r4, [r3, #5]!
        cmp     r4, r7
        movlt   r7, r4
        strb    r7, [r12, #5]!
        cmp     r6, lr
        ble     LBFU2
LBFU3:
        add     r0, r6, r0
        add     r1, r6, r1
LBFU4:
        ldrb    r12, [r1]
        ldrb    r3, [r0], #1
        add     r6, r6, #1
        cmp     r3, r12
        movlt   r12, r3
        strb    r12, [r1], #1
        cmp     r6, r2
        blt     LBFU4
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBFU5:
        cmp     r2, #6
        mov     r4, #0
        blt     LBFU7
        sub     lr, r2, #6
        sub     r12, r1, #1
        sub     r3, r0, #1
LBFU6:
        ldrb    r6, [r12, #1]
        ldrb    r8, [r3, #1]
        ldrb    r7, [r12, #2]
        ldrb    r5, [r12, #3]
        add     r4, r4, #5
        cmp     r8, r6
        movlt   r6, r8
        strb    r6, [r12, #1]
        ldrb    r8, [r3, #2]
        ldrb    r6, [r12, #4]
        cmp     r8, r7
        movlt   r7, r8
        strb    r7, [r12, #2]
        ldrb    r8, [r3, #3]
        ldrb    r7, [r12, #5]
        cmp     r8, r5
        movlt   r5, r8
        strb    r5, [r12, #3]
        ldrb    r5, [r3, #4]
        cmp     r5, r6
        movlt   r6, r5
        strb    r6, [r12, #4]
        ldrb    r5, [r3, #5]!
        cmp     r5, r7
        movlt   r7, r5
        strb    r7, [r12, #5]!
        cmp     r4, lr
        ble     LBFU6
LBFU7:
        add     r0, r4, r0
        add     r1, r4, r1
LBFU8:
        ldrb    r3, [r1]
        ldrb    r12, [r0], #1
        add     r4, r4, #1
        cmp     r12, r3
        movlt   r3, r12
        strb    r3, [r1], #1
        cmp     r4, r2
        blt     LBFU8
LBFU9:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LBFU10:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


