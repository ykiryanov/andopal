        .text
        .align  4
        .globl  ownps_SubC_16u_Sfs


ownps_SubC_16u_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r12, [sp, #0x20]
        cmp     r12, #0
        mov     lr, #0
        bne     LCZL3
        cmp     r3, #0
        ble     LCZL7
        cmp     r3, #6
        movlt   r12, #0
        blt     LCZL1
        mov     r12, #0
        sub     r7, r3, #6
        mov     r6, r12
        mov     r5, r0
        mov     r4, r2
LCZL0:
        ldrh    r8, [r5]
        add     r12, r12, #5
        mov     r9, r6
        sub     r8, r8, r1
        cmp     r8, #0
        movgt   r9, r8
        strh    r9, [r4]
        ldrh    r8, [r5, #2]
        mov     r9, r6
        sub     r8, r8, r1
        cmp     r8, #0
        movgt   r9, r8
        strh    r9, [r4, #2]
        ldrh    r8, [r5, #4]
        mov     r9, r6
        sub     r8, r8, r1
        cmp     r8, #0
        movgt   r9, r8
        strh    r9, [r4, #4]
        ldrh    r8, [r5, #6]
        mov     r9, r6
        sub     r8, r8, r1
        cmp     r8, #0
        movgt   r9, r8
        strh    r9, [r4, #6]
        ldrh    r8, [r5, #8]
        add     r5, r5, #0xA
        mov     r9, r6
        sub     r8, r8, r1
        cmp     r8, #0
        movgt   r9, r8
        strh    r9, [r4, #8]
        cmp     r12, r7
        add     r4, r4, #0xA
        ble     LCZL0
LCZL1:
        add     r0, r0, r12, lsl #1
        add     r2, r2, r12, lsl #1
LCZL2:
        ldrh    r4, [r0], #2
        add     r12, r12, #1
        sub     r4, r4, r1
        cmp     r4, #0
        mov     r5, lr
        movgt   r5, r4
        strh    r5, [r2], #2
        cmp     r12, r3
        blt     LCZL2
        ldmia   sp!, {r4 - r10, pc}
LCZL3:
        cmp     r12, #0
        ble     LCZL8
        sub     r4, r12, #1
        mov     r5, #1
        mov     r4, r5, lsl r4
        cmp     r3, #0
        sub     r4, r4, #1
        ble     LCZL7
        cmp     r3, #5
        movlt   r5, #0
        blt     LCZL5
        mov     r5, #0
        sub     r8, r3, #5
        mov     r7, r0
        mov     r6, r2
LCZL4:
        ldrh    r9, [r7]
        add     r5, r5, #4
        sub     r10, r9, r1
        cmp     r10, #0
        mov     r9, lr
        movgt   r9, r10
        mov     r10, r9, asr r12
        add     r9, r4, r9
        and     r10, r10, #1
        add     r10, r9, r10
        mov     r9, r10, asr r12
        strh    r9, [r6]
        ldrh    r9, [r7, #2]
        sub     r10, r9, r1
        cmp     r10, #0
        mov     r9, lr
        movgt   r9, r10
        mov     r10, r9, asr r12
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr r12
        strh    r9, [r6, #2]
        ldrh    r9, [r7, #4]
        sub     r10, r9, r1
        cmp     r10, #0
        mov     r9, lr
        movgt   r9, r10
        mov     r10, r9, asr r12
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr r12
        strh    r9, [r6, #4]
        ldrh    r9, [r7, #6]
        add     r7, r7, #8
        sub     r10, r9, r1
        cmp     r10, #0
        mov     r9, lr
        movgt   r9, r10
        mov     r10, r9, asr r12
        and     r10, r10, #1
        add     r9, r4, r9
        add     r10, r9, r10
        mov     r9, r10, asr r12
        strh    r9, [r6, #6]
        cmp     r5, r8
        add     r6, r6, #8
        ble     LCZL4
LCZL5:
        add     r0, r0, r5, lsl #1
        add     r2, r2, r5, lsl #1
        mov     lr, #0
LCZL6:
        ldrh    r6, [r0], #2
        add     r5, r5, #1
        sub     r7, r6, r1
        cmp     r7, #0
        mov     r6, lr
        movgt   r6, r7
        mov     r7, r6, asr r12
        and     r7, r7, #1
        add     r6, r4, r6
        add     r7, r6, r7
        mov     r6, r7, asr r12
        strh    r6, [r2], #2
        cmp     r5, r3
        blt     LCZL6
LCZL7:
        ldmia   sp!, {r4 - r10, pc}
LCZL8:
        mov     r4, #0xFF
        cmn     r12, #0xF
        orr     r4, r4, #0xFF, 24
        bge     LCZL10
        cmp     r3, #0
        ble     LCZL7
        mov     r12, #0
LCZL9:
        ldrh    lr, [r0], #2
        cmp     lr, r1
        movle   lr, #0
        movgt   lr, r4
        add     r12, r12, #1
        strh    lr, [r2], #2
        cmp     r12, r3
        blt     LCZL9
        ldmia   sp!, {r4 - r10, pc}
LCZL10:
        cmp     r3, #0
        rsb     r12, r12, #0
        ble     LCZL7
        cmp     r3, #5
        movlt   r5, #0
        blt     LCZL12
        mov     r5, #0
        sub     r8, r3, #5
        mov     r7, r0
        mov     r6, r2
LCZL11:
        ldrh    r9, [r7]
        add     r5, r5, #4
        mov     r10, lr
        sub     r9, r9, r1
        cmp     r9, #0
        movgt   r10, r9
        mov     r9, r10, lsl r12
        cmp     r9, r4
        mov     r10, r4
        movlt   r10, r9
        strh    r10, [r6]
        ldrh    r9, [r7, #2]
        mov     r10, lr
        sub     r9, r9, r1
        cmp     r9, #0
        movgt   r10, r9
        mov     r9, r10, lsl r12
        cmp     r9, r4
        mov     r10, r4
        movlt   r10, r9
        strh    r10, [r6, #2]
        ldrh    r9, [r7, #4]
        mov     r10, lr
        sub     r9, r9, r1
        cmp     r9, #0
        movgt   r10, r9
        mov     r9, r10, lsl r12
        cmp     r9, r4
        mov     r10, r4
        movlt   r10, r9
        strh    r10, [r6, #4]
        ldrh    r9, [r7, #6]
        add     r7, r7, #8
        mov     r10, lr
        sub     r9, r9, r1
        cmp     r9, #0
        movgt   r10, r9
        mov     r9, r10, lsl r12
        cmp     r9, r4
        mov     r10, r4
        movlt   r10, r9
        strh    r10, [r6, #6]
        cmp     r5, r8
        add     r6, r6, #8
        ble     LCZL11
LCZL12:
        mov     lr, #0xFF
        orr     lr, lr, #0xFF, 24
        add     r0, r0, r5, lsl #1
        add     r2, r2, r5, lsl #1
        mov     r4, #0
LCZL13:
        ldrh    r6, [r0], #2
        add     r5, r5, #1
        sub     r6, r6, r1
        cmp     r6, #0
        mov     r7, r4
        movgt   r7, r6
        mov     r6, r7, lsl r12
        cmp     r6, lr
        mov     r7, lr
        movlt   r7, r6
        strh    r7, [r2], #2
        cmp     r5, r3
        blt     LCZL13
        ldmia   sp!, {r4 - r10, pc}


