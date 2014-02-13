        .text
        .align  4
        .globl  _ippsSqr_16s_ISfs


_ippsSqr_16s_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        cmp     r0, #0
        beq     LAWW30
        cmp     r1, #0
        ble     LAWW31
        mov     r3, #0xFF
        orr     r4, r3, #0x7F, 24
        cmp     r2, #0
        mov     r3, #0
        mov     r12, #4
        bne     LAWW5
        cmp     r1, #4
        blt     LAWW1
        add     r5, r0, #2
        add     lr, r0, #4
        add     r2, r0, #6
LAWW0:
        mov     r3, r3, lsl #1
        ldrsh   r6, [r0, +r3]
        ldrsh   r7, [r5, +r3]
        ldrsh   r8, [lr, +r3]
        mul     r6, r6, r6
        ldrsh   r9, [r2, +r3]
        mul     r7, r7, r7
        mul     r8, r8, r8
        mul     r9, r9, r9
        cmp     r4, r6
        movlt   r6, r4
        cmp     r4, r7
        movlt   r7, r4
        cmp     r4, r8
        strh    r6, [r0, +r3]
        movlt   r8, r4
        strh    r7, [r5, +r3]
        cmp     r4, r9
        strh    r8, [lr, +r3]
        movlt   r9, r4
        strh    r9, [r2, +r3]
        mov     r3, r12
        add     r12, r12, #4
        cmp     r1, r12
        bge     LAWW0
LAWW1:
        cmp     r3, r1
        bge     LAWW25
        sub     r2, r1, r3
        cmp     r2, #5
        blt     LAWW3
        sub     r12, r1, #5
        add     r2, r0, r3, lsl #1
