        .text
        .align  4
        .globl  read_data_through_boundary_top_8u_px


read_data_through_boundary_top_8u_px:
        stmdb   sp!, {r4 - r7, lr}
        mov     r6, r0
        ldr     r7, [r6, #0x28]
        ldr     r2, [r6, #0x30]
        rsb     r1, r7, #0
        cmp     r1, r2
        rsbge   r7, r2, #1
        strge   r7, [r6, #0x28]
        ldr     r1, [r6]
        ldr     r3, [r6, #0x24]
        ldr     r5, [r6, #8]
        cmp     r7, #0
        add     r4, r1, r3
        bge     LKFU1
LKFU0:
        ldr     r2, [r6, #0x2C]
        mov     r1, r4
        mov     r0, r5
        bl      memcpy
        ldr     r2, [r6, #0xC]
        adds    r7, r7, #1
        add     r5, r5, r2
        bmi     LKFU0
        ldr     r7, [r6, #0x28]
        ldr     r2, [r6, #0x30]
LKFU1:
        add     r7, r2, r7
        cmp     r7, #0
        ble     LKFU3
        mov     r7, #0
LKFU2:
        ldr     r2, [r6, #0x2C]
        mov     r1, r4
        mov     r0, r5
        bl      memcpy
        ldr     r12, [r6, #0x28]
        ldr     lr, [r6, #0x30]
        ldr     r3, [r6, #0xC]
        ldr     r2, [r6, #4]
        add     r7, r7, #1
        add     r12, lr, r12
        cmp     r7, r12
        add     r5, r5, r3
        add     r4, r4, r2
        blt     LKFU2
LKFU3:
        ldmia   sp!, {r4 - r7, pc}


