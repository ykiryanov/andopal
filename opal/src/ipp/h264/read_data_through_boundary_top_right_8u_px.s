        .text
        .align  4
        .globl  read_data_through_boundary_top_right_8u_px


read_data_through_boundary_top_right_8u_px:
        stmdb   sp!, {r4 - r9, lr}
        mov     r5, r0
        ldr     r3, [r5, #0x24]
        ldr     r2, [r5, #0x34]
        cmp     r3, r2
        subge   r3, r2, #1
        strge   r3, [r5, #0x24]
        ldr     r12, [r5, #0x28]
        ldr     r1, [r5, #0x30]
        rsb     r12, r12, #0
        cmp     r12, r1
        rsbge   r1, r1, #1
        strge   r1, [r5, #0x28]
        ldr     r12, [r5]
        ldr     r7, [r5, #8]
        sub     r4, r2, r3
        add     r6, r12, r3
        mov     r1, r6
        mov     r2, r4
        mov     r0, r7
        bl      memcpy
        ldr     r3, [r5, #0x2C]
        add     r12, r4, r6
        ldrb    r1, [r12, #-1]
        sub     r2, r3, r4
        add     r0, r7, r4
        bl      memset
        ldr     r8, [r5, #4]
        ldr     r3, [r5, #0x28]
        ldr     r12, [r5, #0xC]
        add     r8, r6, r8
        add     lr, r3, #1
        cmp     lr, #0
        add     r6, r12, r7
        bgt     LKFG1
        rsb     r9, r3, #0
LKFG0:
        ldr     r2, [r5, #0x2C]
        mov     r1, r7
        mov     r0, r6
        bl      memcpy
        ldr     r3, [r5, #0xC]
        subs    r9, r9, #1
        add     r6, r6, r3
        bne     LKFG0
        ldr     r3, [r5, #0x28]
LKFG1:
        ldr     r12, [r5, #0x30]
        add     r12, r3, r12
        cmp     r12, #1
        ble     LKFG3
        mov     r7, #1
LKFG2:
        mov     r2, r4
        mov     r1, r8
        mov     r0, r6
        bl      memcpy
        ldr     r3, [r5, #0x2C]
        add     r12, r4, r8
        ldrb    r1, [r12, #-1]
        sub     r2, r3, r4
        add     r0, r6, r4
        bl      memset
        ldr     lr, [r5, #0x30]
        ldr     r9, [r5, #0x28]
        ldr     r12, [r5, #0xC]
        ldr     r3, [r5, #4]
        add     r7, r7, #1
        add     lr, r9, lr
        cmp     r7, lr
        add     r6, r6, r12
        add     r8, r8, r3
        blt     LKFG2
LKFG3:
        ldmia   sp!, {r4 - r9, pc}


