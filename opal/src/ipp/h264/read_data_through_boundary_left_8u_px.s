        .text
        .align  4
        .globl  read_data_through_boundary_left_8u_px


read_data_through_boundary_left_8u_px:
        stmdb   sp!, {r4 - r8, lr}
        mov     r7, r0
        ldr     r2, [r7, #0x24]
        ldr     r1, [r7, #0x2C]
        rsb     r4, r2, #0
        cmp     r4, r1
        blt     LKGC0
        rsb     r1, r1, #1
        str     r1, [r7, #0x24]
        rsb     r4, r1, #0
LKGC0:
        ldr     r3, [r7, #4]
        ldr     r1, [r7]
        ldr     r12, [r7, #0x28]
        ldr     r6, [r7, #8]
        mla     r5, r12, r3, r1
        ldr     r3, [r7, #0x30]
        cmp     r3, #0
        ble     LKGC2
        mov     r8, #0
LKGC1:
        ldrb    r1, [r5]
        mov     r2, r4
        mov     r0, r6
        bl      memset
        ldr     r3, [r7, #0x2C]
        add     r0, r4, r6
        sub     r2, r3, r4
        mov     r1, r5
        bl      memcpy
        ldr     r3, [r7, #0x30]
        ldr     r12, [r7, #0xC]
        ldr     lr, [r7, #4]
        add     r8, r8, #1
        cmp     r8, r3
        add     r6, r6, r12
        add     r5, r5, lr
        blt     LKGC1
LKGC2:
        ldmia   sp!, {r4 - r8, pc}


