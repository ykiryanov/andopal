        .text
        .align  4
        .globl  h264_interpolate_chroma_type_00_16u_px


h264_interpolate_chroma_type_00_16u_px:
        stmdb   sp!, {r4 - r6, lr}
        ldr     r5, [r0, #0x1C]
        ldr     lr, [r0]
        ldr     r12, [r0, #4]
        ldr     r3, [r0, #8]
        ldr     r2, [r0, #0xC]
        cmp     r5, #0
        ble     LLAD3
        ldr     r4, [r0, #0x18]
        mov     r1, #0
LLAD0:
        cmp     r4, #0
        ble     LLAD2
        mov     r6, #0
        mov     r5, r6
LLAD1:
        ldrh    r4, [lr, +r5]
        add     r6, r6, #1
        strh    r4, [r3, +r5]
        ldr     r4, [r0, #0x18]
        add     r5, r5, #2
        cmp     r6, r4
        blt     LLAD1
        ldr     r5, [r0, #0x1C]
LLAD2:
        add     r1, r1, #1
        cmp     r1, r5
        add     lr, lr, r12, lsl #1
        add     r3, r3, r2, lsl #1
        blt     LLAD0
LLAD3:
        ldmia   sp!, {r4 - r6, pc}


