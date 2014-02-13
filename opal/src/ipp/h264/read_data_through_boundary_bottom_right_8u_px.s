        .text
        .align  4
        .globl  read_data_through_boundary_bottom_right_8u_px


read_data_through_boundary_bottom_right_8u_px:
        stmdb   sp!, {r4 - r9, lr}
        mov     r5, r0
        ldr     r1, [r5, #0x24]
        ldr     r2, [r5, #0x34]
        cmp     r1, r2
        subge   r1, r2, #1
        strge   r1, [r5, #0x24]
        ldr     r7, [r5, #0x28]
        ldr     r6, [r5, #0x38]
        cmp     r7, r6
        subge   r7, r6, #1
        strge   r7, [r5, #0x28]
        ldr     r12, [r5]
        ldr     r3, [r5, #4]
        ldr     r4, [r5, #8]
        sub     r8, r2, r1
        cmp     r7, r6
        mla     r12, r3, r7, r12
        add     r9, r12, r1
        ldrge   r3, [r5, #0xC]
        bge     LKGE1
LKGE0:
        mov     r2, r8
        mov     r1, r9
        mov     r0, r4
        bl      memcpy
        ldr     r3, [r5, #0x2C]
        add     r12, r8, r9
        ldrb    r1, [r12, #-1]
        sub     r2, r3, r8
        add     r0, r8, r4
        bl      memset
        ldr     r6, [r5, #0x38]
        ldr     r3, [r5, #0xC]
        ldr     r12, [r5, #4]
        add     r7, r7, #1
        cmp     r7, r6
        add     r9, r9, r12
        add     r4, r4, r3
        blt     LKGE0
        ldr     r7, [r5, #0x28]
LKGE1:
        ldr     r2, [r5, #0x30]
        sub     r8, r4, r3
        add     r2, r7, r2
        cmp     r6, r2
        bge     LKGE3
LKGE2:
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
        blt     LKGE2
LKGE3:
        ldmia   sp!, {r4 - r9, pc}


