        .text
        .align  4
        .globl  ownVad2DetermineVADAndSpectrDeviation_GSMAMR_16s


ownVad2DetermineVADAndSpectrDeviation_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r6, [pc, #0x220]
        ldr     r7, [sp, #0x24]
        ldr     r8, [sp, #0x28]
        ldr     r12, [sp, #0x2C]
        sub     lr, r6, #0x50
        mov     r9, r3, lsl #1
        ldrsh   lr, [lr, +r9]
        mov     r5, r0
        ldrsh   r9, [r5, #0xB2]
        mov     r4, r1
        add     r9, lr, r9
        mov     lr, #0
        mov     r9, r9, lsl #16
        cmp     r2, r9, asr #16
        mov     r2, #1
        ble     LDOI0
        strh    r2, [r8]
        ldrsh   r8, [r5, #0xB4]
        mov     r9, r3, lsl #1
        sub     r2, r6, #0x28
        ldrsh   r2, [r2, +r9]
        add     r8, r8, #1
        strh    r8, [r5, #0xB4]
        mov     r8, r8, lsl #16
        cmp     r2, r8, asr #16
        bge     LDOI1
        mov     r3, r3, lsl #1
        ldrsh   r3, [r6, +r3]
        strh    r3, [r5, #0xB6]
        b       LDOI1
LDOI0:
        ldrsh   r3, [r5, #0xB6]
        strh    lr, [r5, #0xB4]
        sub     r3, r3, #1
        mov     r6, r3, lsl #16
        cmp     r6, #0
        strleh  lr, [r8]
        strleh  lr, [r5, #0xB6]
        strgth  r3, [r5, #0xB6]
        strgth  r2, [r8]
LDOI1:
        strh    lr, [r12]
        ldr     r2, [r5, #0xB8]
        mvn     r3, #0xFF
        bic     r6, r3, #0x7F, 24
        cmp     r2, #1
        beq     LDOI13
        mvn     r9, r6
        mov     r2, r5
        mov     r3, r4
        mov     r8, #0x10
LDOI2:
        ldrsh   r10, [r2, #0x80]
        ldrsh   r11, [r3], #2
        sub     r10, r10, r11
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
        cmp     r10, #0
        bge     LDOI3
        cmn     r10, #2, 18
        beq     LDOI11
        rsb     r10, r10, #0
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
LDOI3:
        add     lr, r10, lr
        cmp     r9, lr
        mvnlt   lr, r6
        blt     LDOI4
        cmn     lr, #2, 18
        movge   lr, lr, lsl #16
        movge   lr, lr, asr #16
        movlt   lr, r6
LDOI4:
        subs    r8, r8, #1
        strh    lr, [r12]
        add     r2, r2, #2
        bne     LDOI2
LDOI5:
        ldrsh   r1, [r5, #0xAE]
        mov     r2, #0x33
        orr     r8, r2, #0x73, 24
        sub     r7, r1, r7
        mov     r7, r7, lsl #16
        mov     r7, r7, asr #16
        cmp     r7, #0
        ble     LDOI12
        cmp     r1, #0
        ble     LDOI12
        cmp     r7, r1
        ble     LDOI6
        mov     r2, #0x66
        mov     r3, #0x9A
        orr     r2, r2, #0x26, 24
        orr     r8, r3, #0x59, 24
        b       LDOI8
LDOI6:
        cmp     r7, r1
        mvneq   r2, r6
        beq     LDOI7
        mov     r0, r7, lsl #15
        bl      __intel_idiv
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
LDOI7:
        mov     r3, #0x99
        orr     r3, r3, #0x19, 24
        mul     r3, r2, r3
        mvn     r2, r6
        sub     r8, r8, r3, asr #15
        mov     r3, r8, lsl #16
        mov     r8, r3, asr #16
        rsb     r2, r8, r2
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LDOI8:
        add     r5, r5, #0x7E
        sub     r12, r6, #2, 2
        mov     r3, #0x10
LDOI9:
        ldrsh   r7, [r5, #2]
        ldrsh   lr, [r4], #2
        mul     r7, r8, r7
        mla     r7, r2, lr, r7
        mov     lr, r7, lsl #1
        cmp     r12, lr
        mvnle   lr, r6
        ble     LDOI10
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDOI10:
        strh    lr, [r5, #2]!
        subs    r3, r3, #1
        bne     LDOI9
        ldmia   sp!, {r4 - r11, pc}
LDOI11:
        mov     r10, #0
        sub     r10, r10, #2, 18
        mvn     r10, r10
        b       LDOI3
LDOI12:
        mov     r2, #0xCD
        orr     r2, r2, #3, 22
        b       LDOI8
LDOI13:
        add     r1, r5, #0x80
        mov     r2, #0x10
        mov     r0, r4
        bl      _ippsCopy_16s
        b       LDOI5
        .long   LDOI_TableHangover


        .data
        .align  4


LDOI_TablePeakSNR:
        .byte   0x22,0x00,0x22,0x00,0x22,0x00,0x22,0x00,0x22,0x00,0x22,0x00,0x22,0x00,0x22,0x00
        .byte   0x22,0x00,0x22,0x00,0x22,0x00,0x28,0x00,0x33,0x00,0x47,0x00,0x64,0x00,0x8B,0x00
        .byte   0xBF,0x00,0x01,0x01,0x51,0x01,0xB0,0x01
LDOI_TableBurstcount:
        .byte   0x08,0x00,0x08,0x00,0x08,0x00,0x08,0x00,0x08,0x00,0x08,0x00,0x08,0x00,0x08,0x00
        .byte   0x07,0x00,0x06,0x00,0x05,0x00,0x04,0x00,0x04,0x00,0x04,0x00,0x04,0x00,0x04,0x00
        .byte   0x04,0x00,0x04,0x00,0x04,0x00,0x04,0x00
LDOI_TableHangover:
        .byte   0x1E,0x00,0x1E,0x00,0x1E,0x00,0x1E,0x00,0x1E,0x00,0x1E,0x00,0x1C,0x00,0x1A,0x00
        .byte   0x18,0x00,0x16,0x00,0x14,0x00,0x12,0x00,0x10,0x00,0x0E,0x00,0x0C,0x00,0x0A,0x00
        .byte   0x08,0x00,0x08,0x00,0x08,0x00,0x08,0x00


