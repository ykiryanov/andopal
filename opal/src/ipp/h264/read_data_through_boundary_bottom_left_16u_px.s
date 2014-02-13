        .text
        .align  4
        .globl  read_data_through_boundary_bottom_left_16u_px


read_data_through_boundary_bottom_left_16u_px:
        stmdb   sp!, {r4 - r11, lr}
        mov     r6, r0
        ldr     r2, [r6, #0x24]
        ldr     r1, [r6, #0x2C]
        rsb     r7, r2, #0
        cmp     r7, r1
        blt     LKGJ0
        rsb     r1, r1, #1
        str     r1, [r6, #0x24]
        rsb     r7, r1, #0
LKGJ0:
        ldr     r10, [r6, #0x28]
        ldr     r11, [r6, #0x38]
        cmp     r10, r11
        subge   r10, r11, #1
        strge   r10, [r6, #0x28]
        ldr     r2, [r6, #4]
        ldr     r1, [r6]
        ldr     r5, [r6, #8]
        mul     r2, r10, r2
        cmp     r10, r11
        add     r4, r1, r2, lsl #1
        ldrge   r2, [r6, #0xC]
        bge     LKGJ6
        mov     r9, r7, lsl #1
        sub     r8, r7, #6
LKGJ1:
        ldrh    r3, [r4]
        cmp     r7, #0
        ble     LKGJ5
        cmp     r7, #6
        mov     r1, #0
        movlt   r2, r1
        blt     LKGJ3
        mov     r2, r1
        mov     r0, #2
        mov     r11, #4
        mov     lr, #6
        mov     r12, #8
LKGJ2:
        strh    r3, [r5, +r1]
        strh    r3, [r5, +r0]
        strh    r3, [r5, +r11]
        strh    r3, [r5, +lr]
        add     r2, r2, #5
        strh    r3, [r5, +r12]
        cmp     r2, r8
        add     r0, r0, #0xA
        add     r11, r11, #0xA
        add     lr, lr, #0xA
        add     r12, r12, #0xA
        add     r1, r1, #0xA
        ble     LKGJ2
LKGJ3:
        mov     r12, r2, lsl #1
LKGJ4:
        add     r2, r2, #1
        strh    r3, [r5, +r12]
        cmp     r2, r7
        add     r12, r12, #2
        blt     LKGJ4
LKGJ5:
        ldr     r2, [r6, #0x2C]
        add     r0, r9, r5
        sub     r2, r2, r7
        mov     r1, r4
        mov     r2, r2, lsl #1
        bl      memcpy
        ldr     r11, [r6, #0x38]
        ldr     r2, [r6, #0xC]
        ldr     r3, [r6, #4]
        add     r10, r10, #1
        cmp     r10, r11
        add     r4, r4, r3, lsl #1
        add     r5, r5, r2, lsl #1
        blt     LKGJ1
        ldr     r10, [r6, #0x28]
LKGJ6:
        ldr     r3, [r6, #0x30]
        sub     r4, r5, r2, lsl #1
        add     r3, r10, r3
        cmp     r11, r3
        bge     LKGJ8
LKGJ7:
        ldr     r2, [r6, #0x2C]
        mov     r1, r4
        mov     r0, r5
        mov     r2, r2, lsl #1
        bl      memcpy
        ldr     r3, [r6, #0x30]
        ldr     r12, [r6, #0x28]
        ldr     r2, [r6, #0xC]
        add     r11, r11, #1
        add     r3, r12, r3
        cmp     r11, r3
        add     r5, r5, r2, lsl #1
        blt     LKGJ7
LKGJ8:
        ldmia   sp!, {r4 - r11, pc}