LAWW2:
        ldrsh   lr, [r2]
        ldrsh   r7, [r2, #2]
        ldrsh   r5, [r2, #4]
        mul     lr, lr, lr
        ldrsh   r6, [r2, #6]
        mul     r7, r7, r7
        mul     r5, r5, r5
        mul     r6, r6, r6
        cmp     r4, lr
        movlt   lr, r4
        cmp     r4, r7
        movlt   r7, r4
        cmp     r4, r5
        movlt   r5, r4
        cmp     r4, r6
        movlt   r6, r4
        add     r3, r3, #4
        strh    lr, [r2]
        strh    r7, [r2, #2]
        strh    r5, [r2, #4]
        strh    r6, [r2, #6]
        cmp     r3, r12
        add     r2, r2, #8
        ble     LAWW2
LAWW3:
        add     r0, r0, r3, lsl #1
LAWW4:
        ldrsh   r2, [r0]
        add     r3, r3, #1
        mul     r2, r2, r2
        cmp     r4, r2
        movlt   r2, r4
        strh    r2, [r0], #2
        cmp     r3, r1
        blt     LAWW4
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAWW5:
        cmp     r2, #0
        ble     LAWW19
        cmp     r2, #0x1E
        bgt     LAWW15
        cmp     r2, #1
        beq     LAWW26
        sub     lr, r2, #1
        mov     r5, #1
        mov     lr, r5, lsl lr
        cmp     r2, #0xF
        sub     lr, lr, #1
        bgt     LAWW9
        cmp     r1, #4
        blt     LAWW7
        add     r7, r0, #2
        add     r6, r0, #4
        add     r5, r0, #6
        str     r12, [sp]
        str     r1, [sp, #4]
LAWW6:
        mov     r3, r3, lsl #1
        ldrsh   r1, [r0, +r3]
        ldrsh   r9, [r7, +r3]
        ldrsh   r12, [r5, +r3]
        mul     r1, r1, r1
        ldrsh   r8, [r6, +r3]
        mul     r10, r9, r9
        mul     r9, r12, r12
        mul     r8, r8, r8
        mov     r12, r1, asr r2
        and     r12, r12, #1
        add     r12, r1, r12
        str     r12, [sp, #8]
        mov     r12, r8, asr r2
        mov     r11, r9, asr r2
        and     r11, r11, #1
        and     r12, r12, #1
        str     r11, [sp, #0xC]
        ldr     r11, [sp, #8]
        mov     r1, r10, asr r2
        add     r12, r8, r12
        ldr     r8, [sp, #0xC]
        and     r1, r1, #1
        add     r11, lr, r11
        add     r1, r10, r1
        add     r9, r9, r8
        add     r8, lr, r12
        cmp     r11, r4, lsl r2
        add     r1, lr, r1
        add     r12, lr, r9
        strgth  r4, [r0, +r3]
        movle   r11, r11, asr r2
        strleh  r11, [r0, +r3]
        cmp     r1, r4, lsl r2
        strgth  r4, [r7, +r3]
        movle   r1, r1, asr r2
        strleh  r1, [r7, +r3]
        cmp     r8, r4, lsl r2
        strgth  r4, [r6, +r3]
        movle   r8, r8, asr r2
        strleh  r8, [r6, +r3]
        cmp     r12, r4, lsl r2
        strgth  r4, [r5, +r3]
        movle   r12, r12, asr r2
        strleh  r12, [r5, +r3]
        ldr     r3, [sp]
        ldr     r12, [sp, #4]
        add     r1, r3, #4
        str     r1, [sp]
        cmp     r12, r1
        bge     LAWW6
        ldr     r1, [sp, #4]
LAWW7:
        cmp     r3, r1
        bge     LAWW25
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        add     r0, r0, r3, lsl #1
LAWW8:
        ldrsh   r5, [r0]
        mul     r5, r5, r5
        mov     r6, r5, asr r2
        and     r6, r6, #1
        add     r6, r5, r6
        add     r5, lr, r6
        cmp     r5, r4, lsl r2
        movgt   r5, r12
        movle   r5, r5, asr r2
        add     r3, r3, #1
        strh    r5, [r0], #2
        cmp     r3, r1
        blt     LAWW8
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAWW9:
        cmp     r1, #4
        blt     LAWW11
        add     r6, r0, #2
        add     r5, r0, #4
        add     r4, r0, #6
        str     r1, [sp, #4]
LAWW10:
        mov     r1, r3, lsl #1
        ldrsh   r3, [r0, +r1]
        ldrsh   r9, [r6, +r1]
        ldrsh   r7, [r4, +r1]
        mul     r3, r3, r3
        ldrsh   r8, [r5, +r1]
        mul     r11, r9, r9
        mul     r9, r7, r7
        mul     r8, r8, r8
        mov     r7, r3, asr r2
        and     r7, r7, #1
        add     r3, r3, r7
        mov     r7, r11, asr r2
        and     r7, r7, #1
        mov     r10, r8, asr r2
        add     r7, r11, r7
        add     r3, lr, r3
        and     r10, r10, #1
        add     r7, lr, r7
        mov     r11, r9, asr r2
        mov     r3, r3, asr r2
        strh    r3, [r0, +r1]
        add     r10, r8, r10
        mov     r7, r7, asr r2
        and     r11, r11, #1
        strh    r7, [r6, +r1]
        add     r10, lr, r10
        add     r11, r9, r11
        mov     r10, r10, asr r2
        strh    r10, [r5, +r1]
        ldr     r7, [sp, #4]
        add     r11, lr, r11
        mov     r3, r12
        add     r12, r12, #4
        mov     r11, r11, asr r2
        cmp     r7, r12
        strh    r11, [r4, +r1]
        bge     LAWW10
        ldr     r1, [sp, #4]
LAWW11:
        cmp     r3, r1
        bge     LAWW25
        sub     r12, r1, r3
        cmp     r12, #4
        blt     LAWW13
        sub     r6, r1, #4
        add     r5, r0, r3, lsl #1
LAWW12:
        ldrsh   r7, [r5]
        ldrsh   r4, [r5, #2]
        ldrsh   r12, [r5, #4]
        mul     r7, r7, r7
        add     r3, r3, #3
        mul     r4, r4, r4
        mul     r12, r12, r12
        cmp     r3, r6
        mov     r8, r7, asr r2
        and     r8, r8, #1
        add     r8, r7, r8
        add     r7, lr, r8
        mov     r7, r7, asr r2
        strh    r7, [r5]
        mov     r7, r4, asr r2
        and     r7, r7, #1
        add     r7, r4, r7
        add     r4, lr, r7
        mov     r4, r4, asr r2
        strh    r4, [r5, #2]
        mov     r4, r12, asr r2
        and     r4, r4, #1
        add     r4, r12, r4
        add     r12, lr, r4
        mov     r12, r12, asr r2
        strh    r12, [r5, #4]
        add     r5, r5, #6
        ble     LAWW12
LAWW13:
        add     r0, r0, r3, lsl #1
LAWW14:
        ldrsh   r12, [r0]
        add     r3, r3, #1
        cmp     r3, r1
        mul     r12, r12, r12
        mov     r4, r12, asr r2
        and     r4, r4, #1
        add     r4, r12, r4
        add     r12, lr, r4
        mov     r12, r12, asr r2
        strh    r12, [r0], #2
        blt     LAWW14
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAWW15:
        cmp     r1, #6
        movlt   r2, r3
        blt     LAWW17
        mov     r2, r3
        sub     r4, r1, #6
        mov     lr, r2
        mov     r12, r0
LAWW16:
        add     r2, r2, #5
        strh    lr, [r12]
        strh    lr, [r12, #2]
        strh    lr, [r12, #4]
        strh    lr, [r12, #6]
        strh    lr, [r12, #8]
        cmp     r2, r4
        add     r12, r12, #0xA
        ble     LAWW16
LAWW17:
        add     r0, r0, r2, lsl #1
LAWW18:
        add     r2, r2, #1
        strh    r3, [r0], #2
        cmp     r2, r1
        blt     LAWW18
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAWW19:
        rsb     r2, r2, #0
        cmp     r2, #0xE
        bgt     LAWW23
        cmp     r1, #4
        blt     LAWW21
        add     r6, r0, #2
        add     r5, r0, #4
        add     lr, r0, #6
LAWW20:
        mov     r3, r3, lsl #1
        ldrsh   r7, [r0, +r3]
        ldrsh   r8, [r6, +r3]
        ldrsh   r9, [r5, +r3]
        ldrsh   r10, [lr, +r3]
        mul     r7, r7, r7
        mul     r8, r8, r8
        mul     r9, r9, r9
        mul     r10, r10, r10
        cmp     r7, r4, asr r2
        movgt   r7, #0xFF
        orrgt   r7, r7, #0x7F, 24
        movle   r7, r7, lsl r2
        cmp     r8, r4, asr r2
        strh    r7, [r0, +r3]
        movgt   r7, #0xFF
        orrgt   r8, r7, #0x7F, 24
        movle   r8, r8, lsl r2
        cmp     r9, r4, asr r2
        strh    r8, [r6, +r3]
        movgt   r7, #0xFF
        orrgt   r9, r7, #0x7F, 24
        movle   r9, r9, lsl r2
        cmp     r10, r4, asr r2
        strh    r9, [r5, +r3]
        movgt   r7, #0xFF
        orrgt   r10, r7, #0x7F, 24
        movle   r10, r10, lsl r2
        strh    r10, [lr, +r3]
        mov     r3, r12
        add     r12, r12, #4
        cmp     r1, r12
        bge     LAWW20
LAWW21:
        cmp     r3, r1
        bge     LAWW25
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        add     r0, r0, r3, lsl #1
LAWW22:
        ldrsh   lr, [r0]
        mul     lr, lr, lr
        cmp     lr, r4, asr r2
        movgt   lr, r12
        movle   lr, lr, lsl r2
        add     r3, r3, #1
        strh    lr, [r0], #2
        cmp     r3, r1
        blt     LAWW22
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAWW23:
        cmp     r1, #0
        ble     LAWW25
LAWW24:
        ldrsh   r2, [r0]
        cmp     r2, #0
        strneh  r4, [r0]
        add     r3, r3, #1
        cmp     r3, r1
        add     r0, r0, #2
        blt     LAWW24
LAWW25:
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAWW26:
        cmp     r1, #4
        blt     LAWW28
        add     r5, r0, #2
        add     lr, r0, #4
        add     r2, r0, #6
        str     r1, [sp, #4]
LAWW27:
        mov     r3, r3, lsl #1
        ldrsh   r1, [r0, +r3]
        ldrsh   r6, [r2, +r3]
        ldrsh   r8, [r5, +r3]
        mul     r1, r1, r1
        ldrsh   r7, [lr, +r3]
        mul     r9, r6, r6
        mul     r8, r8, r8
        mul     r10, r7, r7
        mov     r6, r1, asr #1
        and     r6, r6, #1
        add     r11, r1, r6
        mov     r6, r8, asr #1
        mov     r7, r10, asr #1
        mov     r1, r9, asr #1
        and     r6, r6, #1
        and     r7, r7, #1
        and     r1, r1, #1
        cmp     r11, r4, lsl #1
        add     r6, r8, r6
        add     r7, r10, r7
        add     r1, r9, r1
        movgt   r8, #0xFF
        orrgt   r11, r8, #0x7F, 24
        movle   r11, r11, asr #1
        cmp     r6, r4, lsl #1
        strh    r11, [r0, +r3]
        movgt   r6, #0xFF
        orrgt   r6, r6, #0x7F, 24
        movle   r6, r6, asr #1
        cmp     r7, r4, lsl #1
        strh    r6, [r5, +r3]
        movgt   r6, #0xFF
        orrgt   r7, r6, #0x7F, 24
        movle   r7, r7, asr #1
        cmp     r1, r4, lsl #1
        strh    r7, [lr, +r3]
        movgt   r1, #0xFF
        orrgt   r1, r1, #0x7F, 24
        movle   r1, r1, asr #1
        strh    r1, [r2, +r3]
        ldr     r1, [sp, #4]
        mov     r3, r12
        add     r12, r12, #4
        cmp     r1, r12
        bge     LAWW27
        ldr     r1, [sp, #4]
LAWW28:
        cmp     r3, r1
        bge     LAWW25
        mov     r2, #0xFF
        orr     r2, r2, #0x7F, 24
        add     r0, r0, r3, lsl #1
LAWW29:
        ldrsh   r12, [r0]
        mul     r12, r12, r12
        mov     lr, r12, asr #1
        and     lr, lr, #1
        add     lr, r12, lr
        cmp     lr, r2, lsl #1
        movgt   r12, r2
        movle   r12, lr, asr #1
        add     r3, r3, #1
        strh    r12, [r0], #2
        cmp     r3, r1
        blt     LAWW29
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAWW30:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LAWW31:
        mvn     r0, #5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


