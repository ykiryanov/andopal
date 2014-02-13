        .text
        .align  4
        .globl  _ippsSubC_16sc_ISfs


_ippsSubC_16sc_ISfs:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #4
        str     r0, [sp]
        cmp     r3, #0x10
        mov     r0, r1
        bgt     LATL13
        cmp     r0, #0
        beq     LATL17
        cmp     r2, #0
        ble     LATL16
        mvn     r12, #0xFF
        bic     lr, r12, #0x7F, 24
        cmp     r3, #0
        mov     r12, #0
        bne     LATL0
        ldrsh   r3, [sp]
        cmp     r3, #0
        bne     LATL4
        ldrsh   r3, [sp, #2]
        cmp     r3, #0
        bne     LATL4
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LATL0:
        cmn     r3, #0xF
        bge     LATL3
        cmp     r2, #0
        ble     LATL2
        ldrsh   r3, [sp]
        ldrsh   r4, [sp, #2]
        sub     r0, r0, #2
LATL1:
        ldrsh   r5, [r0, #2]
        ldrsh   r6, [r0, #4]
        sub     r5, r5, r3
        cmp     r5, #0
        sub     r6, r6, r4
        mvngt   r5, lr
        cmp     r6, #0
        mvngt   r6, lr
        cmp     r5, #0
        movlt   r5, lr
        cmp     r6, #0
        strh    r5, [r0, #2]
        sublt   r6, r12, #2, 18
        strh    r6, [r0, #4]!
        subs    r2, r2, #1
        bne     LATL1
LATL2:
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LATL3:
        cmp     r3, #0
        bne     LATL8
LATL4:
        cmp     r2, #0
        ble     LATL12
        ldrsh   r4, [sp]
        ldrsh   r3, [sp, #2]
        sub     r0, r0, #2
        mov     r5, r12
LATL5:
        ldrsh   r6, [r0, #2]
        ldrsh   r7, [r0, #4]
        cmp     r4, #0
        sub     r6, r6, r4
        sub     r7, r7, r3
        blt     LATL15
        sub     r8, r12, #2, 18
        cmp     r6, r8
        movgt   r8, r6
LATL6:
        cmp     r3, #0
        strh    r8, [r0, #2]
        blt     LATL14
        sub     r6, r12, #2, 18
        cmp     r7, r6
        movgt   r6, r7
LATL7:
        add     r5, r5, #1
        strh    r6, [r0, #4]!
        cmp     r5, r2
        blt     LATL5
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LATL8:
        cmp     r3, #0
        ble     LATL10
        sub     r5, r3, #1
        mov     r4, #1
        mov     r5, r4, lsl r5
        cmp     r2, #0
        sub     r4, r5, #1
        ble     LATL12
        ldrsh   r6, [sp]
        ldrsh   r5, [sp, #2]
        mvn     lr, lr
        sub     r7, r0, #2
LATL9:
        ldrsh   r8, [r7, #2]
        ldrsh   r0, [r7, #4]
        add     r12, r12, #1
        sub     r8, r8, r6
        mov     r9, r8, asr r3
        and     r9, r9, #1
        add     r8, r4, r8
        add     r9, r8, r9
        mov     r9, r9, asr r3
        cmp     r9, lr
        mov     r8, lr
        sub     r0, r0, r5
        movlt   r8, r9
        mov     r9, r0, asr r3
        and     r9, r9, #1
        add     r0, r4, r0
        add     r9, r0, r9
        mov     r0, r9, asr r3
        cmp     r0, lr
        mov     r9, lr
        movlt   r9, r0
        strh    r8, [r7, #2]
        strh    r9, [r7, #4]!
        cmp     r12, r2
        blt     LATL9
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LATL10:
        cmp     r2, #0
        rsb     r3, r3, #0
        ble     LATL12
        ldrsh   r5, [sp]
        ldrsh   r4, [sp, #2]
        mvn     lr, lr
        sub     r0, r0, #2
        sub     r6, r12, #2, 18
LATL11:
        ldrsh   r7, [r0, #2]
        ldrsh   r8, [r0, #4]
        add     r12, r12, #1
        sub     r7, r7, r5
        mov     r7, r7, lsl r3
        sub     r8, r8, r4
        cmp     r7, lr
        mov     r9, r8, lsl r3
        mov     r8, lr
        movlt   r8, r7
        cmp     r9, lr
        mov     r7, lr
        movlt   r7, r9
        cmp     r8, r6
        mov     r9, r6
        movgt   r9, r8
        cmp     r7, r6
        mov     r8, r6
        movgt   r8, r7
        strh    r9, [r0, #2]
        strh    r8, [r0, #4]!
        cmp     r12, r2
        blt     LATL11
LATL12:
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LATL13:
        mov     r1, r2
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, lr}
        b       _ippsZero_16sc
LATL14:
        mvn     r6, lr
        cmp     r7, r6
        movlt   r6, r7
        b       LATL7
LATL15:
        sub     r8, r12, #2, 18
        mvn     r8, r8
        cmp     r6, r8
        movlt   r8, r6
        b       LATL6
LATL16:
        mvn     r0, #5
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LATL17:
        mvn     r0, #7
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}


