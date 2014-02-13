        .text
        .align  4
        .globl  ownsSet_8u


ownsSet_8u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        cmp     r2, #0
        mov     r11, r1
        ble     LCVD7
        tst     r1, #3
        beq     LCVD1
LCVD0:
        strb    r0, [r11], #1
        subs    r2, r2, #1
        beq     LCVD8
        tst     r11, #3
        bne     LCVD0
LCVD1:
        add     r12, sp, #8
        strb    r0, [r12, #2]
        add     r3, sp, #8
        strb    r0, [r3]
        and     r12, r2, #0x1F
        add     lr, sp, #8
        strb    r0, [lr, #1]
        sub     r2, r2, r12
        add     r3, sp, #8
        strb    r0, [r3, #3]
        ldr     r10, [sp, #8]
        mov     lr, r2, asr #1
        add     r3, r2, r11
        add     lr, r2, lr, lsr #30
        mov     r2, lr, asr #2
        cmp     r2, #0
        ble     LCVD3
        add     lr, r11, #0xC
        str     lr, [sp, #4]
        str     r0, [sp]
        ldr     r0, [sp, #4]
        mov     r9, #0
        add     r8, r11, #4
        add     r7, r11, #8
        add     r6, r11, #0x10
        add     r5, r11, #0x14
        add     r4, r11, #0x18
        add     lr, r11, #0x1C
LCVD2:
        str     r10, [r11, +r9, lsl #2]
        str     r10, [r8], #0x20
        str     r10, [r7], #0x20
        str     r10, [r0], #0x20
        str     r10, [r6], #0x20
        str     r10, [r5], #0x20
        str     r10, [r4], #0x20
        add     r9, r9, #8
        str     r10, [lr], #0x20
        cmp     r9, r2
        blt     LCVD2
        ldr     r0, [sp]
LCVD3:
        cmp     r12, #0
        beq     LCVD7
        cmp     r12, #0
        ble     LCVD7
        cmp     r12, #6
        mov     r2, #0
        blt     LCVD5
        sub     r4, r12, #6
        sub     lr, r3, #1
LCVD4:
        add     r2, r2, #5
        strb    r0, [lr, #1]
        strb    r0, [lr, #2]
        strb    r0, [lr, #3]
        strb    r0, [lr, #4]
        strb    r0, [lr, #5]!
        cmp     r2, r4
        ble     LCVD4
LCVD5:
        add     r3, r2, r3
LCVD6:
        add     r2, r2, #1
        strb    r0, [r3], #1
        cmp     r2, r12
        blt     LCVD6
LCVD7:
        mov     r0, r1
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCVD8:
        mov     r0, r1
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


