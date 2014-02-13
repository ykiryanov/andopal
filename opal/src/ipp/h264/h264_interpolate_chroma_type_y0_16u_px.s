        .text
        .align  4
        .globl  h264_interpolate_chroma_type_y0_16u_px


h264_interpolate_chroma_type_y0_16u_px:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r4, [r0, #0x1C]
        ldr     lr, [r0]
        ldr     r12, [r0, #4]
        ldr     r3, [r0, #8]
        ldr     r2, [r0, #0xC]
        cmp     r4, #0
        ble     LKZZ3
        ldr     r8, [r0, #0x18]
        mov     r1, #0
LKZZ0:
        cmp     r8, #0
        addle   r7, lr, r12, lsl #1
        ble     LKZZ2
        mov     r6, #0
        add     r7, lr, r12, lsl #1
        mov     r5, r6
        mov     r4, r7
LKZZ1:
        ldrh    r9, [r4], #2
        ldr     r10, [r0, #0x14]
        ldrh    r8, [lr, +r5]
        add     r6, r6, #1
        mul     r9, r10, r9
        rsb     r10, r10, #8
        mla     r9, r10, r8, r9
        add     r8, r9, #4
        mov     r8, r8, asr #3
        strh    r8, [r3, +r5]
        ldr     r8, [r0, #0x18]
        add     r5, r5, #2
        cmp     r6, r8
        blt     LKZZ1
        ldr     r4, [r0, #0x1C]
LKZZ2:
        add     r1, r1, #1
        cmp     r1, r4
        add     r3, r3, r2, lsl #1
        mov     lr, r7
        blt     LKZZ0
LKZZ3:
        ldmia   sp!, {r4 - r10, pc}


