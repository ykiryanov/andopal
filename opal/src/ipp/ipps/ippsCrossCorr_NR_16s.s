        .text
        .align  4
        .globl  _ippsCrossCorr_NR_16s


_ippsCrossCorr_NR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r12, [sp, #0x40]
        cmp     r0, #0
        beq     LDUU8
        cmp     r1, #0
        beq     LDUU8
        cmp     r3, #0
        beq     LDUU8
        cmp     r2, #0
        ble     LDUU7
        cmp     r12, #0
        ble     LDUU7
        cmp     r12, #0
        ble     LDUU5
        sub     lr, r2, #6
        mov     r9, #0
        str     lr, [sp, #0x18]
LDUU0:
        cmp     r2, #0
        movle   lr, #0
        movle   r4, r9, lsl #1
        ble     LDUU4
        cmp     r2, #6
        blt     LDUU6
        mov     r4, r9, lsl #1
        add     r5, r1, r4
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x18]
        mov     lr, #0
        mov     r6, lr
        mov     r8, r5
        mov     r7, r0
        str     r9, [sp, #0x14]
        str     r12, [sp, #0x10]
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
        str     r0, [sp]
LDUU1:
        ldrsh   r12, [r8]
        ldrsh   r9, [r7]
        ldrsh   r2, [r8, #2]
        ldrsh   r3, [r7, #2]
        ldrsh   r0, [r8, #4]
        mla     r11, r9, r12, lr
        ldrsh   r12, [r7, #4]
        ldrsh   lr, [r8, #6]
        ldrsh   r9, [r7, #6]
        ldrsh   r10, [r8, #8]
        mla     r11, r3, r2, r11
        ldrsh   r2, [r7, #8]
        add     r6, r6, #5
        cmp     r6, r1
        add     r8, r8, #0xA
        mla     r11, r12, r0, r11
        add     r7, r7, #0xA
        mla     r11, r9, lr, r11
        mla     lr, r2, r10, r11
        ble     LDUU1
        ldr     r9, [sp, #0x14]
        ldr     r12, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LDUU2:
        mov     r8, r6, lsl #1
        add     r7, r0, r6, lsl #1
LDUU3:
        ldrsh   r11, [r5, +r8]
        ldrsh   r10, [r7], #2
        add     r6, r6, #1
        add     r8, r8, #2
        mla     lr, r10, r11, lr
        cmp     r6, r2
        blt     LDUU3
LDUU4:
        add     lr, lr, #1, 18
        add     r9, r9, #1
        mov     lr, lr, asr #15
        cmp     r9, r12
        strh    lr, [r3, +r4]
        blt     LDUU0
LDUU5:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDUU6:
        mov     lr, #0
        mov     r4, r9, lsl #1
        mov     r6, lr
        add     r5, r1, r4
        b       LDUU2
LDUU7:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDUU8:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


