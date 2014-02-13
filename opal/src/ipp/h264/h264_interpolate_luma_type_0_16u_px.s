        .text
        .align  4
        .globl  h264_interpolate_luma_type_0_16u_px


h264_interpolate_luma_type_0_16u_px:
        stmdb   sp!, {r4 - r7, lr}
        mov     r6, r0
        ldr     r2, [r6, #0x1C]
        ldr     r5, [r6]
        ldr     r4, [r6, #8]
        cmp     r2, #0
        ble     LKZL1
        mov     r7, #0
LKZL0:
        ldr     r2, [r6, #0x18]
        mov     r1, r5
        mov     r0, r4
        mov     r2, r2, lsl #1
        bl      memcpy
        ldr     r3, [r6, #0x1C]
        add     r7, r7, #1
        ldr     r2, [r6, #0xC]
        cmp     r7, r3
        ldr     r3, [r6, #4]
        add     r4, r4, r2, lsl #1
        add     r5, r5, r3, lsl #1
        blt     LKZL0
LKZL1:
        ldmia   sp!, {r4 - r7, pc}


