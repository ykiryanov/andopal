        .text
        .align  4
        .globl  _ippiHuffmanTableInitAlloc_32s


_ippiHuffmanTableInitAlloc_32s:
        cmp     r0, #0
        mov     r2, r1
        beq     LKVB0
        cmp     r2, #0
        bne     LKVB1
LKVB0:
        mvn     r0, #7
        bx      lr
LKVB1:
        mov     r1, r0
        mov     r0, #0
        b       LKVB_HuffmanInitAlloc
LKVB_HuffmanInitAlloc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        mov     r5, r1
        cmp     r5, #0
        mov     r4, r2
        beq     LKVB32
        cmp     r4, #0
        beq     LKVB32
        ldr     r0, [r5, #4]
        mov     r6, #0
        add     r0, r5, r0, lsl #2
        add     r12, r0, #8
        mov     r0, r6
LKVB2:
        ldr     r3, [r12]
        cmp     r3, #0
        blt     LKVB3
        add     r12, r12, r3, lsl #3
        add     r0, r0, r3
        add     r12, r12, #4
        b       LKVB2
LKVB3:
        mov     r0, r0, lsl #3
        bl      _ippsMalloc_8u
        ldr     lr, [r5, #8]
        ldr     r12, [r5, #4]
        mov     r3, #1
        mov     r9, r3
        mov     lr, r9, lsl lr
        add     r12, r5, r12, lsl #2
        add     r8, lr, #1
        add     r12, r12, #8
        add     r7, r5, #8
        add     lr, r5, #0xC
        str     r4, [sp, #0x24]
LKVB4:
        ldr     r4, [r12], #4
        cmp     r4, #0
        blt     LKVB16
        cmp     r4, #0
        ble     LKVB12
        mov     r2, r6, lsl #3
        sub     r2, r2, #4
        add     r2, r2, r0
        str     r0, [sp, #0x28]
LKVB5:
        ldr     r1, [r5, #4]
        cmp     r1, #0
        ldrle   r0, [r12]
        ble     LKVB11
        mov     r9, lr
        ldr     r0, [r12]
        str     r5, [sp, #0x18]
        ldr     r5, [sp, #0x28]
        str     r4, [sp, #0x10]
        mov     r11, #0
        mov     r10, r7
        str     r2, [sp, #0xC]
        str     lr, [sp, #0x1C]
        str     r7, [sp, #0x14]
        str     r12, [sp, #0x20]
        mov     r4, #1
LKVB6:
        ldr     r2, [r10], #4
        add     r11, r11, r2
        cmp     r3, r11
        ble     LKVB15
        sub     r2, r3, r11
        cmp     r6, #0
        mov     r2, r0, asr r2
        movle   r12, #0
        ble     LKVB14
        mov     r12, #0
        mov     lr, r5
LKVB7:
        ldr     r7, [lr, #4]
        cmp     r7, r11
        ble     LKVB8
        ldr     r5, [lr]
        sub     r7, r7, r11
        cmp     r2, r5, asr r7
        beq     LKVB13
LKVB8:
        add     r12, r12, #1
        cmp     r12, r6
        add     lr, lr, #8
        blt     LKVB7
        ldr     r5, [sp, #0x28]
LKVB9:
        ldr     r2, [r9]
        add     r2, r8, r4, lsl r2
        add     r8, r2, #1
LKVB10:
        subs    r1, r1, #1
        add     r9, r9, #4
        bne     LKVB6
        ldr     r2, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        ldr     lr, [sp, #0x1C]
        ldr     r7, [sp, #0x14]
        ldr     r12, [sp, #0x20]
        ldr     r5, [sp, #0x18]
LKVB11:
        str     r0, [r2, #4]
        str     r3, [r2, #8]!
        subs    r4, r4, #1
        add     r12, r12, #8
        add     r6, r6, #1
        bne     LKVB5
        ldr     r0, [sp, #0x28]
LKVB12:
        add     r3, r3, #1
        b       LKVB4
LKVB13:
        ldr     r5, [sp, #0x28]
LKVB14:
        cmp     r12, r6
        bge     LKVB9
        b       LKVB10
LKVB15:
        ldr     r2, [sp, #0xC]
        ldr     r4, [sp, #0x10]
        ldr     lr, [sp, #0x1C]
        ldr     r7, [sp, #0x14]
        ldr     r12, [sp, #0x20]
        ldr     r5, [sp, #0x18]
        b       LKVB11
LKVB16:
        ldr     r4, [sp, #0x24]
        bl      _ippsFree
        ldr     r3, [r5, #8]
        ldr     r6, [r5, #4]
        mov     r0, r8, lsl #2
        mov     r12, #1
        mov     r9, r12, lsl r3
        bl      _ippsMalloc_8u
        add     r9, r9, #1
        ldr     r10, [pc, #0x26C]
        cmp     r8, #0
        str     r0, [r4]
        ble     LKVB20
        cmp     r8, #6
        mov     r3, #0
        blt     LKVB18
        sub     lr, r8, #6
        add     r12, r0, #4
LKVB17:
        add     r3, r3, #5
        str     r10, [r12, #-4]
        str     r10, [r12]
        str     r10, [r12, #4]
        str     r10, [r12, #8]
        str     r10, [r12, #0xC]
        cmp     r3, lr
        add     r12, r12, #0x14
        ble     LKVB17
LKVB18:
        add     r12, r0, r3, lsl #2
LKVB19:
        add     r3, r3, #1
        str     r10, [r12], #4
        cmp     r3, r8
        blt     LKVB19
LKVB20:
        ldr     r3, [r5, #8]
        str     r3, [r0]
        ldr     r0, [r5, #4]
        add     r0, r0, #2
        ldr     r8, [r5, +r0, lsl #2]
        cmp     r8, #0
        blt     LKVB27
        mov     lr, #1
        mov     r12, #1
        add     r3, r5, #0xC
        str     r9, [sp, #0x1C]
        str     r4, [sp, #0x24]
LKVB21:
        add     r0, r0, #1
        add     r9, r0, r8, lsl #1
        cmp     r0, r9
        bge     LKVB26
        mov     r2, #4
        add     r4, r5, r0, lsl #2
        add     r2, r2, r4
        mov     r8, r0
        str     r9, [sp, #0x28]
        str     r5, [sp, #0x18]
LKVB22:
        ldr     r1, [sp, #0x24]
        cmp     r6, #0
        ldr     r1, [r1]
        ble     LKVB25
        mov     r10, r3
        mov     r5, r7
        mov     r9, r6
        str     r2, [sp]
        str     r3, [sp, #8]
        str     r0, [sp, #0xC]
        ldr     r2, [pc, #0x190]
        ldr     r0, [sp, #0x1C]
        ldr     r3, [sp, #0x18]
        mov     r11, #0
        str     r4, [sp, #4]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0x14]
LKVB23:
        ldr     r6, [r5], #4
        add     r11, r11, r6
        cmp     r11, r12
        bge     LKVB30
        ldr     r4, [r3, +r8, lsl #2]
        mov     r6, lr, lsl r6
        sub     r6, r6, #1
        sub     r7, r12, r11
        and     r4, r6, r4, asr r7
        add     r6, r1, #4
        ldr     r7, [r6, +r4, lsl #2]
        cmp     r2, r7
        beq     LKVB29
        and     r4, r7, #0xFF
        cmp     r4, #0x80
        beq     LKVB28
LKVB24:
        subs    r9, r9, #1
        add     r10, r10, #4
        bne     LKVB23
        str     r0, [sp, #0x1C]
        ldr     r2, [sp]
        ldr     r4, [sp, #4]
        ldr     r3, [sp, #8]
        ldr     r0, [sp, #0xC]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #0x14]
LKVB25:
        ldr     r1, [sp, #0x28]
        add     r0, r0, #2
        add     r8, r8, #2
        cmp     r0, r1
        add     r4, r4, #8
        add     r2, r2, #8
        blt     LKVB22
        ldr     r5, [sp, #0x18]
LKVB26:
        ldr     r8, [r5, +r0, lsl #2]
        add     r12, r12, #1
        cmp     r8, #0
        bge     LKVB21
LKVB27:
        mov     r0, #0
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LKVB28:
        tst     r7, #0xFF, 24
        beq     LKVB24
        ldr     r1, [sp, #0x24]
        bic     r7, r7, #0xFF
        ldr     r1, [r1]
        add     r1, r1, r7, asr #6
        b       LKVB24
LKVB29:
        mov     r1, r0, lsl #8
        orr     r1, r1, #0x80
        str     r1, [r6, +r4, lsl #2]
        ldr     r1, [sp, #0x24]
        ldr     r6, [r10]
        ldr     r4, [r1]
        str     r6, [r4, +r0, lsl #2]
        add     r1, r4, r0, lsl #2
        ldr     r4, [r10]
        add     r4, r0, lr, lsl r4
        add     r0, r4, #1
        b       LKVB24
LKVB30:
        ldr     r4, [sp, #4]
        str     r0, [sp, #0x1C]
        ldr     r2, [sp]
        ldr     r5, [r4]
        ldr     r3, [sp, #8]
        ldr     r0, [sp, #0xC]
        ldr     r7, [sp, #0x14]
        str     r5, [sp, #0x2C]
        ldr     r5, [r2]
        mov     r9, r6
        ldr     r6, [sp, #0x10]
        sub     r10, r12, r11
        add     r9, r10, r9
        sub     r11, r11, r12
        mov     r10, lr, lsl r11
        str     r10, [sp, #0x20]
        ldr     r10, [sp, #0x2C]
        mov     r9, lr, lsl r9
        sub     r9, r9, #1
        and     r9, r10, r9
        ldr     r10, [sp, #0x20]
        mov     r9, r9, lsl r11
        cmp     r10, #0
        ble     LKVB25
        ldr     r10, [sp, #0x20]
        add     r1, r1, #4
        orr     r5, r11, r5, lsl #8
LKVB31:
        str     r5, [r1, +r9, lsl #2]
        subs    r10, r10, #1
        add     r9, r9, #1
        bne     LKVB31
        b       LKVB25
LKVB32:
        mvn     r0, #7
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
        .long   0x00f0f101


