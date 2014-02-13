        .text
        .align  4
        .globl  ownsUnpackIcsInfo_AAC


ownsUnpackIcsInfo_AAC:
        stmdb   sp!, {r4 - r11, lr}
        mov     r6, r0
        mov     r5, r1
        mov     r4, r2
        mov     r2, #1
        mov     r7, r3
        bl      ownsGetBits_AAC
        str     r0, [r4]
        mov     r0, r6
        mov     r2, #2
        mov     r1, r5
        bl      ownsGetBits_AAC
        str     r0, [r4, #4]
        mov     r0, r6
        mov     r2, #1
        mov     r1, r5
        bl      ownsGetBits_AAC
        ldr     r12, [r4, #4]
        mov     r9, #0
        cmp     r12, #2
        str     r0, [r4, #8]
        str     r9, [r4, #0x14]
        beq     LGGX14
        mov     r0, r6
        mov     r1, r5
        mov     r2, #6
        bl      ownsGetBits_AAC
        cmp     r0, #0x33
        str     r0, [r4, #0xC]
        mvngt   r0, #0xA1
        ldmgtia sp!, {r4 - r11, pc}
        mov     r0, r6
        mov     r1, r5
        mov     r2, #1
        bl      ownsGetBits_AAC
        cmp     r0, #0
        str     r0, [r4, #0x14]
        str     r9, [r4, #0x18]
        beq     LGGX6
        mov     r0, r6
        mov     r1, r5
        mov     r2, #1
        bl      ownsGetBits_AAC
        cmp     r0, #0
        str     r0, [r4, #0x18]
        beq     LGGX0
        mov     r0, r6
        mov     r1, r5
        mov     r2, #5
        bl      ownsGetBits_AAC
        str     r0, [r4, #0x1C]
LGGX0:
        ldr     r12, [r4, #0xC]
        mov     r8, r7
        cmp     r12, r7
        movlt   r8, r12
        cmp     r8, #0
        ble     LGGX2
        add     r11, r4, #0x1F
        mov     r10, r8
LGGX1:
        mov     r0, r6
        mov     r1, r5
        mov     r2, #1
        bl      ownsGetBits_AAC
        strb    r0, [r11, #1]!
        subs    r10, r10, #1
        bne     LGGX1
LGGX2:
        cmp     r8, r7
        bge     LGGX6
        sub     r0, r7, r8
        cmp     r0, #6
        blt     LGGX4
        add     r0, r8, #0x1F
        add     r0, r0, r4
        sub     r1, r7, #6
LGGX3:
        add     r8, r8, #5
        strb    r9, [r0, #1]
        strb    r9, [r0, #2]
        strb    r9, [r0, #3]
        strb    r9, [r0, #4]
        strb    r9, [r0, #5]!
        cmp     r8, r1
        ble     LGGX3
LGGX4:
        add     r0, r8, #0x1F
        add     r0, r0, r4
LGGX5:
        add     r8, r8, #1
        strb    r9, [r0, #1]!
        cmp     r8, r7
        blt     LGGX5
LGGX6:
        ldr     r0, [r4, #4]
        mov     r1, #1
        cmp     r0, #2
        strne   r1, [r4, #0x4C]
        strne   r1, [r4, #0x50]
        beq     LGGX7
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LGGX7:
        ldr     r0, [r4, #0x10]
        str     r1, [r4, #0x50]
        tst     r0, #0x40
        streq   r1, [r4, #0x54]
        moveq   r3, #2
        beq     LGGX8
        ldr     r12, [r4, #0x50]
        mov     r3, #1
        add     r12, r12, #1
        str     r12, [r4, #0x50]
LGGX8:
        tst     r0, #0x20
        add     r12, r4, #0x4C
        addeq   r3, r3, #1
        moveq   r6, #1
        ldrne   lr, [r12, +r3, lsl #2]
        addne   r6, lr, #1
        mov     lr, r3, lsl #2
        tst     r0, #0x10
        add     r5, r12, lr
        addne   r6, r6, #1
        bne     LGGX9
        str     r6, [r12, +lr]
        add     r3, r3, #1
        mov     r6, #1
        mov     lr, r3, lsl #2
        add     r5, r12, lr
LGGX9:
        tst     r0, #8
        addne   r6, r6, #1
        bne     LGGX10
        add     r3, r3, #1
        str     r6, [r5]
        mov     lr, r3, lsl #2
        add     r5, r12, lr
        mov     r6, #1
LGGX10:
        tst     r0, #4
        addne   r6, r6, #1
        bne     LGGX11
        add     r3, r3, #1
        str     r6, [r5]
        mov     lr, r3, lsl #2
        add     r5, r12, lr
        mov     r6, #1
LGGX11:
        tst     r0, #2
        addne   r6, r6, #1
        bne     LGGX12
        add     r3, r3, #1
        str     r6, [r5]
        mov     lr, r3, lsl #2
        add     r5, r12, lr
        mov     r6, #1
LGGX12:
        tst     r0, #1
        addne   r6, r6, #1
        strne   r6, [lr, +r12]
        bne     LGGX13
        str     r6, [r5]
        add     r3, r3, #1
        str     r1, [r12, +r3, lsl #2]
LGGX13:
        str     r3, [r4, #0x4C]
        mov     r0, #0
        ldmia   sp!, {r4 - r11, pc}
LGGX14:
        mov     r0, r6
        mov     r1, r5
        mov     r2, #4
        bl      ownsGetBits_AAC
        str     r0, [r4, #0xC]
        mov     r0, r6
        mov     r1, r5
        mov     r2, #7
        bl      ownsGetBits_AAC
        str     r0, [r4, #0x10]
        b       LGGX6


