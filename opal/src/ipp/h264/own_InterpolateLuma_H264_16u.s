        .text
        .align  4
        .globl  own_InterpolateLuma_H264_16u


own_InterpolateLuma_H264_16u:
        stmdb   sp!, {r4, r5, lr}
        sub     sp, sp, #0x10
        mov     r3, r2
        ldr     r12, [r3, #0x20]
        ldr     lr, [r3, #0x14]
        ldr     r4, [r3, #0x10]
        mov     r2, r1
        ldr     r1, [r3, #8]
        str     r12, [sp, #8]
        ldr     r5, [r3, #0x1C]
        ldr     r12, [pc, #0x24]
        add     lr, lr, r4, lsl #2
        str     r5, [sp, #4]
        ldr     r4, [r3, #0x18]
        str     r4, [sp]
        ldr     r3, [r3, #0xC]
        ldr     r12, [r12, +lr, lsl #2]
        blx     r12
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4, r5, pc}
        .long   InterpolFnTbl_16u


