        .text
        .align  4
        .globl  _ipps_crDftInv_Fact_32f


_ipps_crDftInv_Fact_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x78
        ldr     r6, [sp, #0x9C]
        ldr     r5, [sp, #0xA0]
        ldr     r12, [sp, #0xA4]
        ldr     r4, [sp, #0xA8]
        add     lr, r3, #1
        cmp     r6, #0
        mov     lr, lr, asr #1
        ble     LCJS9
        ldr     r7, [pc, #0x5D4]
        rsb     r8, r6, #0
        mla     r8, r3, r6, r8
        ldr     r9, [r7]
        add     r11, r4, #8
        sub     r10, r3, #1
        mov     r7, #0
        str     r10, [sp, #0x68]
        str     r9, [sp, #0x64]
        str     r11, [sp, #0x60]
        str     r8, [sp, #0x5C]
        str     r4, [sp, #0x58]
        str     r5, [sp, #0x54]
        str     r3, [sp, #0x50]
LCJS0:
        ldr     r4, [sp, #0x5C]
        ldr     r8, [r0]
        ldr     r3, [r0, #4]
        add     r9, r0, r4, lsl #3
        str     r9, [sp, #0x30]
        add     r9, r1, r6, lsl #2
        str     r9, [sp, #0x44]
        add     r9, r2, r6, lsl #2
        str     r9, [sp, #0x48]
        add     r9, r1, r4, lsl #2
        add     r4, r2, r4, lsl #2
        str     r9, [sp, #0x4C]
        str     r4, [sp, #0x6C]
        cmp     r7, #0
        add     r5, r0, r6, lsl #3
        mov     r4, r8
        mov     r9, r3
        bne     LCJS2
        cmp     lr, #1
        ble     LCJS10
        ldr     r10, [sp, #0x58]
        str     r9, [sp, #4]
        str     r3, [sp, #0x18]
        sub     r11, r10, #4
        sub     r10, r10, #0xC
        str     r10, [sp, #0x38]
        sub     r10, lr, #1
        str     r11, [sp, #0x34]
        str     r10, [sp, #0x14]
        ldr     r9, [sp, #0x38]
        ldr     r10, [sp, #0x34]
        ldr     r11, [sp, #0x30]
        str     r8, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     lr, [sp, #0xC]
        str     r12, [sp, #0x10]
        str     r2, [sp, #0x24]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
LCJS1:
        ldr     r0, [r5]
        ldr     r1, [r11]
        bl      __addsf3
        ldr     r1, [r5, #4]
        ldr     r2, [r11, #4]
        mov     r8, r0
        mov     r0, r1
        mov     r1, r2
        bl      __addsf3
        mov     r7, r0
        mov     r0, r4
        mov     r1, r8
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [sp, #4]
        mov     r1, r7
        bl      __addsf3
        str     r8, [r9, #0xC]
        str     r7, [r9, #0x10]!
        ldr     r1, [r5]
        ldr     r2, [r11]
        str     r0, [sp, #4]
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        str     r0, [r10, #0xC]
        ldr     r0, [r5, #4]
        ldr     r1, [r11, #4]
        add     r5, r5, r6, lsl #3
        bl      __subsf3
        str     r0, [r10, #0x10]!
        ldr     r1, [sp, #0x14]
        sub     r11, r11, r6, lsl #3
        subs    r1, r1, #1
        str     r1, [sp, #0x14]
        bne     LCJS1
        ldr     r5, [sp, #0x50]
        ldr     r12, [sp, #0x10]
        ldr     r9, [sp, #4]
        ldr     r3, [sp, #0x18]
        ldr     r8, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     lr, [sp, #0xC]
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
        add     r5, r12, r5, lsl #3
        str     r5, [sp, #0x14]
        b       LCJS4
LCJS2:
        cmp     lr, #1
        ble     LCJS11
        mov     r10, #1
        str     r10, [sp, #0x38]
        ldr     r10, [sp, #0x50]
        str     r9, [sp, #4]
        str     r4, [sp]
        add     r10, r12, r10, lsl #3
        str     r10, [sp, #0x14]
        ldr     r10, [sp, #0x58]
        str     r3, [sp, #0x18]
        str     r8, [sp, #0x1C]
        sub     r11, r10, #4
        sub     r10, r10, #0xC
        str     r7, [sp, #0x20]
        str     r6, [sp, #8]
        ldr     r7, [sp, #0x38]
        ldr     r6, [sp, #0x30]
        str     r10, [sp, #0x40]
        add     r10, r12, #4
        str     r11, [sp, #0x3C]
        str     r10, [sp, #0x34]
        str     lr, [sp, #0xC]
        str     r12, [sp, #0x10]
        str     r2, [sp, #0x24]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
LCJS3:
        ldr     r1, [sp, #0x34]
        ldr     r2, [sp, #0x10]
        ldr     r11, [r5]
        ldr     r8, [r1, #8]
        ldr     r10, [r5, #4]
        ldr     r4, [r2, +r7, lsl #3]
        mov     r0, r11
        mov     r1, r4
        bl      __mulsf3
        mov     r9, r0
        mov     r0, r10
        mov     r1, r8
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x70]
        mov     r1, r4
        mov     r0, r10
        bl      __mulsf3
        mov     r4, r0
        mov     r1, r8
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r4
        rsb     r8, r7, #0
        bl      __subsf3
        ldr     r2, [sp, #0x14]
        ldr     r9, [r6, #4]
        ldr     r11, [r6]
        ldr     r10, [r2, +r8, lsl #3]
        add     r8, r2, r8, lsl #3
        ldr     r8, [r8, #4]
        mov     r4, r0
        mov     r1, r10
        mov     r0, r11
        bl      __mulsf3
        str     r0, [sp, #0x74]
        mov     r1, r8
        mov     r0, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x74]
        bl      __addsf3
        str     r0, [sp, #0x74]
        mov     r1, r10
        mov     r0, r9
        bl      __mulsf3
        mov     r9, r0
        mov     r1, r8
        mov     r0, r11
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        ldr     r1, [sp, #0x74]
        mov     r8, r0
        ldr     r0, [sp, #0x70]
        add     r7, r7, #1
        bl      __addsf3
        mov     r10, r0
        mov     r1, r8
        mov     r0, r4
        bl      __addsf3
        mov     r9, r0
        ldr     r0, [sp]
        mov     r1, r10
        bl      __addsf3
        str     r0, [sp]
        ldr     r0, [sp, #4]
        mov     r1, r9
        bl      __addsf3
        ldr     r2, [sp, #0x40]
        str     r0, [sp, #4]
        str     r10, [r2, #0xC]
        str     r9, [r2, #0x10]
        ldr     r0, [sp, #0x70]
        ldr     r1, [sp, #0x74]
        bl      __subsf3
        ldr     r2, [sp, #0x3C]
        mov     r1, r8
        str     r0, [r2, #0xC]
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x3C]
        str     r0, [r1, #0x10]
        ldr     r0, [sp, #0xC]
        cmp     r7, r0
        ldr     r0, [sp, #8]
        add     r5, r5, r0, lsl #3
        sub     r6, r6, r0, lsl #3
        ldr     r0, [sp, #0x3C]
        add     r0, r0, #0x10
        str     r0, [sp, #0x3C]
        ldr     r0, [sp, #0x40]
        add     r0, r0, #0x10
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x34]
        add     r0, r0, #8
        str     r0, [sp, #0x34]
        blt     LCJS3
        ldr     r9, [sp, #4]
        ldr     r4, [sp]
        ldr     r3, [sp, #0x18]
        ldr     r8, [sp, #0x1C]
        ldr     r7, [sp, #0x20]
        ldr     lr, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
LCJS4:
        str     r4, [r1]
        cmp     lr, #1
        str     r9, [r2]
        ble     LCJS8
        ldr     r10, [sp, #0x4C]
        ldr     r11, [sp, #0x48]
        ldr     r9, [sp, #0x44]
        mov     r4, #1
        str     r3, [sp, #0x18]
        str     r8, [sp, #0x1C]
        str     r7, [sp, #0x20]
        str     lr, [sp, #0xC]
        str     r6, [sp, #8]
        str     r2, [sp, #0x24]
        str     r1, [sp, #0x28]
        str     r0, [sp, #0x2C]
LCJS5:
        ldr     r6, [sp, #0x64]
        ldr     r0, [sp, #0x68]
        ldr     r8, [sp, #0x1C]
        ldr     r7, [sp, #0x18]
        cmp     r0, #0
        mov     r5, r6
        mov     r1, r4
        ble     LCJS7
        ldr     r2, [sp, #0x60]
        ldr     r3, [sp, #0x58]
        str     r4, [sp, #0x40]
        ldr     r4, [sp, #0x50]
        mov     r0, #0
        str     r6, [sp, #0x3C]
        str     r7, [sp, #0x38]
        str     r8, [sp, #0x34]
        str     r9, [sp, #0x44]
        str     r10, [sp, #0x4C]
        str     r11, [sp, #0x48]
        mov     r8, r0
        mov     r9, r1
        mov     r7, r2
        mov     r6, r3
LCJS6:
        ldr     r12, [sp, #0x54]
        ldr     r0, [r6]
        ldr     r10, [r12, +r9, lsl #3]
        add     r11, r12, r9, lsl #3
        ldr     r12, [sp, #0x40]
        mov     r1, r10
        add     r9, r12, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        ldr     r2, [r6, #4]
        str     r0, [sp, #0x34]
        mov     r1, r10
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x38]
        bl      __addsf3
        ldr     r1, [r7, #4]
        ldr     r11, [r11, #4]
        str     r0, [sp, #0x38]
        mov     r0, r1
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [r7], #0x10
        mov     r5, r0
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x3C]
        bl      __addsf3
        cmp     r9, r4
        str     r0, [sp, #0x3C]
        subge   r9, r9, r4
        ldr     r12, [sp, #0x68]
        add     r8, r8, #2
        add     r6, r6, #0x10
        cmp     r8, r12
        blt     LCJS6
        ldr     r6, [sp, #0x3C]
        ldr     r7, [sp, #0x38]
        ldr     r8, [sp, #0x34]
        ldr     r4, [sp, #0x40]
        ldr     r10, [sp, #0x4C]
        ldr     r11, [sp, #0x48]
        ldr     r9, [sp, #0x44]
LCJS7:
        mov     r0, r8
        mov     r1, r5
        bl      __addsf3
        str     r0, [r9]
        mov     r0, r7
        mov     r1, r6
        bl      __subsf3
        str     r0, [r11]
        mov     r0, r8
        mov     r1, r5
        bl      __subsf3
        str     r0, [r10]
        mov     r0, r7
        mov     r1, r6
        bl      __addsf3
        ldr     r1, [sp, #0x6C]
        add     r4, r4, #1
        str     r0, [r1]
        ldr     r0, [sp, #0xC]
        cmp     r4, r0
        ldr     r0, [sp, #8]
        sub     r1, r1, r0, lsl #2
        str     r1, [sp, #0x6C]
        add     r9, r9, r0, lsl #2
        add     r11, r11, r0, lsl #2
        sub     r10, r10, r0, lsl #2
        blt     LCJS5
        ldr     r7, [sp, #0x20]
        ldr     lr, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r2, [sp, #0x24]
        ldr     r1, [sp, #0x28]
        ldr     r0, [sp, #0x2C]
LCJS8:
        ldr     r12, [sp, #0x14]
        add     r7, r7, #1
        cmp     r7, r6
        add     r0, r0, #8
        add     r1, r1, #4
        add     r2, r2, #4
        blt     LCJS0
LCJS9:
        add     sp, sp, #0x78
        ldmia   sp!, {r4 - r11, pc}
LCJS10:
        ldr     r5, [sp, #0x50]
        add     r5, r12, r5, lsl #3
        str     r5, [sp, #0x14]
        b       LCJS4
LCJS11:
        ldr     r5, [sp, #0x50]
        add     r5, r12, r5, lsl #3
        str     r5, [sp, #0x14]
        b       LCJS4
        .long   LCJS__2il0floatpacket.1


        .data
        .align  4


LCJS__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


