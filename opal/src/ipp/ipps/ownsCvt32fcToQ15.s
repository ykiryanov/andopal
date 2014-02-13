        .text
        .align  4
        .globl  ownsCvt32fcToQ15


ownsCvt32fcToQ15:
        stmdb   sp!, {r4 - r10, lr}
        mov     r12, r2, lsl #1
        cmp     r12, #0
        mov     r4, #0
        ble     LBVU3
        mov     r3, #0xFE, 10
        cmp     r12, #6
        orr     r3, r3, #1, 2
        movlt   r5, #0
        movlt   r6, r5
        blt     LBVU1
        mov     r5, #0
        mov     r6, r5
        sub     r8, r12, #6
        add     r7, r0, #4
LBVU0:
        ldr     r9, [r7, #-4]
        ldr     lr, [r7]
        add     r6, r6, #5
        and     r9, r9, r3
        cmp     r9, r5
        movgt   r5, r9
        ldr     r9, [r7, #4]
        and     r10, lr, r3
        ldr     lr, [r7, #8]
        cmp     r10, r5
        movgt   r5, r10
        and     r10, r9, r3
        ldr     r9, [r7, #0xC]
        cmp     r10, r5
        movgt   r5, r10
        and     lr, lr, r3
        cmp     lr, r5
        movgt   r5, lr
        and     r9, r9, r3
        cmp     r9, r5
        movgt   r5, r9
        cmp     r6, r8
        add     r7, r7, #0x14
        ble     LBVU0
LBVU1:
        add     lr, r0, r6, lsl #2
LBVU2:
        ldr     r7, [lr], #4
        add     r6, r6, #1
        and     r7, r7, r3
        cmp     r7, r5
        movgt   r5, r7
        cmp     r6, r12
        blt     LBVU2
        cmp     r5, #0
        bne     LBVU8
LBVU3:
        cmp     r2, #0
        ble     LBVU7
        cmp     r2, #6
        movlt   r0, #0
        blt     LBVU5
        mov     r0, #0
        sub     lr, r2, #6
        mov     r12, r0
        add     r3, r1, #2
LBVU4:
        add     r0, r0, #5
        strh    r12, [r3]
        strh    r12, [r3, #-2]
        strh    r12, [r3, #4]
        strh    r12, [r3, #2]
        strh    r12, [r3, #8]
        strh    r12, [r3, #6]
        strh    r12, [r3, #0xC]
        strh    r12, [r3, #0xA]
        strh    r12, [r3, #0x10]
        strh    r12, [r3, #0xE]
        cmp     r0, lr
        add     r3, r3, #0x14
        ble     LBVU4
LBVU5:
        mov     r3, r0, lsl #2
        add     r3, r3, #2
        add     r1, r3, r1
LBVU6:
        add     r0, r0, #1
        strh    r4, [r1]
        strh    r4, [r1, #-2]
        cmp     r0, r2
        add     r1, r1, #4
        blt     LBVU6
LBVU7:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LBVU8:
        mov     r5, r5, asr #23
        cmp     r2, #0
        add     r12, r5, #9
        ble     LBVU11
        sub     r0, r0, #8
        mov     r5, #0
        mov     r4, #1
        mov     lr, #0x1F
LBVU9:
        sub     r7, r2, r5
        ldr     r6, [r0, +r7, lsl #3]
        mvn     r8, #0xFE, 10
        bic     r8, r8, #3, 2
        and     r9, r6, r3
        sub     r10, r12, r9, asr #23
        cmp     r10, #0x1F
        mov     r9, lr
        movlt   r9, r10
        and     r8, r6, r8
        sub     r10, r9, #1
        orr     r8, r8, #2, 10
        add     r10, r8, r4, lsl r10
        mov     r8, r10, asr r9
        tst     r8, #2, 18
        beq     LBVU10
        cmp     r2, #0
        add     r12, r12, #1
        movgt   r5, #0
        bgt     LBVU9
        b       LBVU11
LBVU10:
        mvn     r9, #2, 2
        bics    r9, r6, r9
        rsbne   r8, r8, #0
        mov     r6, r5, lsl #2
        strh    r8, [r1, +r6]
        add     r7, r0, r7, lsl #3
        ldr     r8, [r7, #4]
        mvn     r7, #0xFE, 10
        bic     r7, r7, #3, 2
        and     r9, r8, r3
        sub     r10, r12, r9, asr #23
        cmp     r10, #0x1F
        mov     r9, lr
        movlt   r9, r10
        and     r7, r8, r7
        sub     r10, r9, #1
        orr     r7, r7, #2, 10
        add     r10, r7, r4, lsl r10
        mov     r9, r10, asr r9
        tst     r9, #2, 18
        beq     LBVU12
        cmp     r2, #0
        add     r12, r12, #1
        movgt   r5, #0
        bgt     LBVU9
LBVU11:
        sub     r0, r12, #0x88
        ldmia   sp!, {r4 - r10, pc}
LBVU12:
        mvn     r7, #2, 2
        bics    r7, r8, r7
        rsbne   r9, r9, #0
        add     r5, r5, #1
        add     r6, r1, r6
        cmp     r5, r2
        strh    r9, [r6, #2]
        blt     LBVU9
        b       LBVU11


