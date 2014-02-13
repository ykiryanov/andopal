        .text
        .align  4
        .globl  read_data_through_boundary_bottom_8u_px


read_data_through_boundary_bottom_8u_px:
        stmdb   sp!, {r4 - r8, lr}
        mov     r6, r0
        ldr     r7, [r6, #0x28]
        ldr     r8, [r6, #0x38]
        cmp     r7, r8
        subge   r7, r8, #1
        strge   r7, [r6, #0x28]
        ldr     r3, [r6]
        ldr     r2, [r6, #4]
        ldr     r1, [r6, #0x24]
        ldr     r4, [r6, #8]
        cmp     r7, r8
        mla     r3, r2, r7, r3
        add     r5, r3, r1
        ldrge   r2, [r6, #0xC]
        bge     LKGK1
LKGK0:
        ldr     r2, [r6, #0x2C]
        mov     r1, r5
        mov     r0, r4
        bl      memcpy
        ldr     r8, [r6, #0x38]
        ldr     r2, [r6, #0xC]
        ldr     r3, [r6, #4]
        add     r7, r7, #1
        cmp     r7, r8
        add     r5, r5, r3
        add     r4, r4, r2
        blt     LKGK0
        ldr     r7, [r6, #0x28]
LKGK1:
        ldr     r3, [r6, #0x30]
        sub     r5, r4, r2
        add     r3, r7, r3
        cmp     r8, r3
        bge     LKGK3
LKGK2:
        ldr     r2, [r6, #0x2C]
        mov     r1, r5
        mov     r0, r4
        bl      memcpy
        ldr     r3, [r6, #0x30]
        ldr     r12, [r6, #0x28]
        ldr     r2, [r6, #0xC]
        add     r8, r8, #1
        add     r3, r12, r3
        cmp     r8, r3
        add     r4, r4, r2
        blt     LKGK2
LKGK3:
        ldmia   sp!, {r4 - r8, pc}


