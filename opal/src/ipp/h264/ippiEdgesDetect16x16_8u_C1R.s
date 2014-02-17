        .text
        .align  4
        .globl  ippiEdgesDetect16x16_8u_C1R


ippiEdgesDetect16x16_8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        cmp     r0, #0
        beq     LKJF5
        cmp     r12, #0
        beq     LKJF5
        mov     r6, #0
        add     r4, r0, r1
        mov     r5, #0xF
LKJF0:
        mov     r7, r0
        mov     r8, r4
        mov     r9, #0xF
LKJF1:
        ldrb    lr, [r7, #1]
        ldrb    r10, [r7]
        ldrb    r11, [r8], #1
        sub     lr, r10, lr
        sub     r10, r10, r11
        eor     r11, lr, lr, asr #31
        sub     r11, r11, lr, asr #31
        and     lr, r11, #0xFF
        cmp     lr, r2
        eor     lr, r10, r10, asr #31
        sub     lr, lr, r10, asr #31
        and     lr, lr, #0xFF
        bgt     LKJF2
        cmp     lr, r2
        ble     LKJF3
LKJF2:
        add     r6, r6, #1
LKJF3:
        subs    r9, r9, #1
        add     r7, r7, #1
        bne     LKJF1
        and     lr, r6, #0xFF
        cmp     lr, r3
        bgt     LKJF4
        subs    r5, r5, #1
        add     r4, r4, r1
        add     r0, r0, r1
        bne     LKJF0
LKJF4:
        cmp     lr, r3
        movle   r0, #0
        movgt   r0, #1
        strb    r0, [r12]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LKJF5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}


