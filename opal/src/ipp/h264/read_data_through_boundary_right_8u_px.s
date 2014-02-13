        .text
        .align  4
        .globl  read_data_through_boundary_right_8u_px


read_data_through_boundary_right_8u_px:
        stmdb   sp!, {r4 - r8, lr}
        mov     r7, r0
        ldr     r1, [r7, #0x24]
        ldr     r2, [r7, #0x34]
        cmp     r1, r2
        subge   r1, r2, #1
        strge   r1, [r7, #0x24]
        ldr     r12, [r7]
        ldr     r5, [r7, #0x28]
        ldr     lr, [r7, #4]
        ldr     r3, [r7, #0x30]
        ldr     r6, [r7, #8]
        mla     r12, r5, lr, r12
        sub     r4, r2, r1
        cmp     r3, #0
        add     r5, r12, r1
        ble     LKFW1
        mov     r8, #0
LKFW0:
        mov     r2, r4
        mov     r1, r5
        mov     r0, r6
        bl      memcpy
        ldr     r3, [r7, #0x2C]
        add     r12, r4, r5
        ldrb    r1, [r12, #-1]
        sub     r2, r3, r4
        add     r0, r4, r6
        bl      memset
        ldr     r3, [r7, #0x30]
        ldr     r12, [r7, #0xC]
        ldr     lr, [r7, #4]
        add     r8, r8, #1
        cmp     r8, r3
        add     r6, r6, r12
        add     r5, r5, lr
        blt     LKFW0
LKFW1:
        ldmia   sp!, {r4 - r8, pc}


