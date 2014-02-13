        .text
        .align  4
        .globl  read_data_through_boundary_right_16u_px


read_data_through_boundary_right_16u_px:
        stmdb   sp!, {r4 - r11, lr}
        mov     r7, r0
        ldr     r1, [r7, #0x24]
        ldr     r3, [r7, #0x34]
        cmp     r1, r3
        subge   r1, r3, #1
        strge   r1, [r7, #0x24]
        ldr     lr, [r7, #4]
        ldr     r4, [r7, #0x28]
        ldr     r12, [r7, #0x30]
        ldr     r2, [r7]
        ldr     r6, [r7, #8]
        mul     lr, r4, lr
        cmp     r12, #0
        sub     r8, r3, r1
        add     lr, r2, lr, lsl #1
        add     r4, lr, r1, lsl #1
        ble     LKFX5
        mov     r5, r8, lsl #1
        mov     r10, #0
        sub     r9, r5, #2
LKFX0:
        mov     r2, r5
        mov     r1, r4
        mov     r0, r6
        bl      memcpy
        ldr     r12, [r7, #0x2C]
        ldrh    r3, [r4, +r9]
        add     r11, r5, r6
        sub     r12, r12, r8
        cmp     r12, #0
        ble     LKFX4
        cmp     r12, #6
        movlt   lr, #0
        blt     LKFX2
        mov     lr, #0
        sub     r1, r12, #6
        mov     r0, r11
LKFX1:
        add     lr, lr, #5
        strh    r3, [r0]
        strh    r3, [r0, #2]
        strh    r3, [r0, #4]
        strh    r3, [r0, #6]
        strh    r3, [r0, #8]
        cmp     lr, r1
        add     r0, r0, #0xA
        ble     LKFX1
LKFX2:
        add     r11, r11, lr, lsl #1
LKFX3:
        add     lr, lr, #1
        strh    r3, [r11], #2
        cmp     lr, r12
        blt     LKFX3
LKFX4:
        ldr     r3, [r7, #0x30]
        ldr     r12, [r7, #0xC]
        ldr     lr, [r7, #4]
        add     r10, r10, #1
        cmp     r10, r3
        add     r6, r6, r12, lsl #1
        add     r4, r4, lr, lsl #1
        blt     LKFX0
LKFX5:
        ldmia   sp!, {r4 - r11, pc}


