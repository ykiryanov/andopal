        .text
        .align  4
        .globl  _ippsMagnitude_32sc_Sfs


_ippsMagnitude_32sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        beq     LBIK21
        cmp     r4, #0
        beq     LBIK21
        cmp     r2, #0
        ble     LBIK20
        cmp     r3, #0x20
        bge     LBIK18
        cmp     r3, #0
        mvn     r12, #2, 2
        mov     lr, #2, 2
        blt     LBIK9
        cmp     r3, #0
        bne     LBIK4
        cmp     r2, #0
        ble     LBIK17
        mov     r6, #0
LBIK0:
        ldr     r3, [r5]
        cmp     r3, #2, 2
        ldrne   r7, [r5, #4]
        beq     LBIK19
LBIK1:
        smull   lr, r3, r3, r3
        smull   r9, r8, r7, r7
        mov     r7, #0
        mov     r11, #2, 2
        adds    lr, lr, r9
        adc     r3, r3, r8
LBIK2:
        orr     r8, r7, r11
        umull   r9, r10, r8, r8
        cmp     r3, r10
        cmpeq   lr, r9
        movcs   r7, r8
        movs    r11, r11, lsr #1
        bne     LBIK2
        umull   r8, r9, r7, r7
        adds    r8, r8, r7
        adc     r9, r9, #0
        cmp     r3, r9
        cmpeq   lr, r8
        addhi   r7, r7, #1
        cmn     r7, #6, 2
        strcc   r7, [r4]
        strcs   r12, [r4]
LBIK3:
        add     r6, r6, #1
        cmp     r6, r2
        add     r5, r5, #8
        add     r4, r4, #4
        blt     LBIK0
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBIK4:
        mov     r12, #1
        sub     lr, r3, #1
        cmp     r2, #0
        mov     r12, r12, lsl lr
        ble     LBIK17
        mov     r8, #0
LBIK5:
        ldr     lr, [r5, #4]
        ldr     r7, [r5], #8
        smull   r6, lr, lr, lr
        smull   r9, r7, r7, r7
        adds    r6, r9, r6
        adc     lr, r7, lr
        cmp     r12, #2, 2
        moveq   r7, #0
        moveq   r9, #2, 2
        beq     LBIK7
        mov     r7, #0
        mov     r9, #2, 2
LBIK6:
        orr     r0, r7, r9
        umull   r11, r10, r0, r0
        cmp     lr, r10
        cmpeq   r6, r11
        movcs   r7, r0
        mov     r9, r9, lsr #1
        cmp     r9, r12
        bne     LBIK6
LBIK7:
        orr     r9, r7, r9
        umull   r9, r10, r9, r9
        cmp     r10, lr
        mov     r7, r7, lsr r3
        cmpeq   r9, r6
        bhi     LBIK8
        cmp     r10, lr
        cmpeq   r9, r6
        andcs   lr, r7, #1
        addcs   r7, r7, lr
        addcc   r7, r7, #1
LBIK8:
        cmn     r7, #6, 2
        mvncs   r7, #2, 2
        add     r8, r8, #1
        str     r7, [r4], #4
        cmp     r8, r2
        blt     LBIK5
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBIK9:
        rsb     r3, r3, #0
        cmp     r3, #0x20
        bge     LBIK15
        cmp     r2, #0
        mov     r12, lr, lsr r3
        ble     LBIK17
        rsb     lr, r3, #0x20
        mov     r9, #0
        str     lr, [sp, #0x14]
        str     r12, [sp]
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
LBIK10:
        ldr     r3, [r5, #4]
        ldr     r2, [r5], #8
        smull   r12, r3, r3, r3
        mov     r0, #0
        smull   r6, lr, r2, r2
        mov     r2, #2, 2
        adds    r8, r6, r12
        adc     r7, lr, r3
LBIK11:
        orr     r3, r0, r2
        umull   r12, lr, r3, r3
        cmp     r7, lr
        cmpeq   r8, r12
        movcs   r0, r3
        movs    r2, r2, lsr #1
        bne     LBIK11
        umull   r6, lr, r0, r0
        ldr     r2, [sp]
        cmp     r2, #2, 2
        moveq   r10, #0
        moveq   r2, #2, 2
        beq     LBIK13
        str     r9, [sp, #0x10]
        ldr     r9, [sp]
        mov     r10, #0
        mov     r2, #2, 2
        str     r5, [sp, #0x18]
        str     r4, [sp, #4]
LBIK12:
        orr     r5, r2, r10
        umull   r1, r11, r5, r5
        umull   r3, r4, r5, r0
        mov     r12, r11, lsr #16
        mov     r11, r11, lsl #16
        orr     r1, r11, r1, lsr #16
        mov     r11, r12, lsl #15
        orr     r1, r11, r1, lsr #17
        adds    r3, r1, r3
        adc     r12, r4, r12, lsr #17
        mov     r1, r12, lsl #1
        orr     r3, r1, r3, lsr #31
        adds    r1, r6, r3
        adc     r12, lr, r12, lsr #31
        cmp     r12, r7
        cmpeq   r1, r8
        movcc   r10, r5
        mov     r2, r2, lsr #1
        cmp     r2, r9
        bne     LBIK12
        ldr     r5, [sp, #0x18]
        ldr     r9, [sp, #0x10]
        ldr     r4, [sp, #4]
LBIK13:
        orr     r2, r2, r10
        umull   r1, r11, r2, r2
        umull   r3, r12, r2, r0
        mov     r2, r11, lsr #16
        mov     r11, r11, lsl #16
        orr     r11, r11, r1, lsr #16
        mov     r1, r2, lsl #15
        orr     r11, r1, r11, lsr #17
        adds    r3, r11, r3
        adc     r12, r12, r2, lsr #17
        ldr     r2, [sp, #0xC]
        mov     r11, r12, lsl #1
        orr     r11, r11, r3, lsr #31
        adds    r6, r6, r11
        adc     r11, lr, r12, lsr #31
        mov     r1, #0
        mov     r3, #0
        bl      __ashldi3
        ldr     r2, [sp, #0x14]
        cmp     r11, r7
        cmpeq   r6, r8
        orr     r10, r0, r10, lsr r2
        bcs     LBIK14
        adds    r10, r10, #1
        adc     r1, r1, #0
LBIK14:
        mvn     r2, #2, 2
        cmp     r10, r2
        sbcs    r1, r1, #0
        movge   r10, r2
        str     r10, [r4], #4
        ldr     r2, [sp, #8]
        add     r9, r9, #1
        cmp     r9, r2
        blt     LBIK10
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBIK15:
        cmp     r2, #0
        ble     LBIK17
        mov     r3, #0
LBIK16:
        ldr     lr, [r5, #4]
        ldr     r7, [r5], #8
        smull   r6, lr, lr, lr
        smull   r8, r7, r7, r7
        adds    r6, r8, r6
        adc     lr, r7, lr
        orrs    lr, r6, lr
        moveq   lr, #0
        movne   lr, r12
        add     r3, r3, #1
        str     lr, [r4], #4
        cmp     r3, r2
        blt     LBIK16
LBIK17:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBIK18:
        mov     r0, r4
        mov     r1, r2
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, lr}
        b       _ippsZero_32s
LBIK19:
        ldr     r7, [r5, #4]
        cmp     r7, #2, 2
        streq   r12, [r4]
        beq     LBIK3
        b       LBIK1
LBIK20:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LBIK21:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


