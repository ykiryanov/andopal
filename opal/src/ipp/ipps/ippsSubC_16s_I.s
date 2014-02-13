        .text
        .align  4
        .globl  _ippsSubC_16s_I


_ippsSubC_16s_I:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r1, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r9, pc}
        cmp     r0, #0
        beq     LATO3
        mvn     r3, #0xFF
        bic     r12, r3, #0x7F, 24
        cmp     r0, #0
        mov     r3, #0
        ble     LATO4
        cmp     r2, #6
        blt     LATO1
        sub     r6, r2, #6
        sub     r5, r3, #2, 18
        mov     r4, r1
LATO0:
        ldrsh   r8, [r4]
        ldrsh   r7, [r4, #2]
        ldrsh   lr, [r4, #4]
        sub     r8, r8, r0
        cmp     r8, r5
        mov     r9, r5
        movgt   r9, r8
        sub     r7, r7, r0
        cmp     r7, r5
        mov     r8, r5
        movgt   r8, r7
        ldrsh   r7, [r4, #6]
        sub     lr, lr, r0
        strh    r8, [r4, #2]
        cmp     lr, r5
        mov     r8, r5
        movgt   r8, lr
        ldrsh   lr, [r4, #8]
        sub     r7, r7, r0
        strh    r8, [r4, #4]
        cmp     r7, r5
        mov     r8, r5
        movgt   r8, r7
        sub     lr, lr, r0
        cmp     lr, r5
        mov     r7, r5
        movgt   r7, lr
        add     r3, r3, #5
        strh    r9, [r4]
        strh    r8, [r4, #6]
        strh    r7, [r4, #8]
        cmp     r3, r6
        add     r4, r4, #0xA
        ble     LATO0
LATO1:
        add     r1, r1, r3, lsl #1
LATO2:
        ldrsh   lr, [r1]
        add     r3, r3, #1
        mov     r4, r12
        sub     lr, lr, r0
        cmp     lr, r12
        movgt   r4, lr
        strh    r4, [r1], #2
        cmp     r3, r2
        blt     LATO2
LATO3:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}
LATO4:
        cmp     r2, #6
        movlt   r4, r3
        blt     LATO6
        mvn     r12, r12
        mov     r4, r3
        sub     r6, r2, #6
        mov     r5, r1
LATO5:
        ldrsh   r8, [r5]
        ldrsh   r7, [r5, #2]
        ldrsh   lr, [r5, #4]
        sub     r8, r8, r0
        cmp     r8, r12
        mov     r9, r12
        movlt   r9, r8
        sub     r7, r7, r0
        cmp     r7, r12
        mov     r8, r12
        movlt   r8, r7
        ldrsh   r7, [r5, #6]
        sub     lr, lr, r0
        strh    r8, [r5, #2]
        cmp     lr, r12
        mov     r8, r12
        movlt   r8, lr
        ldrsh   lr, [r5, #8]
        sub     r7, r7, r0
        strh    r8, [r5, #4]
        cmp     r7, r12
        mov     r8, r12
        movlt   r8, r7
        sub     lr, lr, r0
        cmp     lr, r12
        mov     r7, r12
        movlt   r7, lr
        add     r4, r4, #5
        strh    r9, [r5]
        strh    r8, [r5, #6]
        strh    r7, [r5, #8]
        cmp     r4, r6
        add     r5, r5, #0xA
        ble     LATO5
LATO6:
        sub     r3, r3, #2, 18
        mvn     r3, r3
        add     r1, r1, r4, lsl #1
LATO7:
        ldrsh   r12, [r1]
        add     r4, r4, #1
        mov     lr, r3
        sub     r12, r12, r0
        cmp     r12, r3
        movlt   lr, r12
        strh    lr, [r1], #2
        cmp     r4, r2
        blt     LATO7
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}


