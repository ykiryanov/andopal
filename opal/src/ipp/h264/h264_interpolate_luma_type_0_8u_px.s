        .text
        .align  4
        .globl  h264_interpolate_luma_type_0_8u_px


h264_interpolate_luma_type_0_8u_px:
        stmdb   sp!, {r4 - r7, lr}
        mov     r5, r0
        ldr     r2, [r5, #0x1C]
        ldr     r4, [r5]
        ldr     r6, [r5, #8]
        cmp     r2, #0
        ble     LKZK1
        mov     r7, #0
LKZK0:
        ldr     r2, [r5, #0x18]
        mov     r1, r4
        mov     r0, r6
        bl      memcpy
        ldr     r2, [r5, #0x1C]
        ldr     r3, [r5, #0xC]
        ldr     r12, [r5, #4]
        add     r7, r7, #1
        cmp     r7, r2
        add     r6, r3, r6
        add     r4, r12, r4
        blt     LKZK0
LKZK1:
        ldmia   sp!, {r4 - r7, pc}


