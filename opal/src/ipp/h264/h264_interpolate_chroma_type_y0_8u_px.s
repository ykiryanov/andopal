        .text
        .align  4
        .globl  h264_interpolate_chroma_type_y0_8u_px


h264_interpolate_chroma_type_y0_8u_px:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r1, [r0, #0x1C]
        ldr     r5, [r0]
        ldr     r4, [r0, #4]
        ldr     lr, [r0, #8]
        ldr     r12, [r0, #0xC]
        cmp     r1, #0
        ble     LKZY3
        ldr     r7, [r0, #0x18]
        mov     r6, #0
LKZY0:
        cmp     r7, #0
        addle   r3, r4, r5
        ble     LKZY2
        add     r3, r4, r5
        mov     r2, #0
        mov     r1, r3
LKZY1:
        ldrb    r8, [r1], #1
        ldr     r9, [r0, #0x14]
        ldrb    r7, [r2, +r5]
        mul     r8, r9, r8
        rsb     r9, r9, #8
        mla     r8, r9, r7, r8
        add     r7, r8, #4
        mov     r7, r7, asr #3
        strb    r7, [r2, +lr]
        ldr     r7, [r0, #0x18]
        add     r2, r2, #1
        cmp     r2, r7
        blt     LKZY1
        ldr     r1, [r0, #0x1C]
LKZY2:
        add     r6, r6, #1
        cmp     r6, r1
        add     lr, r12, lr
        mov     r5, r3
        blt     LKZY0
LKZY3:
        ldmia   sp!, {r4 - r9, pc}


