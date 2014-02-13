        .text
        .align  4
        .globl  _ippsCopy_1u


_ippsCopy_1u:
        stmdb   sp!, {r4 - r8, lr}
        ldr     lr, [sp, #0x18]
        cmp     r0, #0
        beq     LCVV19
        cmp     r2, #0
        beq     LCVV19
        cmp     lr, #0
        ble     LCVV18
        cmp     r1, #0
        blt     LCVV18
        cmp     r3, #0
        blt     LCVV18
        and     r4, r1, #7
        cmp     lr, #0x10
        and     r1, r3, #7
        blt     LCVV13
        cmp     r4, #0
        mov     r12, #0
        mov     r3, #0xFF
        beq     LCVV1
        ldrb    r7, [r0]
        ldrb    r6, [r2]
        rsb     r5, r1, #8
        mov     r7, r7, lsl r4
        and     r7, r7, #0xFF
        and     r5, r6, r3, lsl r5
        cmp     r4, r1
        orr     r7, r5, r7, asr r1
        add     lr, r4, lr
        blt     LCVV0
        sub     r1, r1, r4
        add     r1, r1, #8
        and     r5, r7, #0xFF
        ands    r1, r1, #7
        strb    r5, [r2]
        sub     lr, lr, #8
        add     r0, r0, #1
        addeq   r2, r2, #1
        beq     LCVV2
        b       LCVV6
LCVV0:
        strb    r7, [r2]
        ldrb    r5, [r0], #1
        sub     r6, r4, r1
        add     r6, r6, #8
        mov     r6, r5, lsl r6
        strb    r6, [r2, #1]!
        sub     r1, r1, r4
        sub     lr, lr, #8
LCVV1:
        cmp     r1, #0
        ldrneb  r5, [r2]
        bne     LCVV6
LCVV2:
        mov     r1, lr, asr #3
        cmp     r1, #0
        ble     LCVV5
        cmp     r1, #6
        blt     LCVV4
        sub     r6, r1, #6
        sub     r5, r2, #1
        sub     r4, r0, #1
LCVV3:
        ldrb    r7, [r0, +r12]
        strb    r7, [r12, +r2]
        ldrb    r7, [r4, #2]
        add     r12, r12, #5
        cmp     r12, r6
        strb    r7, [r5, #2]
        ldrb    r7, [r4, #3]
        strb    r7, [r5, #3]
        ldrb    r7, [r4, #4]
        strb    r7, [r5, #4]
        ldrb    r7, [r4, #5]!
        strb    r7, [r5, #5]!
        ble     LCVV3
LCVV4:
        ldrb    r4, [r0, +r12]
        strb    r4, [r12, +r2]
        add     r12, r12, #1
        cmp     r12, r1
        blt     LCVV4
LCVV5:
        ands    lr, lr, #7
        beq     LCVV12
        ldrb    r1, [r0, +r12]
        ldrb    r4, [r12, +r2]
        rsb     r0, lr, #8
        mov     r1, r1, asr r0
        and     lr, r4, r3, asr lr
        orr     r0, lr, r1, lsl r0
        strb    r0, [r12, +r2]
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LCVV6:
        ldrb    r6, [r0]
        add     lr, r1, lr
        rsb     r4, r1, #8
        and     r5, r5, r3, lsl r4
        orr     r6, r5, r6, asr r1
        sub     lr, lr, #8
        cmp     lr, #8
        strb    r6, [r2]
        add     r5, r2, #1
        ble     LCVV10
        sub     r6, lr, #8
        cmp     r6, #0x28
        blt     LCVV8
        mov     r6, r0
LCVV7:
        ldrb    r8, [r6, #1]
        ldrb    r7, [r0, +r12]
        add     r12, r12, #4
        mov     r8, r8, asr r1
        sub     lr, lr, #0x20
        orr     r7, r8, r7, lsl r4
        strb    r7, [r2, #1]
        ldrb    r8, [r6, #2]
        ldrb    r7, [r6, #1]
        cmp     lr, #0x30
        mov     r8, r8, asr r1
        orr     r7, r8, r7, lsl r4
        strb    r7, [r2, #2]
        ldrb    r8, [r6, #3]
        ldrb    r7, [r6, #2]
        mov     r8, r8, asr r1
        orr     r7, r8, r7, lsl r4
        strb    r7, [r2, #3]
        ldrb    r8, [r6, #4]
        ldrb    r7, [r6, #3]
        add     r6, r6, #4
        mov     r8, r8, asr r1
        orr     r7, r8, r7, lsl r4
        strb    r7, [r2, #4]!
        bge     LCVV7
        sub     r6, lr, #8
LCVV8:
        add     lr, r12, r0
        add     r2, r12, r5
LCVV9:
        ldrb    r8, [lr, #1]!
        ldrb    r7, [r0, +r12]
        mov     r8, r8, asr r1
        cmp     r6, #8
        orr     r7, r8, r7, lsl r4
        strb    r7, [r2], #1
        add     r12, r12, #1
        subgt   r6, r6, #8
        bgt     LCVV9
        mov     lr, r6
LCVV10:
        ldrb    r2, [r12, +r5]
        cmp     lr, r1
        add     r5, r5, r12
        bne     LCVV11
        ldrb    r12, [r0, +r12]
        and     r1, r2, r3, asr r1
        orr     r4, r1, r12, lsl r4
        strb    r4, [r5]
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LCVV11:
        add     r6, r12, r0
        ldrb    r6, [r6, #1]
        ldrb    r12, [r0, +r12]
        and     r2, r2, r3, asr lr
        mov     r1, r6, asr r1
        rsb     lr, lr, #8
        orr     r4, r1, r12, lsl r4
        and     lr, r4, r3, lsl lr
        orr     lr, r2, lr
        strb    lr, [r5]
LCVV12:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LCVV13:
        mov     r12, #0x80
        mov     r3, r12, asr r4
        mov     r4, r12, asr r1
        mvn     r12, #0x80
        cmp     lr, #0
        and     r3, r3, #0xFF
        and     r4, r4, #0xFF
        mov     r1, r12, asr r1
        ble     LCVV17
LCVV14:
        ldrb    r5, [r0]
        and     r5, r5, r3
        mov     r3, r3, lsr #1
        cmp     r3, #0
        and     r5, r5, #0xFF
        addeq   r0, r0, #1
        moveq   r3, #0x80
        cmp     r5, #0
        ldrneb  r5, [r2]
        orrne   r5, r5, r4
        bne     LCVV15
        ldrb    r5, [r2]
        and     r4, r4, #0xFF
        and     r5, r5, r1
LCVV15:
        mov     r4, r4, lsr #1
        cmp     r4, #0
        strb    r5, [r2]
        mov     r1, r1, asr #1
        bne     LCVV16
        add     r2, r2, #1
        mov     r1, r12
        mov     r4, #0x80
LCVV16:
        subs    lr, lr, #1
        bne     LCVV14
LCVV17:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LCVV18:
        mvn     r0, #5
        ldmia   sp!, {r4 - r8, pc}
LCVV19:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


