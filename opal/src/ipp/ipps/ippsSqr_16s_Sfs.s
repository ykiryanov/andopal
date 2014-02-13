        .text
        .align  4
        .globl  _ippsSqr_16s_Sfs


_ippsSqr_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        cmp     r0, #0
        beq     LAWV34
        cmp     r1, #0
        beq     LAWV34
        cmp     r2, #0
        ble     LAWV35
        mov     r12, #0xFF
        orr     r5, r12, #0x7F, 24
        cmp     r3, #0
        mov     r12, #0
        mov     lr, #4
        bne     LAWV5
        cmp     r2, #4
        blt     LAWV1
        add     r9, r0, #2
        add     r8, r1, #6
        add     r7, r0, #4
        add     r6, r0, #6
        add     r4, r1, #2
        add     r3, r1, #4
        str     r8, [sp, #0x18]
        str     r9, [sp, #0x10]
        str     r2, [sp, #0x14]
LAWV0:
        ldr     r2, [sp, #0x10]
        mov     r9, r12, lsl #1
        ldrsh   r12, [r0, +r9]
        ldrsh   r2, [r2, +r9]
        ldrsh   r8, [r7, +r9]
        ldrsh   r10, [r6, +r9]
        mul     r11, r12, r12
        mul     r2, r2, r2
        mul     r8, r8, r8
        mul     r10, r10, r10
        mov     r12, lr
        cmp     r5, r11
        movlt   r11, r5
        cmp     r5, r2
        movlt   r2, r5
        cmp     r5, r8
        strh    r11, [r1, +r9]
        movlt   r8, r5
        strh    r2, [r4, +r9]
        strh    r8, [r3, +r9]
        ldr     r2, [sp, #0x14]
        cmp     r5, r10
        movlt   r10, r5
        add     lr, lr, #4
        cmp     r2, lr
        ldr     r2, [sp, #0x18]
        strh    r10, [r2, +r9]
        bge     LAWV0
        ldr     r2, [sp, #0x14]
LAWV1:
        cmp     r12, r2
        bge     LAWV29
        sub     r3, r2, r12
        cmp     r3, #5
        mov     r3, #0xFF
        orr     r3, r3, #0x7F, 24
        blt     LAWV3
        sub     r5, r2, #5
        add     r4, r0, r12, lsl #1
        add     lr, r1, r12, lsl #1
LAWV2:
        ldrsh   r6, [r4]
        add     r12, r12, #4
        mul     r6, r6, r6
        cmp     r3, r6
        movlt   r6, r3
        strh    r6, [lr]
        ldrsh   r6, [r4, #2]
        mul     r6, r6, r6
        cmp     r3, r6
        movlt   r6, r3
        strh    r6, [lr, #2]
        ldrsh   r6, [r4, #4]
        mul     r6, r6, r6
        cmp     r3, r6
        movlt   r6, r3
        strh    r6, [lr, #4]
        ldrsh   r6, [r4, #6]
        add     r4, r4, #8
        mul     r6, r6, r6
        cmp     r3, r6
        movlt   r6, r3
        strh    r6, [lr, #6]
        cmp     r12, r5
        add     lr, lr, #8
        ble     LAWV2
LAWV3:
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
LAWV4:
        ldrsh   lr, [r0], #2
        add     r12, r12, #1
        mul     lr, lr, lr
        cmp     r3, lr
        movlt   lr, r3
        strh    lr, [r1], #2
        cmp     r12, r2
        blt     LAWV4
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWV5:
        cmp     r3, #0
        ble     LAWV23
        cmp     r3, #0x1E
        bgt     LAWV19
        cmp     r3, #1
        beq     LAWV30
        sub     r4, r3, #1
        mov     r6, #1
        mov     r4, r6, lsl r4
        cmp     r3, #0xF
        sub     r4, r4, #1
        bgt     LAWV13
        cmp     r2, #4
        blt     LAWV11
        add     r9, r0, #2
        add     r10, r0, #4
        add     r11, r1, #4
        add     r8, r1, #6
        add     r7, r0, #6
        add     r6, r1, #2
        str     r0, [sp, #0xC]
        str     r8, [sp, #0x18]
        str     r11, [sp, #8]
        str     r10, [sp, #4]
        str     r9, [sp, #0x10]
        str     r2, [sp, #0x14]
        str     r1, [sp]
LAWV6:
        ldr     r2, [sp, #0x10]
        mov     r0, r12, lsl #1
        ldr     r1, [sp, #0xC]
        ldrsh   r8, [r2, +r0]
        ldr     r2, [sp, #4]
        ldrsh   r1, [r1, +r0]
        mul     r9, r8, r8
        ldrsh   r12, [r2, +r0]
        ldrsh   r2, [r7, +r0]
        mul     r1, r1, r1
        mul     r10, r12, r12
        mul     r11, r2, r2
        mov     r2, r1, asr r3
        and     r2, r2, #1
        add     r8, r1, r2
        mov     r1, r9, asr r3
        mov     r12, r11, asr r3
        mov     r2, r10, asr r3
        and     r1, r1, #1
        and     r12, r12, #1
        and     r2, r2, #1
        add     r1, r9, r1
        add     r11, r11, r12
        add     r8, r4, r8
        add     r2, r10, r2
        add     r12, r4, r1
        cmp     r8, r5, lsl r3
        add     r2, r4, r2
        add     r1, r4, r11
        movgt   r8, #0xFF
        orrgt   r8, r8, #0x7F, 24
        bgt     LAWV7
        mov     r8, r8, asr r3
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
LAWV7:
        ldr     r9, [sp]
        cmp     r12, r5, lsl r3
        strh    r8, [r9, +r0]
        movgt   r12, #0xFF
        orrgt   r12, r12, #0x7F, 24
        bgt     LAWV8
        mov     r12, r12, asr r3
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
LAWV8:
        cmp     r2, r5, lsl r3
        strh    r12, [r6, +r0]
        movgt   r2, #0xFF
        orrgt   r2, r2, #0x7F, 24
        bgt     LAWV9
        mov     r2, r2, asr r3
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LAWV9:
        ldr     r12, [sp, #8]
        cmp     r1, r5, lsl r3
        strh    r2, [r12, +r0]
        movgt   r1, #0xFF
        orrgt   r1, r1, #0x7F, 24
        bgt     LAWV10
        mov     r1, r1, asr r3
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
LAWV10:
        mov     r12, lr
        ldr     r2, [sp, #0x14]
        add     lr, lr, #4
        cmp     r2, lr
        ldr     r2, [sp, #0x18]
        strh    r1, [r2, +r0]
        bge     LAWV6
        ldr     r0, [sp, #0xC]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp]
LAWV11:
        cmp     r12, r2
        bge     LAWV29
        mov     lr, #0xFF
        orr     lr, lr, #0x7F, 24
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
LAWV12:
        ldrsh   r6, [r0], #2
        mul     r6, r6, r6
        mov     r7, r6, asr r3
        and     r7, r7, #1
        add     r7, r6, r7
        add     r6, r4, r7
        cmp     r6, r5, lsl r3
        movgt   r6, lr
        movle   r6, r6, asr r3
        add     r12, r12, #1
        strh    r6, [r1], #2
        cmp     r12, r2
        blt     LAWV12
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWV13:
        cmp     r2, #4
        blt     LAWV15
        add     r8, r0, #2
        add     r9, r0, #6
        add     r10, r1, #4
        add     r7, r0, #4
        add     r6, r1, #2
        add     r5, r1, #6
        str     r0, [sp, #0xC]
        str     r10, [sp, #8]
        str     r9, [sp, #0x18]
        str     r8, [sp, #0x10]
        str     r2, [sp, #0x14]
LAWV14:
        mov     r0, r12, lsl #1
        ldr     r12, [sp, #0x10]
        ldr     r2, [sp, #0xC]
        ldr     r9, [sp, #0x18]
        ldrsh   r8, [r12, +r0]
        ldrsh   r12, [r7, +r0]
        ldrsh   r2, [r2, +r0]
        ldrsh   r9, [r9, +r0]
        mul     r11, r8, r8
        mul     r8, r12, r12
        mul     r2, r2, r2
        mul     r9, r9, r9
        mov     r10, r8, asr r3
        and     r10, r10, #1
        add     r10, r8, r10
        mov     r12, r2, asr r3
        and     r12, r12, #1
        add     r2, r2, r12
        mov     r12, r11, asr r3
        and     r12, r12, #1
        add     r12, r11, r12
        add     r2, r4, r2
        add     r12, r4, r12
        mov     r2, r2, asr r3
        strh    r2, [r1, +r0]
        mov     r12, r12, asr r3
        strh    r12, [r6, +r0]
        ldr     r8, [sp, #8]
        add     r10, r4, r10
        mov     r11, r9, asr r3
        mov     r10, r10, asr r3
        and     r11, r11, #1
        strh    r10, [r8, +r0]
        ldr     r8, [sp, #0x14]
        add     r11, r9, r11
        add     r2, r4, r11
        mov     r12, lr
        add     lr, lr, #4
        mov     r2, r2, asr r3
        cmp     r8, lr
        strh    r2, [r5, +r0]
        bge     LAWV14
        ldr     r0, [sp, #0xC]
        ldr     r2, [sp, #0x14]
LAWV15:
        cmp     r12, r2
        bge     LAWV29
        sub     lr, r2, r12
        cmp     lr, #4
        blt     LAWV17
        sub     r6, r2, #4
        add     r5, r0, r12, lsl #1
        add     lr, r1, r12, lsl #1
LAWV16:
        ldrsh   r7, [r5]
        add     r12, r12, #3
        cmp     r12, r6
        mul     r7, r7, r7
        mov     r8, r7, asr r3
        and     r8, r8, #1
        add     r8, r7, r8
        add     r7, r4, r8
        mov     r7, r7, asr r3
        strh    r7, [lr]
        ldrsh   r7, [r5, #2]
        mul     r7, r7, r7
        mov     r8, r7, asr r3
        and     r8, r8, #1
        add     r8, r7, r8
        add     r7, r4, r8
        mov     r7, r7, asr r3
        strh    r7, [lr, #2]
        ldrsh   r7, [r5, #4]
        add     r5, r5, #6
        mul     r7, r7, r7
        mov     r8, r7, asr r3
        and     r8, r8, #1
        add     r8, r7, r8
        add     r7, r4, r8
        mov     r7, r7, asr r3
        strh    r7, [lr, #4]
        add     lr, lr, #6
        ble     LAWV16
LAWV17:
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
LAWV18:
        ldrsh   lr, [r0], #2
        add     r12, r12, #1
        mul     lr, lr, lr
        cmp     r12, r2
        mov     r5, lr, asr r3
        and     r5, r5, #1
        add     r5, lr, r5
        add     lr, r4, r5
        mov     lr, lr, asr r3
        strh    lr, [r1], #2
        blt     LAWV18
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWV19:
        cmp     r2, #6
        movlt   r0, r12
        blt     LAWV21
        mov     r0, r12
        sub     r4, r2, #6
        mov     lr, r0
        mov     r3, r1
LAWV20:
        add     r0, r0, #5
        strh    lr, [r3]
        strh    lr, [r3, #2]
        strh    lr, [r3, #4]
        strh    lr, [r3, #6]
        strh    lr, [r3, #8]
        cmp     r0, r4
        add     r3, r3, #0xA
        ble     LAWV20
LAWV21:
        add     r1, r1, r0, lsl #1
LAWV22:
        add     r0, r0, #1
        strh    r12, [r1], #2
        cmp     r0, r2
        blt     LAWV22
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWV23:
        rsb     r3, r3, #0
        cmp     r3, #0xE
        bgt     LAWV27
        cmp     r2, #4
        blt     LAWV25
        add     r9, r0, #2
        add     r10, r1, #2
        add     r8, r1, #6
        add     r7, r0, #4
        add     r6, r0, #6
        add     r4, r1, #4
        str     r8, [sp, #0x18]
        str     r10, [sp, #8]
        str     r9, [sp, #0x10]
LAWV24:
        mov     r8, r12, lsl #1
        ldr     r12, [sp, #0x10]
        ldrsh   r10, [r6, +r8]
        ldrsh   r11, [r0, +r8]
        ldrsh   r9, [r12, +r8]
        ldrsh   r12, [r7, +r8]
        mul     r11, r11, r11
        mul     r10, r10, r10
        mul     r9, r9, r9
        mul     r12, r12, r12
        cmp     r11, r5, asr r3
        movgt   r11, #0xFF
        orrgt   r11, r11, #0x7F, 24
        movle   r11, r11, lsl r3
        cmp     r9, r5, asr r3
        strh    r11, [r1, +r8]
        movgt   r9, #0xFF
        orrgt   r9, r9, #0x7F, 24
        movle   r9, r9, lsl r3
        ldr     r11, [sp, #8]
        cmp     r12, r5, asr r3
        strh    r9, [r11, +r8]
        movgt   r12, #0xFF
        orrgt   r12, r12, #0x7F, 24
        movle   r12, r12, lsl r3
        cmp     r10, r5, asr r3
        strh    r12, [r4, +r8]
        movgt   r12, #0xFF
        orrgt   r10, r12, #0x7F, 24
        movle   r10, r10, lsl r3
        mov     r12, lr
        ldr     r9, [sp, #0x18]
        add     lr, lr, #4
        cmp     r2, lr
        strh    r10, [r9, +r8]
        bge     LAWV24
LAWV25:
        cmp     r12, r2
        bge     LAWV29
        mov     lr, #0xFF
        orr     lr, lr, #0x7F, 24
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
LAWV26:
        ldrsh   r4, [r0], #2
        mul     r4, r4, r4
        cmp     r4, r5, asr r3
        movgt   r4, lr
        movle   r4, r4, lsl r3
        add     r12, r12, #1
        strh    r4, [r1], #2
        cmp     r12, r2
        blt     LAWV26
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWV27:
        cmp     r2, #0
        ble     LAWV29
        mov     r3, r12
LAWV28:
        ldrsh   lr, [r0], #2
        cmp     lr, #0
        moveq   lr, r12
        movne   lr, r5
        add     r3, r3, #1
        strh    lr, [r1], #2
        cmp     r3, r2
        blt     LAWV28
LAWV29:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWV30:
        cmp     r2, #4
        blt     LAWV32
        add     r6, r0, #2
        add     r7, r0, #4
        add     r8, r0, #6
        add     r9, r1, #4
        add     r4, r1, #2
        add     r3, r1, #6
        str     r9, [sp, #4]
        str     r8, [sp, #0x18]
        str     r7, [sp, #0x10]
        str     r6, [sp, #8]
LAWV31:
        mov     r6, r12, lsl #1
        ldr     r12, [sp, #8]
        ldrsh   r9, [r0, +r6]
        ldr     r7, [sp, #0x10]
        ldrsh   r12, [r12, +r6]
        ldr     r8, [sp, #0x18]
        mul     r10, r9, r9
        ldrsh   r7, [r7, +r6]
        mul     r12, r12, r12
        ldrsh   r8, [r8, +r6]
        mul     r7, r7, r7
        mov     r11, r10, asr #1
        and     r11, r11, #1
        mul     r8, r8, r8
        mov     r9, r12, asr #1
        and     r9, r9, #1
        add     r10, r10, r11
        add     r9, r12, r9
        mov     r12, r7, asr #1
        mov     r11, r8, asr #1
        and     r12, r12, #1
        and     r11, r11, #1
        cmp     r10, r5, lsl #1
        add     r12, r7, r12
        add     r11, r8, r11
        movgt   r7, #0xFF
        orrgt   r10, r7, #0x7F, 24
        movle   r10, r10, asr #1
        cmp     r9, r5, lsl #1
        strh    r10, [r1, +r6]
        movgt   r7, #0xFF
        orrgt   r9, r7, #0x7F, 24
        movle   r9, r9, asr #1
        cmp     r12, r5, lsl #1
        strh    r9, [r4, +r6]
        movgt   r12, #0xFF
        orrgt   r12, r12, #0x7F, 24
        movle   r12, r12, asr #1
        ldr     r7, [sp, #4]
        cmp     r11, r5, lsl #1
        strh    r12, [r7, +r6]
        movgt   r12, #0xFF
        orrgt   r11, r12, #0x7F, 24
        movle   r11, r11, asr #1
        mov     r12, lr
        add     lr, lr, #4
        cmp     r2, lr
        strh    r11, [r3, +r6]
        bge     LAWV31
LAWV32:
        cmp     r12, r2
        bge     LAWV29
        mov     r3, #0xFF
        orr     r3, r3, #0x7F, 24
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
LAWV33:
        ldrsh   lr, [r0], #2
        mul     lr, lr, lr
        mov     r4, lr, asr #1
        and     r4, r4, #1
        add     r4, lr, r4
        cmp     r4, r3, lsl #1
        movgt   lr, r3
        movle   lr, r4, asr #1
        add     r12, r12, #1
        strh    lr, [r1], #2
        cmp     r12, r2
        blt     LAWV33
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWV34:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LAWV35:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


