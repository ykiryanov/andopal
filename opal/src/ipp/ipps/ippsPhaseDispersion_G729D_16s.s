        .text
        .align  4
        .globl  _ippsPhaseDispersion_G729D_16s


_ippsPhaseDispersion_G729D_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x5E, 30
        add     lr, sp, #0x68
        ldr     r5, [sp, #0x19C]
        and     lr, lr, #0x1F
        ldr     r8, [sp, #0x1A0]
        rsb     lr, lr, #0
        mov     r10, r0
        add     r12, sp, #0x68
        and     lr, lr, #0x1F
        cmp     r10, #0
        add     r4, r12, lr
        mov     r7, r1
        mov     r6, r2
        mov     r9, r3
        beq     LDFD20
        cmp     r7, #0
        beq     LDFD20
        cmp     r5, #0
        beq     LDFD20
        cmp     r8, #0
        beq     LDFD20
        mov     r12, #0xE
        str     r12, [sp]
        mov     r1, r6
        mov     r0, r5
        mov     r2, r4
        mov     r3, #0x28
        bl      _ippsMulC_NR_16s_Sfs
        add     r2, sp, #0x18
        mov     r1, r10
        mov     r0, r4
        mov     r3, #0x28
        bl      _ippsSub_16s
        add     r1, sp, #0x4A, 30
        mov     r0, r5
        mov     r2, #0x28
        bl      _ippsCopy_16s
        mov     r1, #0x28
        mov     r0, r5
        bl      _ippsZero_16s
        mov     r12, #0
        mov     lr, r12
        mov     r1, lr
        mov     r0, r1
LDFD0:
        add     r10, sp, #0x4A, 30
        ldrsh   r10, [r10, +r0]
        cmp     r10, #0
        beq     LDFD1
        mov     r11, lr
        add     r10, sp, #0xD8
        mov     r11, r11, lsl #16
        add     lr, lr, #1
        mov     r11, r11, asr #15
        strh    r1, [r10, +r11]
LDFD1:
        add     r11, r1, #1
        add     r10, sp, #0x4A, 30
        mov     r2, r11, lsl #16
        mov     r2, r2, asr #15
        ldrsh   r2, [r10, +r2]
        cmp     r2, #0
        beq     LDFD2
        mov     r2, lr
        add     r10, sp, #0xD8
        mov     r2, r2, lsl #16
        add     lr, lr, #1
        mov     r2, r2, asr #15
        strh    r11, [r10, +r2]
LDFD2:
        add     r1, r1, #2
        cmp     r1, #0x28
        add     r0, r0, #4
        blt     LDFD0
        mov     r10, #0x99
        orr     r10, r10, #0x39, 24
        cmp     r10, r9
        movle   r12, #2
        ble     LDFD3
        mov     r10, #0x66
        orr     r10, r10, #0x26, 24
        cmp     r10, r9
        movlt   r12, #1
LDFD3:
        ldrsh   r1, [r8, #8]
        ldrsh   r2, [r8, #0xE]
        mov     r3, r6, lsl #16
        str     r1, [sp, #8]
        ldrsh   r10, [r8, #6]
        ldrsh   r11, [r8, #4]
        ldrsh   r0, [r8, #2]
        strh    r1, [r8, #0xA]
        ldrsh   r1, [r8]
        cmp     r2, r3, asr #17
        strh    r10, [r8, #8]
        strh    r11, [r8, #6]
        strh    r0, [r8, #4]
        strh    r9, [r8]
        strh    r1, [r8, #2]
        movlt   r3, #2
        blt     LDFD4
        ldrsh   r3, [r8, #0x10]
        mov     r9, #0
        sub     r3, r3, #1
        mov     r3, r3, lsl #16
        movs    r3, r3, asr #16
        movmi   r3, r9
LDFD4:
        ldrsh   r9, [r8]
        mov     r2, #0x66
        orr     r2, r2, #0x26, 24
        cmp     r2, r9
        strh    r3, [r8, #0x10]
        movle   r9, #0
        movgt   r9, #1
        mov     r2, #0x66
        orr     r2, r2, #0x26, 24
        cmp     r2, r1
        addgt   r9, r9, #1
        mov     r1, #0x66
        orr     r1, r1, #0x26, 24
        cmp     r1, r0
        addgt   r9, r9, #1
        mov     r0, #0x66
        orr     r0, r0, #0x26, 24
        cmp     r0, r11
        ble     LDFD5
        add     r9, r9, #1
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
LDFD5:
        mov     r11, #0x66
        orr     r11, r11, #0x26, 24
        cmp     r11, r10
        ble     LDFD6
        add     r9, r9, #1
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
LDFD6:
        ldr     r11, [sp, #8]
        mov     r10, #0x66
        orr     r10, r10, #0x26, 24
        cmp     r10, r11
        ble     LDFD7
        add     r9, r9, #1
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
LDFD7:
        mov     r9, r9, lsl #16
        cmp     r9, #2, 16
        ble     LDFD8
        cmp     r3, #0
        moveq   r12, #0
LDFD8:
        ldrsh   r9, [r8, #0xC]
        add     r9, r9, #1
        mov     r9, r9, lsl #16
        cmp     r12, r9, asr #16
        ble     LDFD9
        cmp     r3, #0
        subeq   r12, r12, #1
LDFD9:
        cmp     r3, #0
        beq     LDFD10
        cmp     r12, #2
        addlt   r12, r12, #1
LDFD10:
        ldr     r3, [pc, #0x1E4]
        cmp     r12, #2
        strh    r12, [r8, #0xC]
        strh    r6, [r8, #0xE]
        bge     LDFD11
        cmp     r12, #0
        addeq   r3, r3, #0x50
        addne   r3, r3, #0xA0
LDFD11:
        mov     lr, lr, lsl #16
        mov     r12, lr, asr #16
        cmp     r12, #0
        ble     LDFD18
        mov     lr, #0
        str     r4, [sp, #0xC]
        str     r6, [sp, #0x10]
        str     r7, [sp, #0x14]
LDFD12:
        add     r1, sp, #0xD8
        ldrsh   r1, [r1, +lr]
        cmp     r1, #0
        ble     LDFD15
        mov     r4, r1, lsl #1
        add     r2, sp, #0x4A, 30
        ldrsh   r4, [r2, +r4]
        cmp     r1, #5
        rsb     r2, r1, #0x28
        blt     LDFD19
        mov     r7, #0
        add     r2, r3, r2, lsl #1
        mov     r10, r7
        sub     r6, r1, #5
        str     r3, [sp, #8]
LDFD13:
        mov     r10, r10, lsl #1
        ldrsh   r8, [r2, +r10]
        ldrsh   r11, [r5, +r10]
        add     r3, r7, #1
        mul     r8, r4, r8
        mov     r9, r3, lsl #16
        add     r3, r7, #2
        mov     r9, r9, asr #15
        mov     r3, r3, lsl #16
        add     r8, r11, r8, asr #15
        strh    r8, [r5, +r10]
        ldrsh   r10, [r2, +r9]
        ldrsh   r11, [r5, +r9]
        mov     r8, r3, asr #15
        mul     r0, r4, r10
        add     r3, r7, #3
        add     r7, r7, #4
        mov     r3, r3, lsl #16
        mov     r10, r7, lsl #16
        add     r0, r11, r0, asr #15
        strh    r0, [r5, +r9]
        ldrsh   r11, [r2, +r8]
        ldrsh   r9, [r5, +r8]
        mov     r3, r3, asr #15
        mul     r11, r4, r11
        mov     r10, r10, asr #16
        cmp     r10, r6
        add     r11, r9, r11, asr #15
        strh    r11, [r5, +r8]
        ldrsh   r9, [r2, +r3]
        ldrsh   r8, [r5, +r3]
        mul     r9, r4, r9
        add     r9, r8, r9, asr #15
        strh    r9, [r5, +r3]
        ble     LDFD13
        ldr     r3, [sp, #8]
LDFD14:
        mov     r6, r10, lsl #1
        ldrsh   r9, [r2, +r6]
        ldrsh   r8, [r5, +r6]
        add     r7, r7, #1
        mul     r9, r4, r9
        mov     r10, r7, lsl #16
        mov     r10, r10, asr #16
        cmp     r10, r1
        add     r9, r8, r9, asr #15
        strh    r9, [r5, +r6]
        blt     LDFD14
LDFD15:
        cmp     r1, #0x28
        bge     LDFD17
        add     r2, sp, #0x4A, 30
        mov     r4, r1, lsl #1
        ldrsh   r2, [r2, +r4]
        rsb     r4, r1, #0
        add     r6, r5, r1, lsl #1
        add     r4, r3, r4, lsl #1
        add     r4, r4, r1, lsl #1
LDFD16:
        ldrsh   r7, [r4], #2
        ldrsh   r8, [r6]
        mul     r7, r2, r7
        add     r1, r1, #1
        cmp     r1, #0x28
        add     r7, r8, r7, asr #15
        strh    r7, [r6], #2
        blt     LDFD16
LDFD17:
        subs    r12, r12, #1
        add     lr, lr, #2
        bne     LDFD12
        ldr     r4, [sp, #0xC]
        ldr     r6, [sp, #0x10]
        ldr     r7, [sp, #0x14]
LDFD18:
        mov     r0, r5
        mov     r1, r6
        mov     r3, #0xE
        str     r3, [sp]
        mov     r3, #0x28
        mov     r2, r4
        bl      _ippsMulC_NR_16s_Sfs
        add     r1, sp, #0x18
        mov     r0, r4
        mov     r2, r7
        mov     r3, #0x28
        bl      _ippsAdd_16s
        mov     r0, #0
        add     sp, sp, #0x5E, 30
        ldmia   sp!, {r4 - r11, pc}
LDFD19:
        mov     r7, #0
        add     r2, r3, r2, lsl #1
        mov     r10, r7
        b       LDFD14
LDFD20:
        mvn     r0, #7
        add     sp, sp, #0x5E, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   LDFD_phImpHigh


        .data
        .align  4


LDFD_phImpHigh:
        .byte   0xFF,0x7F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
LDFD_phImpLow:
        .byte   0x62,0x39,0xFE,0x2C,0xF4,0x04,0x36,0xF5,0xD8,0xE9,0x5A,0x1D,0xDC,0xFF,0x08,0xF5
        .byte   0x1F,0xF4,0xD7,0x12,0x88,0x0B,0x17,0xDF,0xC9,0x0E,0xAF,0x05,0x83,0x08,0x42,0xDE
        .byte   0x73,0x1F,0xC8,0xF7,0x51,0xFA,0x09,0x03,0x54,0x04,0xAE,0xF6,0xCE,0x08,0x94,0xFE
        .byte   0x5D,0xFD,0xC8,0xF7,0x9E,0x17,0xCE,0xE9,0x30,0x04,0x33,0x0C,0x3D,0xEC,0xC0,0x14
        .byte   0xE6,0xF6,0x6F,0xF1,0x0C,0x1B,0xCE,0xF0,0xA3,0x02,0x10,0xF9,0x1D,0x00,0xA1,0x27
LDFD_phImpMid:
        .byte   0x42,0x76,0xF7,0x0E,0x3B,0xF0,0x9C,0x0B,0xE7,0xFB,0x15,0xFC,0xAD,0x09,0x1C,0xF4
        .byte   0xFF,0x0A,0x48,0xF7,0xD9,0x06,0xB4,0xF9,0xB2,0x06,0x10,0xF9,0x07,0x06,0x0F,0xFC
        .byte   0xAD,0x01,0x56,0xFF,0xD8,0x01,0x0F,0xFB,0x80,0x08,0x6D,0xF5,0xDB,0x09,0xAA,0xF9
        .byte   0x58,0x01,0x3A,0x03,0x06,0xFA,0xBC,0x06,0x86,0xF9,0xA5,0x06,0xF0,0xF7,0x54,0x0A
        .byte   0x0B,0xF4,0x51,0x0B,0x45,0xF8,0x2D,0x02,0x0C,0x03,0xA6,0xFA,0x4A,0x03,0x8F,0x02


