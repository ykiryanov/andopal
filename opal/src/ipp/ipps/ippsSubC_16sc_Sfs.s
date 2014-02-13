        .text
        .align  4
        .globl  _ippsSubC_16sc_Sfs


_ippsSubC_16sc_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #4
        ldr     r12, [sp, #0x24]
        cmp     r12, #0x10
        str     r1, [sp]
        ble     LATK0
        cmp     r0, #0
        beq     LATK15
        mov     r0, r2
        mov     r1, r3
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_16sc
LATK0:
        cmp     r0, #0
        beq     LATK15
        cmp     r2, #0
        beq     LATK15
        cmp     r3, #0
        ble     LATK14
        mvn     lr, #0xFF
        cmn     r12, #0xF
        bic     lr, lr, #0x7F, 24
        mov     r4, #0
        bge     LATK3
        cmp     r3, #0
        ble     LATK2
        ldrsh   r12, [sp]
        ldrsh   r5, [sp, #2]
        sub     r4, r4, #2, 18
LATK1:
        ldrsh   r6, [r0]
        ldrsh   r7, [r0, #2]
        sub     r6, r6, r12
        cmp     r6, #0
        sub     r7, r7, r5
        mvngt   r6, lr
        cmp     r7, #0
        mvngt   r7, lr
        cmp     r6, #0
        strlth  r4, [r2]
        strgeh  r6, [r2]
        cmp     r7, #0
        strlth  r4, [r2, #2]
        strgeh  r7, [r2, #2]
        subs    r3, r3, #1
        add     r2, r2, #4
        add     r0, r0, #4
        bne     LATK1
LATK2:
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LATK3:
        cmp     r12, #0
        bne     LATK7
        cmp     r3, #0
        ble     LATK11
        ldrsh   r5, [sp]
        ldrsh   r12, [sp, #2]
        sub     r2, r2, #2
        mov     r6, r4
LATK4:
        ldrsh   r7, [r0]
        ldrsh   r8, [r0, #2]
        cmp     r5, #0
        sub     r7, r7, r5
        sub     r8, r8, r12
        blt     LATK13
        sub     r9, r4, #2, 18
        cmp     r7, r9
        movgt   r9, r7
LATK5:
        cmp     r12, #0
        strh    r9, [r2, #2]
        blt     LATK12
        sub     r7, r4, #2, 18
        cmp     r8, r7
        movgt   r7, r8
LATK6:
        add     r6, r6, #1
        strh    r7, [r2, #4]!
        cmp     r6, r3
        add     r0, r0, #4
        blt     LATK4
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LATK7:
        cmp     r12, #0
        ble     LATK9
        sub     r6, r12, #1
        mov     r5, #1
        mov     r6, r5, lsl r6
        cmp     r3, #0
        sub     r5, r6, #1
        ble     LATK11
        ldrsh   r7, [sp]
        ldrsh   r6, [sp, #2]
        mvn     lr, lr
        sub     r2, r2, #2
        sub     r8, r0, #2
LATK8:
        ldrsh   r9, [r8, #2]
        ldrsh   r0, [r8, #4]!
        sub     r10, r9, r7
        mov     r9, r10, asr r12
        and     r9, r9, #1
        add     r10, r5, r10
        add     r9, r10, r9
        mov     r10, r9, asr r12
        cmp     r10, lr
        mov     r9, lr
        sub     r0, r0, r6
        movlt   r9, r10
        mov     r10, r0, asr r12
        and     r10, r10, #1
        add     r0, r5, r0
        add     r10, r0, r10
        mov     r0, r10, asr r12
        cmp     r0, lr
        mov     r10, lr
        movlt   r10, r0
        add     r4, r4, #1
        strh    r9, [r2, #2]
        strh    r10, [r2, #4]!
        cmp     r4, r3
        blt     LATK8
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LATK9:
        cmp     r3, #0
        rsb     r12, r12, #0
        ble     LATK11
        ldrsh   r6, [sp]
        ldrsh   r5, [sp, #2]
        sub     r2, r2, #2
        sub     r0, r0, #2
        mvn     r7, lr
LATK10:
        ldrsh   r8, [r0, #2]
        ldrsh   r9, [r0, #4]!
        sub     r8, r8, r6
        mov     r8, r8, lsl r12
        sub     r9, r9, r5
        cmp     r8, r7
        mov     r10, r9, lsl r12
        mov     r9, r7
        movlt   r9, r8
        cmp     r10, r7
        mov     r8, r7
        movlt   r8, r10
        cmp     r9, lr
        mov     r10, lr
        movgt   r10, r9
        cmp     r8, lr
        mov     r9, lr
        movgt   r9, r8
        add     r4, r4, #1
        strh    r10, [r2, #2]
        strh    r9, [r2, #4]!
        cmp     r4, r3
        blt     LATK10
LATK11:
        mov     r0, #0
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LATK12:
        mvn     r7, lr
        cmp     r8, r7
        movlt   r7, r8
        b       LATK6
LATK13:
        sub     r9, r4, #2, 18
        mvn     r9, r9
        cmp     r7, r9
        movlt   r9, r7
        b       LATK5
LATK14:
        mvn     r0, #5
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}
LATK15:
        mvn     r0, #7
        add     sp, sp, #4
        ldmia   sp!, {r4 - r10, pc}


