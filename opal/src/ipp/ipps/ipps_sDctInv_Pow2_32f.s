        .text
        .align  4
        .globl  _ipps_sDctInv_Pow2_32f


_ipps_sDctInv_Pow2_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x8C
        ldr     r5, [sp, #0xB0]
        str     r2, [sp, #0xC]
        mov     r6, r2, asr #1
        cmp     r6, #0
        str     r1, [sp, #8]
        add     r4, r5, r6, lsl #2
        ble     LCRU8
        add     r2, r0, #0x10
        str     r2, [sp, #0x48]
        add     r2, r0, #0x18
        str     r2, [sp, #0x4C]
        add     r2, r0, #4
        str     r2, [sp, #0x50]
        add     r2, r0, #0xC
        str     r2, [sp, #0x54]
        add     r2, r3, #4
        str     r2, [sp, #0x58]
        add     r2, r0, #0x14
        str     r2, [sp, #0x5C]
        add     r2, r3, #8
        str     r2, [sp, #0x60]
        add     r9, r4, #4
        add     r7, r4, #8
        add     r8, r4, #0xC
        add     r10, r5, #4
        add     r2, r0, #0x1C
        add     lr, r5, #0xC
        add     r12, r5, #8
        str     r2, [sp, #0x64]
        str     r10, [sp, #0x28]
        str     r9, [sp, #0x34]
        str     r7, [sp, #0x38]
        str     r8, [sp, #0x3C]
        add     r11, r0, #8
        add     r2, r3, #0xC
        str     r4, [sp, #0x80]
        str     r9, [sp, #0x84]
        str     r7, [sp, #0x88]
        str     r2, [sp, #0x68]
        str     r5, [sp, #0x6C]
        str     r10, [sp, #0x70]
        str     r8, [sp, #0x24]
        str     r11, [sp, #0x1C]
        str     r4, [sp, #0x40]
        str     r6, [sp, #0x14]
        str     r5, [sp, #0x10]
        ldr     r10, [sp, #0x88]
        ldr     r7, [sp, #0x84]
        ldr     r8, [sp, #0x80]
        ldr     r9, [sp, #0x68]
        ldr     r6, [sp, #0x64]
        ldr     r5, [sp, #0x60]
        ldr     r11, [sp, #0x58]
        ldr     r4, [sp, #0x50]
        str     lr, [sp, #0x30]
        str     r12, [sp, #0x2C]
        mov     r1, #0
        str     r12, [sp, #0x74]
        str     lr, [sp, #0x78]
        str     r3, [sp, #0x7C]
        str     r1, [sp, #0x18]
        str     r3, [sp, #0x44]
        str     r0, [sp, #0x20]
LCRU0:
        ldr     r1, [sp, #0x20]
        ldr     r0, [r1], #0x20
        str     r1, [sp, #0x20]
        ldr     r1, [sp, #0x18]
        add     r1, r1, #4
        str     r1, [sp, #0x18]
        ldr     r1, [sp, #0x6C]
        str     r0, [r1], #0x10
        ldr     r0, [sp, #0x1C]
        ldr     r0, [r0]
        str     r1, [sp, #0x6C]
        ldr     r1, [sp, #0x1C]
        add     r1, r1, #0x20
        str     r1, [sp, #0x1C]
        ldr     r1, [sp, #0x70]
        str     r0, [r1], #0x10
        ldr     r0, [sp, #0x48]
        ldr     r0, [r0]
        str     r1, [sp, #0x70]
        ldr     r1, [sp, #0x48]
        add     r1, r1, #0x20
        str     r1, [sp, #0x48]
        ldr     r1, [sp, #0x74]
        str     r0, [r1], #0x10
        ldr     r0, [sp, #0x4C]
        ldr     r2, [sp, #0x78]
        ldr     r0, [r0]
        str     r1, [sp, #0x74]
        ldr     r1, [sp, #0x4C]
        add     r1, r1, #0x20
        str     r1, [sp, #0x4C]
        str     r0, [r2], #0x10
        ldr     r0, [r4], #0x20
        ldr     r1, [sp, #0x7C]
        ldr     r1, [r1]
        str     r2, [sp, #0x78]
        bl      __mulsf3
        str     r0, [r8], #0x10
        ldr     r0, [sp, #0x54]
        ldr     r1, [r11], #0x10
        ldr     r2, [sp, #0x7C]
        ldr     r0, [r0]
        add     r2, r2, #0x10
        str     r2, [sp, #0x7C]
        bl      __mulsf3
        str     r0, [r7], #0x10
        ldr     r0, [sp, #0x5C]
        ldr     r2, [sp, #0x54]
        ldr     r1, [r5], #0x10
        ldr     r0, [r0]
        add     r2, r2, #0x20
        str     r2, [sp, #0x54]
        bl      __mulsf3
        str     r0, [r10], #0x10
        ldr     r2, [sp, #0x5C]
        ldr     r0, [r6], #0x20
        ldr     r1, [r9], #0x10
        add     r2, r2, #0x20
        str     r2, [sp, #0x5C]
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        str     r0, [r1]
        ldr     r0, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        cmp     r1, r0
        ldr     r0, [sp, #0x24]
        add     r0, r0, #0x10
        str     r0, [sp, #0x24]
        blt     LCRU0
        ldr     r6, [sp, #0x14]
        ldr     r4, [sp, #0x40]
        ldr     r5, [sp, #0x10]
        ldr     r3, [sp, #0x44]
        cmp     r6, #8
        bgt     LCRU2
LCRU1:
        ldr     r3, [pc, #0x7CC]
        ldr     r9, [r5, #0x1C]
        ldr     r1, [r3]
        ldr     r3, [pc, #0x7C4]
        str     r1, [sp, #0x88]
        ldr     r8, [r5, #4]
        ldr     r3, [r3]
        mov     r0, r8
        str     r3, [sp, #0x84]
        bl      __mulsf3
        ldr     r1, [sp, #0x84]
        mov     r7, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        ldr     r1, [sp, #0x84]
        mov     r7, r0
        mov     r0, r8
        bl      __mulsf3
        ldr     r1, [sp, #0x88]
        mov     r8, r0
        mov     r0, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        ldr     r12, [pc, #0x768]
        ldr     r11, [r5, #0xC]
        ldr     r9, [r5, #0x14]
        ldr     r3, [pc, #0x760]
        ldr     r12, [r12]
        mov     r10, r0
        mov     r0, r9
        str     r12, [sp, #0x80]
        ldr     r3, [r3]
        ldr     r1, [sp, #0x80]
        str     r3, [sp, #0x7C]
        bl      __mulsf3
        ldr     r1, [sp, #0x7C]
        mov     r8, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        ldr     r1, [sp, #0x7C]
        mov     r8, r0
        mov     r0, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x80]
        mov     r9, r0
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        mov     r9, r0
        mov     r1, r8
        mov     r0, r7
        bl      __addsf3
        mov     r11, r0
        mov     r0, r7
        mov     r1, r8
        bl      __subsf3
        mov     r7, r0
        mov     r0, r10
        mov     r1, r9
        bl      __addsf3
        mov     r8, r0
        mov     r0, r10
        mov     r1, r9
        bl      __subsf3
        ldr     r3, [pc, #0x6BC]
        mov     r9, r0
        mov     r0, r11
        ldr     r1, [r3]
        str     r1, [sp, #0x78]
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        str     r0, [sp, #0x74]
        mov     r0, r8
        bl      __mulsf3
        str     r0, [sp, #0x70]
        mov     r0, r7
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x6C]
        mov     r0, r7
        mov     r1, r9
        bl      __subsf3
        ldr     r1, [r5, #0x10]
        ldr     r3, [pc, #0x674]
        str     r0, [sp, #0x68]
        mov     r0, r1
        ldr     r3, [r3]
        str     r3, [sp, #0x64]
        ldr     r1, [sp, #0x64]
        bl      __mulsf3
        ldr     r8, [r5]
        mov     r7, r0
        mov     r1, r8
        bl      __addsf3
        mov     r10, r0
        mov     r1, r7
        mov     r0, r8
        bl      __subsf3
        ldr     lr, [r5, #8]
        ldr     r12, [pc, #0x638]
        ldr     r3, [pc, #0x638]
        str     lr, [sp, #0x60]
        ldr     r9, [r5, #0x18]
        ldr     r7, [r12]
        ldr     r8, [r3]
        str     r0, [sp, #0x5C]
        ldr     r0, [sp, #0x60]
        mov     r1, r7
        bl      __mulsf3
        str     r0, [sp, #0x58]
        mov     r1, r8
        mov     r0, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x58]
        bl      __addsf3
        mov     r11, r0
        ldr     r0, [sp, #0x60]
        mov     r1, r8
        bl      __mulsf3
        str     r0, [sp, #0x60]
        mov     r0, r9
        mov     r1, r7
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x60]
        bl      __subsf3
        mov     r9, r0
        mov     r0, r10
        mov     r1, r11
        bl      __addsf3
        str     r0, [sp, #0x60]
        mov     r0, r10
        mov     r1, r11
        bl      __subsf3
        mov     r11, r0
        ldr     r0, [sp, #0x5C]
        mov     r1, r9
        bl      __addsf3
        mov     r10, r0
        ldr     r0, [sp, #0x5C]
        mov     r1, r9
        bl      __subsf3
        ldr     r1, [sp, #0x60]
        mov     r9, r0
        ldr     r0, [sp, #0x74]
        bl      __addsf3
        str     r0, [r5]
        ldr     r1, [sp, #0x74]
        ldr     r0, [sp, #0x60]
        bl      __subsf3
        str     r0, [r5, #0x1C]
        ldr     r0, [sp, #0x6C]
        mov     r1, r10
        bl      __addsf3
        str     r0, [r5, #4]
        ldr     r1, [sp, #0x6C]
        mov     r0, r10
        bl      __subsf3
        str     r0, [r5, #0x18]
        ldr     r0, [sp, #0x68]
        mov     r1, r9
        bl      __addsf3
        str     r0, [r5, #8]
        ldr     r1, [sp, #0x68]
        mov     r0, r9
        bl      __subsf3
        str     r0, [r5, #0x14]
        ldr     r0, [sp, #0x70]
        mov     r1, r11
        bl      __addsf3
        str     r0, [r5, #0xC]
        ldr     r1, [sp, #0x70]
        mov     r0, r11
        bl      __subsf3
        str     r0, [r5, #0x10]
        ldr     r1, [r5, +r6, lsl #2]
        str     r1, [sp, #0x74]
        ldr     r0, [r4, #0x1C]
        str     r0, [sp, #0x70]
        bl      __addsf3
        ldr     r11, [r4, #4]
        ldr     r10, [r4, #0x18]
        str     r0, [sp, #0x6C]
        mov     r0, r11
        mov     r1, r10
        bl      __addsf3
        ldr     r3, [r4, #8]
        str     r3, [sp, #0x68]
        ldr     r9, [r4, #0x14]
        str     r0, [sp, #0x60]
        ldr     r0, [sp, #0x68]
        mov     r1, r9
        bl      __addsf3
        ldr     r3, [r4, #0xC]
        str     r3, [sp, #0x5C]
        ldr     r3, [r4, #0x10]
        str     r0, [sp, #0x54]
        ldr     r0, [sp, #0x5C]
        str     r3, [sp, #0x58]
        ldr     r1, [sp, #0x58]
        bl      __addsf3
        ldr     r1, [sp, #0x58]
        str     r0, [sp, #0x50]
        ldr     r0, [sp, #0x5C]
        bl      __subsf3
        str     r0, [sp, #0x58]
        ldr     r0, [sp, #0x68]
        mov     r1, r9
        bl      __subsf3
        str     r0, [sp, #0x68]
        mov     r1, r10
        mov     r0, r11
        bl      __subsf3
        ldr     r1, [sp, #0x70]
        str     r0, [sp, #0x4C]
        ldr     r0, [sp, #0x74]
        bl      __subsf3
        ldr     r1, [sp, #0x50]
        str     r0, [sp, #0x74]
        ldr     r0, [sp, #0x6C]
        bl      __addsf3
        ldr     r1, [sp, #0x50]
        mov     r10, r0
        ldr     r0, [sp, #0x6C]
        bl      __subsf3
        str     r0, [sp, #0x70]
        ldr     r1, [sp, #0x54]
        ldr     r0, [sp, #0x60]
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp, #0x60]
        ldr     r1, [sp, #0x54]
        bl      __subsf3
        mov     r11, r0
        mov     r0, r10
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x5C]
        mov     r1, r9
        mov     r0, r10
        bl      __subsf3
        ldr     r1, [sp, #0x64]
        bl      __mulsf3
        str     r0, [r4, #0x10]
        ldr     r1, [sp, #0x70]
        mov     r0, r7
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r11
        mov     r0, r8
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        str     r0, [r4, #8]
        ldr     r1, [sp, #0x70]
        mov     r0, r8
        bl      __mulsf3
        mov     r8, r0
        mov     r0, r7
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        str     r0, [r4, #0x18]
        ldr     r1, [sp, #0x4C]
        ldr     r0, [sp, #0x68]
        bl      __addsf3
        ldr     r1, [sp, #0x68]
        mov     r8, r0
        ldr     r0, [sp, #0x4C]
        bl      __subsf3
        mov     r10, r0
        ldr     r1, [sp, #0x78]
        ldr     r0, [sp, #0x58]
        bl      __mulsf3
        ldr     r1, [sp, #0x78]
        mov     r11, r0
        ldr     r0, [sp, #0x74]
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
        ldr     r0, [sp, #0x88]
        mov     r1, r7
        bl      __mulsf3
        mov     r11, r0
        ldr     r0, [sp, #0x84]
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        mov     r11, r0
        str     r11, [r4, #4]
        ldr     r0, [sp, #0x84]
        mov     r1, r7
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [sp, #0x88]
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        str     r0, [r4, #0x1C]
        ldr     r0, [sp, #0x80]
        mov     r1, r8
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [sp, #0x7C]
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r7
        bl      __addsf3
        str     r0, [r4, #0x14]
        ldr     r0, [sp, #0x7C]
        mov     r1, r8
        bl      __mulsf3
        mov     r7, r0
        ldr     r0, [sp, #0x80]
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        str     r0, [r4, #0xC]
        b       LCRU3
LCRU2:
        ldr     r8, [sp, #8]
        add     r7, r3, r6, lsl #2
        mov     r3, r7
        str     r8, [sp]
        mov     r2, r6
        mov     r1, r5
        mov     r0, r5
        bl      ipps_sDctInv_Pow2_32f
        str     r8, [sp]
        mov     r3, r7
        mov     r2, r6
        mov     r1, r4
        mov     r0, r4
        bl      _ipps_sDctFwd_Pow2_32f
        ldr     r3, [r5, +r6, lsl #2]
        str     r3, [sp, #0x5C]
        ldr     r11, [r4, #4]
LCRU3:
        mov     r0, r11
        ldr     r1, [sp, #0x5C]
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
        ble     LCRU5
        str     r6, [sp, #0x14]
        str     r5, [sp, #0x10]
        ldr     r5, [sp, #0x34]
        ldr     r6, [sp, #0x38]
        ldr     r11, [sp, #0x3C]
        mov     r9, #3
        add     r8, r4, #0xC
        add     r7, r4, #0x1C
LCRU4:
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
        blt     LCRU4
        ldr     r6, [sp, #0x14]
        ldr     r5, [sp, #0x10]
LCRU5:
        cmp     r6, #0
        ble     LCRU7
        ldr     r11, [sp, #8]
        mov     r7, #0
        str     r6, [sp, #0x14]
        sub     r8, r11, #4
        sub     r9, r11, #8
        sub     r10, r11, #0xC
        add     r3, r11, #4
        add     r12, r11, #8
        add     lr, r11, #0xC
        sub     r11, r11, #0x10
        str     r11, [sp, #0x7C]
        str     r10, [sp, #0x88]
        str     r9, [sp, #0x84]
        str     r8, [sp, #0x80]
        ldr     r8, [sp, #0x2C]
        ldr     r9, [sp, #0x30]
        ldr     r10, [sp, #0x34]
        ldr     r11, [sp, #0x38]
        str     lr, [sp, #0x78]
        str     r12, [sp, #0x74]
        str     r3, [sp, #0x70]
LCRU6:
        ldr     r1, [r4]
        ldr     r0, [r5]
        ldr     r2, [sp, #0xC]
        sub     r6, r2, r7
        bl      __addsf3
        ldr     r2, [sp, #8]
        str     r0, [r2], #0x10
        ldr     r3, [sp, #0x28]
        ldr     r1, [r10, +r7, lsl #2]
        ldr     r0, [r3, +r7, lsl #2]
        str     r2, [sp, #8]
        bl      __addsf3
        ldr     r2, [sp, #0x70]
        str     r0, [r2], #0x10
        ldr     r1, [r11, +r7, lsl #2]
        ldr     r0, [r8, +r7, lsl #2]
        str     r2, [sp, #0x70]
        bl      __addsf3
        ldr     r2, [sp, #0x74]
        str     r0, [r2], #0x10
        ldr     r3, [sp, #0x3C]
        ldr     r0, [r9, +r7, lsl #2]
        ldr     r1, [r3, +r7, lsl #2]
        str     r2, [sp, #0x74]
        bl      __addsf3
        ldr     r2, [sp, #0x78]
        str     r0, [r2], #0x10
        ldr     r0, [r5], #0x10
        ldr     r1, [r4], #0x10
        str     r2, [sp, #0x78]
        bl      __subsf3
        ldr     r2, [sp, #0x80]
        str     r0, [r2, +r6, lsl #2]
        ldr     r2, [sp, #0x28]
        ldr     r1, [r10, +r7, lsl #2]
        ldr     r0, [r2, +r7, lsl #2]
        bl      __subsf3
        ldr     r2, [sp, #0x84]
        str     r0, [r2, +r6, lsl #2]
        ldr     r0, [r8, +r7, lsl #2]
        ldr     r1, [r11, +r7, lsl #2]
        bl      __subsf3
        ldr     r2, [sp, #0x88]
        str     r0, [r2, +r6, lsl #2]
        ldr     r2, [sp, #0x3C]
        ldr     r0, [r9, +r7, lsl #2]
        ldr     r1, [r2, +r7, lsl #2]
        add     r7, r7, #4
        bl      __subsf3
        ldr     r2, [sp, #0x7C]
        str     r0, [r2, +r6, lsl #2]
        ldr     r2, [sp, #0x14]
        cmp     r7, r2
        blt     LCRU6
LCRU7:
        add     sp, sp, #0x8C
        ldmia   sp!, {r4 - r11, pc}
LCRU8:
        add     r3, r5, #4
        str     r3, [sp, #0x28]
        add     r3, r5, #0xC
        str     r3, [sp, #0x30]
        add     r3, r5, #8
        str     r3, [sp, #0x2C]
        add     r3, r4, #4
        str     r3, [sp, #0x34]
        add     r3, r4, #8
        str     r3, [sp, #0x38]
        add     r3, r4, #0xC
        str     r3, [sp, #0x3C]
        b       LCRU1
        .long   LCRU_cos_1_16s
        .long   LCRU_sin_1_16s
        .long   LCRU_cos_5_16s
        .long   LCRU_sin_5_16s
        .long   LCRU_sqrt_2
        .long   LCRU_cos_4_16
        .long   LCRU_cos_2_16
        .long   LCRU_sin_2_16


        .data
        .align  4


LCRU_cos_1_16s:
        .byte   0x86,0x8A,0x31,0x3F
LCRU_sin_1_16s:
        .byte   0xAF,0x42,0x0D,0x3E
LCRU_cos_5_16s:
        .byte   0x4E,0x23,0xC9,0x3E
LCRU_sin_5_16s:
        .byte   0x17,0x83,0x16,0x3F
LCRU_sqrt_2:
        .byte   0xF3,0x04,0xB5,0x3F
LCRU_cos_4_16:
        .byte   0xF3,0x04,0x35,0x3F
LCRU_cos_2_16:
        .byte   0x5E,0x83,0x6C,0x3F
LCRU_sin_2_16:
        .byte   0x15,0xEF,0xC3,0x3E


