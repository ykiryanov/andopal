        .text
        .align  4
        .globl  ownsConvert32fcTo16sc


ownsConvert32fcTo16sc:
        stmdb   sp!, {r4 - r11, lr}
        mov     r12, r2, lsl #1
        cmp     r12, #0
        mov     r4, #0
        ble     LBPI3
        mov     r3, #0xFE, 10
        cmp     r12, #6
        orr     r3, r3, #1, 2
        movlt   r5, r4
        movlt   r6, r5
        blt     LBPI1
        mov     r5, r4
        mov     r6, r5
        sub     r8, r12, #6
        add     r7, r0, #4
LBPI0:
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
        ble     LBPI0
LBPI1:
        add     lr, r0, r6, lsl #2
LBPI2:
        ldr     r7, [lr], #4
        add     r6, r6, #1
        and     r7, r7, r3
        cmp     r7, r5
        movgt   r5, r7
        cmp     r6, r12
        blt     LBPI2
        cmp     r5, #0
        bne     LBPI8
LBPI3:
        cmp     r2, #0
        ble     LBPI7
        cmp     r2, #6
        movlt   r0, r4
        blt     LBPI5
        mov     r0, r4
        sub     lr, r2, #6
        mov     r12, r0
        add     r3, r1, #2
LBPI4:
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
        ble     LBPI4
LBPI5:
        mov     r3, r0, lsl #2
        add     r3, r3, #2
        add     r1, r3, r1
LBPI6:
        add     r0, r0, #1
        strh    r4, [r1]
        strh    r4, [r1, #-2]
        cmp     r0, r2
        add     r1, r1, #4
        blt     LBPI6
LBPI7:
        mvn     r0, #0xD
        ldmia   sp!, {r4 - r11, pc}
LBPI8:
        mov     r5, r5, asr #23
        cmp     r2, #0
        add     r12, r5, #9
        ble     LBPI11
        mov     r6, #1
        mov     r5, #0x1F
LBPI9:
        ldr     r8, [r0, +r4, lsl #3]
        mov     r9, r4, lsl #3
        mvn     lr, #0
        and     r7, r8, r3
        sub     r10, r12, r7, asr #23
        cmp     r10, #0x1F
        mov     r7, r5
        movlt   r7, r10
        add     r10, lr, #2, 10
        and     r10, r8, r10
        sub     r11, r7, #1
        orr     r10, r10, #2, 10
        add     r11, r10, r6, lsl r11
        mov     r7, r11, asr r7
        tst     r7, #2, 18
        addne   r12, r12, #1
        movne   r4, lr
        bne     LBPI10
        mvn     lr, #2, 2
        bics    lr, r8, lr
        rsbne   r7, r7, #0
        mov     lr, r4, lsl #2
        strh    r7, [r1, +lr]
        add     r9, r0, r9
        ldr     r7, [r9, #4]
        mvn     r8, #0
        add     r9, r8, #2, 10
        and     r10, r7, r3
        sub     r11, r12, r10, asr #23
        cmp     r11, #0x1F
        mov     r10, r5
        movlt   r10, r11
        and     r9, r7, r9
        sub     r11, r10, #1
        orr     r9, r9, #2, 10
        add     r11, r9, r6, lsl r11
        mov     r10, r11, asr r10
        tst     r10, #2, 18
        addne   r12, r12, #1
        movne   r4, r8
        bne     LBPI10
        mvn     r8, #2, 2
        bics    r8, r7, r8
        rsbne   r10, r10, #0
        add     lr, r1, lr
        strh    r10, [lr, #2]
LBPI10:
        add     r4, r4, #1
        cmp     r4, r2
        blt     LBPI9
LBPI11:
        rsb     r0, r12, #0x88
        ldmia   sp!, {r4 - r11, pc}


