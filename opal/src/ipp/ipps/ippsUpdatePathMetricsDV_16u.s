        .text
        .align  4
        .globl  _ippsUpdatePathMetricsDV_16u


_ippsUpdatePathMetricsDV_16u:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r12, [sp, #0x1C]
        cmp     r0, #0
        beq     LANF10
        cmp     r1, #0
        beq     LANF10
        cmp     r2, #0
        beq     LANF10
        cmp     r3, #0
        beq     LANF10
        mov     lr, #0xFF
        cmp     r12, #0
        orr     lr, lr, #0xFF, 24
        mov     r8, #0
        movle   r4, r8
        ble     LANF1
        mov     r4, r8
        mov     r6, r4
        mov     r5, r0
LANF0:
        ldrh    r7, [r5], #2
        cmp     r7, lr
        movlt   lr, r7
        movlt   r4, r6
        add     r6, r6, #1
        cmp     r6, r12
        blt     LANF0
LANF1:
        cmp     r12, #0
        ble     LANF5
        cmp     r12, #6
        blt     LANF3
        sub     r7, r12, #6
        mov     r6, r0
        mov     r5, r3
LANF2:
        ldrh    r9, [r6]
        add     r8, r8, #5
        cmp     r8, r7
        sub     r9, r9, lr
        strh    r9, [r5]
        ldrh    r9, [r6, #2]
        sub     r9, r9, lr
        strh    r9, [r5, #2]
        ldrh    r9, [r6, #4]
        sub     r9, r9, lr
        strh    r9, [r5, #4]
        ldrh    r9, [r6, #6]
        sub     r9, r9, lr
        strh    r9, [r5, #6]
        ldrh    r9, [r6, #8]
        add     r6, r6, #0xA
        sub     r9, r9, lr
        strh    r9, [r5, #8]
        add     r5, r5, #0xA
        ble     LANF2
LANF3:
        add     r3, r3, r8, lsl #1
        add     r5, r0, r8, lsl #1
LANF4:
        ldrh    r6, [r5], #2
        add     r8, r8, #1
        sub     r6, r6, lr
        strh    r6, [r3], #2
        cmp     r8, r12
        blt     LANF4
LANF5:
        cmp     r12, #0
        ble     LANF9
        mov     r3, #0xFF
        cmp     r12, #6
        orr     r3, r3, #0xFF, 24
        mov     r5, #0
        blt     LANF7
        sub     r7, r12, #6
        mov     r6, r0
LANF6:
        add     r5, r5, #5
        strh    r3, [r6]
        strh    r3, [r6, #2]
        strh    r3, [r6, #4]
        strh    r3, [r6, #6]
        strh    r3, [r6, #8]
        cmp     r5, r7
        add     r6, r6, #0xA
        ble     LANF6
LANF7:
        add     r0, r0, r5, lsl #1
LANF8:
        add     r5, r5, #1
        strh    r3, [r0], #2
        cmp     r5, r12
        blt     LANF8
LANF9:
        strh    lr, [r1]
        mov     r0, #0
        strb    r4, [r2]
        ldmia   sp!, {r4 - r9, pc}
LANF10:
        mvn     r0, #7
        ldmia   sp!, {r4 - r9, pc}


