        .text
        .align  4
        .globl  ownFixedCodebookCodeword


ownFixedCodebookCodeword:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x2C
        ldr     r12, [sp, #0x64]
        ldr     r9, [sp, #0x50]
        ldr     r10, [sp, #0x54]
        ldr     r11, [sp, #0x58]
        ldr     r8, [sp, #0x5C]
        ldr     r7, [sp, #0x60]
        mov     r4, r1
        ldr     r6, [sp, #0x68]
        mov     r1, r2
        str     r0, [sp]
        str     r1, [sp, #8]
        str     r12, [sp, #0x24]
        mov     r0, r4
        mov     r5, r3
        bl      _ippsZero_16s
        cmp     r5, r9
        ble     LDNF0
        mov     r2, r5
        mov     r12, r8
        mov     r5, r9
        mov     r8, r7
        mov     r9, r2
        mov     r7, r12
LDNF0:
        cmp     r10, r11
        ble     LDNF1
        mov     r2, r10
        ldr     r12, [sp, #0x24]
        mov     r10, r11
        str     r6, [sp, #0x24]
        mov     r11, r2
        mov     r6, r12
LDNF1:
        cmp     r5, r10
        ble     LDNF2
        mov     r12, r5
        mov     r2, r8
        mov     r5, r10
        ldr     r8, [sp, #0x24]
        mov     r10, r12
        str     r2, [sp, #0x24]
LDNF2:
        cmp     r9, r11
        ble     LDNF3
        mov     r2, r9
        mov     r12, r7
        mov     r9, r11
        mov     r7, r6
        mov     r11, r2
        mov     r6, r12
LDNF3:
        cmp     r9, r10
        ble     LDNF4
        mov     r12, r9
        mov     r2, r7
        mov     r9, r10
        ldr     r7, [sp, #0x24]
        mov     r10, r12
        str     r2, [sp, #0x24]
LDNF4:
        cmp     r5, #0
        movle   r2, #0
        ble     LDNF8
        cmp     r5, #6
        movlt   r2, #0
        blt     LDNF6
        mov     r0, #0
        mov     r2, #0
        sub     lr, r5, #6
        mov     r12, r4
LDNF5:
        add     r2, r2, #5
        strh    r0, [r12]
        strh    r0, [r12, #2]
        strh    r0, [r12, #4]
        strh    r0, [r12, #6]
        strh    r0, [r12, #8]
        cmp     r2, lr
        add     r12, r12, #0xA
        ble     LDNF5
LDNF6:
        mov     r12, #0
        add     lr, r4, r2, lsl #1
LDNF7:
        add     r2, r2, #1
        strh    r12, [lr], #2
        cmp     r2, r5
        blt     LDNF7
LDNF8:
        cmp     r2, r9
        bge     LDNF12
        sub     r12, r9, r2
        cmp     r12, #6
        blt     LDNF28
        ldr     r12, [sp]
        rsb     lr, r5, #0
        sub     r0, r9, #6
        add     r12, r12, lr, lsl #1
        str     r12, [sp, #0x18]
        add     r12, r12, r2, lsl #1
        add     lr, r4, r2, lsl #1
LDNF9:
        ldrsh   r1, [r12]
        add     r2, r2, #5
        cmp     r2, r0
        mul     r1, r8, r1
        strh    r1, [lr]
        ldrsh   r1, [r12, #2]
        mul     r1, r8, r1
        strh    r1, [lr, #2]
        ldrsh   r1, [r12, #4]
        mul     r1, r8, r1
        strh    r1, [lr, #4]
        ldrsh   r1, [r12, #6]
        mul     r1, r8, r1
        strh    r1, [lr, #6]
        ldrsh   r1, [r12, #8]
        add     r12, r12, #0xA
        mul     r1, r8, r1
        strh    r1, [lr, #8]
        add     lr, lr, #0xA
        ble     LDNF9
LDNF10:
        ldr     r0, [sp, #0x18]
        mov     lr, r2, lsl #1
        add     r12, r4, r2, lsl #1
LDNF11:
        ldrsh   r1, [r0, +lr]
        add     lr, lr, #2
        add     r2, r2, #1
        mul     r1, r8, r1
        cmp     r2, r9
        strh    r1, [r12], #2
        blt     LDNF11
LDNF12:
        cmp     r2, r10
        bge     LDNF16
        sub     r12, r10, r2
        cmp     r12, #5
        blt     LDNF27
        ldr     r12, [sp]
        rsb     lr, r5, #0
        rsb     r1, r9, #0
        sub     r0, r10, #5
        add     lr, r12, lr, lsl #1
        str     r0, [sp, #0x1C]
        ldr     r3, [sp, #0x1C]
        add     r12, r12, r1, lsl #1
        str     r12, [sp, #0x18]
        add     r1, lr, r2, lsl #1
        add     r12, r12, r2, lsl #1
        add     r0, r4, r2, lsl #1
        str     r5, [sp, #0xC]
        str     r4, [sp, #4]
LDNF13:
        ldrsh   r5, [r12]
        ldrsh   r4, [r1]
        add     r2, r2, #4
        mul     r5, r7, r5
        cmp     r2, r3
        mla     r5, r8, r4, r5
        strh    r5, [r0]
        ldrsh   r5, [r12, #2]
        ldrsh   r4, [r1, #2]
        mul     r5, r7, r5
        mla     r5, r8, r4, r5
        strh    r5, [r0, #2]
        ldrsh   r5, [r12, #4]
        ldrsh   r4, [r1, #4]
        mul     r5, r7, r5
        mla     r5, r8, r4, r5
        strh    r5, [r0, #4]
        ldrsh   r5, [r12, #6]
        ldrsh   r4, [r1, #6]
        add     r1, r1, #8
        mul     r5, r7, r5
        add     r12, r12, #8
        mla     r5, r8, r4, r5
        strh    r5, [r0, #6]
        add     r0, r0, #8
        ble     LDNF13
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #4]
LDNF14:
        ldr     r1, [sp, #0x18]
        mov     r0, r2, lsl #1
        add     r12, r4, r2, lsl #1
        str     r4, [sp, #4]
LDNF15:
        ldrsh   r3, [r1, +r0]
        ldrsh   r4, [lr, +r0]
        add     r0, r0, #2
        mul     r3, r7, r3
        add     r2, r2, #1
        cmp     r2, r10
        mla     r3, r8, r4, r3
        strh    r3, [r12], #2
        blt     LDNF15
        ldr     r4, [sp, #4]
LDNF16:
        cmp     r2, r11
        bge     LDNF20
        sub     r12, r11, r2
        cmp     r12, #4
        blt     LDNF26
        ldr     r0, [sp]
        rsb     r12, r5, #0
        rsb     lr, r9, #0
        rsb     r1, r10, #0
        add     r12, r0, r12, lsl #1
        add     lr, r0, lr, lsl #1
        add     r0, r0, r1, lsl #1
        str     r0, [sp, #0x1C]
        add     r0, r0, r2, lsl #1
        str     r0, [sp, #0x18]
        add     r0, r4, r2, lsl #1
        str     r5, [sp, #0xC]
        str     r4, [sp, #4]
        ldr     r4, [sp, #0x18]
        ldr     r5, [sp, #0x24]
        str     r12, [sp, #0x20]
        sub     r3, r11, #4
        add     r12, r12, r2, lsl #1
        add     r1, lr, r2, lsl #1
        str     r11, [sp, #0x28]
        str     r10, [sp, #0x14]
        str     r9, [sp, #0x10]
LDNF17:
        ldrsh   r11, [r1]
        ldrsh   r9, [r12]
        ldrsh   r10, [r4]
        mul     r11, r7, r11
        add     r2, r2, #3
        cmp     r2, r3
        mla     r11, r8, r9, r11
        mla     r11, r5, r10, r11
        strh    r11, [r0]
        ldrsh   r11, [r1, #2]
        ldrsh   r9, [r12, #2]
        ldrsh   r10, [r4, #2]
        mul     r11, r7, r11
        mla     r11, r8, r9, r11
        mla     r11, r5, r10, r11
        strh    r11, [r0, #2]
        ldrsh   r11, [r1, #4]
        ldrsh   r9, [r12, #4]
        ldrsh   r10, [r4, #4]
        mul     r11, r7, r11
        add     r12, r12, #6
        add     r1, r1, #6
        add     r4, r4, #6
        mla     r11, r8, r9, r11
        mla     r11, r5, r10, r11
        strh    r11, [r0, #4]
        add     r0, r0, #6
        ble     LDNF17
        ldr     r11, [sp, #0x28]
        ldr     r10, [sp, #0x14]
        ldr     r9, [sp, #0x10]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #4]
LDNF18:
        add     r12, r4, r2, lsl #1
        str     r4, [sp, #4]
        ldr     r3, [sp, #0x20]
        ldr     r1, [sp, #0x1C]
        ldr     r4, [sp, #0x24]
        mov     r0, r2, lsl #1
        str     r10, [sp, #0x14]
        str     r9, [sp, #0x10]
        str     r5, [sp, #0xC]
LDNF19:
        ldrsh   r10, [lr, +r0]
        ldrsh   r5, [r3, +r0]
        ldrsh   r9, [r1, +r0]
        mul     r10, r7, r10
        add     r0, r0, #2
        add     r2, r2, #1
        cmp     r2, r11
        mla     r10, r8, r5, r10
        mla     r10, r4, r9, r10
        strh    r10, [r12], #2
        blt     LDNF19
        ldr     r10, [sp, #0x14]
        ldr     r9, [sp, #0x10]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #4]
LDNF20:
        ldr     r12, [sp, #8]
        cmp     r2, r12
        bge     LDNF24
        ldr     r12, [sp, #8]
        sub     r12, r12, r2
        cmp     r12, #4
        blt     LDNF25
        ldr     r0, [sp]
        rsb     r3, r9, #0
        rsb     r12, r10, #0
        rsb     r5, r5, #0
        add     r10, r0, r3, lsl #1
        ldr     r3, [sp, #8]
        rsb     lr, r11, #0
        add     r11, r0, r12, lsl #1
        add     r9, r0, r5, lsl #1
        sub     r1, r3, #4
        add     r0, r0, lr, lsl #1
        add     r3, r10, r2, lsl #1
        str     r3, [sp, #0x1C]
        add     r12, r0, r2, lsl #1
        str     r0, [sp, #0x20]
        str     r1, [sp, #0xC]
        ldr     r1, [sp, #0x1C]
        ldr     r0, [sp, #0x24]
        add     r5, r9, r2, lsl #1
        add     lr, r11, r2, lsl #1
        add     r3, r4, r2, lsl #1
        str     r9, [sp, #0x10]
        str     r10, [sp, #0x14]
        str     r11, [sp, #0x18]
        str     r4, [sp, #4]
LDNF21:
        ldrsh   r4, [r5]
        ldrsh   r9, [r1]
        ldrsh   r10, [r12]
        str     r4, [sp, #0x28]
        ldr     r11, [sp, #0xC]
        mul     r4, r7, r9
        mul     r10, r6, r10
        ldrsh   r9, [lr]
        add     r2, r2, #3
        cmp     r2, r11
        ldr     r11, [sp, #0x28]
        mla     r10, r0, r9, r10
        mla     r4, r8, r11, r4
        add     r10, r4, r10
        strh    r10, [r3]
        ldrsh   r11, [r12, #2]
        ldrsh   r4, [r1, #2]
        ldrsh   r9, [r5, #2]
        ldrsh   r10, [lr, #2]
        mul     r11, r6, r11
        mul     r4, r7, r4
        mla     r11, r0, r10, r11
        mla     r4, r8, r9, r4
        add     r11, r4, r11
        strh    r11, [r3, #2]
        ldrsh   r11, [r12, #4]
        ldrsh   r4, [r1, #4]
        ldrsh   r9, [r5, #4]
        ldrsh   r10, [lr, #4]
        mul     r11, r6, r11
        mul     r4, r7, r4
        add     r5, r5, #6
        add     r1, r1, #6
        add     lr, lr, #6
        mla     r11, r0, r10, r11
        mla     r4, r8, r9, r4
        add     r12, r12, #6
        add     r11, r4, r11
        strh    r11, [r3, #4]
        add     r3, r3, #6
        ble     LDNF21
        ldr     r9, [sp, #0x10]
        ldr     r10, [sp, #0x14]
        ldr     r11, [sp, #0x18]
        ldr     r0, [sp, #0x20]
        ldr     r4, [sp, #4]
LDNF22:
        add     r4, r4, r2, lsl #1
        mov     r12, r2, lsl #1
LDNF23:
        ldrsh   r3, [r10, +r12]
        ldrsh   r1, [r0, +r12]
        ldrsh   lr, [r9, +r12]
        mul     r3, r7, r3
        ldrsh   r5, [r11, +r12]
        mul     r1, r6, r1
        add     r12, r12, #2
        add     r2, r2, #1
        mla     r3, r8, lr, r3
        ldr     lr, [sp, #0x24]
        mla     r1, lr, r5, r1
        ldr     lr, [sp, #8]
        cmp     r2, lr
        add     r1, r3, r1
        strh    r1, [r4], #2
        blt     LDNF23
LDNF24:
        add     sp, sp, #0x2C
        ldmia   sp!, {r4 - r11, pc}
LDNF25:
        ldr     r0, [sp]
        rsb     r3, r9, #0
        rsb     r12, r10, #0
        rsb     lr, r11, #0
        rsb     r5, r5, #0
        add     r10, r0, r3, lsl #1
        add     r11, r0, r12, lsl #1
        add     r9, r0, r5, lsl #1
        add     r0, r0, lr, lsl #1
        b       LDNF22
LDNF26:
        ldr     r12, [sp]
        rsb     lr, r5, #0
        rsb     r0, r10, #0
        add     lr, r12, lr, lsl #1
        str     lr, [sp, #0x20]
        rsb     lr, r9, #0
        add     r0, r12, r0, lsl #1
        add     lr, r12, lr, lsl #1
        str     r0, [sp, #0x1C]
        b       LDNF18
LDNF27:
        ldr     r12, [sp]
        rsb     r0, r9, #0
        rsb     lr, r5, #0
        add     r0, r12, r0, lsl #1
        str     r0, [sp, #0x18]
        add     lr, r12, lr, lsl #1
        b       LDNF14
LDNF28:
        ldr     r12, [sp]
        rsb     lr, r5, #0
        add     lr, r12, lr, lsl #1
        str     lr, [sp, #0x18]
        b       LDNF10


