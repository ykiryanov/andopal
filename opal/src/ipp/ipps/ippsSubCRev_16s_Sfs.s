        .text
        .align  4
        .globl  _ippsSubCRev_16s_Sfs


_ippsSubCRev_16s_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r12, [sp, #0x20]
        cmp     r12, #0x10
        ble     LATX0
        cmp     r0, #0
        beq     LATX15
        mov     r0, r2
        mov     r1, r3
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_16s
LATX0:
        cmp     r0, #0
        beq     LATX15
        cmp     r2, #0
        beq     LATX15
        cmp     r3, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        mvn     lr, #0xFF
        bic     r5, lr, #0x7F, 24
        cmn     r12, #0xF
        mov     lr, #0
        bge     LATX3
        cmp     r3, #0
        ble     LATX2
LATX1:
        ldrsh   r12, [r0], #2
        sub     r12, r1, r12
        cmp     r12, #0
        mvngt   r12, r5
        cmp     r12, #0
        sublt   r12, lr, #2, 18
        strh    r12, [r2], #2
        subs    r3, r3, #1
        bne     LATX1
LATX2:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LATX3:
        cmp     r12, #0
        bne     LATX5
        cmp     r1, #0
        blt     LATX13
        mvn     r5, r5
LATX4:
        ldrsh   r12, [r0], #2
        add     lr, lr, #1
        sub     r12, r1, r12
        cmp     r12, r5
        mov     r4, r5
        movlt   r4, r12
        strh    r4, [r2], #2
        cmp     lr, r3
        blt     LATX4
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LATX5:
        cmp     r12, #0
        ble     LATX9
        sub     r4, r12, #1
        mov     r6, #1
        mov     r4, r6, lsl r4
        cmp     r3, #5
        sub     r4, r4, #1
        blt     LATX7
        mvn     r5, r5
        sub     r8, r3, #5
        mov     r7, r0
        mov     r6, r2
LATX6:
        ldrsh   r9, [r7]
        add     lr, lr, #4
        sub     r9, r1, r9
        mov     r10, r9, asr r12
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr r12
        mov     r10, r5
        cmp     r9, r5
        movlt   r10, r9
        strh    r10, [r6]
        ldrsh   r9, [r7, #2]
        sub     r9, r1, r9
        mov     r10, r9, asr r12
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr r12
        cmp     r9, r5
        mov     r10, r5
        movlt   r10, r9
        strh    r10, [r6, #2]
        ldrsh   r9, [r7, #4]
        sub     r9, r1, r9
        mov     r10, r9, asr r12
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr r12
        cmp     r9, r5
        mov     r10, r5
        movlt   r10, r9
        strh    r10, [r6, #4]
        ldrsh   r9, [r7, #6]
        add     r7, r7, #8
        sub     r9, r1, r9
        mov     r10, r9, asr r12
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr r12
        cmp     r9, r5
        mov     r10, r5
        movlt   r10, r9
        strh    r10, [r6, #6]
        cmp     lr, r8
        add     r6, r6, #8
        ble     LATX6
LATX7:
        mvn     r5, #0xFF
        bic     r5, r5, #0x7F, 24
        mvn     r5, r5
        add     r0, r0, lr, lsl #1
        add     r2, r2, lr, lsl #1
LATX8:
        ldrsh   r6, [r0], #2
        add     lr, lr, #1
        sub     r6, r1, r6
        mov     r7, r6, asr r12
        and     r7, r7, #1
        add     r6, r4, r6
        add     r7, r6, r7
        mov     r6, r7, asr r12
        cmp     r6, r5
        mov     r7, r5
        movlt   r7, r6
        strh    r7, [r2], #2
        cmp     lr, r3
        blt     LATX8
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LATX9:
        cmp     r3, #5
        rsb     r12, r12, #0
        blt     LATX11
        mvn     r4, r5
        sub     r8, r3, #5
        sub     r7, lr, #2, 18
        mov     r6, r0
        mov     r5, r2
LATX10:
        ldrsh   r9, [r6]
        add     lr, lr, #4
        sub     r9, r1, r9
        mov     r10, r9, lsl r12
        cmp     r10, r4
        mov     r9, r4
        movlt   r9, r10
        mov     r10, r7
        cmp     r9, r7
        movgt   r10, r9
        strh    r10, [r5]
        ldrsh   r9, [r6, #2]
        sub     r9, r1, r9
        mov     r10, r9, lsl r12
        cmp     r10, r4
        mov     r9, r4
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r5, #2]
        ldrsh   r9, [r6, #4]
        sub     r9, r1, r9
        mov     r10, r9, lsl r12
        cmp     r10, r4
        mov     r9, r4
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r5, #4]
        ldrsh   r9, [r6, #6]
        add     r6, r6, #8
        sub     r9, r1, r9
        mov     r10, r9, lsl r12
        cmp     r10, r4
        mov     r9, r4
        movlt   r9, r10
        cmp     r9, r7
        mov     r10, r7
        movgt   r10, r9
        strh    r10, [r5, #6]
        cmp     lr, r8
        add     r5, r5, #8
        ble     LATX10
LATX11:
        mvn     r4, #0xFF
        bic     r4, r4, #0x7F, 24
        mov     r5, #0
        sub     r5, r5, #2, 18
        mvn     r4, r4
        add     r0, r0, lr, lsl #1
        add     r2, r2, lr, lsl #1
LATX12:
        ldrsh   r6, [r0], #2
        add     lr, lr, #1
        sub     r6, r1, r6
        mov     r7, r6, lsl r12
        cmp     r7, r4
        mov     r6, r4
        movlt   r6, r7
        cmp     r6, r5
        mov     r7, r5
        movgt   r7, r6
        strh    r7, [r2], #2
        cmp     lr, r3
        blt     LATX12
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LATX13:
        sub     r12, lr, #2, 18
LATX14:
        ldrsh   r4, [r0], #2
        add     lr, lr, #1
        sub     r4, r1, r4
        cmp     r4, r12
        mov     r5, r12
        movgt   r5, r4
        strh    r5, [r2], #2
        cmp     lr, r3
        blt     LATX14
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LATX15:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


