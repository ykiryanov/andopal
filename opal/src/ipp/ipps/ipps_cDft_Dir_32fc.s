        .text
        .align  4
        .globl  _ipps_cDft_Dir_32fc


_ipps_cDft_Dir_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x50
        ldr     r12, [sp, #0x74]
        str     r0, [sp, #0x1C]
        str     r12, [sp, #0x4C]
        ldr     r6, [r0]
        ldr     r5, [r0, #4]
        ldr     r10, [sp, #0x78]
        mov     r8, r2
        tst     r8, #1
        mov     r7, r1
        str     r3, [sp, #0x48]
        beq     LCLU6
        add     r3, r8, #1
        mov     r12, r5
        mov     r4, r3, asr #1
        cmp     r4, #1
        mov     r3, r6
        ble     LCLU1
        ldr     lr, [sp, #0x1C]
        mov     r1, #1
        sub     r2, r10, #4
        add     r0, lr, r8, lsl #3
        str     r6, [sp, #0x2C]
        str     r8, [sp, #0x34]
        str     r7, [sp, #0x38]
        add     r9, lr, #4
        sub     r11, r10, #0xC
        str     r12, [sp, #0x44]
        str     r3, [sp, #0x40]
        str     r4, [sp, #0x24]
        str     r5, [sp, #0x28]
        str     r10, [sp, #0x30]
        mov     r7, r0
        mov     r8, r1
        mov     r6, r2
LCLU0:
        rsb     r3, r8, #0
        str     r3, [sp, #0x3C]
        ldr     r1, [r7, +r3, lsl #3]
        ldr     r0, [r9, #4]
        add     r10, r7, r3, lsl #3
        add     r8, r8, #1
        bl      __addsf3
        ldr     r1, [r9, #8]
        ldr     r2, [r10, #4]
        mov     r5, r0
        mov     r0, r1
        mov     r1, r2
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [sp, #0x40]
        mov     r1, r5
        bl      __addsf3
        str     r0, [sp, #0x40]
        ldr     r0, [sp, #0x44]
        mov     r1, r4
        bl      __addsf3
        str     r5, [r11, #0xC]
        str     r4, [r11, #0x10]!
        ldr     r3, [sp, #0x3C]
        ldr     r1, [r9, #4]
        ldr     r2, [r7, +r3, lsl #3]
        str     r0, [sp, #0x44]
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        str     r0, [r6, #0xC]
        ldr     r0, [r9, #8]!
        ldr     r1, [r10, #4]
        bl      __subsf3
        str     r0, [r6, #0x10]!
        ldr     r3, [sp, #0x24]
        cmp     r8, r3
        blt     LCLU0
        ldr     r12, [sp, #0x44]
        ldr     r3, [sp, #0x40]
        ldr     r4, [sp, #0x24]
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
        ldr     r8, [sp, #0x34]
        ldr     r7, [sp, #0x38]
LCLU1:
        cmp     r4, #1
        str     r3, [r7]
        str     r12, [r7, #4]
        ble     LCLU15
        ldr     r3, [pc, #0x618]
        mov     r11, #1
        add     r9, r7, r8, lsl #3
        ldr     r3, [r3]
        add     r1, r10, #8
        sub     r12, r8, #1
        add     r7, r7, #8
        str     r12, [sp, #0x10]
        str     r1, [sp, #0x18]
        str     r3, [sp, #0x20]
        str     r5, [sp, #0x28]
        str     r6, [sp, #0x2C]
        str     r10, [sp, #0x30]
        str     r8, [sp, #0x34]
LCLU2:
        ldr     r8, [sp, #0x20]
        ldr     r0, [sp, #0x10]
        ldr     r10, [sp, #0x2C]
        ldr     r6, [sp, #0x28]
        cmp     r0, #0
        mov     r5, r8
        mov     r0, r11
        ble     LCLU4
        ldr     r2, [sp, #0x18]
        ldr     r3, [sp, #0x30]
        str     r8, [sp, #8]
        ldr     r8, [sp, #0x34]
        mov     r1, #0
        str     r6, [sp, #4]
        str     r10, [sp]
        str     r7, [sp, #0x14]
        str     r4, [sp, #0x24]
        str     r9, [sp, #0x1C]
        str     r11, [sp, #0xC]
        mov     r7, r0
        mov     r6, r1
        mov     r4, r2
        mov     r10, r3
LCLU3:
        ldr     r12, [sp, #0x4C]
        ldr     r0, [r10]
        ldr     r9, [r12, +r7, lsl #3]
        add     r11, r12, r7, lsl #3
        ldr     r12, [sp, #0xC]
        mov     r1, r9
        add     r7, r12, r7
        bl      __mulsf3
        ldr     r1, [sp]
        bl      __addsf3
        ldr     r2, [r10, #4]
        str     r0, [sp]
        mov     r1, r9
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #4]
        bl      __addsf3
        ldr     r1, [r4, #4]
        ldr     r11, [r11, #4]
        str     r0, [sp, #4]
        mov     r0, r1
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r5
        bl      __addsf3
        ldr     r2, [r4], #0x10
        mov     r5, r0
        mov     r1, r11
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #8]
        bl      __addsf3
        cmp     r7, r8
        str     r0, [sp, #8]
        subge   r7, r7, r8
        ldr     r12, [sp, #0x10]
        add     r6, r6, #2
        add     r10, r10, #0x10
        cmp     r6, r12
        blt     LCLU3
        ldr     r8, [sp, #8]
        ldr     r6, [sp, #4]
        ldr     r10, [sp]
        ldr     r7, [sp, #0x14]
        ldr     r9, [sp, #0x1C]
        ldr     r11, [sp, #0xC]
        ldr     r4, [sp, #0x24]
LCLU4:
        ldr     r2, [sp, #0x48]
        cmp     r2, #0
        ble     LCLU16
        mov     r0, r10
        mov     r1, r5
        bl      __subsf3
        str     r0, [r7]
        mov     r0, r6
        mov     r1, r8
        bl      __addsf3
        str     r0, [r7, #4]
        mov     r1, r5
        mov     r0, r10
        bl      __addsf3
        rsb     r5, r11, #0
        str     r0, [r9, +r5, lsl #3]
        mov     r0, r6
        mov     r1, r8
        bl      __subsf3
LCLU5:
        add     r11, r11, #1
        add     r5, r9, r5, lsl #3
        cmp     r11, r4
        str     r0, [r5, #4]
        add     r7, r7, #8
        blt     LCLU2
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LCLU6:
        ldr     r3, [sp, #0x1C]
        mov     r9, r8, asr #1
        mov     r0, r6
        ldr     r11, [r3, +r9, lsl #3]
        add     r3, r3, r9, lsl #3
        ldr     r4, [r3, #4]
        mov     r1, r11
        bl      __addsf3
        str     r0, [sp, #0x3C]
        mov     r0, r5
        mov     r1, r4
        bl      __addsf3
        ldr     r3, [sp, #0x3C]
        str     r0, [sp, #0x40]
        cmp     r9, #1
        mov     r1, r6
        str     r5, [sp, #0x10]
        ble     LCLU8
        mov     r12, #1
        str     r12, [sp, #0x18]
        ldr     r12, [sp, #0x1C]
        sub     lr, r10, #4
        str     lr, [sp, #0x20]
        sub     lr, r10, #0xC
        str     lr, [sp, #0x24]
        str     r11, [sp, #0x14]
        str     r9, [sp]
        str     r10, [sp, #0x30]
        ldr     r9, [sp, #0x24]
        ldr     r10, [sp, #0x20]
        ldr     r11, [sp, #0x18]
        add     r2, r12, r8, lsl #3
        add     r12, r12, #4
        str     r6, [sp, #0x2C]
        str     r7, [sp, #0x38]
        str     r1, [sp, #4]
        str     r0, [sp, #8]
        str     r3, [sp, #0x44]
        str     r4, [sp, #0xC]
        str     r5, [sp, #0x28]
        str     r8, [sp, #0x34]
        mov     r7, r2
        mov     r6, r12
LCLU7:
        rsb     r3, r11, #0
        str     r3, [sp, #0x1C]
        ldr     r1, [r7, +r3, lsl #3]
        ldr     r0, [r6, #4]
        add     r8, r7, r3, lsl #3
        add     r11, r11, #1
        bl      __addsf3
        ldr     r2, [r6, #8]
        ldr     r1, [r8, #4]
        mov     r5, r0
        mov     r0, r2
        bl      __addsf3
        mov     r4, r0
        ldr     r0, [sp, #0x44]
        mov     r1, r5
        bl      __addsf3
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #8]
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #4]
        str     r0, [sp, #8]
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp, #0x10]
        str     r0, [sp, #4]
        mov     r0, r4
        bl      __subsf3
        str     r5, [r9, #0xC]
        str     r4, [r9, #0x10]!
        ldr     r3, [sp, #0x1C]
        ldr     r1, [r6, #4]
        ldr     r2, [r7, +r3, lsl #3]
        str     r0, [sp, #0x10]
        mov     r0, r1
        mov     r1, r2
        bl      __subsf3
        str     r0, [r10, #0xC]
        ldr     r0, [r6, #8]!
        ldr     r1, [r8, #4]
        bl      __subsf3
        str     r0, [r10, #0x10]!
        ldr     r0, [sp]
        cmp     r11, r0
        blt     LCLU7
        ldr     r1, [sp, #4]
        ldr     r0, [sp, #8]
        ldr     r3, [sp, #0x44]
        ldr     r4, [sp, #0xC]
        ldr     r11, [sp, #0x14]
        ldr     r9, [sp]
        ldr     r5, [sp, #0x28]
        ldr     r6, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
        ldr     r8, [sp, #0x34]
        ldr     r7, [sp, #0x38]
LCLU8:
        str     r3, [r7]
        str     r0, [r7, #4]
        add     r3, r7, r9, lsl #3
        tst     r9, #1
        str     r3, [sp, #0x24]
        beq     LCLU9
        mov     r0, r1
        mov     r1, r11
        bl      __subsf3
        str     r0, [r7, +r9, lsl #3]
        ldr     r0, [sp, #0x10]
        mov     r1, r4
        bl      __subsf3
        b       LCLU10
LCLU9:
        mov     r0, r11
        bl      __subsf3
        str     r0, [r7, +r9, lsl #3]
        ldr     r1, [sp, #0x10]
        mov     r0, r4
        bl      __subsf3
LCLU10:
        ldr     r3, [sp, #0x24]
        cmp     r9, #1
        str     r0, [r3, #4]
        ble     LCLU15
        mov     r0, r6
        mov     r1, r11
        ldr     r3, [pc, #0x268]
        ldr     r11, [r3]
        bl      __subsf3
        mov     r6, r0
        mov     r1, r4
        mov     r0, r5
        bl      __subsf3
        mov     r1, r0
        add     r4, r7, r8, lsl #3
        add     r3, r10, #8
        mov     r0, #1
        add     r7, r7, #8
        str     r9, [sp]
        str     r10, [sp, #0x30]
        sub     r5, r8, #2
        str     r1, [sp, #0x14]
        str     r6, [sp, #0x10]
        str     r3, [sp, #0xC]
        str     r11, [sp, #4]
        str     r8, [sp, #0x34]
        mov     r9, r0
        mov     r10, r7
LCLU11:
        tst     r9, #1
        ldreq   r11, [sp, #0x3C]
        ldreq   r7, [sp, #0x40]
        ldrne   r11, [sp, #0x10]
        ldrne   r7, [sp, #0x14]
        ldr     r8, [sp, #4]
        cmp     r5, #0
        mov     r0, r9
        mov     r6, r8
        ble     LCLU13
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x30]
        str     r8, [sp, #0x24]
        ldr     r8, [sp, #0x34]
        mov     r1, #0
        str     r7, [sp, #0x28]
        str     r11, [sp, #0x2C]
        str     r4, [sp, #8]
        str     r5, [sp, #0x1C]
        str     r10, [sp, #0x18]
        str     r9, [sp, #0x20]
        mov     r7, r0
        mov     r5, r1
        mov     r4, r2
        mov     r11, r3
LCLU12:
        ldr     r12, [sp, #0x4C]
        ldr     r0, [r11]
        ldr     r9, [r12, +r7, lsl #3]
        add     r10, r12, r7, lsl #3
        ldr     r12, [sp, #0x20]
        mov     r1, r9
        add     r7, r12, r7
        bl      __mulsf3
        ldr     r1, [sp, #0x2C]
        bl      __addsf3
        ldr     r2, [r11, #4]
        str     r0, [sp, #0x2C]
        mov     r1, r9
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x28]
        bl      __addsf3
        ldr     r1, [r4, #4]
        ldr     r10, [r10, #4]
        str     r0, [sp, #0x28]
        mov     r0, r1
        mov     r1, r10
        bl      __mulsf3
        mov     r1, r6
        bl      __addsf3
        ldr     r2, [r4], #0x10
        mov     r6, r0
        mov     r1, r10
        mov     r0, r2
        bl      __mulsf3
        ldr     r1, [sp, #0x24]
        bl      __addsf3
        cmp     r7, r8
        str     r0, [sp, #0x24]
        subge   r7, r7, r8
        ldr     r12, [sp, #0x1C]
        add     r5, r5, #2
        add     r11, r11, #0x10
        cmp     r5, r12
        blt     LCLU12
        ldr     r8, [sp, #0x24]
        ldr     r7, [sp, #0x28]
        ldr     r11, [sp, #0x2C]
        ldr     r10, [sp, #0x18]
        ldr     r4, [sp, #8]
        ldr     r5, [sp, #0x1C]
        ldr     r9, [sp, #0x20]
LCLU13:
        ldr     r2, [sp, #0x48]
        cmp     r2, #0
        ble     LCLU17
        mov     r0, r11
        mov     r1, r6
        bl      __subsf3
        str     r0, [r10]
        mov     r0, r7
        mov     r1, r8
        bl      __addsf3
        str     r0, [r10, #4]
        mov     r1, r6
        mov     r0, r11
        bl      __addsf3
        rsb     r6, r9, #0
        str     r0, [r4, +r6, lsl #3]
        mov     r0, r7
        mov     r1, r8
        bl      __subsf3
LCLU14:
        ldr     r1, [sp]
        add     r9, r9, #1
        add     r6, r4, r6, lsl #3
        cmp     r9, r1
        str     r0, [r6, #4]
        add     r10, r10, #8
        blt     LCLU11
LCLU15:
        add     sp, sp, #0x50
        ldmia   sp!, {r4 - r11, pc}
LCLU16:
        mov     r0, r10
        mov     r1, r5
        bl      __addsf3
        str     r0, [r7]
        mov     r0, r6
        mov     r1, r8
        bl      __subsf3
        str     r0, [r7, #4]
        mov     r1, r5
        mov     r0, r10
        bl      __subsf3
        rsb     r5, r11, #0
        str     r0, [r9, +r5, lsl #3]
        mov     r0, r6
        mov     r1, r8
        bl      __addsf3
        b       LCLU5
LCLU17:
        mov     r0, r11
        mov     r1, r6
        bl      __addsf3
        str     r0, [r10]
        mov     r0, r7
        mov     r1, r8
        bl      __subsf3
        str     r0, [r10, #4]
        mov     r1, r6
        mov     r0, r11
        bl      __subsf3
        rsb     r6, r9, #0
        str     r0, [r4, +r6, lsl #3]
        mov     r0, r7
        mov     r1, r8
        bl      __addsf3
        b       LCLU14
        .long   LCLU__2il0floatpacket.1


        .data
        .align  4


LCLU__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


