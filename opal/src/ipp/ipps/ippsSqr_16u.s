        .text
        .align  4
        .globl  ownippsSqr_16u


ownippsSqr_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        cmp     r3, #0
        mov     r12, #0
        bne     LAWG3
        subs    r10, r2, #4
        bmi     LAWG1
        add     lr, r0, #2
        add     r4, r0, #4
        add     r5, r0, #6
        add     r9, r1, #2
        add     r8, r1, #4
        add     r7, r1, #6
        mov     r3, r0
        mov     r6, r1
        str     r0, [sp, #8]
        str     r2, [sp, #0xC]
        str     r1, [sp, #0x10]
LAWG0:
        ldrh    r1, [r3], #8
        ldrh    r0, [lr], #8
        ldrh    r2, [r4], #8
        ldrh    r11, [r5], #8
        cmp     r1, #0xFF
        mulls   r1, r1, r1
        mvnhi   r1, #0
        addhi   r1, r1, #1, 16
        cmp     r0, #0xFF
        mulls   r0, r0, r0
        mvnhi   r0, #0
        addhi   r0, r0, #1, 16
        cmp     r2, #0xFF
        mulls   r2, r2, r2
        mvnhi   r2, #0
        addhi   r2, r2, #1, 16
        cmp     r11, #0xFF
        mulls   r11, r11, r11
        mvnhi   r11, #0
        addhi   r11, r11, #1, 16
        strh    r1, [r6], #8
        strh    r0, [r9], #8
        strh    r2, [r8], #8
        add     r12, r12, #4
        strh    r11, [r7], #8
        cmp     r12, r10
        ble     LAWG0
        ldr     r0, [sp, #8]
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x10]
LAWG1:
        and     r3, r2, #3
        sub     r3, r2, r3
        cmp     r3, r2
        bge     LAWG33
        add     r0, r0, r3, lsl #1
        add     r1, r1, r3, lsl #1
        mvn     r12, #0
LAWG2:
        ldrh    lr, [r0], #2
        cmp     lr, #0xFF
        mulls   lr, lr, lr
        addhi   lr, r12, #1, 16
        add     r3, r3, #1
        strh    lr, [r1], #2
        cmp     r3, r2
        blt     LAWG2
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAWG3:
        cmp     r3, #0
        mvn     r4, #0
        ble     LAWG36
        cmp     r3, #3
        bgt     LAWG9
        subs    r11, r2, #4
        bmi     LAWG5
        add     lr, r4, #1, 16
        add     r4, r1, #6
        str     r4, [sp, #0x18]
        str     r3, [sp, #0x14]
        ldr     r3, [sp, #0x18]
        add     r10, r0, #2
        add     r9, r0, #4
        add     r8, r0, #6
        add     r7, r1, #2
        add     r6, r1, #4
        mov     r5, r0
        mov     r4, r1
        str     r0, [sp, #8]
        str     r11, [sp, #4]
        str     r2, [sp, #0xC]
        str     r1, [sp, #0x10]
LAWG4:
        ldrh    r11, [r8], #8
        ldrh    r0, [r5], #8
        ldrh    r2, [r10], #8
        mul     r11, r11, r11
        ldrh    r1, [r9], #8
        mul     r0, r0, r0
        mul     r2, r2, r2
        mul     r1, r1, r1
        str     r11, [sp, #0x2C]
        ldr     r11, [sp, #0x14]
        add     r12, r12, #4
        mov     r0, r0, lsr r11
        cmp     lr, r0
        movcc   r0, lr
        mov     r2, r2, lsr r11
        cmp     lr, r2
        movcc   r2, lr
        mov     r1, r1, lsr r11
        cmp     lr, r1
        movcc   r1, lr
        str     r1, [sp, #0x28]
        ldr     r1, [sp, #0x2C]
        strh    r0, [r4], #8
        strh    r2, [r7], #8
        ldr     r0, [sp, #0x28]
        mov     r11, r1, lsr r11
        cmp     lr, r11
        strh    r0, [r6], #8
        movcc   r11, lr
        strh    r11, [r3], #8
        ldr     r0, [sp, #4]
        cmp     r12, r0
        ble     LAWG4
        ldr     r0, [sp, #8]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x10]
LAWG5:
        and     r12, r2, #3
        sub     r12, r2, r12
        cmp     r12, r2
        bge     LAWG33
        sub     lr, r2, r12
        cmp     lr, #5
        mvn     r7, #0
        blt     LAWG7
        sub     r6, r2, #5
        add     r5, r7, #1, 16
        add     r4, r0, r12, lsl #1
        add     lr, r1, r12, lsl #1
LAWG6:
        ldrh    r8, [r4]
        add     r12, r12, #4
        mul     r8, r8, r8
        mov     r8, r8, lsr r3
        cmp     r5, r8
        movcc   r8, r5
        strh    r8, [lr]
        ldrh    r8, [r4, #2]
        mul     r8, r8, r8
        mov     r8, r8, lsr r3
        cmp     r5, r8
        movcc   r8, r5
        strh    r8, [lr, #2]
        ldrh    r8, [r4, #4]
        mul     r8, r8, r8
        mov     r8, r8, lsr r3
        cmp     r5, r8
        movcc   r8, r5
        strh    r8, [lr, #4]
        ldrh    r8, [r4, #6]
        add     r4, r4, #8
        mul     r8, r8, r8
        mov     r8, r8, lsr r3
        cmp     r5, r8
        movcc   r8, r5
        strh    r8, [lr, #6]
        cmp     r12, r6
        add     lr, lr, #8
        ble     LAWG6
LAWG7:
        add     r7, r7, #1, 16
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
LAWG8:
        ldrh    lr, [r0], #2
        add     r12, r12, #1
        mul     lr, lr, lr
        mov     lr, lr, lsr r3
        cmp     r7, lr
        movcc   lr, r7
        strh    lr, [r1], #2
        cmp     r12, r2
        blt     LAWG8
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAWG9:
        cmp     r3, #0x10
        mov     lr, #1
        bge     LAWG15
        sub     r6, r3, #1
        and     r5, r3, #1
        subs    r11, r2, #4
        rsb     r10, r5, lr, lsl r6
        bmi     LAWG11
        add     r4, r4, #1, 16
        str     r4, [sp, #4]
        add     r6, r1, #2
        add     r5, r1, #4
        add     r4, r1, #6
        str     r1, [sp, #0x18]
        str     r11, [sp]
        str     r10, [sp, #0x1C]
        ldr     r11, [sp, #0x18]
        ldr     r10, [sp, #4]
        add     r9, r0, #2
        add     r8, r0, #4
        add     r7, r0, #6
        mov     lr, r0
        str     r0, [sp, #8]
        str     r3, [sp, #0x14]
        str     r2, [sp, #0xC]
        str     r1, [sp, #0x10]
LAWG10:
        ldrh    r3, [lr], #8
        ldr     r2, [sp, #0x1C]
        ldrh    r0, [r9], #8
        ldrh    r1, [r8], #8
        add     r12, r12, #4
        mla     r3, r3, r3, r2
        mla     r0, r0, r0, r2
        mla     r1, r1, r1, r2
        str     r3, [sp, #0x2C]
        ldrh    r3, [r7], #8
        mla     r2, r3, r3, r2
        ldr     r3, [sp, #0x14]
        mov     r0, r0, lsr r3
        mov     r1, r1, lsr r3
        str     r2, [sp, #0x28]
        ldr     r2, [sp, #0x2C]
        mov     r2, r2, lsr r3
        cmp     r10, r2
        movcc   r2, r10
        cmp     r10, r0
        movcc   r0, r10
        cmp     r10, r1
        movcc   r1, r10
        str     r1, [sp, #0x2C]
        ldr     r1, [sp, #0x28]
        strh    r2, [r11], #8
        strh    r0, [r6], #8
        ldr     r0, [sp, #0x2C]
        mov     r3, r1, lsr r3
        cmp     r10, r3
        strh    r0, [r5], #8
        movcc   r3, r10
        strh    r3, [r4], #8
        ldr     r0, [sp]
        cmp     r12, r0
        ble     LAWG10
        ldr     r0, [sp, #8]
        ldr     r10, [sp, #0x1C]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x10]
LAWG11:
        and     r12, r2, #3
        sub     r12, r2, r12
        cmp     r12, r2
        bge     LAWG33
        sub     lr, r2, r12
        cmp     lr, #5
        mvn     r7, #0
        blt     LAWG13
        sub     r6, r2, #5
        add     r5, r7, #1, 16
        add     r4, r0, r12, lsl #1
        add     lr, r1, r12, lsl #1
LAWG12:
        ldrh    r8, [r4]
        add     r12, r12, #4
        mla     r8, r8, r8, r10
        mov     r8, r8, lsr r3
        cmp     r5, r8
        movcc   r8, r5
        strh    r8, [lr]
        ldrh    r8, [r4, #2]
        mla     r8, r8, r8, r10
        mov     r8, r8, lsr r3
        cmp     r5, r8
        movcc   r8, r5
        strh    r8, [lr, #2]
        ldrh    r8, [r4, #4]
        mla     r8, r8, r8, r10
        mov     r8, r8, lsr r3
        cmp     r5, r8
        movcc   r8, r5
        strh    r8, [lr, #4]
        ldrh    r8, [r4, #6]
        add     r4, r4, #8
        mla     r8, r8, r8, r10
        mov     r8, r8, lsr r3
        cmp     r5, r8
        movcc   r8, r5
        strh    r8, [lr, #6]
        cmp     r12, r6
        add     lr, lr, #8
        ble     LAWG12
LAWG13:
        add     r7, r7, #1, 16
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
LAWG14:
        ldrh    lr, [r0], #2
        add     r12, r12, #1
        mla     lr, lr, lr, r10
        mov     lr, lr, lsr r3
        cmp     r7, lr
        movcc   lr, r7
        strh    lr, [r1], #2
        cmp     r12, r2
        blt     LAWG14
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAWG15:
        cmp     r3, #0x11
        bgt     LAWG21
        sub     r5, r3, #1
        and     r4, r3, #1
        subs    r11, r2, #4
        rsb     r10, r4, lr, lsl r5
        bmi     LAWG17
        add     lr, r1, #6
        str     lr, [sp, #0x18]
        str     r2, [sp, #0xC]
        ldr     r2, [sp, #0x18]
        add     r9, r0, #2
        add     r8, r0, #4
        add     r7, r0, #6
        add     r6, r1, #2
        add     r5, r1, #4
        mov     r4, r0
        mov     lr, r1
        str     r0, [sp, #8]
        str     r11, [sp]
        str     r10, [sp, #4]
        str     r1, [sp, #0x10]
LAWG16:
        ldrh    r10, [r7], #8
        ldrh    r0, [r4], #8
        ldrh    r11, [r9], #8
        ldrh    r1, [r8], #8
        str     r10, [sp, #0x2C]
        ldr     r10, [sp, #4]
        add     r12, r12, #4
        mla     r0, r0, r0, r10
        mla     r1, r1, r1, r10
        str     r0, [sp, #0x28]
        mla     r0, r11, r11, r10
        ldr     r11, [sp, #0x2C]
        mov     r1, r1, lsr r3
        mla     r10, r11, r11, r10
        ldr     r11, [sp, #0x28]
        mov     r0, r0, lsr r3
        mov     r11, r11, lsr r3
        strh    r11, [lr], #8
        strh    r0, [r6], #8
        strh    r1, [r5], #8
        mov     r10, r10, lsr r3
        strh    r10, [r2], #8
        ldr     r0, [sp]
        cmp     r12, r0
        ble     LAWG16
        ldr     r0, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x10]
LAWG17:
        and     r12, r2, #3
        sub     r12, r2, r12
        cmp     r12, r2
        bge     LAWG33
        sub     lr, r2, r12
        cmp     lr, #5
        blt     LAWG19
        sub     r5, r2, #5
        add     r4, r0, r12, lsl #1
        add     lr, r1, r12, lsl #1
LAWG18:
        ldrh    r6, [r4]
        add     r12, r12, #4
        cmp     r12, r5
        mla     r6, r6, r6, r10
        mov     r6, r6, lsr r3
        strh    r6, [lr]
        ldrh    r6, [r4, #2]
        mla     r6, r6, r6, r10
        mov     r6, r6, lsr r3
        strh    r6, [lr, #2]
        ldrh    r6, [r4, #4]
        mla     r6, r6, r6, r10
        mov     r6, r6, lsr r3
        strh    r6, [lr, #4]
        ldrh    r6, [r4, #6]
        add     r4, r4, #8
        mla     r6, r6, r6, r10
        mov     r6, r6, lsr r3
        strh    r6, [lr, #6]
        add     lr, lr, #8
        ble     LAWG18
LAWG19:
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
LAWG20:
        ldrh    lr, [r0], #2
        add     r12, r12, #1
        mla     lr, lr, lr, r10
        cmp     r12, r2
        mov     lr, lr, lsr r3
        strh    lr, [r1], #2
        blt     LAWG20
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAWG21:
        cmp     r3, #0x20
        bge     LAWG29
        sub     r5, r3, #1
        and     r6, r3, #1
        rsb     r9, r6, lr, lsl r5
        mov     lr, #2, 2
        subs    r11, r2, #4
        mov     lr, lr, lsr r5
        rsb     r4, r9, r4
        bmi     LAWG27
        add     r5, r0, #4
        str     r5, [sp, #0x18]
        add     r5, r1, #4
        add     r10, r1, #6
        add     r8, r1, #2
        str     r1, [sp, #4]
        str     r5, [sp]
        str     r3, [sp, #0x14]
        str     r2, [sp, #0xC]
        str     r1, [sp, #0x10]
        ldr     r3, [sp, #0x18]
        ldr     r1, [sp, #4]
        ldr     r2, [sp]
        add     r6, r0, #2
        add     r7, r0, #6
        mov     r5, r0
        str     r0, [sp, #8]
        str     r10, [sp, #0x20]
        str     r11, [sp, #0x1C]
        str     r9, [sp, #0x2C]
LAWG22:
        ldrh    r0, [r6], #8
        ldrh    r9, [r7], #8
        ldrh    r10, [r3], #8
        mul     r0, r0, r0
        ldrh    r11, [r5], #8
        str     r9, [sp, #0x24]
        mul     r10, r10, r10
        mul     r9, r11, r11
        str     r0, [sp, #0x28]
        ldr     r0, [sp, #0x24]
        cmp     r9, r4
        mul     r0, r0, r0
        strhi   lr, [sp, #0x24]
        bhi     LAWG23
        ldr     r11, [sp, #0x2C]
        add     r9, r9, r11
        ldr     r11, [sp, #0x14]
        mov     r11, r9, lsr r11
        str     r11, [sp, #0x24]
LAWG23:
        ldr     r9, [sp, #0x28]
        cmp     r9, r4
        movhi   r9, lr
        bhi     LAWG24
        ldr     r9, [sp, #0x28]
        ldr     r11, [sp, #0x2C]
        add     r9, r9, r11
        ldr     r11, [sp, #0x14]
        mov     r9, r9, lsr r11
LAWG24:
        cmp     r10, r4
        movhi   r10, lr
        bhi     LAWG25
        ldr     r11, [sp, #0x2C]
        add     r10, r10, r11
        ldr     r11, [sp, #0x14]
        mov     r10, r10, lsr r11
LAWG25:
        cmp     r0, r4
        movhi   r0, lr
        bhi     LAWG26
        ldr     r11, [sp, #0x2C]
        add     r0, r0, r11
        ldr     r11, [sp, #0x14]
        mov     r0, r0, lsr r11
LAWG26:
        ldr     r11, [sp, #0x24]
        add     r12, r12, #4
        strh    r11, [r1], #8
        strh    r9, [r8], #8
        strh    r10, [r2], #8
        ldr     r9, [sp, #0x20]
        strh    r0, [r9], #8
        ldr     r0, [sp, #0x1C]
        cmp     r12, r0
        str     r9, [sp, #0x20]
        ble     LAWG22
        ldr     r0, [sp, #8]
        ldr     r9, [sp, #0x2C]
        ldr     r3, [sp, #0x14]
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x10]
LAWG27:
        and     r12, r2, #3
        sub     r12, r2, r12
        cmp     r12, r2
        bge     LAWG33
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
LAWG28:
        ldrh    r5, [r0], #2
        mul     r5, r5, r5
        cmp     r5, r4
        movhi   r5, lr
        addls   r5, r5, r9
        movls   r5, r5, lsr r3
        add     r12, r12, #1
        strh    r5, [r1], #2
        cmp     r12, r2
        blt     LAWG28
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAWG29:
        cmp     r3, #0x20
        beq     LAWG34
        cmp     r2, #0
        ble     LAWG33
        cmp     r2, #6
        movlt   r0, r12
        blt     LAWG31
        mov     r0, r12
        sub     r4, r2, #6
        mov     lr, r0
        mov     r3, r1
LAWG30:
        add     r0, r0, #5
        strh    lr, [r3]
        strh    lr, [r3, #2]
        strh    lr, [r3, #4]
        strh    lr, [r3, #6]
        strh    lr, [r3, #8]
        cmp     r0, r4
        add     r3, r3, #0xA
        ble     LAWG30
LAWG31:
        add     r1, r1, r0, lsl #1
LAWG32:
        add     r0, r0, #1
        strh    r12, [r1], #2
        cmp     r0, r2
        blt     LAWG32
LAWG33:
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAWG34:
        cmp     r2, #0
        ble     LAWG33
        mov     r3, #0x41, 30
        orr     r3, r3, #0x2D, 22
        mov     lr, r12
LAWG35:
        ldrh    r4, [r0], #2
        cmp     r3, r4
        movcs   r4, r12
        movcc   r4, #1
        add     lr, lr, #1
        strh    r4, [r1], #2
        cmp     lr, r2
        blt     LAWG35
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAWG36:
        cmn     r3, #0x10
        ble     LAWG40
        rsb     lr, r3, #0
        subs    r10, r2, #4
        add     r3, r4, #1, 16
        bmi     LAWG38
        add     r4, r0, #4
        str     r4, [sp, #0x18]
        str     r10, [sp, #4]
        ldr     r10, [sp, #0x18]
        add     r11, r1, #6
        add     r5, r0, #2
        add     r6, r0, #6
        add     r9, r1, #2
        add     r8, r1, #4
        mov     r4, r0
        mov     r7, r1
        str     r0, [sp, #8]
        str     r11, [sp]
        str     r2, [sp, #0xC]
        str     r1, [sp, #0x10]
LAWG37:
        ldrh    r11, [r4], #8
        ldrh    r2, [r5], #8
        ldrh    r1, [r10], #8
        ldrh    r0, [r6], #8
        mul     r11, r11, r11
        mul     r2, r2, r2
        mul     r1, r1, r1
        mul     r0, r0, r0
        cmp     r11, r3, asr lr
        mvnhi   r11, #0
        addhi   r11, r11, #1, 16
        movls   r11, r11, lsl lr
        cmp     r2, r3, asr lr
        mvnhi   r2, #0
        addhi   r2, r2, #1, 16
        movls   r2, r2, lsl lr
        cmp     r1, r3, asr lr
        mvnhi   r1, #0
        addhi   r1, r1, #1, 16
        movls   r1, r1, lsl lr
        cmp     r0, r3, asr lr
        mvnhi   r0, #0
        addhi   r0, r0, #1, 16
        movls   r0, r0, lsl lr
        strh    r11, [r7], #8
        strh    r2, [r9], #8
        strh    r1, [r8], #8
        ldr     r1, [sp]
        add     r12, r12, #4
        strh    r0, [r1], #8
        ldr     r0, [sp, #4]
        cmp     r12, r0
        str     r1, [sp]
        ble     LAWG37
        ldr     r0, [sp, #8]
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x10]
LAWG38:
        and     r12, r2, #3
        sub     r12, r2, r12
        cmp     r12, r2
        bge     LAWG33
        add     r0, r0, r12, lsl #1
        add     r1, r1, r12, lsl #1
        mvn     r4, #0
LAWG39:
        ldrh    r5, [r0], #2
        mul     r5, r5, r5
        cmp     r5, r3, asr lr
        addhi   r5, r4, #1, 16
        movls   r5, r5, lsl lr
        add     r12, r12, #1
        strh    r5, [r1], #2
        cmp     r12, r2
        blt     LAWG39
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LAWG40:
        cmp     r2, #0
        ble     LAWG33
        mov     r3, r12
LAWG41:
        ldrh    lr, [r0], #2
        cmp     lr, #0
        moveq   lr, r12
        addne   lr, r4, #1, 16
        add     r3, r3, #1
        strh    lr, [r1], #2
        cmp     r3, r2
        blt     LAWG41
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}


