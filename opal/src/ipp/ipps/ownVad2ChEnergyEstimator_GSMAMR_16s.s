        .text
        .align  4
        .globl  ownVad2ChEnergyEstimator_GSMAMR_16s


ownVad2ChEnergyEstimator_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        mov     r4, r0
        ldrsh   r3, [r4, #0xAA]
        mov     r6, r1
        mov     r5, r2
        cmp     r3, #0
        mov     r12, #0
        mov     lr, #1
        bne     LDOK0
        cmp     r5, #0
        strleh  lr, [r4, #0xAA]
        movle   r3, lr
        movgt   lr, r12
        b       LDOK1
LDOK0:
        cmp     r5, #3
        movlt   lr, r12
        movge   r3, r12
        strgeh  r3, [r4, #0xAA]
LDOK1:
        ldr     r7, [pc, #0x368]
        cmp     lr, #0
        beq     LDOK5
        mov     r3, r3, lsl #1
        ldrsh   r0, [r7, +r3]
        cmp     r0, #0
        blt     LDOK2
        mov     r1, r4
        mov     r2, #0x10
        bl      _ippsRShiftC_32s_I
        ldrsh   r3, [r4, #0xAA]
        b       LDOK5
LDOK2:
        mov     r9, r12
        mov     r8, #2, 2
        mvn     lr, #2, 2
LDOK3:
        ldr     r3, [r4, +r12, lsl #2]
        rsb     r0, r0, #0
        bic     r10, r0, #0xFF, 8
        bic     r10, r10, #0xFF, 16
        cmp     r3, lr, asr r10
        movgt   r10, lr
        bgt     LDOK4
        cmp     r3, r8, asr r10
        movge   r10, r3, lsl r10
        movlt   r10, #2, 2
LDOK4:
        str     r10, [r4, +r12, lsl #2]
        add     r9, r9, #1
        ldrsh   r3, [r4, #0xAA]
        mov     r12, r9, lsl #16
        mov     r12, r12, asr #16
        cmp     r12, #0xF
        movle   r3, r3, lsl #1
        ldrlesh r0, [r7, +r3]
        ble     LDOK3
LDOK5:
        ldr     r12, [r4, #0xB8]
        mov     lr, #0
        cmp     r12, #1
        beq     LDOK14
        mov     r8, #0x66
        mov     r12, #0x9A
        orr     r8, r8, #0x46, 24
        orr     r12, r12, #0x39, 24
LDOK6:
        mov     r2, lr
        add     r9, r7, #0x68
        add     r1, r6, #4
        add     r0, r7, #4
        add     r11, r7, #0x44
        mov     r10, #1
        add     r7, r7, #0x48
        str     r8, [sp, #0x30]
        str     r9, [sp, #0x2C]
        str     r1, [sp, #0x3C]
        str     r6, [sp, #0x28]
LDOK7:
        mov     r6, lr, lsl #2
        add     r8, r0, r6
        ldrsh   r9, [r0, +r6]
        ldrsh   r10, [r8, #2]
        cmp     r9, r10
        movgt   r8, #0
        bgt     LDOK11
        sub     r8, r10, r9
        cmp     r8, #6
        movlt   r8, #0
        blt     LDOK9
        sub     r1, r10, #6
        str     r1, [sp, #0x34]
        ldr     r1, [sp, #0x28]
        mov     r8, #0
        str     r10, [sp, #0x24]
        add     r1, r1, r9, lsl #3
        str     r1, [sp, #0x40]
        ldr     r1, [sp, #0x3C]
        str     r6, [sp, #0x20]
        ldr     r6, [sp, #0x3C]
        add     r1, r1, r9, lsl #3
        str     r1, [sp, #0x38]
        str     r7, [sp, #0x1C]
        str     lr, [sp, #0xC]
        str     r5, [sp, #4]
        str     r4, [sp]
        ldr     r4, [sp, #0x38]
        ldr     lr, [sp, #0x40]
        ldr     r5, [sp, #0x34]
        ldr     r7, [sp, #0x28]
        str     r11, [sp, #0x18]
        str     r0, [sp, #0x14]
        str     r2, [sp, #0x10]
        str     r3, [sp, #8]
LDOK8:
        ldr     r10, [lr], #0x28
        ldr     r11, [r4], #0x28
        add     r0, r9, #1
        ldr     r2, [r7, +r0, lsl #3]
        ldr     r0, [r6, +r0, lsl #3]
        add     r10, r8, r10
        add     r1, r9, #2
        ldr     r3, [r7, +r1, lsl #3]
        ldr     r1, [r6, +r1, lsl #3]
        add     r11, r10, r11
        add     r2, r11, r2
        add     r8, r9, #3
        ldr     r10, [r7, +r8, lsl #3]
        ldr     r8, [r6, +r8, lsl #3]
        add     r2, r2, r0
        add     r0, r9, #4
        add     r3, r2, r3
        ldr     r2, [r7, +r0, lsl #3]
        add     r1, r3, r1
        ldr     r0, [r6, +r0, lsl #3]
        add     r10, r1, r10
        add     r8, r10, r8
        add     r9, r9, #5
        add     r2, r8, r2
        cmp     r9, r5
        add     r8, r2, r0
        ble     LDOK8
        ldr     r10, [sp, #0x24]
        ldr     r6, [sp, #0x20]
        ldr     r7, [sp, #0x1C]
        ldr     r11, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        ldr     r2, [sp, #0x10]
        ldr     lr, [sp, #0xC]
        ldr     r3, [sp, #8]
        ldr     r5, [sp, #4]
        ldr     r4, [sp]
LDOK9:
        ldr     r1, [sp, #0x28]
        str     r3, [sp, #8]
        str     r5, [sp, #4]
        add     r1, r1, r9, lsl #3
        str     r1, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        ldr     r3, [sp, #0x38]
        str     r4, [sp]
        add     r1, r1, r9, lsl #3
        str     r1, [sp, #0x34]
        ldr     r4, [sp, #0x34]
LDOK10:
        ldr     r5, [r3], #8
        ldr     r1, [r4], #8
        add     r9, r9, #1
        add     r5, r8, r5
        cmp     r9, r10
        add     r8, r5, r1
        ble     LDOK10
        ldr     r3, [sp, #8]
        ldr     r5, [sp, #4]
        ldr     r4, [sp]
LDOK11:
        mov     r3, r3, lsl #1
        ldrsh   r9, [r11, +r3]
        mov     r3, r8, lsl #1
        rsb     r9, r9, r5, lsl #1
        mov     r8, r9, lsl #16
        mov     r8, r8, asr #16
        cmp     r8, #0
        ble     LDOK13
        sub     r9, r8, #1
        mov     r10, #1
        tst     r3, r10, lsl r9
        mov     r3, r3, asr r8
        addne   r3, r3, #1
LDOK12:
        mov     lr, lr, lsl #1
        ldrsh   r9, [r7, +lr]
        ldr     r10, [sp, #0x30]
        ldr     r8, [r4, +r6]
        mov     lr, #0xFF
        orr     lr, lr, #0x7F, 24
        mul     r10, r10, r9
        mov     r9, r3, asr #16
        and     r3, lr, r3, asr #1
        and     lr, lr, r8, asr #1
        mul     lr, lr, r12
        mov     r10, r10, asr #15
        mov     r9, r9, lsl #16
        mov     r1, r10, lsl #16
        add     r2, r2, #1
        mov     r10, r9, asr #16
        mov     r9, r1, asr #16
        mul     r3, r3, r9
        mov     r1, r8, asr #16
        mov     r8, lr, asr #15
        mov     lr, r1, lsl #16
        mov     r3, r3, asr #15
        mla     r9, r10, r9, r3
        mov     lr, lr, asr #16
        mla     r8, lr, r12, r8
        mov     r3, r2, lsl #16
        mov     lr, r3, asr #16
        mov     r8, r8, lsl #1
        add     r9, r8, r9, lsl #1
        str     r9, [r4, +r6]
        ldrsh   r3, [r4, #0xAA]
        ldr     r8, [sp, #0x2C]
        mov     r3, r3, lsl #1
        ldrsh   r3, [r8, +r3]
        cmp     r3, r9
        movgt   r9, r3
        cmp     lr, #0xF
        str     r9, [r4, +r6]
        ldrlesh r3, [r4, #0xAA]
        ble     LDOK7
        b       LDOK15
LDOK13:
        cmp     r8, #0
        bge     LDOK12
        rsb     r8, r8, #0
        bic     r8, r8, #0xFF, 8
        mvn     r9, #2, 2
        bic     r8, r8, #0xFF, 16
        cmp     r3, r9, asr r8
        mov     r9, #2, 2
        mvngt   r3, #2, 2
        bgt     LDOK12
        cmp     r3, r9, asr r8
        movge   r3, r3, lsl r8
        movlt   r3, #2, 2
        b       LDOK12
LDOK14:
        mov     r12, #0xFF
        orr     r8, r12, #0x7F, 24
        mov     r12, lr
        b       LDOK6
LDOK15:
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
        .long   LDOK_tableStateChangeShiftR


        .data
        .align  4


LDOK_tableStateChangeShiftR:
        .byte   0xFB,0xFF,0x05,0x00
LDOK_Table16Ch:
        .byte   0x02,0x00,0x03,0x00,0x04,0x00,0x05,0x00,0x06,0x00,0x07,0x00,0x08,0x00,0x09,0x00
        .byte   0x0A,0x00,0x0B,0x00,0x0C,0x00,0x0D,0x00,0x0E,0x00,0x10,0x00,0x11,0x00,0x13,0x00
        .byte   0x14,0x00,0x16,0x00,0x17,0x00,0x1A,0x00,0x1B,0x00,0x1E,0x00,0x1F,0x00,0x23,0x00
        .byte   0x24,0x00,0x29,0x00,0x2A,0x00,0x30,0x00,0x31,0x00,0x37,0x00,0x38,0x00,0x3F,0x00
LDOK_tableEnrgNormShift:
        .byte   0x0A,0x00,0x05,0x00
LDOK_TableDFTch:
        .byte   0x00,0x40,0x00,0x40,0x00,0x40,0x00,0x40,0x00,0x40,0x00,0x40,0xAB,0x2A,0xAB,0x2A
        .byte   0xAB,0x2A,0x00,0x20,0x00,0x20,0x9A,0x19,0x55,0x15,0x49,0x12,0x49,0x12,0x00,0x10
LDOK_tableMinChanEnrg:
        .byte   0x20,0x00,0x01,0x00


