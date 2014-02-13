        .text
        .align  4
        .globl  h264_interpolate_chroma_type_yx_8u_px


h264_interpolate_chroma_type_yx_8u_px:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     lr, [r0, #0x1C]
        ldr     r12, [r0]
        ldr     r8, [r0, #4]
        ldr     r3, [r0, #8]
        ldr     r7, [r0, #0xC]
        cmp     lr, #0
        ble     LKZW3
        ldr     r1, [r0, #0x18]
        mov     r2, #0
LKZW0:
        cmp     r1, #0
        addle   r6, r8, r12
        ble     LKZW2
        add     r6, r8, r12
        mov     r5, #0
        mov     r4, r6
        mov     lr, r12
        str     r2, [sp, #8]
        str     r7, [sp, #4]
        str     r8, [sp]
LKZW1:
        ldr     r10, [r0, #0x10]
        ldrb    r1, [r4, #1]
        ldrb    r2, [lr, #1]!
        ldr     r7, [r0, #0x14]
        ldrb    r8, [r5, +r12]
        mul     r1, r10, r1
        mul     r2, r10, r2
        ldrb    r9, [r4], #1
        rsb     r10, r10, #8
        rsb     r11, r7, #8
        mla     r2, r10, r8, r2
        mla     r1, r10, r9, r1
        mul     r1, r7, r1
        mla     r1, r11, r2, r1
        add     r1, r1, #0x20
        mov     r1, r1, asr #6
        strb    r1, [r5, +r3]
        ldr     r1, [r0, #0x18]
        add     r5, r5, #1
        cmp     r5, r1
        blt     LKZW1
        ldr     r2, [sp, #8]
        ldr     r7, [sp, #4]
        ldr     r8, [sp]
        ldr     lr, [r0, #0x1C]
LKZW2:
        add     r2, r2, #1
        cmp     r2, lr
        add     r3, r7, r3
        mov     r12, r6
        blt     LKZW0
LKZW3:
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}


