        .text
        .align  4
        .globl  read_data_through_boundary_top_right_16u_px


read_data_through_boundary_top_right_16u_px:
        stmdb   sp!, {r4 - r11, lr}
        mov     r7, r0
        ldr     r2, [r7, #0x24]
        ldr     r3, [r7, #0x34]
        cmp     r2, r3
        subge   r2, r3, #1
        strge   r2, [r7, #0x24]
        ldr     r12, [r7, #0x28]
        ldr     r1, [r7, #0x30]
        rsb     r12, r12, #0
        cmp     r12, r1
        rsbge   r1, r1, #1
        strge   r1, [r7, #0x28]
        ldr     r12, [r7]
        ldr     r9, [r7, #8]
        sub     r8, r3, r2
        add     r4, r12, r2, lsl #1
        mov     r5, r8, lsl #1
        mov     r2, r5
        mov     r1, r4
        mov     r0, r9
        bl      memcpy
        ldr     r12, [r7, #0x2C]
        sub     r3, r4, #2
        ldrh    r3, [r3, +r5]
        sub     r12, r12, r8
        cmp     r12, #0
        add     r11, r5, r9
        ble     LKFH3
        cmp     r12, #6
        mov     lr, #0
        blt     LKFH1
        sub     r10, r12, #6
        mov     r6, r11
LKFH0:
        add     lr, lr, #5
        strh    r3, [r6]
        strh    r3, [r6, #2]
        strh    r3, [r6, #4]
        strh    r3, [r6, #6]
        strh    r3, [r6, #8]
        cmp     lr, r10
        add     r6, r6, #0xA
        ble     LKFH0
LKFH1:
        add     r11, r11, lr, lsl #1
LKFH2:
        add     lr, lr, #1
        strh    r3, [r11], #2
        cmp     lr, r12
        blt     LKFH2
LKFH3:
        ldr     r3, [r7, #0x28]
        ldr     lr, [r7, #4]
        ldr     r12, [r7, #0xC]
        add     r6, r3, #1
        cmp     r6, #0
        add     r6, r4, lr, lsl #1
        add     r4, r9, r12, lsl #1
        bgt     LKFH5
        rsb     r10, r3, #0
LKFH4:
        ldr     r3, [r7, #0x2C]
        mov     r1, r9
        mov     r0, r4
        mov     r2, r3, lsl #1
        bl      memcpy
        ldr     r3, [r7, #0xC]
        subs    r10, r10, #1
        add     r4, r4, r3, lsl #1
        bne     LKFH4
        ldr     r3, [r7, #0x28]
LKFH5:
        ldr     r12, [r7, #0x30]
        add     r12, r3, r12
        cmp     r12, #1
        ble     LKFH11
        mov     r10, #1
        sub     r9, r5, #2
LKFH6:
        mov     r2, r5
        mov     r1, r6
        mov     r0, r4
        bl      memcpy
        ldr     r12, [r7, #0x2C]
        ldrh    r3, [r6, +r9]
        add     r1, r5, r4
        sub     r12, r12, r8
        cmp     r12, #0
        ble     LKFH10
        cmp     r12, #6
        movlt   lr, #0
        blt     LKFH8
        mov     lr, #0
        sub     r0, r12, #6
        mov     r11, r1
LKFH7:
        add     lr, lr, #5
        strh    r3, [r11]
        strh    r3, [r11, #2]
        strh    r3, [r11, #4]
        strh    r3, [r11, #6]
        strh    r3, [r11, #8]
        cmp     lr, r0
        add     r11, r11, #0xA
        ble     LKFH7
LKFH8:
        add     r1, r1, lr, lsl #1
LKFH9:
        add     lr, lr, #1
        strh    r3, [r1], #2
        cmp     lr, r12
        blt     LKFH9
LKFH10:
        ldr     r11, [r7, #0x30]
        ldr     lr, [r7, #0x28]
        ldr     r3, [r7, #0xC]
        ldr     r12, [r7, #4]
        add     r10, r10, #1
        add     r11, lr, r11
        cmp     r10, r11
        add     r4, r4, r3, lsl #1
        add     r6, r6, r12, lsl #1
        blt     LKFH6
LKFH11:
        ldmia   sp!, {r4 - r11, pc}


