        .text
        .align  4
        .globl  h264_interpolate_chroma_type_0x_16u_px


h264_interpolate_chroma_type_0x_16u_px:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r1, [r0, #0x1C]
        ldr     r5, [r0]
        ldr     r4, [r0, #4]
        ldr     lr, [r0, #8]
        ldr     r12, [r0, #0xC]
        cmp     r1, #0
        ble     LLAB3
        ldr     r7, [r0, #0x18]
        mov     r6, #0
LLAB0:
        cmp     r7, #0
        ble     LLAB2
        mov     r3, #0
        add     r2, r5, #2
        mov     r1, r3
LLAB1:
        ldrh    r8, [r2], #2
        ldr     r9, [r0, #0x10]
        ldrh    r7, [r5, +r1]
        add     r3, r3, #1
        mul     r8, r9, r8
        rsb     r9, r9, #8
        mla     r8, r9, r7, r8
        add     r7, r8, #4
        mov     r7, r7, asr #3
        strh    r7, [lr, +r1]
        ldr     r7, [r0, #0x18]
        add     r1, r1, #2
        cmp     r3, r7
        blt     LLAB1
        ldr     r1, [r0, #0x1C]
LLAB2:
        add     r6, r6, #1
        cmp     r6, r1
        add     r5, r5, r4, lsl #1
        add     lr, lr, r12, lsl #1
        blt     LLAB0
LLAB3:
        ldmia   sp!, {r4 - r9, pc}


