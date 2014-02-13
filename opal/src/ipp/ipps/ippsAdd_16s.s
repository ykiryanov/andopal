        .text
        .align  4
        .globl  _ippsAdd_16s


_ippsAdd_16s:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r0, #0
        beq     LDCH3
        cmp     r1, #0
        beq     LDCH3
        cmp     r2, #0
        beq     LDCH3
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        cmp     r3, #5
        mov     r12, #0
        blt     LDCH1
        mvn     lr, #0xFF
        bic     lr, lr, #0x7F, 24
        mvn     lr, lr
        sub     r8, r3, #5
        sub     r7, r12, #2, 18
        mov     r6, r0
        mov     r5, r1
        mov     r4, r2
LDCH0:
        ldrsh   r9, [r6]
        ldrsh   r10, [r5]
        add     r12, r12, #4
        add     r10, r9, r10
        mov     r9, lr
        cmp     r10, lr
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4]
        ldrsh   r10, [r5, #2]
        ldrsh   r9, [r6, #2]
        add     r10, r9, r10
        cmp     r10, lr
        mov     r9, lr
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4, #2]
        ldrsh   r10, [r5, #4]
        ldrsh   r9, [r6, #4]
        add     r10, r9, r10
        cmp     r10, lr
        mov     r9, lr
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4, #4]
        ldrsh   r10, [r5, #6]
        ldrsh   r9, [r6, #6]
        add     r6, r6, #8
        add     r5, r5, #8
        add     r10, r9, r10
        cmp     r10, lr
        mov     r9, lr
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r4, #6]
        cmp     r12, r8
        add     r4, r4, #8
        ble     LDCH0
LDCH1:
        mov     lr, #0
        sub     lr, lr, #2, 18
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        mvn     lr, lr
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
        add     r2, r2, r12, lsl #1
LDCH2:
        ldrsh   r6, [r1], #2
        ldrsh   r5, [r0], #2
        add     r12, r12, #1
        add     r6, r5, r6
        cmp     r6, lr
        mov     r5, lr
        movlt   r5, r6
        cmp     r5, r4
        mov     r6, r4
        movgt   r6, r5
        strh    r6, [r2], #2
        cmp     r12, r3
        blt     LDCH2
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDCH3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


