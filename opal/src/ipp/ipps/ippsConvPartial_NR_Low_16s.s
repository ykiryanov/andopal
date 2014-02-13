        .text
        .align  4
        .globl  _ippsConvPartial_NR_Low_16s


_ippsConvPartial_NR_Low_16s:
        stmdb   sp!, {r1, r4 - r11, lr}
        cmp     r0, #0
        beq     LDJS8
        cmp     r1, #0
        beq     LDJS8
        cmp     r2, #0
        beq     LDJS8
        cmp     r3, #0
        ble     LDJS7
        cmp     r3, #0
        ble     LDJS5
        mov     r5, #0
LDJS0:
        cmp     r5, #0
        movlt   lr, #0
        movlt   r6, r5, lsl #1
        blt     LDJS4
        cmp     r5, #6
        blt     LDJS6
        mov     lr, #0
        mov     r6, r5, lsl #1
        mov     r8, lr
        add     r7, r1, r6
        sub     r10, r5, #6
        mov     r9, r0
        str     r0, [sp]
LDJS1:
        rsb     r0, r8, #0
        ldrsh   r12, [r9]
        mov     r0, r0, lsl #1
        ldrsh   r0, [r7, +r0]
        ldrsh   r4, [r9, #2]
        ldrsh   r11, [r9, #4]
        mla     lr, r12, r0, lr
        mvn     r0, #0
        rsb     r0, r8, r0
        mvn     r12, #1
        mov     r0, r0, lsl #1
        ldrsh   r0, [r7, +r0]
        rsb     r12, r8, r12
        mov     r12, r12, lsl #1
        mla     lr, r4, r0, lr
        ldrsh   r12, [r7, +r12]
        ldrsh   r4, [r9, #6]
        mvn     r0, #2
        mla     r12, r11, r12, lr
        ldrsh   lr, [r9, #8]
        rsb     r0, r8, r0
        mvn     r11, #3
        rsb     r11, r8, r11
        mov     r0, r0, lsl #1
        ldrsh   r0, [r7, +r0]
        mov     r11, r11, lsl #1
        ldrsh   r11, [r7, +r11]
        mla     r12, r4, r0, r12
        add     r8, r8, #5
        add     r9, r9, #0xA
        cmp     r8, r10
        mla     lr, lr, r11, r12
        ble     LDJS1
        ldr     r0, [sp]
LDJS2:
        add     r4, r0, r8, lsl #1
LDJS3:
        rsb     r9, r8, #0
        ldrsh   r12, [r4], #2
        mov     r9, r9, lsl #1
        ldrsh   r9, [r7, +r9]
        add     r8, r8, #1
        mla     lr, r12, r9, lr
        cmp     r8, r5
        ble     LDJS3
LDJS4:
        add     lr, lr, #1, 18
        add     r5, r5, #1
        mov     lr, lr, asr #15
        cmp     r5, r3
        strh    lr, [r2, +r6]
        blt     LDJS0
LDJS5:
        mov     r0, #0
        ldmia   sp!, {r1, r4 - r11, pc}
LDJS6:
        mov     lr, #0
        mov     r6, r5, lsl #1
        mov     r8, lr
        add     r7, r1, r6
        b       LDJS2
LDJS7:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r11, pc}
LDJS8:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r11, pc}


