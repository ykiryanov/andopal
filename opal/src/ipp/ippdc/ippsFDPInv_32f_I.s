        .text
        .align  4
        .globl  _ippsFDPInv_32f_I


_ippsFDPInv_32f_I:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x58
        ldr     r5, [sp, #0x7C]
        cmp     r0, #0
        beq     LGEZ7
        cmp     r1, #0
        beq     LGEZ7
        cmp     r5, #0
        beq     LGEZ7
        cmp     r3, #0
        beq     LGEZ7
        cmp     r2, #0
        ble     LGEZ8
        ldr     r12, [r5, #0x1C]
        cmp     r12, #0x3B
        beq     LGEZ0
        mvn     r0, #0x10
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LGEZ0:
        cmp     r2, #0
        ble     LGEZ5
        ldr     r4, [pc, #0x3D4]
        ldr     lr, [pc, #0x3D4]
        ldr     r12, [pc, #0x3D4]
        ldr     r6, [pc, #0x3D4]
        ldr     r4, [r4]
        ldr     r7, [lr]
        ldr     r8, [r12]
        add     r9, r6, #2, 24
        mov     lr, #0
        add     r12, r1, #4
        str     r9, [sp, #0x28]
        str     r8, [sp, #0x24]
        str     r7, [sp, #0x20]
        str     r3, [sp, #0x18]
LGEZ1:
        ldr     r8, [r1], #4
        ldr     r3, [r12], #4
        cmp     r8, r3
        bge     LGEZ4
        mov     r7, r8
        add     r6, r0, r8, lsl #2
        str     r3, [sp, #0x14]
        str     r1, [sp, #0xC]
        str     r12, [sp, #8]
        str     lr, [sp, #0x10]
        str     r2, [sp, #4]
        str     r0, [sp]
LGEZ2:
        ldr     r2, [r5, #8]
        add     r12, sp, #0x50
        ldr     lr, [r2, +r8, lsl #2]
        str     lr, [sp, #0x1C]
        ldr     r3, [r5]
        ldr     r9, [r5, #0x10]
        str     r3, [sp, #0x3C]
        ldr     r2, [r5, #4]
        str     lr, [sp, #0x50]
        ldr     r12, [r12]
        ldr     r10, [r9, +r8, lsl #2]
        ldr     r0, [r3, +r8, lsl #2]
        ldr     lr, [r5, #0xC]
        add     r3, sp, #0x4C
        mov     r12, r12, lsr #16
        str     r0, [sp, #0x34]
        ldr     r2, [r2, +r8, lsl #2]
        mov     r12, r12, lsl #16
        str     r2, [sp, #0x38]
        ldr     r2, [lr, +r8, lsl #2]
        str     r2, [sp, #0x2C]
        ldr     lr, [r5, #0x14]
        str     r2, [sp, #0x4C]
        mov     r2, r12, asr #16
        ldr     r11, [lr, +r8, lsl #2]
        ldr     r12, [pc, #0x314]
        ldr     r3, [r3]
        and     lr, r2, #0x7F
        bic     r2, r2, #0x7F
        ldr     r1, [r12, +lr, lsl #2]
        mov     r3, r3, lsr #16
        str     r2, [sp, #0x40]
        mov     r9, r3, lsl #16
        bl      __mulsf3
        ldr     r2, [sp, #0x28]
        ldr     r3, [sp, #0x40]
        mov     r9, r9, asr #16
        ldr     r1, [r2, +r3, asr #5]
        and     r2, r9, #0x7F
        str     r2, [sp, #0x40]
        bic     r9, r9, #0x7F
        bl      __mulsf3
        ldr     r2, [pc, #0x2D0]
        ldr     r3, [sp, #0x40]
        ldr     r1, [r2, +r3, lsl #2]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x38]
        bl      __mulsf3
        ldr     r2, [sp, #0x28]
        ldr     r1, [r2, +r9, asr #5]
        bl      __mulsf3
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x30]
        mov     r1, r10
        bl      __mulsf3
        mov     r9, r0
        ldr     r0, [sp, #0x44]
        str     r9, [sp, #0x40]
        mov     r1, r11
        bl      __mulsf3
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x48]
        ldr     r9, [sp, #0x10]
        add     r3, sp, #0x48
        ldr     r12, [r3]
        mov     r2, #0xFF
        orr     lr, r2, #0xFF, 24
        ldr     r2, [sp, #0x18]
        add     r12, r12, #2, 18
        bic     lr, r12, lr
        str     lr, [sp, #0x54]
        ldrb    r2, [r2, +r9]
        add     r3, sp, #0x54
        ldr     r0, [r3]
        cmp     r2, #0
        ldreq   r9, [r6]
        beq     LGEZ3
        ldr     r1, [r6]
        bl      __addsf3
        mov     r9, r0
        str     r9, [r6]
        ldr     r2, [r5]
        str     r2, [sp, #0x3C]
LGEZ3:
        mov     r0, r9
        ldr     r1, [sp, #0x40]
        add     r6, r6, #4
        add     r8, r8, #1
        bl      __subsf3
        str     r0, [sp, #0x44]
        ldr     r0, [sp, #0x34]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [sp, #0x40]
        mov     r0, r10
        mov     r1, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        ldr     r2, [sp, #0x3C]
        mov     r1, r4
        str     r0, [r2, +r7, lsl #2]
        ldr     r0, [sp, #0x38]
        bl      __mulsf3
        ldr     r1, [sp, #0x44]
        str     r0, [sp, #0x40]
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        ldr     r2, [r5, #4]
        mov     r1, r4
        str     r0, [r2, +r7, lsl #2]
        ldr     r0, [sp, #0x1C]
        bl      __mulsf3
        str     r0, [sp, #0x40]
        mov     r0, r10
        mov     r1, r10
        bl      __mulsf3
        str     r0, [sp, #0x3C]
        mov     r0, r9
        mov     r1, r9
        bl      __mulsf3
        ldr     r1, [sp, #0x3C]
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        bl      __mulsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        ldr     r2, [r5, #8]
        mov     r1, r0
        ldr     r0, [sp, #0x2C]
        str     r1, [r2, +r7, lsl #2]
        mov     r1, r4
        bl      __mulsf3
        str     r0, [sp, #0x40]
        mov     r1, r11
        mov     r0, r11
        bl      __mulsf3
        ldr     r1, [sp, #0x44]
        mov     r11, r0
        mov     r0, r1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        ldr     r1, [sp, #0x20]
        bl      __mulsf3
        ldr     r1, [sp, #0x40]
        bl      __addsf3
        ldr     r2, [r5, #0xC]
        mov     r1, r0
        ldr     r0, [sp, #0x30]
        str     r1, [r2, +r7, lsl #2]
        mov     r1, r9
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r10
        bl      __subsf3
        ldr     r10, [sp, #0x24]
        mov     r1, r10
        bl      __mulsf3
        ldr     r2, [r5, #0x14]
        mov     r1, r0
        mov     r0, r9
        str     r1, [r2, +r7, lsl #2]
        mov     r1, r10
        bl      __mulsf3
        ldr     r2, [r5, #0x10]
        mov     r3, #0xFF
        str     r0, [r2, +r7, lsl #2]
        ldr     r2, [r5]
        orr     r0, r3, #0xFF, 24
        ldr     r3, [sp, #0x14]
        ldr     r12, [r2, +r7, lsl #2]
        bic     r12, r12, r0
        str     r12, [r2, +r7, lsl #2]
        ldr     r2, [r5, #4]
        cmp     r8, r3
        ldr     r3, [r2, +r7, lsl #2]
        bic     r3, r3, r0
        str     r3, [r2, +r7, lsl #2]
        ldr     r2, [r5, #8]
        ldr     r3, [r2, +r7, lsl #2]
        bic     r3, r3, r0
        str     r3, [r2, +r7, lsl #2]
        ldr     r2, [r5, #0xC]
        ldr     r3, [r2, +r7, lsl #2]
        bic     r3, r3, r0
        str     r3, [r2, +r7, lsl #2]
        ldr     r2, [r5, #0x10]
        ldr     r3, [r2, +r7, lsl #2]
        bic     r3, r3, r0
        str     r3, [r2, +r7, lsl #2]
        ldr     r2, [r5, #0x14]
        ldr     r3, [r2, +r7, lsl #2]
        bic     r0, r3, r0
        str     r0, [r2, +r7, lsl #2]
        add     r7, r7, #1
        blt     LGEZ2
        ldr     r1, [sp, #0xC]
        ldr     r12, [sp, #8]
        ldr     lr, [sp, #0x10]
        ldr     r2, [sp, #4]
        ldr     r0, [sp]
LGEZ4:
        add     lr, lr, #1
        cmp     lr, r2
        blt     LGEZ1
LGEZ5:
        tst     r0, #0xF
        beq     LGEZ6
        mov     r0, #2
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LGEZ6:
        mov     r0, #0
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LGEZ7:
        mvn     r0, #7
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
LGEZ8:
        mvn     r0, #5
        add     sp, sp, #0x58
        ldmia   sp!, {r4 - r11, pc}
        .long   LGEZ__2il0floatpacket.1
        .long   LGEZ__2il0floatpacket.2
        .long   LGEZ__2il0floatpacket.3
        .long   LGEZ_ao_mnt_table


        .data
        .align  4


LGEZ__2il0floatpacket.1:
        .byte   0x00,0x00,0x68,0x3F
LGEZ__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0x3F
LGEZ__2il0floatpacket.3:
        .byte   0x00,0x00,0x74,0x3F


        .data
        .align  4


LGEZ_ao_mnt_table:
        .byte   0x00,0x00,0x74,0x3F,0x00,0x00,0x72,0x3F,0x00,0x00,0x70,0x3F,0x00,0x00,0x6E,0x3F
        .byte   0x00,0x00,0x6D,0x3F,0x00,0x00,0x6B,0x3F,0x00,0x00,0x69,0x3F,0x00,0x00,0x67,0x3F
        .byte   0x00,0x00,0x66,0x3F,0x00,0x00,0x64,0x3F,0x00,0x00,0x62,0x3F,0x00,0x00,0x61,0x3F
        .byte   0x00,0x00,0x5F,0x3F,0x00,0x00,0x5E,0x3F,0x00,0x00,0x5C,0x3F,0x00,0x00,0x5A,0x3F
        .byte   0x00,0x00,0x59,0x3F,0x00,0x00,0x57,0x3F,0x00,0x00,0x56,0x3F,0x00,0x00,0x54,0x3F
        .byte   0x00,0x00,0x53,0x3F,0x00,0x00,0x52,0x3F,0x00,0x00,0x50,0x3F,0x00,0x00,0x4F,0x3F
        .byte   0x00,0x00,0x4D,0x3F,0x00,0x00,0x4C,0x3F,0x00,0x00,0x4B,0x3F,0x00,0x00,0x49,0x3F
        .byte   0x00,0x00,0x48,0x3F,0x00,0x00,0x47,0x3F,0x00,0x00,0x46,0x3F,0x00,0x00,0x44,0x3F
        .byte   0x00,0x00,0x43,0x3F,0x00,0x00,0x42,0x3F,0x00,0x00,0x41,0x3F,0x00,0x00,0x40,0x3F
        .byte   0x00,0x00,0x3E,0x3F,0x00,0x00,0x3D,0x3F,0x00,0x00,0x3C,0x3F,0x00,0x00,0x3B,0x3F
        .byte   0x00,0x00,0x3A,0x3F,0x00,0x00,0x39,0x3F,0x00,0x00,0x38,0x3F,0x00,0x00,0x37,0x3F
        .byte   0x00,0x00,0x36,0x3F,0x00,0x00,0x35,0x3F,0x00,0x00,0x33,0x3F,0x00,0x00,0x32,0x3F
        .byte   0x00,0x00,0x31,0x3F,0x00,0x00,0x30,0x3F,0x00,0x00,0x2F,0x3F,0x00,0x00,0x2E,0x3F
        .byte   0x00,0x00,0x2E,0x3F,0x00,0x00,0x2D,0x3F,0x00,0x00,0x2C,0x3F,0x00,0x00,0x2B,0x3F
        .byte   0x00,0x00,0x2A,0x3F,0x00,0x00,0x29,0x3F,0x00,0x00,0x28,0x3F,0x00,0x00,0x27,0x3F
        .byte   0x00,0x00,0x26,0x3F,0x00,0x00,0x25,0x3F,0x00,0x00,0x24,0x3F,0x00,0x00,0x24,0x3F
        .byte   0x00,0x00,0x23,0x3F,0x00,0x00,0x22,0x3F,0x00,0x00,0x21,0x3F,0x00,0x00,0x20,0x3F
        .byte   0x00,0x00,0x1F,0x3F,0x00,0x00,0x1F,0x3F,0x00,0x00,0x1E,0x3F,0x00,0x00,0x1D,0x3F
        .byte   0x00,0x00,0x1C,0x3F,0x00,0x00,0x1B,0x3F,0x00,0x00,0x1B,0x3F,0x00,0x00,0x1A,0x3F
        .byte   0x00,0x00,0x19,0x3F,0x00,0x00,0x18,0x3F,0x00,0x00,0x18,0x3F,0x00,0x00,0x17,0x3F
        .byte   0x00,0x00,0x16,0x3F,0x00,0x00,0x15,0x3F,0x00,0x00,0x15,0x3F,0x00,0x00,0x14,0x3F
        .byte   0x00,0x00,0x13,0x3F,0x00,0x00,0x13,0x3F,0x00,0x00,0x12,0x3F,0x00,0x00,0x11,0x3F
        .byte   0x00,0x00,0x11,0x3F,0x00,0x00,0x10,0x3F,0x00,0x00,0x0F,0x3F,0x00,0x00,0x0F,0x3F
        .byte   0x00,0x00,0x0E,0x3F,0x00,0x00,0x0D,0x3F,0x00,0x00,0x0D,0x3F,0x00,0x00,0x0C,0x3F
        .byte   0x00,0x00,0x0B,0x3F,0x00,0x00,0x0B,0x3F,0x00,0x00,0x0A,0x3F,0x00,0x00,0x0A,0x3F
        .byte   0x00,0x00,0x09,0x3F,0x00,0x00,0x08,0x3F,0x00,0x00,0x08,0x3F,0x00,0x00,0x07,0x3F
        .byte   0x00,0x00,0x07,0x3F,0x00,0x00,0x06,0x3F,0x00,0x00,0x05,0x3F,0x00,0x00,0x05,0x3F
        .byte   0x00,0x00,0x04,0x3F,0x00,0x00,0x04,0x3F,0x00,0x00,0x03,0x3F,0x00,0x00,0x03,0x3F
        .byte   0x00,0x00,0x02,0x3F,0x00,0x00,0x02,0x3F,0x00,0x00,0x01,0x3F,0x00,0x00,0x01,0x3F
        .byte   0x00,0x00,0x00,0x3F,0x00,0x00,0xFF,0x3E,0x00,0x00,0xFE,0x3E,0x00,0x00,0xFD,0x3E
        .byte   0x00,0x00,0xFC,0x3E,0x00,0x00,0xFB,0x3E,0x00,0x00,0xFA,0x3E,0x00,0x00,0xF9,0x3E
        .byte   0x00,0x00,0xF8,0x3E,0x00,0x00,0xF7,0x3E,0x00,0x00,0xF6,0x3E,0x00,0x00,0xF5,0x3E
LGEZ_ao_exp_table:
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x3F,0x00,0x00,0x80,0x3E,0x00,0x00,0x00,0x3E,0x00,0x00,0x80,0x3D
        .byte   0x00,0x00,0x00,0x3D,0x00,0x00,0x80,0x3C,0x00,0x00,0x00,0x3C,0x00,0x00,0x80,0x3B
        .byte   0x00,0x00,0x00,0x3B,0x00,0x00,0x80,0x3A,0x00,0x00,0x00,0x3A,0x00,0x00,0x80,0x39
        .byte   0x00,0x00,0x00,0x39,0x00,0x00,0x80,0x38,0x00,0x00,0x00,0x38,0x00,0x00,0x80,0x37
        .byte   0x00,0x00,0x00,0x37,0x00,0x00,0x80,0x36,0x00,0x00,0x00,0x36,0x00,0x00,0x80,0x35
        .byte   0x00,0x00,0x00,0x35,0x00,0x00,0x80,0x34,0x00,0x00,0x00,0x34,0x00,0x00,0x80,0x33
        .byte   0x00,0x00,0x00,0x33,0x00,0x00,0x80,0x32,0x00,0x00,0x00,0x32,0x00,0x00,0x80,0x31
        .byte   0x00,0x00,0x00,0x31,0x00,0x00,0x80,0x30,0x00,0x00,0x00,0x30,0x00,0x00,0x80,0x2F
        .byte   0x00,0x00,0x00,0x2F,0x00,0x00,0x80,0x2E,0x00,0x00,0x00,0x2E,0x00,0x00,0x80,0x2D
        .byte   0x00,0x00,0x00,0x2D,0x00,0x00,0x80,0x2C,0x00,0x00,0x00,0x2C,0x00,0x00,0x80,0x2B
        .byte   0x00,0x00,0x00,0x2B,0x00,0x00,0x80,0x2A,0x00,0x00,0x00,0x2A,0x00,0x00,0x80,0x29
        .byte   0x00,0x00,0x00,0x29,0x00,0x00,0x80,0x28,0x00,0x00,0x00,0x28,0x00,0x00,0x80,0x27
        .byte   0x00,0x00,0x00,0x27,0x00,0x00,0x80,0x26,0x00,0x00,0x00,0x26,0x00,0x00,0x80,0x25
        .byte   0x00,0x00,0x00,0x25,0x00,0x00,0x80,0x24,0x00,0x00,0x00,0x24,0x00,0x00,0x80,0x23
        .byte   0x00,0x00,0x00,0x23,0x00,0x00,0x80,0x22,0x00,0x00,0x00,0x22,0x00,0x00,0x80,0x21
        .byte   0x00,0x00,0x00,0x21,0x00,0x00,0x80,0x20,0x00,0x00,0x00,0x20,0x00,0x00,0x80,0x1F
        .byte   0x00,0x00,0x00,0x1F,0x00,0x00,0x80,0x1E,0x00,0x00,0x00,0x1E,0x00,0x00,0x80,0x1D
        .byte   0x00,0x00,0x00,0x1D,0x00,0x00,0x80,0x1C,0x00,0x00,0x00,0x1C,0x00,0x00,0x80,0x1B
        .byte   0x00,0x00,0x00,0x1B,0x00,0x00,0x80,0x1A,0x00,0x00,0x00,0x1A,0x00,0x00,0x80,0x19
        .byte   0x00,0x00,0x00,0x19,0x00,0x00,0x80,0x18,0x00,0x00,0x00,0x18,0x00,0x00,0x80,0x17
        .byte   0x00,0x00,0x00,0x17,0x00,0x00,0x80,0x16,0x00,0x00,0x00,0x16,0x00,0x00,0x80,0x15
        .byte   0x00,0x00,0x00,0x15,0x00,0x00,0x80,0x14,0x00,0x00,0x00,0x14,0x00,0x00,0x80,0x13
        .byte   0x00,0x00,0x00,0x13,0x00,0x00,0x80,0x12,0x00,0x00,0x00,0x12,0x00,0x00,0x80,0x11
        .byte   0x00,0x00,0x00,0x11,0x00,0x00,0x80,0x10,0x00,0x00,0x00,0x10,0x00,0x00,0x80,0x0F
        .byte   0x00,0x00,0x00,0x0F,0x00,0x00,0x80,0x0E,0x00,0x00,0x00,0x0E,0x00,0x00,0x80,0x0D
        .byte   0x00,0x00,0x00,0x0D,0x00,0x00,0x80,0x0C,0x00,0x00,0x00,0x0C,0x00,0x00,0x80,0x0B
        .byte   0x00,0x00,0x00,0x0B,0x00,0x00,0x80,0x0A,0x00,0x00,0x00,0x0A,0x00,0x00,0x80,0x09
        .byte   0x00,0x00,0x00,0x09,0x00,0x00,0x80,0x08,0x00,0x00,0x00,0x08,0x00,0x00,0x80,0x07
        .byte   0x00,0x00,0x00,0x07,0x00,0x00,0x80,0x06,0x00,0x00,0x00,0x06,0x00,0x00,0x80,0x05
        .byte   0x00,0x00,0x00,0x05,0x00,0x00,0x80,0x04,0x00,0x00,0x00,0x04,0x00,0x00,0x80,0x03
        .byte   0x00,0x00,0x00,0x03,0x00,0x00,0x80,0x02,0x00,0x00,0x00,0x02,0x00,0x00,0x80,0x01
        .byte   0x00,0x00,0x00,0x01,0x00,0x00,0x80,0x00,0x00,0x00,0x40,0x00,0x00,0x00,0x00,0x00

