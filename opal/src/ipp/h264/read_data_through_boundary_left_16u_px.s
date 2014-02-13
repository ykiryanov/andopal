        .text
        .align  4
        .globl  read_data_through_boundary_left_16u_px


read_data_through_boundary_left_16u_px:
        stmdb   sp!, {r4 - r11, lr}
        mov     r5, r0
        ldr     r2, [r5, #0x24]
        ldr     r1, [r5, #0x2C]
        rsb     r6, r2, #0
        cmp     r6, r1
        blt     LKGD0
        rsb     r1, r1, #1
        str     r1, [r5, #0x24]
        rsb     r6, r1, #0
LKGD0:
        ldr     r3, [r5, #4]
        ldr     r12, [r5, #0x28]
        ldr     r2, [r5, #0x30]
        ldr     r1, [r5]
        ldr     r10, [r5, #8]
        mul     r3, r12, r3
        cmp     r2, #0
        add     r4, r1, r3, lsl #1
        ble     LKGD6
        mov     r9, #0
        mov     r8, r6, lsl #1
        sub     r7, r6, #6
LKGD1:
        ldrh    r3, [r4]
        cmp     r6, #0
        ble     LKGD5
        cmp     r6, #6
        movlt   r2, #0
        blt     LKGD3
        mov     r2, #0
        mov     r1, r2
        mov     r0, #2
        mov     r11, #4
        mov     lr, #6
        mov     r12, #8
LKGD2:
        strh    r3, [r10, +r1]
        strh    r3, [r10, +r0]
        strh    r3, [r10, +r11]
        strh    r3, [r10, +lr]
        add     r2, r2, #5
        strh    r3, [r10, +r12]
        cmp     r2, r7
        add     r1, r1, #0xA
        add     r0, r0, #0xA
        add     r11, r11, #0xA
        add     lr, lr, #0xA
        add     r12, r12, #0xA
        ble     LKGD2
LKGD3:
        mov     r12, r2, lsl #1
LKGD4:
        add     r2, r2, #1
        strh    r3, [r10, +r12]
        cmp     r2, r6
        add     r12, r12, #2
        blt     LKGD4
LKGD5:
        ldr     r2, [r5, #0x2C]
        add     r0, r8, r10
        sub     r2, r2, r6
        mov     r1, r4
        mov     r2, r2, lsl #1
        bl      memcpy
        ldr     r2, [r5, #0x30]
        ldr     r3, [r5, #0xC]
        ldr     r12, [r5, #4]
        add     r9, r9, #1
        cmp     r9, r2
        add     r10, r10, r3, lsl #1
        add     r4, r4, r12, lsl #1
        blt     LKGD1
LKGD6:
        ldmia   sp!, {r4 - r11, pc}


