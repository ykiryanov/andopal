        .text
        .align  4
        .globl  h264_interpolate_chroma_type_yx_16u_px


h264_interpolate_chroma_type_yx_16u_px:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        ldr     r3, [r0, #0x1C]
        ldr     r6, [r0]
        ldr     r7, [r0, #4]
        ldr     r8, [r0, #8]
        ldr     r9, [r0, #0xC]
        cmp     r3, #0
        ble     LKZX3
        ldr     r10, [r0, #0x18]
        mov     r1, #0
LKZX0:
        cmp     r10, #0
        addle   r2, r6, r7, lsl #1
        ble     LKZX2
        add     r2, r6, r7, lsl #1
        add     r10, r6, #2
        mov     r5, #0
        mov     r4, r5
        mov     lr, r10
        mov     r12, r2
        mov     r3, r7
        str     r2, [sp, #0xC]
        str     r10, [sp, #0x14]
        str     r1, [sp, #8]
        str     r9, [sp, #4]
        str     r8, [sp, #0x18]
        str     r7, [sp]
        str     r6, [sp, #0x10]
LKZX1:
        ldr     r2, [sp, #0x14]
        ldr     r7, [r0, #0x10]
        ldr     r6, [r0, #0x14]
        ldr     r1, [sp, #0x10]
        ldrh    r10, [lr], #2
        ldrh    r8, [r12], #2
        mov     r11, r3, lsl #1
        ldrh    r2, [r2, +r11]
        mul     r10, r7, r10
        ldrh    r1, [r1, +r4]
        add     r5, r5, #1
        mul     r2, r7, r2
        rsb     r9, r7, #8
        mla     r10, r9, r1, r10
        rsb     r11, r6, #8
        mla     r2, r9, r8, r2
        add     r3, r3, #1
        mul     r2, r6, r2
        mla     r2, r11, r10, r2
        add     r1, r2, #0x20
        ldr     r2, [sp, #0x18]
        mov     r1, r1, asr #6
        strh    r1, [r2, +r4]
        ldr     r10, [r0, #0x18]
        add     r4, r4, #2
        cmp     r5, r10
        blt     LKZX1
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #8]
        ldr     r9, [sp, #4]
        ldr     r8, [sp, #0x18]
        ldr     r7, [sp]
        ldr     r3, [r0, #0x1C]
LKZX2:
        add     r1, r1, #1
        cmp     r1, r3
        add     r8, r8, r9, lsl #1
        mov     r6, r2
        blt     LKZX0
LKZX3:
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}


