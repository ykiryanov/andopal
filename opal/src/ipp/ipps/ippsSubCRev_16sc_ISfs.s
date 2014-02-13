        .text
        .align  4
        .globl  _ippsSubCRev_16sc_ISfs


_ippsSubCRev_16sc_ISfs:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #4
        str     r0, [sp]
        cmp     r3, #0x10
        mov     r0, r1
        bgt     LATW11
        cmp     r0, #0
        beq     LATW15
        cmp     r2, #0
        ble     LATW14
        mvn     r12, #0xFF
        bic     r6, r12, #0x7F, 24
        cmn     r3, #0xF
        mov     r12, #0
        bge     LATW2
        cmp     r2, #0
        ble     LATW1
        ldrsh   r3, [sp]
        ldrsh   lr, [sp, #2]
        sub     r0, r0, #2
LATW0:
        ldrsh   r4, [r0, #2]
        ldrsh   r5, [r0, #4]
        sub     r4, r3, r4
        cmp     r4, #0
        sub     r5, lr, r5
        mvngt   r4, r6
        cmp     r5, #0
        mvngt   r5, r6
        cmp     r4, #0
        sublt   r4, r12, #2, 18
        cmp     r5, #0
        strh    r4, [r0, #2]
        sublt   r5, r12, #2, 18
        strh    r5, [r0, #4]!
        subs    r2, r2, #1
        bne     LATW0
LATW1:
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LATW2:
        cmp     r3, #0
        bne     LATW6
        cmp     r2, #0
        ble     LATW10
        ldrsh   lr, [sp]
        ldrsh   r3, [sp, #2]
        sub     r0, r0, #2
        mov     r4, r12
LATW3:
        ldrsh   r5, [r0, #2]
        ldrsh   r7, [r0, #4]
        cmp     lr, #0
        sub     r5, lr, r5
        sub     r7, r3, r7
        ble     LATW13
        mvn     r8, r6
        cmp     r5, r8
        movlt   r8, r5
LATW4:
        cmp     r3, #0
        strh    r8, [r0, #2]
        ble     LATW12
        mvn     r5, r6
        cmp     r7, r5
        movlt   r5, r7
LATW5:
        add     r4, r4, #1
        strh    r5, [r0, #4]!
        cmp     r4, r2
        blt     LATW3
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LATW6:
        cmp     r3, #0
        ble     LATW8
        sub     r4, r3, #1
        mov     lr, #1
        mov     r4, lr, lsl r4
        cmp     r2, #0
        sub     lr, r4, #1
        ble     LATW10
        ldrsh   r5, [sp]
        ldrsh   r4, [sp, #2]
        mvn     r6, r6
        sub     r7, r0, #2
LATW7:
        ldrsh   r8, [r7, #2]
        ldrsh   r0, [r7, #4]
        add     r12, r12, #1
        sub     r8, r5, r8
        mov     r9, r8, asr r3
        and     r9, r9, #1
        add     r8, lr, r8
        add     r9, r8, r9
        mov     r9, r9, asr r3
        cmp     r9, r6
        mov     r8, r6
        sub     r0, r4, r0
        movlt   r8, r9
        mov     r9, r0, asr r3
        and     r9, r9, #1
        add     r0, lr, r0
        add     r9, r0, r9
        mov     r0, r9, asr r3
        cmp     r0, r6
        mov     r9, r6
        movlt   r9, r0
        strh    r8, [r7, #2]
        strh    r9, [r7, #4]!
        cmp     r12, r2
        blt     LATW7
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LATW8:
        cmp     r2, #0
        rsb     r3, r3, #0
        ble     LATW10
        ldrsh   r4, [sp]
        ldrsh   lr, [sp, #2]
        mvn     r6, r6
        sub     r0, r0, #2
        sub     r5, r12, #2, 18
LATW9:
        ldrsh   r7, [r0, #2]
        ldrsh   r8, [r0, #4]
        add     r12, r12, #1
        sub     r7, r4, r7
        mov     r7, r7, lsl r3
        sub     r8, lr, r8
        cmp     r7, r6
        mov     r9, r8, lsl r3
        mov     r8, r6
        movlt   r8, r7
        cmp     r9, r6
        mov     r7, r6
        movlt   r7, r9
        cmp     r8, r5
        mov     r9, r5
        movgt   r9, r8
        cmp     r7, r5
        mov     r8, r5
        movgt   r8, r7
        strh    r9, [r0, #2]
        strh    r8, [r0, #4]!
        cmp     r12, r2
        blt     LATW9
LATW10:
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LATW11:
        mov     r1, r2
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, lr}
        b       _ippsZero_16sc
LATW12:
        sub     r5, r12, #2, 18
        cmp     r7, r5
        movgt   r5, r7
        b       LATW5
LATW13:
        sub     r8, r12, #2, 18
        cmp     r5, r8
        movgt   r8, r5
        b       LATW4
LATW14:
        mvn     r0, #5
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}
LATW15:
        mvn     r0, #7
        add     sp, sp, #4
        ldmia   sp!, {r4 - r9, pc}


