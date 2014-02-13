        .text
        .align  4
        .globl  _ipps_rDftInv_Prime3_64f


_ipps_rDftInv_Prime3_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x40
        ldr     lr, [sp, #0x64]
        ldr     r12, [sp, #0x68]
        mov     r9, r0
        cmp     lr, #0
        ble     LCNN3
        ldr     r7, [pc, #0x1A4]
        ldr     r5, [pc, #0x1A4]
        mul     r4, r1, r3
        ldr     r6, [r7]
        ldr     r7, [r7, #4]
        ldr     r8, [r5]
        ldr     r5, [r5, #4]
        mov     r3, r3, lsl #1
        mul     r3, r1, r3
        str     r8, [sp, #0x2C]
        str     r5, [sp, #0x28]
        str     r7, [sp, #0x1C]
        str     r6, [sp, #0x18]
        str     r1, [sp, #0x14]
LCNN0:
        ldr     r1, [r12], #4
        cmp     r4, #0
        add     r1, r2, r1, lsl #3
        add     r6, r1, r3, lsl #3
        add     r5, r1, r4, lsl #3
        ble     LCNN2
        mov     r10, #0
        str     r6, [sp, #0x24]
        str     r5, [sp, #0x20]
        str     r1, [sp, #0x30]
        str     r12, [sp, #0xC]
        str     r3, [sp, #8]
        str     r4, [sp, #0x10]
        str     lr, [sp, #4]
        str     r2, [sp]
LCNN1:
        ldr     r0, [r9, #8]
        ldr     r1, [r9, #0xC]
        ldr     r12, [sp, #0x30]
        mov     r2, r0
        add     r12, r12, r10, lsl #3
        mov     r3, r1
        str     r12, [sp, #0x34]
        bl      __adddf3
        ldr     r2, [r9, #0x10]
        ldr     r3, [r9, #0x14]
        mov     r4, r0
        mov     r5, r1
        mov     r0, r2
        mov     r1, r3
        bl      __adddf3
        ldr     r7, [r9]
        ldr     r8, [r9, #4]
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x1C]
        str     r0, [sp, #0x38]
        mov     r11, r1
        mov     r0, r4
        mov     r1, r5
        bl      __muldf3
        mov     r2, r7
        mov     r3, r8
        bl      __adddf3
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x38]
        ldr     r2, [sp, #0x2C]
        ldr     r3, [sp, #0x28]
        mov     r6, r1
        mov     r1, r11
        bl      __muldf3
        str     r1, [sp, #0x38]
        mov     r11, r0
        mov     r0, r7
        mov     r1, r8
        mov     r2, r4
        mov     r3, r5
        bl      __adddf3
        ldr     r3, [sp, #0x30]
        str     r0, [r3, +r10, lsl #3]
        ldr     r3, [sp, #0x34]
        mov     r2, r11
        add     r9, r9, #0x18
        str     r1, [r3, #4]
        ldr     r0, [sp, #0x3C]
        ldr     r3, [sp, #0x38]
        mov     r1, r6
        bl      __adddf3
        ldr     r3, [sp, #0x20]
        mov     r2, r11
        str     r0, [r3, +r10, lsl #3]
        add     r3, r3, r10, lsl #3
        str     r1, [r3, #4]
        ldr     r0, [sp, #0x3C]
        ldr     r3, [sp, #0x38]
        mov     r1, r6
        bl      __subdf3
        ldr     r2, [sp, #0x24]
        str     r0, [r2, +r10, lsl #3]
        ldr     r3, [sp, #0x14]
        add     r2, r2, r10, lsl #3
        str     r1, [r2, #4]
        ldr     r1, [sp, #0x10]
        add     r10, r3, r10
        cmp     r10, r1
        blt     LCNN1
        ldr     r12, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r4, [sp, #0x10]
        ldr     lr, [sp, #4]
        ldr     r2, [sp]
LCNN2:
        subs    lr, lr, #1
        bne     LCNN0
LCNN3:
        add     sp, sp, #0x40
        ldmia   sp!, {r4 - r11, pc}
        .long   LCNN_C_1_3
        .long   LCNN_S_1_3


        .data
        .align  4


LCNN_C_1_3:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0xE0,0xBF
LCNN_S_1_3:
        .byte   0xAA,0x4C,0x58,0xE8,0x7A,0xB6,0xEB,0xBF


