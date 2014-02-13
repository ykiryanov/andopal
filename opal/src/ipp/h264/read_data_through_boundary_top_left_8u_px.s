        .text
        .align  4
        .globl  read_data_through_boundary_top_left_8u_px


read_data_through_boundary_top_left_8u_px:
        stmdb   sp!, {r4 - r9, lr}
        mov     r5, r0
        ldr     r2, [r5, #0x24]
        ldr     r1, [r5, #0x2C]
        rsb     r4, r2, #0
        cmp     r4, r1
        blt     LKFK0
        rsb     r1, r1, #1
        str     r1, [r5, #0x24]
        rsb     r4, r1, #0
LKFK0:
        ldr     r3, [r5, #0x28]
        ldr     r1, [r5, #0x30]
        rsb     r3, r3, #0
        cmp     r3, r1
        rsbge   r1, r1, #1
        strge   r1, [r5, #0x28]
        ldr     r6, [r5]
        ldr     r7, [r5, #8]
        mov     r2, r4
        ldrb    r1, [r6]
        mov     r0, r7
        bl      memset
        ldr     r3, [r5, #0x2C]
        add     r0, r7, r4
        sub     r2, r3, r4
        mov     r1, r6
        bl      memcpy
        ldr     r8, [r5, #4]
        ldr     r3, [r5, #0x28]
        ldr     r12, [r5, #0xC]
        add     r8, r6, r8
        add     lr, r3, #1
        cmp     lr, #0
        add     r6, r12, r7
        bgt     LKFK2
        rsb     r9, r3, #0
LKFK1:
        ldr     r2, [r5, #0x2C]
        mov     r1, r7
        mov     r0, r6
        bl      memcpy
        ldr     r3, [r5, #0xC]
        subs    r9, r9, #1
        add     r6, r6, r3
        bne     LKFK1
        ldr     r3, [r5, #0x28]
LKFK2:
        ldr     r12, [r5, #0x30]
        add     r12, r3, r12
        cmp     r12, #1
        ble     LKFK4
        mov     r7, #1
LKFK3:
        ldrb    r1, [r8]
        mov     r2, r4
        mov     r0, r6
        bl      memset
        ldr     r3, [r5, #0x2C]
        add     r0, r6, r4
        sub     r2, r3, r4
        mov     r1, r8
        bl      memcpy
        ldr     lr, [r5, #0x30]
        ldr     r9, [r5, #0x28]
        ldr     r12, [r5, #0xC]
        ldr     r3, [r5, #4]
        add     r7, r7, #1
        add     lr, r9, lr
        cmp     r7, lr
        add     r6, r6, r12
        add     r8, r8, r3
        blt     LKFK3
LKFK4:
        ldmia   sp!, {r4 - r9, pc}


