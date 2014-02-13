        .text
        .align  4
        .globl  _ippiHuffmanRunLevelTableInitAlloc_32s


_ippiHuffmanRunLevelTableInitAlloc_32s:
        cmp     r0, #0
        mov     r2, r1
        beq     LKVD0
        cmp     r2, #0
        bne     LKVD1
LKVD0:
        mvn     r0, #7
        bx      lr
LKVD1:
        mov     r1, r0
        mov     r0, #1
        b       LKVD_HuffmanInitAlloc
LKVD_HuffmanInitAlloc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x3C
        mov     r4, r1
        cmp     r4, #0
        mov     r7, r2
        beq     LKVD32
        cmp     r7, #0
        beq     LKVD32
        ldr     r0, [r4, #4]
        mov     r5, #0
        add     r0, r4, r0, lsl #2
        add     r3, r0, #8
        mov     r0, r5
LKVD2:
        ldr     r12, [r3]
        cmp     r12, #0
        blt     LKVD3
        add     lr, r12, r12, lsl #1
        add     r0, r0, r12
        add     lr, r3, lr, lsl #2
        add     r3, lr, #4
        b       LKVD2
LKVD3:
        mov     r0, r0, lsl #3
        bl      _ippsMalloc_8u
        ldr     lr, [r4, #8]
        ldr     r12, [r4, #4]
        mov     r3, #1
        mov     r9, r3
        mov     lr, r9, lsl lr
        add     r12, r4, r12, lsl #2
        add     r8, lr, #1
        add     r12, r12, #8
        add     r6, r4, #8
        add     lr, r4, #0xC
        str     r7, [sp, #0x28]
LKVD4:
        ldr     r7, [r12], #4
        cmp     r7, #0
        blt     LKVD16
        cmp     r7, #0
        ble     LKVD12
        mov     r2, r5, lsl #3
        sub     r2, r2, #4
        add     r2, r2, r0
        str     r0, [sp, #0x34]
LKVD5:
        ldr     r1, [r4, #4]
        cmp     r1, #0
        ldrle   r0, [r12]
        ble     LKVD11
        mov     r9, lr
        ldr     r0, [r12]
        mov     r10, r6
        str     r6, [sp, #0x18]
        ldr     r6, [sp, #0x34]
        str     r4, [sp, #0x1C]
        mov     r11, #0
        str     r2, [sp, #0x20]
        str     r7, [sp, #0x24]
        str     lr, [sp, #0x2C]
        str     r12, [sp, #0x30]
        mov     r4, #1
LKVD6:
        ldr     r2, [r10], #4
        add     r11, r11, r2
        cmp     r3, r11
        ble     LKVD15
        sub     r2, r3, r11
        cmp     r5, #0
        mov     r2, r0, asr r2
        movle   r12, #0
        ble     LKVD14
        mov     r12, #0
        mov     lr, r6
LKVD7:
        ldr     r7, [lr, #4]
        cmp     r7, r11
        ble     LKVD8
        ldr     r6, [lr]
        sub     r7, r7, r11
        cmp     r2, r6, asr r7
        beq     LKVD13
LKVD8:
        add     r12, r12, #1
        cmp     r12, r5
        add     lr, lr, #8
        blt     LKVD7
        ldr     r6, [sp, #0x34]
LKVD9:
        ldr     r2, [r9]
        add     r2, r8, r4, lsl r2
        add     r8, r2, #1
LKVD10:
        subs    r1, r1, #1
        add     r9, r9, #4
        bne     LKVD6
        ldr     r2, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        ldr     lr, [sp, #0x2C]
        ldr     r6, [sp, #0x18]
        ldr     r12, [sp, #0x30]
        ldr     r4, [sp, #0x1C]
LKVD11:
        str     r0, [r2, #4]
        str     r3, [r2, #8]!
        subs    r7, r7, #1
        add     r12, r12, #0xC
        add     r5, r5, #1
        bne     LKVD5
        ldr     r0, [sp, #0x34]
LKVD12:
        add     r3, r3, #1
        b       LKVD4
LKVD13:
        ldr     r6, [sp, #0x34]
LKVD14:
        cmp     r12, r5
        bge     LKVD9
        b       LKVD10
LKVD15:
        ldr     r2, [sp, #0x20]
        ldr     r7, [sp, #0x24]
        ldr     lr, [sp, #0x2C]
        ldr     r6, [sp, #0x18]
        ldr     r12, [sp, #0x30]
        ldr     r4, [sp, #0x1C]
        b       LKVD11
LKVD16:
        ldr     r7, [sp, #0x28]
        bl      _ippsFree
        ldr     r3, [r4, #8]
        ldr     r5, [r4, #4]
        mov     r0, r8, lsl #2
        mov     r12, #1
        mov     r9, r12, lsl r3
        bl      _ippsMalloc_8u
        add     lr, r9, #1
        ldr     r9, [pc, #0x2AC]
        cmp     r8, #0
        str     r0, [r7]
        ble     LKVD20
        cmp     r8, #6
        mov     r3, #0
        blt     LKVD18
        sub     r10, r8, #6
        add     r12, r0, #4
LKVD17:
        add     r3, r3, #5
        str     r9, [r12, #-4]
        str     r9, [r12]
        str     r9, [r12, #4]
        str     r9, [r12, #8]
        str     r9, [r12, #0xC]
        cmp     r3, r10
        add     r12, r12, #0x14
        ble     LKVD17
LKVD18:
        add     r12, r0, r3, lsl #2
LKVD19:
        add     r3, r3, #1
        str     r9, [r12], #4
        cmp     r3, r8
        blt     LKVD19
LKVD20:
        ldr     r3, [r4, #8]
        str     r3, [r0]
        ldr     r0, [r4, #4]
        add     r0, r0, #2
        ldr     r10, [r4, +r0, lsl #2]
        cmp     r10, #0
        blt     LKVD27
        mov     r8, #1
        mov     r12, #1
        add     r3, r4, #0xC
        str     lr, [sp, #0x20]
        str     r7, [sp, #0x28]
LKVD21:
        add     r0, r0, #1
        add     r10, r10, r10, lsl #1
        add     r9, r0, r10
        cmp     r0, r9
        bge     LKVD26
        mov     r2, #4
        add     r7, r4, r0, lsl #2
        add     r2, r2, r7
        mov     r8, r0
        add     lr, r6, r0, lsl #2
        str     r9, [sp, #0x2C]
        str     r4, [sp, #0x1C]
LKVD22:
        ldr     r1, [sp, #0x28]
        cmp     r5, #0
        ldr     r1, [r1]
        ble     LKVD25
        mov     r11, r3
        mov     r9, r6
        mov     r10, r5
        str     lr, [sp]
        str     r3, [sp, #0xC]
        str     r0, [sp, #0x10]
        ldr     r3, [pc, #0x1C8]
        ldr     r0, [sp, #0x20]
        ldr     lr, [sp, #0x1C]
        str     r2, [sp, #4]
        mov     r4, #0
        str     r7, [sp, #8]
        str     r5, [sp, #0x14]
        str     r6, [sp, #0x18]
        mov     r2, #1
LKVD23:
        ldr     r6, [r9], #4
        add     r4, r4, r6
        cmp     r4, r12
        bge     LKVD30
        ldr     r5, [lr, +r8, lsl #2]
        mov     r6, r2, lsl r6
        sub     r6, r6, #1
        sub     r7, r12, r4
        and     r5, r6, r5, asr r7
        add     r6, r1, #4
        ldr     r7, [r6, +r5, lsl #2]
        cmp     r3, r7
        beq     LKVD29
        and     r5, r7, #0xFF
        cmp     r5, #0x80
        beq     LKVD28
LKVD24:
        subs    r10, r10, #1
        add     r11, r11, #4
        bne     LKVD23
        str     r0, [sp, #0x20]
        ldr     lr, [sp]
        ldr     r2, [sp, #4]
        ldr     r7, [sp, #8]
        ldr     r3, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        ldr     r5, [sp, #0x14]
        ldr     r6, [sp, #0x18]
LKVD25:
        ldr     r1, [sp, #0x2C]
        add     r0, r0, #3
        add     r8, r8, #3
        cmp     r0, r1
        add     r7, r7, #0xC
        add     r2, r2, #0xC
        add     lr, lr, #0xC
        blt     LKVD22
        ldr     r4, [sp, #0x1C]
LKVD26:
        ldr     r10, [r4, +r0, lsl #2]
        add     r12, r12, #1
        cmp     r10, #0
        bge     LKVD21
LKVD27:
        mov     r0, #0
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
LKVD28:
        ldr     r1, [sp, #0x28]
        bic     r7, r7, #0xFF
        ldr     r1, [r1]
        add     r1, r1, r7, asr #6
        b       LKVD24
LKVD29:
        mov     r1, r0, lsl #8
        orr     r1, r1, #0x80
        str     r1, [r6, +r5, lsl #2]
        ldr     r1, [sp, #0x28]
        ldr     r6, [r11]
        ldr     r5, [r1]
        str     r6, [r5, +r0, lsl #2]
        add     r1, r5, r0, lsl #2
        ldr     r5, [r11]
        add     r5, r0, r2, lsl r5
        add     r0, r5, #1
        b       LKVD24
LKVD30:
        ldr     r7, [sp, #8]
        str     r0, [sp, #0x20]
        ldr     lr, [sp]
        ldr     r11, [r7]
        ldr     r2, [sp, #4]
        ldr     r3, [sp, #0xC]
        ldr     r0, [sp, #0x10]
        ldr     r5, [sp, #0x14]
        str     r11, [sp, #0x24]
        ldr     r11, [r2]
        mov     r9, r6
        ldr     r6, [sp, #0x18]
        sub     r10, r12, r4
        str     r11, [sp, #0x34]
        ldr     r11, [lr]
        add     r9, r10, r9
        mov     r10, #1
        mov     r9, r10, lsl r9
        sub     r4, r4, r12
        sub     r9, r9, #1
        str     r9, [sp, #0x38]
        mov     r10, r10, lsl r4
        ldr     r9, [sp, #0x24]
        str     r10, [sp, #0x30]
        ldr     r10, [sp, #0x38]
        and     r9, r9, r10
        ldr     r10, [sp, #0x30]
        mov     r9, r9, lsl r4
        str     r9, [sp, #0x24]
        cmp     r10, #0
        ble     LKVD25
        ldr     r9, [sp, #0x34]
        ldr     r10, [sp, #0x24]
        add     r1, r1, #4
        and     r9, r9, #0xFF
        mov     r9, r9, lsl #8
        orr     r11, r9, r11, lsl #16
        ldr     r9, [sp, #0x30]
        orr     r4, r11, r4
LKVD31:
        str     r4, [r1, +r10, lsl #2]
        subs    r9, r9, #1
        add     r10, r10, #1
        bne     LKVD31
        b       LKVD25
LKVD32:
        mvn     r0, #7
        add     sp, sp, #0x3C
        ldmia   sp!, {r4 - r11, pc}
        .long   0x00f0f101


