        .text
        .align  4
        .globl  ownsConvert32fTo16s


ownsConvert32fTo16s:
        stmdb   sp!, {r4 - r11, lr}
        cmp     r2, #0
        mov     r12, #0
        ble     LBPJ3
        mov     r3, #0xFE, 10
        cmp     r2, #6
        orr     r3, r3, #1, 2
        movlt   lr, r12
        movlt   r4, lr
        blt     LBPJ1
        mov     lr, r12
        mov     r4, lr
        sub     r6, r2, #6
        add     r5, r0, #4
LBPJ0:
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
        ble     LBPJ0
LBPJ1:
        add     r5, r0, r4, lsl #2
LBPJ2:
        ldr     r6, [r5], #4
        add     r4, r4, #1
        and     r6, r6, r3
        cmp     r6, lr
        movgt   lr, r6
        cmp     r4, r2
        blt     LBPJ2
        cmp     lr, #0
        bne     LBPJ8
LBPJ3:
        cmp     r2, #0
        ble     LBPJ7
        cmp     r2, #6
        movlt   r0, r12
        blt     LBPJ5
        mov     r0, r12
        sub     r4, r2, #6
        mov     lr, r0
        mov     r3, r1
LBPJ4:
        add     r0, r0, #5
        strh    lr, [r3]
        strh    lr, [r3, #2]
        strh    lr, [r3, #4]
        strh    lr, [r3, #6]
        strh    lr, [r3, #8]
        cmp     r0, r4
        add     r3, r3, #0xA
        ble     LBPJ4
LBPJ5:
        add     r1, r1, r0, lsl #1
LBPJ6:
        add     r0, r0, #1
        strh    r12, [r1], #2
        cmp     r0, r2
        blt     LBPJ6
LBPJ7:
        mvn     r0, #0xD
        ldmia   sp!, {r4 - r11, pc}
LBPJ8:
        mov     lr, lr, asr #23
        cmp     r2, #0
        add     r4, lr, #9
        ble     LBPJ11
        mvn     r9, #2, 2
        mvn     r8, #0
        mov     r7, #1
        mov     r6, #0x1F
LBPJ9:
        ldr     r10, [r0, +r12, lsl #2]
        add     lr, r8, #2, 10
        and     r5, r10, r3
        sub     r11, r4, r5, asr #23
        cmp     r11, #0x1F
        mov     r5, r6
        movlt   r5, r11
        and     lr, r10, lr
        sub     r11, r5, #1
        orr     lr, lr, #2, 10
        add     r11, lr, r7, lsl r11
        mov     r5, r11, asr r5
        tst     r5, #2, 18
        addne   r4, r4, #1
        movne   r12, r8
        bne     LBPJ10
        bics    r10, r10, r9
        rsbne   r5, r5, #0
        mov     lr, r12, lsl #1
        strh    r5, [r1, +lr]
LBPJ10:
        add     r12, r12, #1
        cmp     r12, r2
        blt     LBPJ9
LBPJ11:
        rsb     r0, r4, #0x88
        ldmia   sp!, {r4 - r11, pc}


