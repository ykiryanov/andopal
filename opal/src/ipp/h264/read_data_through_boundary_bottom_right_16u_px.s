        .text
        .align  4
        .globl  read_data_through_boundary_bottom_right_16u_px


read_data_through_boundary_bottom_right_16u_px:
        stmdb   sp!, {r4 - r11, lr}
        mov     r7, r0
        ldr     r1, [r7, #0x24]
        ldr     r12, [r7, #0x34]
        cmp     r1, r12
        subge   r1, r12, #1
        strge   r1, [r7, #0x24]
        ldr     r10, [r7, #0x28]
        ldr     r11, [r7, #0x38]
        cmp     r10, r11
        subge   r10, r11, #1
        strge   r10, [r7, #0x28]
        ldr     r3, [r7, #4]
        ldr     r2, [r7]
        ldr     r4, [r7, #8]
        mul     r3, r10, r3
        cmp     r10, r11
        sub     r8, r12, r1
        add     r3, r2, r3, lsl #1
        add     r5, r3, r1, lsl #1
        ldrge   r3, [r7, #0xC]
        bge     LKGF5
        mov     r6, r8, lsl #1
        sub     r9, r6, #2
LKGF0:
        mov     r2, r6
        mov     r1, r5
        mov     r0, r4
        bl      memcpy
        ldr     r12, [r7, #0x2C]
        ldrh    r3, [r5, +r9]
        add     r11, r6, r4
        sub     r12, r12, r8
        cmp     r12, #0
        ble     LKGF4
        cmp     r12, #6
        movlt   lr, #0
        blt     LKGF2
        mov     lr, #0
        sub     r1, r12, #6
        mov     r0, r11
LKGF1:
        add     lr, lr, #5
        strh    r3, [r0]
        strh    r3, [r0, #2]
        strh    r3, [r0, #4]
        strh    r3, [r0, #6]
        strh    r3, [r0, #8]
        cmp     lr, r1
        add     r0, r0, #0xA
        ble     LKGF1
LKGF2:
        add     r11, r11, lr, lsl #1
LKGF3:
        add     lr, lr, #1
        strh    r3, [r11], #2
        cmp     lr, r12
        blt     LKGF3
LKGF4:
        ldr     r11, [r7, #0x38]
        ldr     r3, [r7, #0xC]
        ldr     r12, [r7, #4]
        add     r10, r10, #1
        cmp     r10, r11
        add     r5, r5, r12, lsl #1
        add     r4, r4, r3, lsl #1
        blt     LKGF0
        ldr     r10, [r7, #0x28]
LKGF5:
        ldr     r2, [r7, #0x30]
        sub     r5, r4, r3, lsl #1
        add     r2, r10, r2
        cmp     r11, r2
        bge     LKGF7
LKGF6:
        ldr     r2, [r7, #0x2C]
        mov     r1, r5
        mov     r0, r4
        mov     r2, r2, lsl #1
        bl      memcpy
        ldr     r3, [r7, #0x30]
        ldr     r12, [r7, #0x28]
        ldr     r2, [r7, #0xC]
        add     r11, r11, #1
        add     r3, r12, r3
        cmp     r11, r3
        add     r4, r4, r2, lsl #1
        blt     LKGF6
LKGF7:
        ldmia   sp!, {r4 - r11, pc}


