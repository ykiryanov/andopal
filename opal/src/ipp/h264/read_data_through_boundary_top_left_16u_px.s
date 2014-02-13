        .text
        .align  4
        .globl  read_data_through_boundary_top_left_16u_px


read_data_through_boundary_top_left_16u_px:
        stmdb   sp!, {r4 - r11, lr}
        mov     r6, r0
        ldr     r1, [r6, #0x24]
        ldr     r2, [r6, #0x2C]
        rsb     r7, r1, #0
        cmp     r7, r2
        blt     LKFL0
        rsb     r1, r2, #1
        str     r1, [r6, #0x24]
        rsb     r7, r1, #0
LKFL0:
        ldr     r3, [r6, #0x28]
        ldr     r1, [r6, #0x30]
        rsb     r3, r3, #0
        cmp     r3, r1
        rsbge   r1, r1, #1
        strge   r1, [r6, #0x28]
        ldr     r4, [r6]
        ldr     r8, [r6, #8]
        cmp     r7, #0
        ldrh    r3, [r4]
        ble     LKFL4
        cmp     r7, #6
        movlt   r2, #0
        blt     LKFL2
        mov     r2, #0
        sub     lr, r7, #6
        mov     r12, r8
LKFL1:
        add     r2, r2, #5
        strh    r3, [r12]
        strh    r3, [r12, #2]
        strh    r3, [r12, #4]
        strh    r3, [r12, #6]
        strh    r3, [r12, #8]
        cmp     r2, lr
        add     r12, r12, #0xA
        ble     LKFL1
LKFL2:
        add     r12, r8, r2, lsl #1
LKFL3:
        add     r2, r2, #1
        strh    r3, [r12], #2
        cmp     r2, r7
        blt     LKFL3
        ldr     r2, [r6, #0x2C]
LKFL4:
        sub     r2, r2, r7
        mov     r10, r7, lsl #1
        mov     r2, r2, lsl #1
        add     r0, r8, r10
        mov     r1, r4
        bl      memcpy
        ldr     r2, [r6, #0x28]
        ldr     r12, [r6, #4]
        ldr     r3, [r6, #0xC]
        add     lr, r2, #1
        cmp     lr, #0
        add     r5, r4, r12, lsl #1
        add     r4, r8, r3, lsl #1
        bgt     LKFL6
        rsb     r9, r2, #0
LKFL5:
        ldr     r2, [r6, #0x2C]
        mov     r1, r8
        mov     r0, r4
        mov     r2, r2, lsl #1
        bl      memcpy
        ldr     r2, [r6, #0xC]
        subs    r9, r9, #1
        add     r4, r4, r2, lsl #1
        bne     LKFL5
        ldr     r2, [r6, #0x28]
LKFL6:
        ldr     r3, [r6, #0x30]
        add     r3, r2, r3
        cmp     r3, #1
        ble     LKFL12
        mov     r9, #1
        sub     r8, r7, #6
LKFL7:
        ldrh    r3, [r5]
        cmp     r7, #0
        ble     LKFL11
        cmp     r7, #6
        movlt   r2, #0
        blt     LKFL9
        mov     r2, #0
        mov     r1, r2
        mov     r0, #2
        mov     r11, #4
        mov     lr, #6
        mov     r12, #8
LKFL8:
        strh    r3, [r4, +r1]
        strh    r3, [r4, +r0]
        strh    r3, [r4, +r11]
        strh    r3, [r4, +lr]
        add     r2, r2, #5
        strh    r3, [r4, +r12]
        cmp     r2, r8
        add     r1, r1, #0xA
        add     r0, r0, #0xA
        add     r11, r11, #0xA
        add     lr, lr, #0xA
        add     r12, r12, #0xA
        ble     LKFL8
LKFL9:
        mov     r12, r2, lsl #1
LKFL10:
        add     r2, r2, #1
        strh    r3, [r4, +r12]
        cmp     r2, r7
        add     r12, r12, #2
        blt     LKFL10
LKFL11:
        ldr     r2, [r6, #0x2C]
        add     r0, r4, r10
        sub     r2, r2, r7
        mov     r1, r5
        mov     r2, r2, lsl #1
        bl      memcpy
        ldr     lr, [r6, #0x30]
        ldr     r12, [r6, #0x28]
        ldr     r2, [r6, #0xC]
        ldr     r3, [r6, #4]
        add     r9, r9, #1
        add     lr, r12, lr
        cmp     r9, lr
        add     r4, r4, r2, lsl #1
        add     r5, r5, r3, lsl #1
        blt     LKFL7
LKFL12:
        ldmia   sp!, {r4 - r11, pc}


