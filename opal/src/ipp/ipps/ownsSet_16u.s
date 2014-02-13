        .text
        .align  4
        .globl  ownsSet_16u


ownsSet_16u:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        cmp     r2, #0
        mov     r11, r1
        ble     LCVH7
        tst     r1, #2
        beq     LCVH1
LCVH0:
        strh    r0, [r11], #2
        subs    r2, r2, #1
        beq     LCVH8
        tst     r11, #2
        bne     LCVH0
LCVH1:
        add     lr, sp, #8
        add     r3, sp, #8
        and     r12, r2, #0xF
        strh    r0, [lr]
        strh    r0, [r3, #2]
        ldr     r9, [sp, #8]
        subs    r2, r2, r12
        mov     r10, #0
        mov     lr, r10
        mov     r3, #1
        movmi   lr, r3
        add     r3, r2, lr
        add     r2, r11, r2, lsl #1
        mov     r3, r3, asr #1
        cmp     r3, #0
        ble     LCVH3
        add     lr, r11, #0x18
        str     lr, [sp]
        str     r0, [sp, #4]
        ldr     r0, [sp]
        add     r8, r11, #4
        add     r7, r11, #8
        add     r6, r11, #0xC
        add     r5, r11, #0x10
        add     r4, r11, #0x14
        add     lr, r11, #0x1C
LCVH2:
        str     r9, [r11, +r10, lsl #2]
        str     r9, [r8], #0x20
        str     r9, [r7], #0x20
        str     r9, [r6], #0x20
        str     r9, [r5], #0x20
        str     r9, [r4], #0x20
        str     r9, [r0], #0x20
        add     r10, r10, #8
        str     r9, [lr], #0x20
        cmp     r10, r3
        blt     LCVH2
        ldr     r0, [sp, #4]
LCVH3:
        cmp     r12, #0
        beq     LCVH7
        cmp     r12, #0
        ble     LCVH7
        cmp     r12, #6
        mov     r3, #0
        blt     LCVH5
        sub     r4, r12, #6
        mov     lr, r2
LCVH4:
        add     r3, r3, #5
        strh    r0, [lr]
        strh    r0, [lr, #2]
        strh    r0, [lr, #4]
        strh    r0, [lr, #6]
        strh    r0, [lr, #8]
        cmp     r3, r4
        add     lr, lr, #0xA
        ble     LCVH4
LCVH5:
        add     r2, r2, r3, lsl #1
LCVH6:
        add     r3, r3, #1
        strh    r0, [r2], #2
        cmp     r3, r12
        blt     LCVH6
LCVH7:
        mov     r0, r1
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LCVH8:
        mov     r0, r1
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


