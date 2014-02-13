        .text
        .align  4
        .globl  ownsSet_64sc


ownsSet_64sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x30
        str     r0, [sp, #0x20]
        str     r1, [sp, #0x24]
        str     r0, [sp, #0x18]
        str     r1, [sp, #0x1C]
        str     r2, [sp, #0x10]
        add     r6, sp, #0x18
        ldr     r1, [r6, #4]
        ldr     r6, [sp, #0x58]
        str     r3, [sp, #0x14]
        add     r5, sp, #0x10
        add     r0, sp, #0x10
        str     r2, [sp, #0x28]
        ldr     r2, [r5]
        ldr     lr, [r0, #4]
        add     r7, sp, #0x18
        ldr     r12, [r7]
        ldr     r0, [sp, #0x54]
        mov     r5, r6, lsl #2
        cmp     r5, #0
        str     r3, [sp, #0x2C]
        ble     LCVE9
        tst     r0, #3
        mov     r3, #0
        beq     LCVE3
        cmp     r5, #0x14
        blt     LCVE10
        add     r11, r0, #0x18
        str     r11, [sp, #4]
        add     r11, r0, #0x1C
        str     r11, [sp, #0xC]
        add     r8, r0, #4
        add     r9, r0, #8
        add     r10, r0, #0xC
        add     r6, r0, #0x10
        add     r4, r0, #0x14
        str     r0, [sp]
        ldr     r0, [sp, #0xC]
        ldr     r11, [sp, #4]
        sub     r7, r5, #0x14
LCVE0:
        str     r12, [r6, #-0x10]
        str     r1, [r4, #-0x10]
        str     r2, [r11, #-0x10]
        str     lr, [r0, #-0x10]
        str     r12, [r6]
        str     r1, [r4]
        str     r2, [r11]
        str     lr, [r0]
        str     r12, [r6, #0x10]
        str     r1, [r4, #0x10]
        str     r2, [r11, #0x10]
        str     lr, [r0, #0x10]
        str     r12, [r6, #0x20]
        str     r1, [r4, #0x20]
        str     r2, [r11, #0x20]
        add     r3, r3, #0x10
        str     lr, [r0, #0x20]
        cmp     r3, r7
        add     r6, r6, #0x40
        add     r4, r4, #0x40
        add     r11, r11, #0x40
        add     r0, r0, #0x40
        ble     LCVE0
        ldr     r0, [sp]
LCVE1:
        add     r4, r0, r3, lsl #2
LCVE2:
        str     r12, [r4], #0x10
        str     r1, [r8, +r3, lsl #2]
        str     r2, [r9, +r3, lsl #2]
        str     lr, [r10, +r3, lsl #2]
        add     r3, r3, #4
        cmp     r3, r5
        blt     LCVE2
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCVE3:
        and     r4, r5, #6
        sub     r5, r5, r4
        cmp     r5, #0
        ble     LCVE5
        add     r6, r0, #8
        str     r6, [sp, #8]
        add     r6, r0, #0x14
        str     r6, [sp, #0xC]
        add     r11, r0, #4
        add     r10, r0, #0xC
        add     r9, r0, #0x10
        add     r8, r0, #0x18
        add     r7, r0, #0x1C
        mov     r6, r0
        str     r4, [sp, #4]
        str     r0, [sp]
        ldr     r0, [sp, #0xC]
        ldr     r4, [sp, #8]
LCVE4:
        str     r12, [r6], #0x20
        str     r1, [r11], #0x20
        str     r2, [r4], #0x20
        str     lr, [r10], #0x20
        str     r12, [r9], #0x20
        str     r1, [r0], #0x20
        str     r2, [r8], #0x20
        add     r3, r3, #8
        str     lr, [r7], #0x20
        cmp     r3, r5
        blt     LCVE4
        ldr     r4, [sp, #4]
        ldr     r0, [sp]
LCVE5:
        cmp     r4, #0
        beq     LCVE9
        cmp     r4, #0
        add     r3, r0, r5, lsl #2
        ble     LCVE9
        cmp     r4, #0x14
        mov     r11, #0
        blt     LCVE11
        add     r5, r3, #0x10
        str     r5, [sp, #8]
        add     r5, r3, #0x14
        str     r5, [sp, #0xC]
        sub     r7, r4, #0x14
        str     r4, [sp, #4]
        str     r0, [sp]
        ldr     r0, [sp, #0xC]
        ldr     r4, [sp, #8]
        add     r8, r3, #4
        add     r9, r3, #8
        add     r10, r3, #0xC
        add     r6, r3, #0x18
        add     r5, r3, #0x1C
LCVE6:
        str     r12, [r4, #-0x10]
        str     r1, [r0, #-0x10]
        str     r2, [r6, #-0x10]
        str     lr, [r5, #-0x10]
        str     r12, [r4]
        str     r1, [r0]
        str     r2, [r6]
        str     lr, [r5]
        str     r12, [r4, #0x10]
        str     r1, [r0, #0x10]
        str     r2, [r6, #0x10]
        str     lr, [r5, #0x10]
        str     r12, [r4, #0x20]
        str     r1, [r0, #0x20]
        str     r2, [r6, #0x20]
        add     r11, r11, #0x10
        str     lr, [r5, #0x20]
        cmp     r11, r7
        add     r4, r4, #0x40
        add     r0, r0, #0x40
        add     r6, r6, #0x40
        add     r5, r5, #0x40
        ble     LCVE6
        ldr     r4, [sp, #4]
        ldr     r0, [sp]
LCVE7:
        add     r3, r3, r11, lsl #2
LCVE8:
        str     r12, [r3], #0x10
        str     r1, [r8, +r11, lsl #2]
        str     r2, [r9, +r11, lsl #2]
        str     lr, [r10, +r11, lsl #2]
        add     r11, r11, #4
        cmp     r11, r4
        blt     LCVE8
LCVE9:
        add     sp, sp, #0x30
        ldmia   sp!, {r4 - r11, pc}
LCVE10:
        add     r8, r0, #4
        add     r9, r0, #8
        add     r10, r0, #0xC
        b       LCVE1
LCVE11:
        add     r8, r3, #4
        add     r9, r3, #8
        add     r10, r3, #0xC
        b       LCVE7


