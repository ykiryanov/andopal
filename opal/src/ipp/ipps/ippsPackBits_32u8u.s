        .text
        .align  4
        .globl  _ippsPackBits_32u8u


_ippsPackBits_32u8u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        ldr     r12, [sp, #0x48]
        ldr     r9, [sp, #0x4C]
        cmp     r0, #0
        mov     r8, r3
        beq     LBBD19
        cmp     r1, #0
        beq     LBBD19
        cmp     r8, #0
        beq     LBBD19
        cmp     r9, #0
        beq     LBBD19
        cmp     r2, #0
        ble     LBBD18
        cmp     r12, #0
        blt     LBBD18
        ands    r12, r12, #7
        mov     r11, #0
        beq     LBBD0
        ldrb    lr, [r8]
        rsb     r4, r12, #8
        rsb     r6, r12, #0x40
        mov     r5, lr, asr r4
        mov     r4, r5, asr #31
        b       LBBD1
LBBD0:
        mov     r5, r11
        mov     r4, r5
        mov     r6, #0x40
LBBD1:
        cmp     r2, #0
        movle   r7, r11
        movle   r10, r7
        ble     LBBD12
        mov     r7, r11
        mov     r10, r7
        str     r7, [sp, #0xC]
        str     r9, [sp, #0x10]
        str     r8, [sp]
        str     r10, [sp, #8]
        mov     r7, r0
        mov     r8, r1
        mov     r9, r2
LBBD2:
        ldr     r10, [r8], #4
        cmp     r10, #0x20
        ble     LBBD3
        mov     r3, #0x1B
        mov     r10, #0x20
        str     r3, [sp, #0xC]
        b       LBBD4
LBBD3:
        cmp     r10, #0
        blt     LBBD5
LBBD4:
        cmp     r10, r6
        bgt     LBBD6
        b       LBBD10
LBBD5:
        mov     r3, #0x1B
        cmp     r6, #0
        str     r3, [sp, #0xC]
        movge   r10, #0
        movlt   r10, #0
        bge     LBBD10
LBBD6:
        mov     r3, r6, asr #31
        mov     r0, r5
        mov     r1, r4
        mov     r2, r6
        bl      __ashldi3
        cmp     r6, #0x38
        bgt     LBBD10
        rsb     r3, r6, #0x38
        cmp     r3, #0x30
        blt     LBBD8
        ldr     r3, [sp, #8]
        ldr     r12, [sp]
        str     r4, [sp, #0x14]
        ldr     r4, [sp, #8]
        sub     r3, r3, #1
        add     r3, r3, r12
        str     r5, [sp, #0x18]
        str     r11, [sp, #0x1C]
        str     r9, [sp, #0x20]
LBBD7:
        mov     lr, r0, lsr #24
        mov     r12, r0, lsl #8
        orr     r9, lr, r1, lsl #8
        mov     lr, r0, lsl #16
        mov     r12, r12, lsr #24
        mov     lr, lr, lsr #24
        orr     r12, r12, r9, lsl #8
        mov     r0, r0, lsl #24
        orr     r5, lr, r12, lsl #8
        mov     lr, r0, lsr #24
        orr     lr, lr, r5, lsl #8
        mov     r2, r0, lsl #8
        mov     r1, r1, lsr #24
        mov     r9, r9, lsr #24
        mov     r12, r12, lsr #24
        mov     r5, r5, lsr #24
        mov     r11, lr, lsr #24
        add     r6, r6, #0x28
        strb    r1, [r3, #1]
        strb    r9, [r3, #2]
        strb    r12, [r3, #3]
        strb    r5, [r3, #4]
        strb    r11, [r3, #5]!
        mov     r2, r2, lsr #24
        cmp     r6, #8
        mov     r0, r0, lsl #16
        orr     r1, r2, lr, lsl #8
        add     r4, r4, #5
        ble     LBBD7
        str     r4, [sp, #8]
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x18]
        ldr     r11, [sp, #0x1C]
        ldr     r9, [sp, #0x20]
LBBD8:
        ldr     r3, [sp]
        ldr     r12, [sp, #8]
        ldr     r2, [sp, #8]
        add     r3, r12, r3
LBBD9:
        mov     r12, r1, lsr #24
        add     r6, r6, #8
        mov     lr, r0, lsr #24
        strb    r12, [r3], #1
        cmp     r6, #0x38
        add     r2, r2, #1
        mov     r0, r0, lsl #8
        orr     r1, lr, r1, lsl #8
        ble     LBBD9
        str     r2, [sp, #8]
LBBD10:
        ldr     r12, [r7], #4
        cmp     r10, #0
        moveq   r3, #0
        streq   r3, [sp, #4]
        beq     LBBD11
        rsb     r3, r10, #0x20
        mov     r12, r12, lsl r3
        mov     r3, r12, lsr r3
        str     r3, [sp, #4]
LBBD11:
        mov     r3, r10, asr #31
        mov     r0, r5
        mov     r1, r4
        mov     r2, r10
        bl      __ashldi3
        ldr     r3, [sp, #4]
        subs    r9, r9, #1
        sub     r6, r6, r10
        add     r11, r11, r10
        mov     r4, r1
        orr     r5, r0, r3
        bne     LBBD2
        ldr     r7, [sp, #0xC]
        ldr     r10, [sp, #8]
        ldr     r9, [sp, #0x10]
        ldr     r8, [sp]
LBBD12:
        cmp     r6, #0x38
        bgt     LBBD16
        rsb     r12, r6, #0x38
        cmp     r12, #0x30
        blt     LBBD14
        sub     r12, r10, #1
        add     r0, r12, r8
        str     r8, [sp]
        mov     r8, r0
LBBD13:
        mov     r3, r6, asr #31
        mov     r2, r6
        mov     r0, r5
        mov     r1, r4
        bl      __ashldi3
        add     r2, r6, #8
        mov     r1, r1, lsr #24
        strb    r1, [r8, #1]
        mov     r3, r2, asr #31
        mov     r1, r4
        mov     r0, r5
        bl      __ashldi3
        add     r2, r6, #0x10
        mov     r1, r1, lsr #24
        strb    r1, [r8, #2]
        mov     r3, r2, asr #31
        mov     r1, r4
        mov     r0, r5
        bl      __ashldi3
        add     r2, r6, #0x18
        mov     r1, r1, lsr #24
        strb    r1, [r8, #3]
        mov     r3, r2, asr #31
        mov     r1, r4
        mov     r0, r5
        bl      __ashldi3
        add     r2, r6, #0x20
        mov     r1, r1, lsr #24
        strb    r1, [r8, #4]
        mov     r3, r2, asr #31
        mov     r1, r4
        mov     r0, r5
        bl      __ashldi3
        add     r6, r6, #0x28
        mov     r1, r1, lsr #24
        strb    r1, [r8, #5]!
        cmp     r6, #8
        add     r10, r10, #5
        ble     LBBD13
        ldr     r8, [sp]
LBBD14:
        add     r0, r10, r8
        str     r8, [sp]
        mov     r8, r0
LBBD15:
        mov     r3, r6, asr #31
        mov     r2, r6
        mov     r1, r4
        mov     r0, r5
        bl      __ashldi3
        add     r6, r6, #8
        mov     r1, r1, lsr #24
        strb    r1, [r8], #1
        cmp     r6, #0x38
        add     r10, r10, #1
        ble     LBBD15
        ldr     r8, [sp]
LBBD16:
        cmp     r6, #0x40
        bge     LBBD17
        mov     r1, r4
        mov     r3, r6, asr #31
        mov     r2, r6
        mov     r0, r5
        bl      __ashldi3
        ldrb    r12, [r10, +r8]
        and     r6, r6, #7
        rsb     r2, r6, #8
        mov     lr, #0xFF
        and     r2, r12, lr, asr r2
        orr     r1, r2, r1, lsr #24
        strb    r1, [r10, +r8]
LBBD17:
        mov     r0, r7
        str     r11, [r9]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBBD18:
        mvn     r0, #5
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
LBBD19:
        mvn     r0, #7
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}


