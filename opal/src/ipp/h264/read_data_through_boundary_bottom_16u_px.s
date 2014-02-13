        .text
        .align  4
        .globl  read_data_through_boundary_bottom_16u_px


read_data_through_boundary_bottom_16u_px:
        stmdb   sp!, {r4 - r8, lr}
        mov     r5, r0
        ldr     r6, [r5, #0x28]
        ldr     r7, [r5, #0x38]
        cmp     r6, r7
        subge   r6, r7, #1
        strge   r6, [r5, #0x28]
        ldr     r3, [r5, #4]
        ldr     r2, [r5]
        ldr     r1, [r5, #0x24]
        mul     r3, r6, r3
        ldr     r4, [r5, #8]
        cmp     r6, r7
        add     r3, r2, r3, lsl #1
        add     r8, r3, r1, lsl #1
        ldrge   r2, [r5, #0xC]
        bge     LKGL1
LKGL0:
        ldr     r2, [r5, #0x2C]
        mov     r1, r8
        mov     r0, r4
        mov     r2, r2, lsl #1
        bl      memcpy
        ldr     r7, [r5, #0x38]
        ldr     r2, [r5, #0xC]
        ldr     r3, [r5, #4]
        add     r6, r6, #1
        cmp     r6, r7
        add     r8, r8, r3, lsl #1
        add     r4, r4, r2, lsl #1
        blt     LKGL0
        ldr     r6, [r5, #0x28]
LKGL1:
        ldr     r3, [r5, #0x30]
        sub     r8, r4, r2, lsl #1
        add     r3, r6, r3
        cmp     r7, r3
        bge     LKGL3
LKGL2:
        ldr     r2, [r5, #0x2C]
        mov     r1, r8
        mov     r0, r4
        mov     r2, r2, lsl #1
        bl      memcpy
        ldr     r3, [r5, #0x30]
        ldr     r12, [r5, #0x28]
        ldr     r2, [r5, #0xC]
        add     r7, r7, #1
        add     r3, r12, r3
        cmp     r7, r3
        add     r4, r4, r2, lsl #1
        blt     LKGL2
LKGL3:
        ldmia   sp!, {r4 - r8, pc}


