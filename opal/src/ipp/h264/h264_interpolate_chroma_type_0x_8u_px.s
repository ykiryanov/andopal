        .text
        .align  4
        .globl  h264_interpolate_chroma_type_0x_8u_px


h264_interpolate_chroma_type_0x_8u_px:
        stmdb   sp!, {r4 - r8, lr}
        ldr     r4, [r0, #0x1C]
        ldr     lr, [r0]
        ldr     r12, [r0, #4]
        ldr     r3, [r0, #8]
        ldr     r2, [r0, #0xC]
        cmp     r4, #0
        ble     LLAA3
        ldr     r6, [r0, #0x18]
        mov     r1, #0
LLAA0:
        cmp     r6, #0
        ble     LLAA2
        mov     r5, #0
        mov     r4, lr
LLAA1:
        ldrb    r7, [r4, #1]!
        ldr     r8, [r0, #0x10]
        ldrb    r6, [r5, +lr]
        mul     r7, r8, r7
        rsb     r8, r8, #8
        mla     r7, r8, r6, r7
        add     r6, r7, #4
        mov     r6, r6, asr #3
        strb    r6, [r5, +r3]
        ldr     r6, [r0, #0x18]
        add     r5, r5, #1
        cmp     r5, r6
        blt     LLAA1
        ldr     r4, [r0, #0x1C]
LLAA2:
        add     r1, r1, #1
        cmp     r1, r4
        add     lr, r12, lr
        add     r3, r2, r3
        blt     LLAA0
LLAA3:
        ldmia   sp!, {r4 - r8, pc}


