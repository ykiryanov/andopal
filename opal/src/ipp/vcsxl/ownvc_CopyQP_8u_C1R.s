        .text
        .align  4
        .globl  ownvc_CopyQP_8u_C1R


ownvc_CopyQP_8u_C1R:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        sub     sp, sp, #1, 22
        ldr     r6, [sp, #0x4A8]
        ldr     r5, [sp, #0x4AC]
        ldr     r4, [sp, #0x4B0]
        ldr     lr, [sp, #0x4B4]
        mov     r12, r6, asr #2
        ands    r12, r12, #3
        and     r7, r6, #3
        beq     LEKP54
        cmp     r7, #0
        add     r6, r4, #1
        bne     LEKP21
        add     r7, sp, #0xA9, 30
        cmp     r6, #0
        mov     r10, r7
        ble     LEKP4
        sub     r9, lr, #6
        add     r8, r4, #1
        str     r7, [sp, #0x30]
        str     r6, [sp, #0x1C]
        str     r12, [sp, #0xC]
        str     r4, [sp, #8]
        str     r5, [sp, #0x28]
        str     r3, [sp, #4]
        str     r2, [sp]
LEKP0:
        cmp     lr, #0
        ble     LEKP3
        cmp     lr, #6
        movlt   r2, #0
        blt     LEKP2
        mov     r2, #0
        sub     r12, r10, #1
        sub     r3, r0, #1
LEKP1:
        ldrb    r11, [r2, +r0]
        ldrb    r7, [r3, #2]
        ldrb    r6, [r3, #3]
        ldrb    r5, [r3, #4]
        ldrb    r4, [r3, #5]!
        strb    r11, [r2, +r10]
        add     r2, r2, #5
        strb    r7, [r12, #2]
        strb    r6, [r12, #3]
        strb    r5, [r12, #4]
        strb    r4, [r12, #5]!
        cmp     r2, r9
        ble     LEKP1
LEKP2:
        ldrb    r3, [r2, +r0]
        strb    r3, [r2, +r10]
        add     r2, r2, #1
        cmp     r2, lr
        blt     LEKP2
LEKP3:
        subs    r8, r8, #1
        add     r0, r1, r0
        add     r10, r10, #0x18
        bne     LEKP0
        ldr     r7, [sp, #0x30]
        ldr     r6, [sp, #0x1C]
        ldr     r12, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #0x28]
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LEKP4:
        sub     r11, r7, #0x18
        sub     r0, lr, #6
        mov     r10, #3
LEKP5:
        cmp     lr, #0
        ble     LEKP8
        cmp     lr, #6
        movlt   r1, #0
        blt     LEKP7
        mov     r1, #0
        sub     r9, r11, #1
        sub     r8, r7, #1
        str     r2, [sp]
LEKP6:
        ldrb    r2, [r1, +r7]
        strb    r2, [r1, +r11]
        ldrb    r2, [r8, #2]
        add     r1, r1, #5
        cmp     r1, r0
        strb    r2, [r9, #2]
        ldrb    r2, [r8, #3]
        strb    r2, [r9, #3]
        ldrb    r2, [r8, #4]
        strb    r2, [r9, #4]
        ldrb    r2, [r8, #5]!
        strb    r2, [r9, #5]!
        ble     LEKP6
        ldr     r2, [sp]
LEKP7:
        ldrb    r8, [r1, +r7]
        strb    r8, [r1, +r11]
        add     r1, r1, #1
        cmp     r1, lr
        blt     LEKP7
LEKP8:
        subs    r10, r10, #1
        add     r7, r7, #0x18
        sub     r11, r11, #0x18
        bne     LEKP5
        rsb     r6, r6, r6, lsl #2
        mov     r9, #3
        add     r6, r7, r6, lsl #3
        sub     r1, r6, #0x60
        add     r10, r1, #0x18
LEKP9:
        cmp     lr, #0
        ble     LEKP12
        cmp     lr, #6
        mov     r8, #0
        blt     LEKP11
        sub     r7, r10, #1
        sub     r6, r1, #1
LEKP10:
        ldrb    r11, [r8, +r1]
        strb    r11, [r8, +r10]
        ldrb    r11, [r6, #2]
        add     r8, r8, #5
        cmp     r8, r0
        strb    r11, [r7, #2]
        ldrb    r11, [r6, #3]
        strb    r11, [r7, #3]
        ldrb    r11, [r6, #4]
        strb    r11, [r7, #4]
        ldrb    r11, [r6, #5]!
        strb    r11, [r7, #5]!
        ble     LEKP10
LEKP11:
        ldrb    r6, [r8, +r1]
        strb    r6, [r8, +r10]
        add     r8, r8, #1
        cmp     r8, lr
        blt     LEKP11
LEKP12:
        subs    r9, r9, #1
        sub     r1, r1, #0x18
        add     r10, r10, #0x18
        bne     LEKP9
        cmp     r4, #0
        add     r0, sp, #0x97, 30
        mov     r6, r2
        ble     LEKP16
        mov     r7, r4
        mov     r1, #0
        mov     r8, #0xFF
        str     r12, [sp, #0xC]
        str     r4, [sp, #8]
        str     r2, [sp]
LEKP13:
        cmp     lr, #0
        ble     LEKP15
        mov     r2, #0
        str     r7, [sp, #0x10]
        str     r3, [sp, #4]
LEKP14:
        ldrb    r4, [r0, #0xA8]
        ldrb    r12, [r0]
        ldrb    r3, [r0, #0x30]
        ldrb    r11, [r0, #0x78]
        ldrb    r8, [r0, #0x90]
        ldrb    r7, [r0, #0x18]
        ldrb    r10, [r0, #0x48]
        ldrb    r9, [r0, #0x60]
        add     r4, r12, r4
        add     r3, r3, r11
        add     r8, r7, r8
        mov     r4, r4, lsl #3
        rsb     r12, r3, r3, lsl #2
        rsb     r8, r8, r8, lsl #2
        rsb     r3, r4, #0
        mov     r12, r12, lsl #4
        rsb     r8, r12, r8, lsl #3
        add     r9, r10, r9
        sub     r3, r3, r5
        add     r8, r3, r8
        add     r9, r9, r9, lsl #2
        add     r0, r0, #1
        mov     r12, #0xFF
        add     r9, r8, r9, lsl #5
        add     r3, r9, #0x80
        mov     r3, r3, asr #8
        cmp     r3, #0xFF
        movgt   r3, r12
        cmp     r3, #0
        mov     r12, r1
        movgt   r12, r3
        strb    r12, [r2, +r6]
        add     r2, r2, #1
        cmp     r2, lr
        blt     LEKP14
        ldr     r7, [sp, #0x10]
        ldr     r3, [sp, #4]
LEKP15:
        sub     r0, r0, lr
        subs    r7, r7, #1
        add     r0, r0, #0x18
        add     r6, r3, r6
        bne     LEKP13
        ldr     r12, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r2, [sp]
LEKP16:
        cmp     r12, #2
        beq     LEKP70
        cmp     r12, #1
        moveq   r1, #3
        movne   r1, #4
        add     r0, sp, #0x97, 30
        rsb     r1, r1, r1, lsl #2
        cmp     r4, #0
        add     r0, r0, r1, lsl #3
        ble     LEKP70
        sub     r1, lr, #5
LEKP17:
        cmp     lr, #0
        ble     LEKP20
        cmp     lr, #5
        movlt   r7, #0
        blt     LEKP19
        mov     r7, #0
        sub     r6, r2, #1
        sub     r12, r0, #1
LEKP18:
        ldrb    r10, [r7, +r0]
        ldrb    r9, [r7, +r2]
        ldrb    r8, [r12, #2]
        sub     r10, r10, r5
        add     r9, r10, r9
        ldrb    r10, [r6, #2]
        add     r9, r9, #1
        sub     r8, r8, r5
        mov     r9, r9, asr #1
        add     r10, r8, r10
        strb    r9, [r7, +r2]
        add     r9, r10, #1
        ldrb    r8, [r12, #3]
        mov     r9, r9, asr #1
        ldrb    r10, [r12, #4]!
        strb    r9, [r6, #2]
        ldrb    r9, [r6, #3]
        sub     r8, r8, r5
        add     r7, r7, #4
        cmp     r7, r1
        add     r8, r8, r9
        ldrb    r9, [r6, #4]
        sub     r10, r10, r5
        add     r8, r8, #1
        add     r9, r10, r9
        add     r9, r9, #1
        mov     r8, r8, asr #1
        mov     r9, r9, asr #1
        strb    r8, [r6, #3]
        strb    r9, [r6, #4]!
        ble     LEKP18
LEKP19:
        ldrb    r6, [r7, +r0]
        ldrb    r12, [r7, +r2]
        sub     r6, r6, r5
        add     r12, r6, r12
        add     r12, r12, #1
        mov     r12, r12, asr #1
        strb    r12, [r7, +r2]
        add     r7, r7, #1
        cmp     r7, lr
        blt     LEKP19
LEKP20:
        subs    r4, r4, #1
        add     r0, r0, #0x18
        add     r2, r3, r2
        bne     LEKP17
        add     sp, sp, #0x84
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LEKP21:
        add     r10, sp, #2, 24
        add     r10, r10, #0xA7
        cmp     r6, #0
        add     r8, lr, #1
        mov     r9, r10
        ble     LEKP26
        add     r11, lr, #1
        str     r11, [sp, #0x18]
        sub     r11, lr, #5
        str     r11, [sp, #0x14]
        add     r11, r4, #1
        str     r11, [sp, #0x10]
        str     lr, [sp, #0x2C]
        str     r4, [sp, #8]
        str     r5, [sp, #0x28]
        ldr     lr, [sp, #0x10]
        ldr     r4, [sp, #0x14]
        ldr     r5, [sp, #0x18]
        str     r10, [sp, #0x30]
        str     r6, [sp, #0x1C]
        str     r12, [sp, #0xC]
        str     r7, [sp, #0x20]
        str     r3, [sp, #4]
        str     r2, [sp]
LEKP22:
        cmp     r8, #0
        ble     LEKP25
        cmp     r5, #6
        movlt   r2, #0
        blt     LEKP24
        mov     r2, #0
        sub     r12, r9, #1
        sub     r3, r0, #1
        str     r1, [sp, #0x24]
LEKP23:
        ldrb    r11, [r2, +r0]
        ldrb    r10, [r3, #2]
        ldrb    r7, [r3, #3]
        ldrb    r6, [r3, #4]
        ldrb    r1, [r3, #5]!
        strb    r11, [r2, +r9]
        add     r2, r2, #5
        strb    r10, [r12, #2]
        strb    r7, [r12, #3]
        strb    r6, [r12, #4]
        strb    r1, [r12, #5]!
        cmp     r2, r4
        ble     LEKP23
        ldr     r1, [sp, #0x24]
LEKP24:
        ldrb    r3, [r2, +r0]
        strb    r3, [r2, +r9]
        add     r2, r2, #1
        cmp     r2, r8
        blt     LEKP24
LEKP25:
        subs    lr, lr, #1
        add     r0, r1, r0
        add     r9, r9, #0x18
        bne     LEKP22
        ldr     r10, [sp, #0x30]
        ldr     r6, [sp, #0x1C]
        ldr     r12, [sp, #0xC]
        ldr     r7, [sp, #0x20]
        ldr     lr, [sp, #0x2C]
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #0x28]
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LEKP26:
        cmp     r6, #0
        ble     LEKP28
        sub     r0, r10, #0x15
        add     r0, r0, lr
        add     r1, r4, #1
LEKP27:
        ldrb    r9, [r10]
        ldrb    r8, [r10, #1]
        subs    r1, r1, #1
        strb    r9, [r10, #-1]
        ldrb    r9, [r10, #2]
        strb    r8, [r10, #-2]
        strb    r9, [r10, #-3]
        ldrb    r9, [r0, #0x15]
        ldrb    r8, [r0, #0x14]
        add     r10, r10, #0x18
        strb    r9, [r0, #0x16]
        ldrb    r9, [r0, #0x13]
        strb    r8, [r0, #0x17]
        strb    r9, [r0, #0x18]!
        bne     LEKP27
LEKP28:
        add     r8, sp, #0x7C
        cmp     r6, #0
        add     r1, sp, #0xA9, 30
        mov     r0, r8
        ble     LEKP32
        mov     r11, #0
        mov     r10, #0xFF
        add     r9, r4, #1
        str     r8, [sp, #0x14]
        str     r6, [sp, #0x1C]
        str     r12, [sp, #0xC]
        str     r7, [sp, #0x20]
        str     r4, [sp, #8]
        str     r3, [sp, #4]
        str     r2, [sp]
LEKP29:
        cmp     lr, #0
        ble     LEKP31
        mov     r3, #0
        add     r2, r1, #3
        str     r9, [sp, #0x18]
LEKP30:
        ldrb    r4, [r3, +r1]
        ldrb    r6, [r2, #4]
        ldrb    r12, [r2, #2]
        ldrb    r11, [r2, #-1]
        ldrb    r7, [r2, #-2]
        ldrb    r8, [r2, #3]
        ldrb    r10, [r2]
        ldrb    r9, [r2, #1]!
        add     r4, r4, r6
        add     r12, r11, r12
        mov     r4, r4, lsl #3
        add     r8, r7, r8
        rsb     r6, r12, r12, lsl #2
        rsb     r12, r4, #0
        rsb     r4, r8, r8, lsl #2
        mov     r6, r6, lsl #4
        add     r9, r10, r9
        sub     r12, r12, r5
        rsb     r4, r6, r4, lsl #3
        add     r9, r9, r9, lsl #2
        add     r12, r12, r4
        add     r9, r12, r9, lsl #5
        add     r12, r9, #0x80
        mov     r4, #0xFF
        mov     r12, r12, asr #8
        cmp     r12, #0xFF
        movgt   r12, r4
        mov     r4, #0
        cmp     r12, #0
        movgt   r4, r12
        strb    r4, [r0, +r3]
        add     r3, r3, #1
        cmp     r3, lr
        blt     LEKP30
        ldr     r9, [sp, #0x18]
LEKP31:
        subs    r9, r9, #1
        add     r1, r1, #0x18
        add     r0, r0, #0x18
        bne     LEKP29
        ldr     r8, [sp, #0x14]
        ldr     r6, [sp, #0x1C]
        ldr     r12, [sp, #0xC]
        ldr     r7, [sp, #0x20]
        ldr     r4, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LEKP32:
        cmp     r7, #2
        beq     LEKP37
        cmp     r7, #1
        moveq   r1, #3
        movne   r1, #4
        add     r0, sp, #0x97, 30
        add     r1, r0, r1
        add     r0, r1, #0x48
        cmp     r6, #0
        mov     r1, r8
        ble     LEKP37
        sub     r9, lr, #5
        add     r7, r4, #1
        str     r9, [sp, #0x24]
        str     r8, [sp, #0x14]
        str     r6, [sp, #0x1C]
        str     r12, [sp, #0xC]
        str     r4, [sp, #8]
        str     r3, [sp, #4]
        str     r2, [sp]
LEKP33:
        cmp     lr, #0
        ble     LEKP36
        cmp     lr, #5
        movlt   r12, #0
        blt     LEKP35
        mov     r12, #0
        sub     r3, r1, #1
        sub     r2, r0, #1
        str     r7, [sp, #0x30]
        str     lr, [sp, #0x2C]
LEKP34:
        ldrb    r11, [r12, +r0]
        ldrb    lr, [r12, +r1]
        ldrb    r4, [r2, #2]
        ldrb    r10, [r2, #3]
        ldrb    r6, [r2, #4]!
        ldrb    r7, [r3, #2]
        ldrb    r8, [r3, #3]
        ldrb    r9, [r3, #4]
        sub     r11, r11, r5
        add     lr, r11, lr
        add     lr, lr, #1
        sub     r4, r4, r5
        sub     r10, r10, r5
        sub     r6, r6, r5
        add     r7, r4, r7
        add     r8, r10, r8
        add     r9, r6, r9
        mov     lr, lr, asr #1
        add     r7, r7, #1
        add     r8, r8, #1
        add     r9, r9, #1
        strb    lr, [r12, +r1]
        mov     r7, r7, asr #1
        mov     r8, r8, asr #1
        mov     r9, r9, asr #1
        strb    r7, [r3, #2]
        strb    r8, [r3, #3]
        strb    r9, [r3, #4]!
        ldr     lr, [sp, #0x24]
        add     r12, r12, #4
        cmp     r12, lr
        ble     LEKP34
        ldr     r7, [sp, #0x30]
        ldr     lr, [sp, #0x2C]
LEKP35:
        ldrb    r3, [r12, +r0]
        ldrb    r2, [r12, +r1]
        sub     r3, r3, r5
        add     r2, r3, r2
        add     r2, r2, #1
        mov     r2, r2, asr #1
        strb    r2, [r12, +r1]
        add     r12, r12, #1
        cmp     r12, lr
        blt     LEKP35
LEKP36:
        subs    r7, r7, #1
        add     r0, r0, #0x18
        add     r1, r1, #0x18
        bne     LEKP33
        ldr     r8, [sp, #0x14]
        ldr     r6, [sp, #0x1C]
        ldr     r12, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LEKP37:
        sub     r11, r8, #0x18
        sub     r0, lr, #6
        mov     r10, #3
LEKP38:
        cmp     lr, #0
        ble     LEKP41
        cmp     lr, #6
        movlt   r1, #0
        blt     LEKP40
        mov     r1, #0
        sub     r9, r11, #1
        sub     r7, r8, #1
        str     r2, [sp]
LEKP39:
        ldrb    r2, [r1, +r8]
        strb    r2, [r1, +r11]
        ldrb    r2, [r7, #2]
        add     r1, r1, #5
        cmp     r1, r0
        strb    r2, [r9, #2]
        ldrb    r2, [r7, #3]
        strb    r2, [r9, #3]
        ldrb    r2, [r7, #4]
        strb    r2, [r9, #4]
        ldrb    r2, [r7, #5]!
        strb    r2, [r9, #5]!
        ble     LEKP39
        ldr     r2, [sp]
LEKP40:
        ldrb    r7, [r1, +r8]
        strb    r7, [r1, +r11]
        add     r1, r1, #1
        cmp     r1, lr
        blt     LEKP40
LEKP41:
        subs    r10, r10, #1
        add     r8, r8, #0x18
        sub     r11, r11, #0x18
        bne     LEKP38
        rsb     r6, r6, r6, lsl #2
        mov     r9, #3
        add     r6, r8, r6, lsl #3
        sub     r1, r6, #0x60
        add     r10, r1, #0x18
LEKP42:
        cmp     lr, #0
        ble     LEKP45
        cmp     lr, #6
        mov     r8, #0
        blt     LEKP44
        sub     r7, r10, #1
        sub     r6, r1, #1
LEKP43:
        ldrb    r11, [r8, +r1]
        strb    r11, [r8, +r10]
        ldrb    r11, [r6, #2]
        add     r8, r8, #5
        cmp     r8, r0
        strb    r11, [r7, #2]
        ldrb    r11, [r6, #3]
        strb    r11, [r7, #3]
        ldrb    r11, [r6, #4]
        strb    r11, [r7, #4]
        ldrb    r11, [r6, #5]!
        strb    r11, [r7, #5]!
        ble     LEKP43
LEKP44:
        ldrb    r6, [r8, +r1]
        strb    r6, [r8, +r10]
        add     r8, r8, #1
        cmp     r8, lr
        blt     LEKP44
LEKP45:
        subs    r9, r9, #1
        sub     r1, r1, #0x18
        add     r10, r10, #0x18
        bne     LEKP42
        cmp     r4, #0
        add     r0, sp, #0x34
        mov     r6, r2
        ble     LEKP49
        mov     r7, r4
        mov     r1, #0
        mov     r8, #0xFF
        str     r12, [sp, #0xC]
        str     r4, [sp, #8]
        str     r2, [sp]
LEKP46:
        cmp     lr, #0
        ble     LEKP48
        mov     r2, #0
        str     r7, [sp, #0x10]
        str     r3, [sp, #4]
LEKP47:
        ldrb    r4, [r0, #0xA8]
        ldrb    r12, [r0]
        ldrb    r3, [r0, #0x30]
        ldrb    r11, [r0, #0x78]
        ldrb    r8, [r0, #0x90]
        ldrb    r7, [r0, #0x18]
        ldrb    r10, [r0, #0x48]
        ldrb    r9, [r0, #0x60]
        add     r4, r12, r4
        add     r3, r3, r11
        add     r8, r7, r8
        mov     r4, r4, lsl #3
        rsb     r12, r3, r3, lsl #2
        rsb     r8, r8, r8, lsl #2
        rsb     r3, r4, #0
        mov     r12, r12, lsl #4
        rsb     r8, r12, r8, lsl #3
        add     r9, r10, r9
        sub     r3, r3, r5
        add     r8, r3, r8
        add     r9, r9, r9, lsl #2
        add     r0, r0, #1
        mov     r12, #0xFF
        add     r9, r8, r9, lsl #5
        add     r3, r9, #0x80
        mov     r3, r3, asr #8
        cmp     r3, #0xFF
        movgt   r3, r12
        cmp     r3, #0
        mov     r12, r1
        movgt   r12, r3
        strb    r12, [r2, +r6]
        add     r2, r2, #1
        cmp     r2, lr
        blt     LEKP47
        ldr     r7, [sp, #0x10]
        ldr     r3, [sp, #4]
LEKP48:
        sub     r0, r0, lr
        subs    r7, r7, #1
        add     r0, r0, #0x18
        add     r6, r3, r6
        bne     LEKP46
        ldr     r12, [sp, #0xC]
        ldr     r4, [sp, #8]
        ldr     r2, [sp]
LEKP49:
        cmp     r12, #2
        beq     LEKP70
        cmp     r12, #1
        moveq   r1, #3
        movne   r1, #4
        add     r0, sp, #0x34
        rsb     r1, r1, r1, lsl #2
        cmp     r4, #0
        add     r0, r0, r1, lsl #3
        ble     LEKP70
        sub     r1, lr, #5
LEKP50:
        cmp     lr, #0
        ble     LEKP53
        cmp     lr, #5
        movlt   r7, #0
        blt     LEKP52
        mov     r7, #0
        sub     r6, r2, #1
        sub     r12, r0, #1
LEKP51:
        ldrb    r10, [r7, +r0]
        ldrb    r9, [r7, +r2]
        ldrb    r8, [r12, #2]
        sub     r10, r10, r5
        add     r9, r10, r9
        ldrb    r10, [r6, #2]
        add     r9, r9, #1
        sub     r8, r8, r5
        mov     r9, r9, asr #1
        add     r10, r8, r10
        strb    r9, [r7, +r2]
        add     r9, r10, #1
        ldrb    r8, [r12, #3]
        mov     r9, r9, asr #1
        ldrb    r10, [r12, #4]!
        strb    r9, [r6, #2]
        ldrb    r9, [r6, #3]
        sub     r8, r8, r5
        add     r7, r7, #4
        cmp     r7, r1
        add     r8, r8, r9
        ldrb    r9, [r6, #4]
        sub     r10, r10, r5
        add     r8, r8, #1
        add     r9, r10, r9
        add     r9, r9, #1
        mov     r8, r8, asr #1
        mov     r9, r9, asr #1
        strb    r8, [r6, #3]
        strb    r9, [r6, #4]!
        ble     LEKP51
LEKP52:
        ldrb    r6, [r7, +r0]
        ldrb    r12, [r7, +r2]
        sub     r6, r6, r5
        add     r12, r6, r12
        add     r12, r12, #1
        mov     r12, r12, asr #1
        strb    r12, [r7, +r2]
        add     r7, r7, #1
        cmp     r7, lr
        blt     LEKP52
LEKP53:
        subs    r4, r4, #1
        add     r0, r0, #0x18
        add     r2, r3, r2
        bne     LEKP50
        add     sp, sp, #0x84
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}
LEKP54:
        add     r12, sp, #2, 24
        add     r12, r12, #0xA7
        cmp     r4, #0
        add     r10, lr, #1
        mov     r11, r12
        ble     LEKP59
        add     r9, lr, #1
        sub     r8, lr, #5
        mov     r6, r4
        str     r12, [sp, #0x30]
        str     r7, [sp, #0x20]
        str     lr, [sp, #0x2C]
        str     r4, [sp, #8]
        str     r5, [sp, #0x28]
        str     r3, [sp, #4]
        str     r2, [sp]
LEKP55:
        cmp     r10, #0
        ble     LEKP58
        cmp     r9, #6
        movlt   r2, #0
        blt     LEKP57
        mov     r2, #0
        sub     r12, r11, #1
        sub     r3, r0, #1
        str     r1, [sp, #0x24]
LEKP56:
        ldrb    r7, [r2, +r0]
        ldrb    r5, [r3, #2]
        ldrb    r4, [r3, #3]
        ldrb    lr, [r3, #4]
        ldrb    r1, [r3, #5]!
        strb    r7, [r2, +r11]
        add     r2, r2, #5
        strb    r5, [r12, #2]
        strb    r4, [r12, #3]
        strb    lr, [r12, #4]
        strb    r1, [r12, #5]!
        cmp     r2, r8
        ble     LEKP56
        ldr     r1, [sp, #0x24]
LEKP57:
        ldrb    r3, [r2, +r0]
        strb    r3, [r2, +r11]
        add     r2, r2, #1
        cmp     r2, r10
        blt     LEKP57
LEKP58:
        subs    r6, r6, #1
        add     r0, r1, r0
        add     r11, r11, #0x18
        bne     LEKP55
        ldr     r12, [sp, #0x30]
        ldr     r7, [sp, #0x20]
        ldr     lr, [sp, #0x2C]
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #0x28]
        ldr     r3, [sp, #4]
        ldr     r2, [sp]
LEKP59:
        cmp     r4, #0
        ble     LEKP61
        sub     r0, r12, #0x15
        add     r0, r0, lr
        mov     r1, r4
LEKP60:
        ldrb    r8, [r12]
        ldrb    r6, [r12, #1]
        subs    r1, r1, #1
        strb    r8, [r12, #-1]
        ldrb    r8, [r12, #2]
        strb    r6, [r12, #-2]
        strb    r8, [r12, #-3]
        ldrb    r6, [r0, #0x15]
        ldrb    r8, [r0, #0x14]
        ldrb    r9, [r0, #0x13]
        strb    r6, [r0, #0x16]
        add     r12, r12, #0x18
        strb    r8, [r0, #0x17]
        strb    r9, [r0, #0x18]!
        bne     LEKP60
LEKP61:
        cmp     r4, #0
        add     r1, sp, #0xA9, 30
        mov     r0, r2
        ble     LEKP65
        mov     r6, r4
        mov     r8, #0
        mov     r12, #0xFF
        str     r7, [sp, #0x20]
        str     r4, [sp, #8]
        str     r2, [sp]
LEKP62:
        cmp     lr, #0
        ble     LEKP64
        mov     r12, #0
        add     r2, r1, #3
        str     r6, [sp, #0x30]
        str     r3, [sp, #4]
LEKP63:
        ldrb    r6, [r2, #4]
        ldrb    r4, [r12, +r1]
        ldrb    r3, [r2, #-1]
        ldrb    r11, [r2, #2]
        ldrb    r8, [r2, #3]
        ldrb    r7, [r2, #-2]
        ldrb    r10, [r2]
        ldrb    r9, [r2, #1]!
        add     r6, r4, r6
        add     r3, r3, r11
        add     r8, r7, r8
        mov     r6, r6, lsl #3
        rsb     r4, r3, r3, lsl #2
        rsb     r8, r8, r8, lsl #2
        rsb     r3, r6, #0
        mov     r4, r4, lsl #4
        rsb     r8, r4, r8, lsl #3
        add     r9, r10, r9
        sub     r3, r3, r5
        add     r8, r3, r8
        add     r9, r9, r9, lsl #2
        mov     r4, #0xFF
        add     r9, r8, r9, lsl #5
        add     r3, r9, #0x80
        mov     r3, r3, asr #8
        cmp     r3, #0xFF
        movgt   r3, r4
        mov     r4, #0
        cmp     r3, #0
        movgt   r4, r3
        strb    r4, [r12, +r0]
        add     r12, r12, #1
        cmp     r12, lr
        blt     LEKP63
        ldr     r6, [sp, #0x30]
        ldr     r3, [sp, #4]
LEKP64:
        subs    r6, r6, #1
        add     r1, r1, #0x18
        add     r0, r3, r0
        bne     LEKP62
        ldr     r7, [sp, #0x20]
        ldr     r4, [sp, #8]
        ldr     r2, [sp]
LEKP65:
        cmp     r7, #2
        beq     LEKP70
        cmp     r7, #1
        moveq   r1, #3
        movne   r1, #4
        add     r0, sp, #0x97, 30
        add     r1, r0, r1
        cmp     r4, #0
        add     r0, r1, #0x48
        ble     LEKP70
        sub     r1, lr, #5
LEKP66:
        cmp     lr, #0
        ble     LEKP69
        cmp     lr, #5
        movlt   r7, #0
        blt     LEKP68
        mov     r7, #0
        sub     r6, r2, #1
        sub     r12, r0, #1
LEKP67:
        ldrb    r10, [r7, +r0]
        ldrb    r9, [r7, +r2]
        ldrb    r8, [r12, #2]
        sub     r10, r10, r5
        add     r9, r10, r9
        ldrb    r10, [r6, #2]
        add     r9, r9, #1
        sub     r8, r8, r5
        mov     r9, r9, asr #1
        add     r10, r8, r10
        strb    r9, [r7, +r2]
        add     r9, r10, #1
        ldrb    r8, [r12, #3]
        mov     r9, r9, asr #1
        ldrb    r10, [r12, #4]!
        strb    r9, [r6, #2]
        ldrb    r9, [r6, #3]
        sub     r8, r8, r5
        add     r7, r7, #4
        cmp     r7, r1
        add     r8, r8, r9
        ldrb    r9, [r6, #4]
        sub     r10, r10, r5
        add     r8, r8, #1
        add     r9, r10, r9
        add     r9, r9, #1
        mov     r8, r8, asr #1
        mov     r9, r9, asr #1
        strb    r8, [r6, #3]
        strb    r9, [r6, #4]!
        ble     LEKP67
LEKP68:
        ldrb    r6, [r7, +r0]
        ldrb    r12, [r7, +r2]
        sub     r6, r6, r5
        add     r12, r6, r12
        add     r12, r12, #1
        mov     r12, r12, asr #1
        strb    r12, [r7, +r2]
        add     r7, r7, #1
        cmp     r7, lr
        blt     LEKP68
LEKP69:
        subs    r4, r4, #1
        add     r0, r0, #0x18
        add     r2, r3, r2
        bne     LEKP66
LEKP70:
        add     sp, sp, #0x84
        add     sp, sp, #1, 22
        ldmia   sp!, {r4 - r11, pc}


