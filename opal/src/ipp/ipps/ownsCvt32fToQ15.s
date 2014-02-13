        .text
        .align  4
        .globl  ownsCvt32fToQ15


ownsCvt32fToQ15:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r2, #0
        mov     r12, #0
        ble     LBVV3
        mov     r3, #0xFE, 10
        cmp     r2, #6
        orr     r3, r3, #1, 2
        movlt   lr, #0
        movlt   r4, lr
        blt     LBVV1
        mov     lr, #0
        mov     r4, lr
        sub     r6, r2, #6
        add     r5, r0, #4
LBVV0:
        ldr     r8, [r5, #-4]
        ldr     r7, [r5]
        add     r4, r4, #5
        and     r8, r8, r3
        cmp     r8, lr
        movgt   lr, r8
        ldr     r8, [r5, #4]
        and     r7, r7, r3
        cmp     r7, lr
        movgt   lr, r7
        and     r8, r8, r3
        ldr     r7, [r5, #8]
        cmp     r8, lr
        movgt   lr, r8
        ldr     r8, [r5, #0xC]
        and     r7, r7, r3
        cmp     r7, lr
        movgt   lr, r7
        and     r8, r8, r3
        cmp     r8, lr
        movgt   lr, r8
        cmp     r4, r6
        add     r5, r5, #0x14
        ble     LBVV0
LBVV1:
        add     r5, r0, r4, lsl #2
LBVV2:
        ldr     r6, [r5], #4
        add     r4, r4, #1
        and     r6, r6, r3
        cmp     r6, lr
        movgt   lr, r6
        cmp     r4, r2
        blt     LBVV2
        cmp     lr, #0
        bne     LBVV8
LBVV3:
        cmp     r2, #0
        ble     LBVV7
        cmp     r2, #6
        movlt   r0, #0
        blt     LBVV5
        mov     r0, #0
        sub     r4, r2, #6
        mov     lr, r0
        mov     r3, r1
LBVV4:
        add     r0, r0, #5
        strh    lr, [r3]
        strh    lr, [r3, #2]
        strh    lr, [r3, #4]
        strh    lr, [r3, #6]
        strh    lr, [r3, #8]
        cmp     r0, r4
        add     r3, r3, #0xA
        ble     LBVV4
LBVV5:
        add     r1, r1, r0, lsl #1
LBVV6:
        add     r0, r0, #1
        strh    r12, [r1], #2
        cmp     r0, r2
        blt     LBVV6
LBVV7:
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LBVV8:
        mov     lr, lr, asr #23
        cmp     r2, #0
        add     lr, lr, #9
        ble     LBVV10
        mvn     r12, #0xFE, 10
        bic     r12, r12, #3, 2
        sub     r0, r0, #4
        mvn     r9, #2, 2
        mov     r8, #0
        mov     r7, #1
        mov     r6, #0x1F
LBVV9:
        sub     r4, r2, r8
        ldr     r4, [r0, +r4, lsl #2]
        and     r5, r4, r3
        sub     r10, lr, r5, asr #23
        cmp     r10, #0x1F
        mov     r5, r6
        movlt   r5, r10
        and     r10, r4, r12
        sub     r11, r5, #1
        orr     r10, r10, #2, 10
        add     r11, r10, r7, lsl r11
        mov     r5, r11, asr r5
        tst     r5, #2, 18
        beq     LBVV11
        cmp     r2, #0
        add     lr, lr, #1
        movgt   r8, #0
        bgt     LBVV9
LBVV10:
        sub     r0, lr, #0x88
        ldmia   sp!, {r4 - r11, pc}
LBVV11:
        bics    r4, r4, r9
        rsbne   r5, r5, #0
        mov     r4, r8, lsl #1
        add     r8, r8, #1
        cmp     r8, r2
        strh    r5, [r1, +r4]
        blt     LBVV9
        b       LBVV10


