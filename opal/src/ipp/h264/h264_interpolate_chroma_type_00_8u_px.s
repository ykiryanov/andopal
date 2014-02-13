        .text
        .align  4
        .globl  h264_interpolate_chroma_type_00_8u_px


h264_interpolate_chroma_type_00_8u_px:
        stmdb   sp!, {r4, r5, lr}
        ldr     r5, [r0, #0x1C]
        ldr     lr, [r0]
        ldr     r12, [r0, #4]
        ldr     r3, [r0, #8]
        ldr     r2, [r0, #0xC]
        cmp     r5, #0
        ble     LLAC3
        ldr     r4, [r0, #0x18]
        mov     r1, #0
LLAC0:
        cmp     r4, #0
        ble     LLAC2
        mov     r5, #0
LLAC1:
        ldrb    r4, [r5, +lr]
        strb    r4, [r5, +r3]
        ldr     r4, [r0, #0x18]
        add     r5, r5, #1
        cmp     r5, r4
        blt     LLAC1
        ldr     r5, [r0, #0x1C]
LLAC2:
        add     r1, r1, #1
        cmp     r1, r5
        add     lr, r12, lr
        add     r3, r2, r3
        blt     LLAC0
LLAC3:
        ldmia   sp!, {r4, r5, pc}


