        .text
        .align  4
        .globl  _ippsMaxEvery_16s_I


_ippsMaxEvery_16s_I:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r0, #0
        beq     LBGD5
        cmp     r1, #0
        beq     LBGD5
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r11, pc}
        bic     r9, r2, #1
        cmp     r9, #0
        ble     LBGD3
        cmp     r9, #8
        mov     r8, #0
        addlt   r12, r0, #2
        addlt   r3, r1, #2
        blt     LBGD1
        add     r12, r0, #2
        add     r3, r1, #2
        sub     r7, r9, #8
        mov     r6, r0
        mov     r5, r1
        mov     r4, r12
        mov     lr, r3
LBGD0:
        ldrsh   r10, [r5]
        ldrsh   r11, [r6]
        add     r8, r8, #6
        cmp     r11, r10
        movgt   r10, r11
        strh    r10, [r5]
        ldrsh   r10, [lr]
        ldrsh   r11, [r4]
        cmp     r11, r10
        movgt   r10, r11
        strh    r10, [lr]
        ldrsh   r10, [r5, #4]
        ldrsh   r11, [r6, #4]
        cmp     r11, r10
        movgt   r10, r11
        strh    r10, [r5, #4]
        ldrsh   r10, [lr, #4]
        ldrsh   r11, [r4, #4]
        cmp     r11, r10
        movgt   r10, r11
        strh    r10, [lr, #4]
        ldrsh   r10, [r5, #8]
        ldrsh   r11, [r6, #8]
        add     r6, r6, #0xC
        cmp     r11, r10
        movgt   r10, r11
        strh    r10, [r5, #8]
        ldrsh   r10, [lr, #8]
        ldrsh   r11, [r4, #8]
        add     r5, r5, #0xC
        add     r4, r4, #0xC
        cmp     r11, r10
        movgt   r10, r11
        strh    r10, [lr, #8]
        cmp     r8, r7
        add     lr, lr, #0xC
        ble     LBGD0
LBGD1:
        mov     r5, r8, lsl #1
        add     r4, r0, r8, lsl #1
        add     lr, r1, r8, lsl #1
LBGD2:
        ldrsh   r6, [lr]
        ldrsh   r7, [r4], #4
        add     r8, r8, #2
        cmp     r7, r6
        movgt   r6, r7
        strh    r6, [lr], #4
        ldrsh   r6, [r3, +r5]
        ldrsh   r7, [r12, +r5]
        cmp     r7, r6
        movgt   r6, r7
        strh    r6, [r3, +r5]
        cmp     r8, r9
        add     r5, r5, #4
        blt     LBGD2
LBGD3:
        tst     r2, #1
        beq     LBGD4
        mov     r2, r2, lsl #1
        sub     r0, r0, #2
        sub     r1, r1, #2
        ldrsh   r3, [r1, +r2]
        ldrsh   r0, [r0, +r2]
        cmp     r0, r3
        movgt   r3, r0
        strh    r3, [r1, +r2]
LBGD4:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBGD5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


