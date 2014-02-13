        .text
        .align  4
        .globl  _ippsSqr_16sc_ISfs


_ippsSqr_16sc_ISfs:
        stmdb   sp!, {r4 - r10, lr}
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r10, pc}
        cmp     r1, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r10, pc}
        mov     r3, #0xFF
        cmp     r2, #0
        orr     r3, r3, #0x7F, 24
        mov     r12, #0
        bne     LAWU3
        cmp     r1, #0
        ble     LAWU21
        sub     r2, r12, #2, 18
        sub     lr, r3, #1, 18
LAWU0:
        ldrsh   r4, [r0, #2]
        ldrsh   r5, [r0]
        add     r6, r5, r4
        sub     r7, r5, r4
        mul     r6, r7, r6
        mul     r4, r5, r4
        cmp     r3, r6
        strlth  r3, [r0]
        blt     LAWU1
        cmn     r6, #2, 18
        strlth  r2, [r0]
        strgeh  r6, [r0]
LAWU1:
        cmp     lr, r4
        strlth  r3, [r0, #2]
        blt     LAWU2
        cmn     r4, #1, 18
        strlth  r2, [r0, #2]
        movge   r4, r4, lsl #1
        strgeh  r4, [r0, #2]
LAWU2:
        add     r12, r12, #1
        cmp     r12, r1
        add     r0, r0, #4
        blt     LAWU0
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAWU3:
        cmp     r2, #0
        ble     LAWU13
        cmp     r2, #0x1F
        bgt     LAWU9
        cmp     r2, #0x10
        mov     lr, #1
        bgt     LAWU7
        cmp     r2, #1
        beq     LAWU22
        sub     r4, r2, #2
        mov     r5, lr, lsl r4
        sub     r7, r2, #1
        mov     lr, lr, lsl r7
        sub     r4, lr, #1
        cmp     r1, #0
        sub     lr, r5, #1
        ble     LAWU21
        sub     r6, r12, #2, 18
LAWU4:
        ldrsh   r5, [r0, #2]
        ldrsh   r9, [r0]
        add     r8, r9, r5
        sub     r10, r9, r5
        mul     r8, r10, r8
        mul     r5, r9, r5
        mov     r9, r8, asr r2
        and     r9, r9, #1
        add     r9, r8, r9
        add     r8, r9, r4
        mov     r9, r5, asr r7
        and     r9, r9, #1
        add     r9, r5, r9
        add     r5, r9, lr
        mov     r8, r8, asr r2
        cmp     r3, r8
        mov     r5, r5, asr r7
        strlth  r3, [r0]
        blt     LAWU5
        cmn     r8, #2, 18
        strlth  r6, [r0]
        strgeh  r8, [r0]
LAWU5:
        cmp     r3, r5
        strlth  r3, [r0, #2]
        blt     LAWU6
        cmn     r5, #2, 18
        strlth  r6, [r0, #2]
        strgeh  r5, [r0, #2]
LAWU6:
        add     r12, r12, #1
        cmp     r12, r1
        add     r0, r0, #4
        blt     LAWU4
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAWU7:
        sub     r3, r2, #2
        mov     r3, lr, lsl r3
        sub     r4, r2, #1
        mov     lr, lr, lsl r4
        cmp     r1, #0
        sub     lr, lr, #1
        sub     r3, r3, #1
        ble     LAWU21
        sub     r0, r0, #2
LAWU8:
        ldrsh   r8, [r0, #2]
        ldrsh   r7, [r0, #4]
        add     r12, r12, #1
        cmp     r12, r1
        mul     r5, r8, r7
        add     r6, r8, r7
        sub     r8, r8, r7
        mul     r6, r8, r6
        mov     r7, r5, asr r4
        and     r7, r7, #1
        add     r5, r5, r7
        add     r5, r5, r3
        mov     r7, r6, asr r2
        and     r7, r7, #1
        add     r7, r6, r7
        add     r6, lr, r7
        mov     r5, r5, asr r4
        mov     r6, r6, asr r2
        strh    r6, [r0, #2]
        strh    r5, [r0, #4]!
        blt     LAWU8
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAWU9:
        cmp     r1, #6
        movlt   r2, r12
        blt     LAWU11
        mov     r2, r12
        sub     r3, r1, #6
        mov     lr, r2
        sub     r4, r0, #2
LAWU10:
        add     r2, r2, #5
        strh    lr, [r4, #2]
        strh    lr, [r4, #4]
        strh    lr, [r4, #6]
        strh    lr, [r4, #8]
        strh    lr, [r4, #0xA]
        strh    lr, [r4, #0xC]
        strh    lr, [r4, #0xE]
        strh    lr, [r4, #0x10]
        strh    lr, [r4, #0x12]
        strh    lr, [r4, #0x14]!
        cmp     r2, r3
        ble     LAWU10
LAWU11:
        mov     r3, r2, lsl #2
        sub     r3, r3, #2
        add     r0, r3, r0
LAWU12:
        add     r2, r2, #1
        strh    r12, [r0, #2]
        strh    r12, [r0, #4]!
        cmp     r2, r1
        blt     LAWU12
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAWU13:
        rsb     r2, r2, #0
        cmp     r2, #0xE
        bgt     LAWU17
        cmp     r1, #0
        add     r5, r2, #1
        sub     r4, r12, #2, 18
        ble     LAWU21
        sub     lr, r12, #2, 18
LAWU14:
        ldrsh   r6, [r0, #2]
        ldrsh   r7, [r0]
        add     r8, r7, r6
        sub     r9, r7, r6
        mul     r8, r9, r8
        mul     r6, r7, r6
        cmp     r8, r3, asr r2
        strgth  r3, [r0]
        bgt     LAWU15
        cmp     r8, r4, asr r2
        strlth  lr, [r0]
        movge   r8, r8, lsl r2
        strgeh  r8, [r0]
LAWU15:
        cmp     r6, r3, asr r5
        strgth  r3, [r0, #2]
        bgt     LAWU16
        cmp     r6, r4, asr r5
        strlth  lr, [r0, #2]
        movge   r6, r6, lsl r5
        strgeh  r6, [r0, #2]
LAWU16:
        add     r12, r12, #1
        cmp     r12, r1
        add     r0, r0, #4
        blt     LAWU14
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAWU17:
        cmp     r1, #0
        ble     LAWU21
        mov     r2, r12
LAWU18:
        ldrsh   r4, [r0, #2]
        ldrsh   lr, [r0]
        sub     r5, lr, r4
        add     r6, lr, r4
        muls    r5, r5, r6
        mul     r4, lr, r4
        streqh  r12, [r0]
        beq     LAWU19
        cmp     r5, #0
        mvnle   lr, r3
        strleh  lr, [r0]
        strgth  r3, [r0]
LAWU19:
        cmp     r4, #0
        streqh  r12, [r0, #2]
        beq     LAWU20
        cmp     r4, #0
        mvnle   lr, r3
        strleh  lr, [r0, #2]
        strgth  r3, [r0, #2]
LAWU20:
        add     r2, r2, #1
        cmp     r2, r1
        add     r0, r0, #4
        blt     LAWU18
LAWU21:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LAWU22:
        cmp     r1, #0
        ble     LAWU21
        sub     r2, r12, #2, 18
LAWU23:
        ldrsh   r4, [r0]
        ldrsh   r5, [r0, #2]
        sub     lr, r4, r5
        add     r6, r4, r5
        mul     lr, lr, r6
        mul     r4, r4, r5
        mov     r5, lr, asr #1
        and     r5, r5, #1
        add     r5, lr, r5
        mov     lr, r5, asr #1
        cmp     r3, lr
        strlth  r3, [r0]
        blt     LAWU24
        cmn     lr, #2, 18
        strlth  r2, [r0]
        strgeh  lr, [r0]
LAWU24:
        cmp     r3, r4
        strlth  r3, [r0, #2]
        blt     LAWU25
        cmn     r4, #2, 18
        strlth  r2, [r0, #2]
        strgeh  r4, [r0, #2]
LAWU25:
        add     r12, r12, #1
        cmp     r12, r1
        add     r0, r0, #4
        blt     LAWU23
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}


