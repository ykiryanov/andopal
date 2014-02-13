        .text
        .align  4
        .globl  read_data_through_boundary_bottom_left_8u_px


read_data_through_boundary_bottom_left_8u_px:
        stmdb   sp!, {r4 - r9, lr}
        mov     r5, r0
        ldr     r2, [r5, #0x24]
        ldr     r1, [r5, #0x2C]
        rsb     r9, r2, #0
        cmp     r9, r1
        blt     LKGI0
        rsb     r1, r1, #1
        str     r1, [r5, #0x24]
        rsb     r9, r1, #0
LKGI0:
        ldr     r7, [r5, #0x28]
        ldr     r6, [r5, #0x38]
        cmp     r7, r6
        subge   r7, r6, #1
        strge   r7, [r5, #0x28]
        ldr     r1, [r5, #4]
        ldr     r3, [r5]
        ldr     r4, [r5, #8]
        cmp     r7, r6
        mla     r8, r1, r7, r3
        ldrge   r3, [r5, #0xC]
        bge     LKGI2
LKGI1:
        ldrb    r1, [r8]
        mov     r2, r9
        mov     r0, r4
        bl      memset
        ldr     r3, [r5, #0x2C]
        add     r0, r9, r4
        sub     r2, r3, r9
        mov     r1, r8
        bl      memcpy
        ldr     r6, [r5, #0x38]
        ldr     r3, [r5, #0xC]
        ldr     r12, [r5, #4]
        add     r7, r7, #1
        cmp     r7, r6
        add     r8, r8, r12
        add     r4, r4, r3
        blt     LKGI1
        ldr     r7, [r5, #0x28]
LKGI2:
        ldr     r2, [r5, #0x30]
        sub     r8, r4, r3
        add     r2, r7, r2
        cmp     r6, r2
        bge     LKGI4
LKGI3:
        ldr     r2, [r5, #0x2C]
        mov     r1, r8
        mov     r0, r4
        bl      memcpy
        ldr     r3, [r5, #0x30]
        ldr     r12, [r5, #0x28]
        ldr     r2, [r5, #0xC]
        add     r6, r6, #1
        add     r3, r12, r3
        cmp     r6, r3
        add     r4, r4, r2
        blt     LKGI3
LKGI4:
        ldmia   sp!, {r4 - r9, pc}


