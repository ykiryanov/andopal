        .text
        .align  4
        .globl  ownps_SubCRev_16u_ISfs


ownps_SubCRev_16u_ISfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        cmp     r3, #0
        mov     lr, #0
        bne     LCZO3
        cmp     r2, #0
        ble     LCZO7
        cmp     r2, #6
        movlt   r12, #0
        blt     LCZO1
        mov     r12, #0
        sub     r6, r2, #6
        mov     r5, r12
        mov     r4, r1
LCZO0:
        ldrh    r8, [r4]
        ldrh    r7, [r4, #2]
        ldrh    r3, [r4, #4]
        sub     r8, r0, r8
        cmp     r8, #0
        mov     r9, r5
        movgt   r9, r8
        sub     r7, r0, r7
        cmp     r7, #0
        mov     r8, r5
        movgt   r8, r7
        ldrh    r7, [r4, #6]
        sub     r3, r0, r3
        strh    r8, [r4, #2]
        cmp     r3, #0
        mov     r8, r5
        movgt   r8, r3
        ldrh    r3, [r4, #8]
        sub     r7, r0, r7
        strh    r8, [r4, #4]
        cmp     r7, #0
        mov     r8, r5
        movgt   r8, r7
        sub     r3, r0, r3
        cmp     r3, #0
        mov     r7, r5
        movgt   r7, r3
        add     r12, r12, #5
        strh    r9, [r4]
        strh    r8, [r4, #6]
        strh    r7, [r4, #8]
        cmp     r12, r6
        add     r4, r4, #0xA
        ble     LCZO0
LCZO1:
        add     r1, r1, r12, lsl #1
LCZO2:
        ldrh    r3, [r1]
        add     r12, r12, #1
        mov     r4, lr
        sub     r3, r0, r3
        cmp     r3, #0
        movgt   r4, r3
        strh    r4, [r1], #2
        cmp     r12, r2
        blt     LCZO2
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCZO3:
        cmp     r3, #0
        ble     LCZO8
        sub     r12, r3, #1
        mov     r4, #1
        mov     r12, r4, lsl r12
        cmp     r2, #0
        sub     r12, r12, #1
        ble     LCZO7
        cmp     r2, #5
        movlt   r7, #0
        blt     LCZO5
        mov     r7, #0
        sub     r6, r2, #5
        mov     r4, r7
        mov     r5, r1
        str     r1, [sp, #4]
        str     r2, [sp]
LCZO4:
        ldrh    r2, [r5]
        ldrh    r1, [r5, #2]
        add     r7, r7, #4
        sub     lr, r0, r2
        mov     r2, #0
        cmp     lr, #0
        movgt   r2, lr
        ldrh    lr, [r5, #4]
        mov     r4, #0
        sub     r1, r0, r1
        cmp     r1, #0
        movgt   r4, r1
        ldrh    r1, [r5, #6]
        sub     lr, r0, lr
        mov     r11, #0
        cmp     lr, #0
        movgt   r11, lr
        sub     lr, r0, r1
        mov     r1, #0
        cmp     lr, #0
        movgt   r1, lr
        add     r9, r12, r2
        mov     lr, r4, asr r3
        mov     r8, r11, asr r3
        mov     r10, r1, asr r3
        mov     r2, r2, asr r3
        and     r2, r2, #1
        and     lr, lr, #1
        and     r8, r8, #1
        and     r10, r10, #1
        add     r4, r12, r4
        add     r11, r12, r11
        add     r1, r12, r1
        add     r2, r9, r2
        add     lr, r4, lr
        add     r8, r11, r8
        add     r10, r1, r10
        mov     r2, r2, asr r3
        mov     lr, lr, asr r3
        mov     r8, r8, asr r3
        mov     r10, r10, asr r3
        strh    r2, [r5]
        strh    lr, [r5, #2]
        strh    r8, [r5, #4]
        strh    r10, [r5, #6]
        cmp     r7, r6
        add     r5, r5, #8
        ble     LCZO4
        ldr     r1, [sp, #4]
        ldr     r2, [sp]
        mov     lr, #0
LCZO5:
        add     r1, r1, r7, lsl #1
LCZO6:
        ldrh    r4, [r1]
        add     r7, r7, #1
        sub     r5, r0, r4
        cmp     r5, #0
        mov     r4, lr
        movgt   r4, r5
        mov     r5, r4, asr r3
        and     r5, r5, #1
        add     r4, r12, r4
        add     r5, r4, r5
        mov     r4, r5, asr r3
        strh    r4, [r1], #2
        cmp     r7, r2
        blt     LCZO6
LCZO7:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCZO8:
        mov     r12, #0xFF
        cmn     r3, #0xF
        orr     r12, r12, #0xFF, 24
        bge     LCZO10
        cmp     r2, #0
        ble     LCZO7
        mov     r3, #0
LCZO9:
        ldrh    lr, [r1]
        cmp     lr, r0
        movge   lr, #0
        movlt   lr, r12
        add     r3, r3, #1
        strh    lr, [r1], #2
        cmp     r3, r2
        blt     LCZO9
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCZO10:
        cmp     r2, #0
        rsb     r3, r3, #0
        ble     LCZO7
        cmp     r2, #5
        movlt   r7, #0
        blt     LCZO12
        mov     r7, #0
        sub     r6, r2, #5
        mov     r5, r7
        mov     r4, r1
LCZO11:
        ldrh    r8, [r4]
        mov     r9, r5
        add     r7, r7, #4
        sub     r8, r0, r8
        cmp     r8, #0
        movgt   r9, r8
        mov     r8, r9, lsl r3
        cmp     r8, r12
        mov     r9, r12
        movlt   r9, r8
        strh    r9, [r4]
        ldrh    r9, [r4, #2]
        ldrh    r8, [r4, #4]
        mov     r10, r5
        sub     r9, r0, r9
        cmp     r9, #0
        movgt   r10, r9
        mov     r9, r10, lsl r3
        cmp     r9, r12
        mov     r10, r12
        movlt   r10, r9
        sub     r8, r0, r8
        cmp     r8, #0
        mov     r9, r5
        movgt   r9, r8
        mov     r8, r9, lsl r3
        cmp     r8, r12
        mov     r9, r12
        movlt   r9, r8
        ldrh    r8, [r4, #6]
        strh    r9, [r4, #4]
        strh    r10, [r4, #2]
        sub     r8, r0, r8
        cmp     r8, #0
        mov     r9, r5
        movgt   r9, r8
        mov     r8, r9, lsl r3
        cmp     r8, r12
        mov     r9, r12
        movlt   r9, r8
        strh    r9, [r4, #6]
        cmp     r7, r6
        add     r4, r4, #8
        ble     LCZO11
LCZO12:
        add     r1, r1, r7, lsl #1
LCZO13:
        ldrh    r4, [r1]
        add     r7, r7, #1
        mov     r5, lr
        sub     r4, r0, r4
        cmp     r4, #0
        movgt   r5, r4
        mov     r4, r5, lsl r3
        cmp     r4, r12
        mov     r5, r12
        movlt   r5, r4
        strh    r5, [r1], #2
        cmp     r7, r2
        blt     LCZO13
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


