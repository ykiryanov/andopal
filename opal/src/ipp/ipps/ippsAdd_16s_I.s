        .text
        .align  4
        .globl  _ippsAdd_16s_I


_ippsAdd_16s_I:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r0, #0
        beq     LDCF3
        cmp     r1, #0
        beq     LDCF3
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        mvn     r3, #0xFF
        cmp     r2, #5
        bic     r3, r3, #0x7F, 24
        mov     r8, #0
        movlt   r7, #0
        blt     LDCF1
        mov     r7, #0
        sub     r6, r2, #5
        sub     r5, r8, #2, 18
        mvn     r4, r3
        mov     lr, r0
        mov     r12, r1
LDCF0:
        ldrsh   r10, [r12]
        ldrsh   r9, [lr]
        add     r7, r7, #4
        add     r10, r9, r10
        cmp     r10, r4
        mov     r9, r4
        movlt   r9, r10
        mov     r10, r5
        cmp     r9, r5
        movgt   r10, r9
        strh    r10, [r12]
        ldrsh   r10, [r12, #2]
        ldrsh   r9, [lr, #2]
        add     r10, r9, r10
        cmp     r10, r4
        mov     r9, r4
        movlt   r9, r10
        cmp     r9, r5
        mov     r10, r5
        movgt   r10, r9
        strh    r10, [r12, #2]
        ldrsh   r10, [r12, #4]
        ldrsh   r9, [lr, #4]
        add     r10, r9, r10
        cmp     r10, r4
        mov     r9, r4
        movlt   r9, r10
        cmp     r9, r5
        mov     r10, r5
        movgt   r10, r9
        strh    r10, [r12, #4]
        ldrsh   r10, [r12, #6]
        ldrsh   r9, [lr, #6]
        add     lr, lr, #8
        add     r10, r9, r10
        cmp     r10, r4
        mov     r9, r4
        movlt   r9, r10
        cmp     r9, r5
        mov     r10, r5
        movgt   r10, r9
        strh    r10, [r12, #6]
        cmp     r7, r6
        add     r12, r12, #8
        ble     LDCF0
LDCF1:
        sub     r8, r8, #2, 18
        mvn     r12, r8
        add     r0, r0, r7, lsl #1
        add     r1, r1, r7, lsl #1
LDCF2:
        ldrsh   r4, [r1]
        ldrsh   lr, [r0], #2
        add     r7, r7, #1
        add     r4, lr, r4
        cmp     r4, r12
        mov     lr, r12
        movlt   lr, r4
        cmp     lr, r3
        mov     r4, r3
        movgt   r4, lr
        strh    r4, [r1], #2
        cmp     r7, r2
        blt     LDCF2
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LDCF3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


