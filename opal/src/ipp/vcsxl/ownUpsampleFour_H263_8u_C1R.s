        .text
        .align  4
        .globl  ownUpsampleFour_H263_8u_C1R


ownUpsampleFour_H263_8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x48
        str     r2, [sp, #0x40]
        ldr     r7, [sp, #0x74]
        str     r3, [sp, #0x44]
        ldr     lr, [sp, #0x78]
        ldr     r4, [sp, #0x6C]
        ldrb    r6, [r0]
        ldr     r12, [sp, #0x70]
        add     r5, r7, #7
        add     r7, r7, #1
        cmp     lr, #0
        str     r7, [sp, #0x24]
        add     r8, r4, #1
        blt     LFFA21
        add     r9, r6, r6, lsl #3
        add     r7, r5, lr, lsl #2
        add     r10, r7, r9
        str     r10, [sp, #0x18]
        add     r9, lr, lr, lsl #1
        add     r10, r10, r9
        cmp     r2, #1
        mov     r10, r10, asr #4
        and     r10, r10, #0xFF
        add     r6, r6, r6, lsl #1
        strb    r10, [r4]
        ble     LFFA3
        sub     r10, r2, #1
        cmp     r10, #4
        movlt   r10, #1
        blt     LFFA1
        sub     r11, r2, #4
        str     r11, [sp, #0x1C]
        str     r4, [sp, #0x10]
        str     r2, [sp, #8]
        ldr     r4, [sp, #0x1C]
        ldr     r2, [sp, #0x18]
        mov     r10, #1
        mov     r11, r0
        str     r12, [sp, #0x14]
        str     r3, [sp, #0xC]
        str     r1, [sp, #4]
        str     r0, [sp]
LFFA0:
        ldrb    r1, [r11, #1]
        add     r10, r10, #3
        cmp     r10, r4
        add     r0, r1, r1, lsl #3
        add     r3, r1, r1, lsl #1
        add     r0, r7, r0
        add     r2, r2, r3
        add     r6, r6, r0
        mov     r2, r2, asr #4
        strb    r2, [r8]
        mov     r6, r6, asr #4
        strb    r6, [r8, #1]
        ldrb    r2, [r11, #2]
        add     r1, r2, r2, lsl #3
        add     r1, r7, r1
        add     r12, r2, r2, lsl #1
        add     r0, r0, r12
        add     r3, r3, r1
        mov     r0, r0, asr #4
        strb    r0, [r8, #2]
        mov     r3, r3, asr #4
        strb    r3, [r8, #3]
        ldrb    r0, [r11, #3]!
        add     r2, r0, r0, lsl #3
        add     r2, r7, r2
        add     r6, r0, r0, lsl #1
        add     r1, r1, r6
        add     r12, r12, r2
        mov     r1, r1, asr #4
        mov     r12, r12, asr #4
        strb    r1, [r8, #4]
        strb    r12, [r8, #5]
        add     r8, r8, #6
        ble     LFFA0
        str     r2, [sp, #0x18]
        ldr     r12, [sp, #0x14]
        ldr     r4, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LFFA1:
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #0x18]
        add     r11, r10, r0
        str     r4, [sp, #0x10]
        str     r1, [sp, #4]
        str     r0, [sp]
LFFA2:
        ldrb    r1, [r11], #1
        add     r10, r10, #1
        add     r0, r1, r1, lsl #3
        add     r1, r1, r1, lsl #1
        add     r4, r3, r1
        add     r0, r7, r0
        add     r3, r6, r0
        mov     r6, r1
        mov     r1, r4, asr #4
        mov     r3, r3, asr #4
        strb    r3, [r8, #1]
        strb    r1, [r8], #2
        cmp     r10, r2
        mov     r3, r0
        blt     LFFA2
        mov     r6, r0
        ldr     r4, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
        add     r9, r6, r9
        mov     r6, r9, asr #4
        and     r10, r6, #0xFF
LFFA3:
        strb    r10, [r8]
LFFA4:
        sub     r3, r3, #1
        cmp     r3, #0
        add     r4, r4, r12
        ble     LFFA10
        mov     r6, r2, asr #1
        sub     r6, r6, #1
        sub     r8, r7, r5
        str     r8, [sp, #0xC]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0x28]
        str     lr, [sp, #0x20]
        str     r2, [sp, #8]
LFFA5:
        ldr     lr, [sp, #0x20]
        ldrb    r2, [r0]
        ldrb    r6, [r1, +r0]
        cmp     lr, #0
        add     lr, r0, r1
        add     r7, r2, r2, lsl #1
        str     lr, [sp, #0x2C]
        add     lr, r6, r6, lsl #1
        add     r7, r7, r6
        add     r8, r2, lr
        add     r9, r7, r7, lsl #1
        add     r10, r8, r8, lsl #1
        blt     LFFA20
        ldr     r2, [sp, #0x28]
        add     lr, r2, r9
        add     r2, r2, r10
        mov     lr, lr, asr #4
        strb    lr, [r4]
        mov     r2, r2, asr #4
LFFA6:
        strb    r2, [r4, +r12]
        ldrb    r6, [r0, #1]
        add     r2, r0, r1
        ldrb    r2, [r2, #1]
        add     lr, r6, r6, lsl #1
        add     r11, r4, #1
        add     lr, lr, r2
        str     r11, [sp, #0x34]
        add     r11, r11, r12
        add     r2, r2, r2, lsl #1
        str     r11, [sp, #0x38]
        add     r2, r6, r2
        add     r6, lr, lr, lsl #1
        add     r11, r5, lr
        add     r6, r5, r6
        add     r9, r9, r11
        str     r11, [sp, #0x30]
        add     r7, r7, r6
        mov     r9, r9, asr #4
        strb    r9, [r4, #1]
        mov     r7, r7, asr #4
        strb    r7, [r4, #2]
        ldr     r9, [sp, #0x10]
        add     lr, r2, r2, lsl #1
        add     lr, r5, lr
        cmp     r9, #0
        ldr     r9, [sp, #0x34]
        add     r2, r5, r2
        add     r7, r8, lr
        add     r10, r10, r2
        mov     r8, r10, asr #4
        strb    r8, [r12, +r9]
        ldr     r8, [sp, #0x38]
        mov     r7, r7, asr #4
        strb    r7, [r8, #1]
        add     r7, r0, #2
        add     r8, r4, #3
        ble     LFFA8
        add     r9, r4, #2
        add     r0, r0, #1
        add     r10, r9, r12
        add     r9, r0, r1
        ldr     r0, [sp, #0x10]
        str     r3, [sp, #0x18]
        str     r4, [sp, #0x1C]
        str     r12, [sp, #0x14]
        str     r1, [sp, #4]
LFFA7:
        ldrb    r3, [r7]
        ldrb    r12, [r9, #1]
        subs    r0, r0, #1
        add     r1, r3, r3, lsl #1
        add     r1, r1, r12
        add     r12, r12, r12, lsl #1
        add     r3, r3, r12
        ldr     r12, [sp, #0x30]
        add     r11, r6, r1
        add     r4, r1, r1, lsl #1
        add     r6, r12, r4
        add     r12, r3, r3, lsl #1
        mov     r11, r11, asr #4
        mov     r6, r6, asr #4
        strb    r6, [r8, #1]
        strb    r11, [r8]
        add     r2, r2, r12
        add     lr, lr, r3
        mov     r2, r2, asr #4
        mov     lr, lr, asr #4
        strb    r2, [r10, #2]
        strb    lr, [r10, #1]
        ldrb    r2, [r7, #1]
        ldrb    r6, [r9, #2]!
        add     lr, r2, r2, lsl #1
        add     r7, r7, #2
        add     lr, lr, r6
        add     r11, r5, lr
        str     r11, [sp, #0x30]
        add     r6, r6, r6, lsl #1
        add     r2, r2, r6
        add     r11, r4, r11
        str     r11, [sp, #0x38]
        ldr     r4, [sp, #0x38]
        add     r6, lr, lr, lsl #1
        add     lr, r2, r2, lsl #1
        add     r6, r5, r6
        add     r1, r1, r6
        add     lr, r5, lr
        add     r2, r5, r2
        mov     r4, r4, asr #4
        mov     r1, r1, asr #4
        add     r12, r12, r2
        add     r3, r3, lr
        strb    r4, [r8, #2]
        strb    r1, [r8, #3]
        mov     r12, r12, asr #4
        mov     r3, r3, asr #4
        strb    r12, [r10, #3]
        strb    r3, [r10, #4]!
        add     r8, r8, #4
        bne     LFFA7
        ldr     r3, [sp, #0x18]
        ldr     r4, [sp, #0x1C]
        ldr     r12, [sp, #0x14]
        ldr     r1, [sp, #4]
LFFA8:
        ldr     r0, [sp, #0x20]
        cmp     r0, #0
        blt     LFFA19
        ldr     r0, [sp, #0xC]
        add     r6, r6, r0
        add     r0, lr, r0
        mov     r6, r6, asr #4
        strb    r6, [r8]
        mov     r0, r0, asr #4
LFFA9:
        strb    r0, [r12, +r8]
        ldr     r0, [sp, #0x2C]
        subs    r3, r3, #1
        add     r4, r4, r12, lsl #1
        bne     LFFA5
        ldr     r7, [sp, #0x28]
        ldr     lr, [sp, #0x20]
        ldr     r2, [sp, #8]
LFFA10:
        cmp     lr, #0
        mov     r1, #1
        blt     LFFA14
        ldrb    r12, [r0]
        cmp     r2, #1
        add     lr, lr, lr, lsl #1
        add     r3, r12, r12, lsl #3
        add     r3, r7, r3
        add     r5, r3, lr
        add     r12, r12, r12, lsl #1
        mov     r5, r5, asr #4
        and     r5, r5, #0xFF
        strb    r5, [r4], #1
        ble     LFFA13
        sub     r5, r2, #1
        cmp     r5, #4
        blt     LFFA12
        sub     r11, r2, #4
        mov     r10, r0
LFFA11:
        ldrb    r6, [r0, +r1]
        add     r1, r1, #3
        cmp     r1, r11
        add     r8, r6, r6, lsl #1
        add     r3, r8, r3
        add     r5, r6, r6, lsl #3
        add     r5, r7, r5
        mov     r3, r3, asr #4
        strb    r3, [r4]
        add     r12, r12, r5
        mov     r3, r12, asr #4
        strb    r3, [r4, #1]
        ldrb    r3, [r10, #2]
        add     r12, r3, r3, lsl #3
        add     r6, r7, r12
        add     r9, r3, r3, lsl #1
        add     r5, r9, r5
        add     r8, r8, r6
        mov     r5, r5, asr #4
        strb    r5, [r4, #2]
        mov     r8, r8, asr #4
        strb    r8, [r4, #3]
        ldrb    r12, [r10, #3]!
        add     r3, r12, r12, lsl #3
        add     r3, r7, r3
        add     r12, r12, r12, lsl #1
        add     r6, r12, r6
        add     r9, r9, r3
        mov     r6, r6, asr #4
        mov     r9, r9, asr #4
        strb    r6, [r4, #4]
        strb    r9, [r4, #5]
        add     r4, r4, #6
        ble     LFFA11
LFFA12:
        ldrb    r6, [r0, +r1]
        add     r1, r1, #1
        cmp     r1, r2
        add     r5, r6, r6, lsl #3
        add     r6, r6, r6, lsl #1
        add     r8, r6, r3
        add     r5, r7, r5
        add     r3, r12, r5
        mov     r8, r8, asr #4
        mov     r12, r6
        mov     r3, r3, asr #4
        strb    r3, [r4, #1]
        strb    r8, [r4], #2
        mov     r3, r5
        blt     LFFA12
        add     lr, r5, lr
        mov     r0, lr, asr #4
        and     r5, r0, #0xFF
LFFA13:
        strb    r5, [r4]
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LFFA14:
        ldrb    r12, [r0]
        add     r3, r4, #1
        cmp     r2, #1
        strb    r12, [r4]
        ldr     r4, [sp, #0x24]
        add     lr, r12, r12, lsl #1
        add     r4, r4, lr
        ble     LFFA18
        sub     lr, r2, #1
        cmp     lr, #4
        blt     LFFA16
        ldr     r9, [sp, #0x24]
        sub     r8, r2, #4
        mov     r7, r0
LFFA15:
        ldrb    r5, [r0, +r1]
        add     r1, r1, #3
        cmp     r1, r8
        add     lr, r5, r5, lsl #1
        add     lr, r9, lr
        add     r12, lr, r12
        add     r4, r4, r5
        mov     r12, r12, asr #2
        strb    r12, [r3, #1]
        mov     r4, r4, asr #2
        strb    r4, [r3]
        ldrb    r6, [r7, #2]
        add     lr, lr, r6
        mov     r12, lr, asr #2
        strb    r12, [r3, #2]
        add     r12, r6, r6, lsl #1
        add     lr, r9, r12
        add     r5, lr, r5
        mov     r12, r5, asr #2
        strb    r12, [r3, #3]
        ldrb    r12, [r7, #3]!
        add     lr, lr, r12
        add     r4, r12, r12, lsl #1
        add     r4, r9, r4
        mov     lr, lr, asr #2
        strb    lr, [r3, #4]
        add     r6, r4, r6
        mov     lr, r6, asr #2
        strb    lr, [r3, #5]
        add     r3, r3, #6
        ble     LFFA15
LFFA16:
        ldr     lr, [sp, #0x24]
LFFA17:
        ldrb    r5, [r0, +r1]
        add     r1, r1, #1
        cmp     r1, r2
        add     r6, r5, r5, lsl #1
        add     r6, lr, r6
        add     r12, r6, r12
        add     r7, r4, r5
        mov     r12, r12, asr #2
        mov     r7, r7, asr #2
        strb    r12, [r3, #1]
        strb    r7, [r3], #2
        mov     r4, r6
        mov     r12, r5
        blt     LFFA17
LFFA18:
        strb    r12, [r3]
        add     sp, sp, #0x48
        ldmia   sp!, {r4 - r11, pc}
LFFA19:
        ldr     r0, [sp, #0x30]
        sub     r2, r2, #6
        sub     r0, r0, #6
        mov     r0, r0, asr #2
        strb    r0, [r8]
        mov     r0, r2, asr #2
        b       LFFA9
LFFA20:
        ldr     r2, [sp, #0x24]
        add     lr, r7, r2
        add     r2, r8, r2
        mov     lr, lr, asr #2
        strb    lr, [r4]
        mov     r2, r2, asr #2
        b       LFFA6
LFFA21:
        strb    r6, [r4]
        ldr     r9, [sp, #0x24]
        add     r7, r6, r6, lsl #1
        cmp     r2, #1
        add     r7, r9, r7
        ble     LFFA25
        sub     r9, r2, #1
        cmp     r9, #4
        movlt   r9, #1
        blt     LFFA23
        str     r4, [sp, #0x10]
        ldr     r4, [sp, #0x24]
        mov     r9, #1
        sub     r11, r2, #4
        mov     r10, r0
        str     r3, [sp, #0xC]
        str     r2, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LFFA22:
        ldrb    r3, [r10, #1]
        add     r9, r9, #3
        cmp     r9, r11
        add     r0, r3, r3, lsl #1
        add     r1, r4, r0
        add     r6, r1, r6
        add     r7, r7, r3
        mov     r0, r7, asr #2
        strb    r0, [r8]
        mov     r6, r6, asr #2
        strb    r6, [r8, #1]
        ldrb    r2, [r10, #2]
        add     r0, r2, r2, lsl #1
        add     r0, r4, r0
        add     r1, r1, r2
        add     r3, r0, r3
        mov     r1, r1, asr #2
        strb    r1, [r8, #2]
        mov     r3, r3, asr #2
        strb    r3, [r8, #3]
        ldrb    r6, [r10, #3]!
        add     r1, r6, r6, lsl #1
        add     r7, r4, r1
        add     r0, r0, r6
        add     r2, r7, r2
        mov     r0, r0, asr #2
        strb    r0, [r8, #4]
        mov     r2, r2, asr #2
        strb    r2, [r8, #5]
        add     r8, r8, #6
        ble     LFFA22
        ldr     r4, [sp, #0x10]
        ldr     r3, [sp, #0xC]
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LFFA23:
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #0x24]
        add     r10, r9, r0
        str     r1, [sp, #4]
        str     r0, [sp]
LFFA24:
        ldrb    r1, [r10], #1
        add     r9, r9, #1
        add     r0, r1, r1, lsl #1
        add     r11, r7, r1
        add     r0, r3, r0
        add     r7, r0, r6
        mov     r6, r1
        mov     r1, r11, asr #2
        mov     r7, r7, asr #2
        strb    r7, [r8, #1]
        strb    r1, [r8], #2
        cmp     r9, r2
        mov     r7, r0
        blt     LFFA24
        ldr     r3, [sp, #0xC]
        ldr     r1, [sp, #4]
        ldr     r0, [sp]
LFFA25:
        strb    r6, [r8]
        mov     r7, #0
        b       LFFA4


