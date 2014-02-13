        .text
        .align  4
        .globl  _ipps_sDctFwd_Pow2_32f


_ipps_sDctFwd_Pow2_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x84
        ldr     r5, [sp, #0xA8]
        mov     r7, r0
        mov     r6, r2, asr #1
        cmp     r6, #0
        str     r1, [sp, #8]
        add     r4, r5, r6, lsl #2
        ble     LCRV8
        sub     r1, r7, #4
        str     r1, [sp, #0x3C]
        add     r1, r7, #4
        str     r1, [sp, #0x40]
        sub     r1, r7, #8
        str     r1, [sp, #0x44]
        add     r1, r7, #8
        str     r1, [sp, #0x48]
        sub     r1, r7, #0xC
        str     r1, [sp, #0x4C]
        add     r1, r7, #0xC
        str     r1, [sp, #0x50]
        sub     r1, r7, #0x10
        str     r1, [sp, #0x54]
        add     r1, r3, #4
        add     r11, r4, #4
        add     r9, r4, #8
        add     r10, r4, #0xC
        str     r1, [sp, #0x58]
        add     r0, r5, #4
        add     r12, r5, #8
        add     lr, r5, #0xC
        str     r11, [sp, #0x28]
        str     r9, [sp, #0x2C]
        str     r10, [sp, #0x30]
        add     r1, r3, #8
        str     r1, [sp, #0x5C]
        add     r1, r3, #0xC
        str     r5, [sp, #0x64]
        str     r11, [sp, #0x7C]
        str     r9, [sp, #0x80]
        str     r10, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r5, [sp, #0xC]
        ldr     r9, [sp, #0x5C]
        ldr     r10, [sp, #0x58]
        ldr     r6, [sp, #0x50]
        ldr     r5, [sp, #0x48]
        ldr     r11, [sp, #0x40]
        str     r0, [sp, #0x1C]
        str     r12, [sp, #0x20]
        str     lr, [sp, #0x24]
        mov     r8, #0
        str     r1, [sp, #0x60]
        str     r0, [sp, #0x68]
        str     r12, [sp, #0x6C]
        str     lr, [sp, #0x70]
        str     r3, [sp, #0x74]
        str     r4, [sp, #0x78]
        str     r4, [sp, #0x34]
        str     r3, [sp, #0x38]
        str     r2, [sp, #0x18]
LCRV0:
        ldr     r1, [sp, #0x18]
        ldr     r0, [r7]
        sub     r4, r1, r8
        ldr     r1, [sp, #0x3C]
        add     r8, r8, #4
        ldr     r1, [r1, +r4, lsl #2]
        bl      __addsf3
        ldr     r2, [sp, #0x64]
        str     r0, [r2], #0x10
        ldr     r0, [r11]
        ldr     r1, [sp, #0x44]
        ldr     r1, [r1, +r4, lsl #2]
        str     r2, [sp, #0x64]
        bl      __addsf3
        ldr     r2, [sp, #0x68]
        str     r0, [r2], #0x10
        ldr     r1, [sp, #0x4C]
        ldr     r0, [r5]
        ldr     r1, [r1, +r4, lsl #2]
        str     r2, [sp, #0x68]
        bl      __addsf3
        ldr     r2, [sp, #0x6C]
        str     r0, [r2], #0x10
        ldr     r0, [r6]
        ldr     r1, [sp, #0x54]
        ldr     r1, [r1, +r4, lsl #2]
        str     r2, [sp, #0x6C]
        bl      __addsf3
        ldr     r2, [sp, #0x70]
        str     r0, [r2], #0x10
        ldr     r1, [sp, #0x3C]
        ldr     r0, [r7], #0x10
        ldr     r1, [r1, +r4, lsl #2]
        str     r2, [sp, #0x70]
        bl      __subsf3
        ldr     r1, [sp, #0x74]
        ldr     r2, [sp, #0x74]
        ldr     r1, [r1]
        add     r2, r2, #0x10
        str     r2, [sp, #0x74]
        bl      __mulsf3
        ldr     r2, [sp, #0x78]
        str     r0, [r2], #0x10
        ldr     r1, [sp, #0x44]
        ldr     r0, [r11], #0x10
        ldr     r1, [r1, +r4, lsl #2]
        str     r2, [sp, #0x78]
        bl      __subsf3
        ldr     r1, [r10], #0x10
        bl      __mulsf3
        ldr     r2, [sp, #0x7C]
        str     r0, [r2], #0x10
        ldr     r0, [r5], #0x10
        ldr     r1, [sp, #0x4C]
        ldr     r1, [r1, +r4, lsl #2]
        str     r2, [sp, #0x7C]
        bl      __subsf3
        ldr     r1, [r9], #0x10
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        str     r0, [r1]
        ldr     r1, [sp, #0x54]
        ldr     r2, [sp, #0x80]
        ldr     r0, [r6], #0x10
        ldr     r1, [r1, +r4, lsl #2]
        add     r2, r2, #0x10
        str     r2, [sp, #0x80]
        bl      __subsf3
        ldr     r1, [sp, #0x60]
        ldr     r2, [sp, #0x60]
        ldr     r1, [r1]
        add     r2, r2, #0x10
        str     r2, [sp, #0x60]
        bl      __mulsf3
        ldr     r1, [sp, #0x14]
        str     r0, [r1]
        ldr     r1, [sp, #0x10]
        cmp     r8, r1
        ldr     r1, [sp, #0x14]
        add     r1, r1, #0x10
        str     r1, [sp, #0x14]
        blt     LCRV0
        ldr     r6, [sp, #0x10]
        ldr     r4, [sp, #0x34]
        ldr     r5, [sp, #0xC]
        ldr     r3, [sp, #0x38]
        cmp     r6, #8
        bgt     LCRV2
LCRV1:
        ldr     r1, [r5]
        str     r1, [sp, #0x80]
        ldr     r0, [r5, #0x1C]
        str     r0, [sp, #0x7C]
        bl      __addsf3
        ldr     r3, [r5, #4]
        mov     r9, r0
        str     r3, [sp, #0x78]
        ldr     r1, [r5, #0x18]
        ldr     r0, [sp, #0x78]
        str     r1, [sp, #0x74]
        bl      __addsf3
        ldr     r8, [r5, #8]
        ldr     r11, [r5, #0x14]
        str     r0, [sp, #0x70]
        mov     r0, r8
        mov     r1, r11
        bl      __addsf3
        ldr     r7, [r5, #0xC]
        ldr     r3, [r5, #0x10]
        str     r0, [sp, #0x68]
        mov     r0, r7
        str     r3, [sp, #0x6C]
        ldr     r1, [sp, #0x6C]
        bl      __addsf3
        ldr     r1, [sp, #0x6C]
        mov     r10, r0
        mov     r0, r7
        bl      __subsf3
        str     r0, [sp, #0x6C]
        mov     r1, r11
        mov     r0, r8
        bl      __subsf3
        str     r0, [sp, #0x64]
        ldr     r1, [sp, #0x74]
        ldr     r0, [sp, #0x78]
        bl      __subsf3
        ldr     r1, [sp, #0x7C]
        mov     r8, r0
        ldr     r0, [sp, #0x80]
        bl      __subsf3
        str     r0, [sp, #0x80]
        mov     r0, r9
        mov     r1, r10
        bl      __addsf3
        mov     r7, r0
        mov     r1, r10
        mov     r0, r9
        bl      __subsf3
        mov     r9, r0
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0x68]
        bl      __addsf3
        mov     r11, r0
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0x68]
        bl      __subsf3
        mov     r10, r0
        mov     r1, r11
        mov     r0, r7
        bl      __addsf3
        ldr     r3, [pc, #0x640]
        str     r0, [r5]
        ldr     r3, [r3]
        mov     r0, r7
        mov     r1, r11
        str     r3, [sp, #0x7C]
        bl      __subsf3
        ldr     r1, [sp, #0x7C]
        bl      __mulsf3
        ldr     r3, [pc, #0x620]
        ldr     r12, [pc, #0x620]
        mov     r1, r9
        ldr     r3, [r3]
        ldr     r7, [r12]
        str     r3, [sp, #0x78]
        str     r0, [r5, #0x10]
        mov     r0, r7
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [sp, #0x78]
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r5, #8]
        ldr     r0, [sp, #0x78]
        mov     r1, r9
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r10
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        str     r0, [r5, #0x18]
        ldr     r0, [sp, #0x64]
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x64]
        mov     r9, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r3, [pc, #0x5A0]
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x6C]
        ldr     r1, [r3]
        str     r1, [sp, #0x70]
        bl      __mulsf3
        ldr     r1, [sp, #0x70]
        mov     r11, r0
        ldr     r0, [sp, #0x80]
        bl      __mulsf3
        mov     r10, r0
        mov     r1, r9
        bl      __addsf3
        mov     r8, r0
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        ldr     r1, [sp, #0x74]
        mov     r9, r0
        mov     r0, r11
        bl      __addsf3
        ldr     r1, [sp, #0x74]
        mov     r10, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r12, [pc, #0x540]
        ldr     r3, [pc, #0x540]
        mov     r11, r0
        mov     r1, r8
        ldr     r12, [r12]
        str     r12, [sp, #0x80]
        ldr     r3, [r3]
        ldr     r0, [sp, #0x80]
        str     r3, [sp, #0x74]
        bl      __mulsf3
        str     r0, [sp, #0x6C]
        ldr     r0, [sp, #0x74]
        mov     r1, r10
        bl      __mulsf3
        ldr     r1, [sp, #0x6C]
        bl      __addsf3
        str     r0, [r5, #4]
        ldr     r0, [sp, #0x74]
        mov     r1, r8
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp, #0x80]
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r12, [pc, #0x4DC]
        ldr     r3, [pc, #0x4DC]
        ldr     r12, [r12]
        mov     r1, r9
        str     r12, [sp, #0x6C]
        str     r0, [r5, #0x1C]
        ldr     r0, [sp, #0x6C]
        ldr     r3, [r3]
        str     r3, [sp, #0x68]
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp, #0x68]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r5, #0x14]
        ldr     r0, [sp, #0x68]
        mov     r1, r9
        bl      __mulsf3
        mov     r8, r0
        ldr     r0, [sp, #0x6C]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        str     r0, [r5, #0xC]
        ldr     r1, [r5, +r6, lsl #2]
        str     r1, [sp, #0x64]
        ldr     r0, [r4, #0x1C]
        str     r0, [sp, #0x60]
        bl      __addsf3
        ldr     r11, [r4, #4]
        ldr     r10, [r4, #0x18]
        str     r0, [sp, #0x5C]
        mov     r0, r11
        mov     r1, r10
        bl      __addsf3
        ldr     r8, [r4, #8]
        ldr     r9, [r4, #0x14]
        str     r0, [sp, #0x58]
        mov     r0, r8
        mov     r1, r9
        bl      __addsf3
        ldr     r3, [r4, #0xC]
        str     r3, [sp, #0x54]
        ldr     r3, [r4, #0x10]
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x54]
        str     r3, [sp, #0x50]
        ldr     r1, [sp, #0x50]
        bl      __addsf3
        ldr     r1, [sp, #0x50]
        str     r0, [sp, #0x48]
        ldr     r0, [sp, #0x54]
        bl      __subsf3
        str     r0, [sp, #0x54]
        mov     r1, r9
        mov     r0, r8
        bl      __subsf3
        str     r0, [sp, #0x44]
        mov     r1, r10
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x60]
        mov     r9, r0
        ldr     r0, [sp, #0x64]
        bl      __subsf3
        str     r0, [sp, #0x64]
        ldr     r1, [sp, #0x48]
        ldr     r0, [sp, #0x5C]
        bl      __addsf3
        ldr     r1, [sp, #0x48]
        mov     r10, r0
        ldr     r0, [sp, #0x5C]
        bl      __subsf3
        mov     r8, r0
        ldr     r1, [sp, #0x4C]
        ldr     r0, [sp, #0x58]
        bl      __addsf3
        ldr     r1, [sp, #0x4C]
        mov     r11, r0
        ldr     r0, [sp, #0x58]
        bl      __subsf3
        str     r0, [sp, #0x60]
        mov     r1, r11
        mov     r0, r10
        bl      __addsf3
        str     r0, [sp, #0x50]
        mov     r1, r11
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x7C]
        bl      __mulsf3
        str     r0, [r4, #0x10]
        mov     r1, r8
        mov     r0, r7
        bl      __mulsf3
        mov     r10, r0
        ldr     r0, [sp, #0x78]
        ldr     r1, [sp, #0x60]
        bl      __mulsf3
        mov     r1, r10
        bl      __addsf3
        str     r0, [r4, #8]
        ldr     r0, [sp, #0x78]
        mov     r1, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x60]
        mov     r8, r0
        mov     r0, r7
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        str     r0, [r4, #0x18]
        ldr     r0, [sp, #0x44]
        mov     r1, r9
        bl      __addsf3
        ldr     r1, [sp, #0x44]
        mov     r8, r0
        mov     r0, r9
        bl      __subsf3
        mov     r10, r0
        ldr     r1, [sp, #0x70]
        ldr     r0, [sp, #0x54]
        bl      __mulsf3
        ldr     r1, [sp, #0x70]
        mov     r11, r0
        ldr     r0, [sp, #0x64]
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r8
        bl      __addsf3
        mov     r7, r0
        mov     r0, r9
        mov     r1, r8
        bl      __subsf3
        mov     r8, r0
        mov     r1, r10
        mov     r0, r11
        bl      __addsf3
        mov     r9, r0
        mov     r1, r10
        mov     r0, r11
        bl      __subsf3
        mov     r10, r0
        ldr     r0, [sp, #0x80]
        mov     r1, r7
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [sp, #0x74]
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r11, r0
        str     r11, [r4, #4]
        ldr     r0, [sp, #0x74]
        mov     r1, r7
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [sp, #0x80]
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        str     r0, [r4, #0x1C]
        ldr     r0, [sp, #0x6C]
        mov     r1, r8
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [sp, #0x68]
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #0x14]
        ldr     r0, [sp, #0x68]
        mov     r1, r8
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [sp, #0x6C]
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        str     r0, [r4, #0xC]
        b       LCRV3
LCRV2:
        ldr     r8, [sp, #8]
        add     r7, r3, r6, lsl #2
        mov     r3, r7
        str     r8, [sp]
        mov     r2, r6
        mov     r1, r5
        mov     r0, r5
        bl      ipps_sDctFwd_Pow2_32f
        str     r8, [sp]
        mov     r3, r7
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      ipps_sDctFwd_Pow2_32f
        ldr     r3, [r5, +r6, lsl #2]
        str     r3, [sp, #0x50]
        ldr     r11, [r4, #4]
LCRV3:
        mov     r0, r11
        ldr     r1, [sp, #0x50]
        sub     r10, r6, #1
        bl      __addsf3
        str     r0, [r5, +r6, lsl #2]
        ldr     r0, [r4, #4]
        ldr     r1, [r4, #8]
        bl      __addsf3
        str     r0, [r4, #4]
        ldr     r0, [r4, #8]
        ldr     r1, [r4, #0xC]
        bl      __addsf3
        cmp     r10, #3
        str     r0, [r4, #8]
        ble     LCRV5
        str     r6, [sp, #0x10]
        str     r5, [sp, #0xC]
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #0x2C]
        ldr     r11, [sp, #0x30]
        mov     r9, #3
        add     r8, r4, #0xC
        add     r7, r4, #0x1C
LCRV4:
        ldr     r1, [r5, +r9, lsl #2]
        ldr     r0, [r8]
        bl      __addsf3
        str     r0, [r8], #0x10
        ldr     r0, [r5, +r9, lsl #2]
        ldr     r1, [r6, +r9, lsl #2]
        bl      __addsf3
        str     r0, [r5, +r9, lsl #2]
        ldr     r0, [r6, +r9, lsl #2]
        ldr     r1, [r11, +r9, lsl #2]
        bl      __addsf3
        str     r0, [r6, +r9, lsl #2]
        ldr     r0, [r11, +r9, lsl #2]
        ldr     r1, [r7], #0x10
        bl      __addsf3
        str     r0, [r11, +r9, lsl #2]
        add     r9, r9, #4
        cmp     r9, r10
        blt     LCRV4
        ldr     r6, [sp, #0x10]
        ldr     r5, [sp, #0xC]
LCRV5:
        cmp     r6, #0
        ble     LCRV7
        ldr     r3, [sp, #8]
        str     r6, [sp, #0x10]
        ldr     r2, [sp, #0x30]
        ldr     r6, [sp, #8]
        add     r10, r3, #4
        add     r9, r3, #8
        add     r8, r3, #0xC
        add     r7, r3, #0x10
        add     lr, r3, #0x14
        add     r12, r3, #0x18
        mov     r11, #0
        add     r3, r3, #0x1C
LCRV6:
        ldr     r0, [r5], #0x10
        str     r0, [r6], #0x20
        ldr     r0, [r4], #0x10
        str     r0, [r10], #0x20
        ldr     r0, [sp, #0x1C]
        ldr     r0, [r0, +r11, lsl #2]
        str     r0, [r9], #0x20
        ldr     r0, [sp, #0x28]
        ldr     r0, [r0, +r11, lsl #2]
        str     r0, [r8], #0x20
        ldr     r0, [sp, #0x20]
        ldr     r0, [r0, +r11, lsl #2]
        str     r0, [r7], #0x20
        ldr     r0, [sp, #0x2C]
        ldr     r0, [r0, +r11, lsl #2]
        str     r0, [lr], #0x20
        ldr     r0, [sp, #0x24]
        ldr     r0, [r0, +r11, lsl #2]
        str     r0, [r12], #0x20
        ldr     r1, [r2, +r11, lsl #2]
        ldr     r0, [sp, #0x10]
        add     r11, r11, #4
        str     r1, [r3], #0x20
        cmp     r11, r0
        blt     LCRV6
LCRV7:
        add     sp, sp, #0x84
        ldmia   sp!, {r4 - r11, pc}
LCRV8:
        add     r3, r5, #4
        str     r3, [sp, #0x1C]
        add     r3, r5, #8
        str     r3, [sp, #0x20]
        add     r3, r5, #0xC
        str     r3, [sp, #0x24]
        add     r3, r4, #4
        str     r3, [sp, #0x28]
        add     r3, r4, #8
        str     r3, [sp, #0x2C]
        add     r3, r4, #0xC
        str     r3, [sp, #0x30]
        b       LCRV1
        .long   LCRV_cos_4_16
        .long   LCRV_sin_2_16
        .long   LCRV_cos_2_16
        .long   LCRV_sqrt_2
        .long   LCRV_cos_1_16s
        .long   LCRV_sin_1_16s
        .long   LCRV_cos_5_16s
        .long   LCRV_sin_5_16s


        .data
        .align  4


LCRV_cos_4_16:
        .byte   0xF3,0x04,0x35,0x3F
LCRV_cos_2_16:
        .byte   0x5E,0x83,0x6C,0x3F
LCRV_sin_2_16:
        .byte   0x15,0xEF,0xC3,0x3E
LCRV_sqrt_2:
        .byte   0xF3,0x04,0xB5,0x3F
LCRV_cos_1_16s:
        .byte   0x86,0x8A,0x31,0x3F
LCRV_sin_1_16s:
        .byte   0xAF,0x42,0x0D,0x3E
LCRV_cos_5_16s:
        .byte   0x4E,0x23,0xC9,0x3E
LCRV_sin_5_16s:
        .byte   0x17,0x83,0x16,0x3F


