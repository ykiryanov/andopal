        .text
        .align  4
        .globl  ownVad2SnrEstimatorAndSumVocieMetric_GSMAMR_16s


ownVad2SnrEstimatorAndSumVocieMetric_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r9, [sp, #0x3C]
        ldr     r8, [sp, #0x40]
        mov     r4, r0
        mov     r6, r2
        mov     r7, r1
        mov     r5, r3
        add     r10, sp, #4
        mov     r2, r10
        mov     r3, #0
        mov     r1, #0x10
        bl      _ippsSum_32s_Sfs
        ldr     r12, [sp, #4]
        mov     lr, #0
        mov     r1, lr
        str     r12, [r7]
        ldr     r10, [r4, #8]
        ldr     r11, [r4, #0xC]
        ldr     r7, [r4, #0x18]
        cmp     r10, #0
        movgt   r1, r10
        ldr     r10, [r4, #0x10]
        cmp     r11, r1
        movgt   r1, r11
        ldr     r11, [r4, #0x14]
        cmp     r10, r1
        movgt   r1, r10
        ldr     r10, [r4, #0x1C]
        cmp     r11, r1
        movgt   r1, r11
        cmp     r7, r1
        ldr     r11, [r4, #0x20]
        movgt   r1, r7
        cmp     r10, r1
        ldr     r7, [r4, #0x24]
        movgt   r1, r10
        cmp     r11, r1
        ldr     r10, [r4, #0x28]
        movgt   r1, r11
        cmp     r7, r1
        movgt   r1, r7
        ldr     r7, [r4, #0x2C]
        cmp     r10, r1
        movgt   r1, r10
        ldr     r10, [r4, #0x30]
        cmp     r7, r1
        movgt   r1, r7
        ldr     r7, [r4, #0x34]
        cmp     r10, r1
        movgt   r1, r10
        ldr     r10, [r4, #0x38]
        cmp     r7, r1
        movgt   r1, r7
        ldr     r7, [r4, #0x3C]
        cmp     r10, r1
        movgt   r1, r10
        mov     r10, #0xFF
        cmp     r7, r1
        movgt   r1, r7
        orr     r10, r10, #0x7F, 24
        and     r7, r10, r12, asr #1
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        add     r7, r7, r7, lsl #2
        mov     r12, r12, asr #16
        mov     r7, r7, lsl #12
        add     r12, r12, r12, lsl #2
        mov     r7, r7, asr #15
        add     r12, r7, r12, lsl #12
        cmp     r1, r12, lsl #1
        movgt   lr, #1
        strh    lr, [r6]
        ldr     r1, [r4, #0xB8]
        cmp     r1, #4
        bgt     LDOH2
        cmp     lr, #1
        beq     LDOH6
        ldr     r6, [pc, #0x200]
        mov     r12, #2, 20
        mov     r1, r4
        sub     lr, r6, #4
        mov     r2, #0x10
LDOH0:
        ldrsh   r10, [r4, #0xAA]
        ldr     r7, [r1]
        mov     r11, r10, lsl #1
        ldrsh   r11, [lr, +r11]
        cmp     r7, r11
        strlt   r12, [r1, #0x40]
        blt     LDOH1
        cmp     r10, #1
        strne   r7, [r1, #0x40]
        beq     LDOH4
LDOH1:
        subs    r2, r2, #1
        add     r1, r1, #4
        bne     LDOH0
LDOH2:
        ldr     r11, [pc, #0x1B8]
        mov     r6, #0
        mov     r1, r6
        mov     r2, #0x54
        strh    r1, [r5]
        orr     r7, r2, #6, 20
        mov     r2, #0x59
        mov     r10, r1
        str     r8, [sp]
LDOH3:
        ldrsh   r12, [r4, #0xAA]
        ldr     r0, [r4, +r6, lsl #2]
        add     lr, r11, #4
        mov     r12, r12, lsl #1
        ldrsh   r8, [lr, +r12]
        add     r2, sp, #0xC
        add     r1, sp, #0x14
        bl      ownLog2
        ldrsh   r1, [sp, #0x14]
        sub     r8, r1, r8
        ldrsh   r1, [sp, #0xC]
        mov     r2, r8, lsl #16
        mov     r2, r2, asr #16
        mul     lr, r2, r7
        mul     r1, r1, r7
        strh    r2, [sp, #0x14]
        add     r1, lr, r1, asr #15
        mov     r1, r1, lsl #1
        tst     r1, #0x20
        mov     r1, r1, asr #6
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        addne   r1, r1, #1
        mov     r8, r6, lsl #1
        strh    r1, [r9, +r8]
        add     r6, r4, r6, lsl #2
        ldr     r0, [r6, #0x40]
        add     r2, sp, #8
        add     r1, sp, #0x10
        bl      ownLog2
        ldrsh   r1, [sp, #0x10]
        ldrsh   r2, [sp, #8]
        sub     r1, r1, #9
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        mul     r2, r2, r7
        mul     r12, r1, r7
        add     r2, r12, r2, asr #15
        mov     r2, r2, lsl #1
        tst     r2, #0x20
        mov     r2, r2, asr #6
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
        addne   r2, r2, #1
        ldrsh   r12, [r9, +r8]
        add     r10, r10, #1
        sub     r12, r12, r2
        mov     r2, r12, lsl #16
        ldr     r12, [sp]
        mov     lr, r10, lsl #16
        mov     r2, r2, asr #16
        add     r6, r2, r2, lsl #2
        strh    r2, [r12, +r8]
        ldrsh   r12, [r5]
        add     r6, r6, r6, lsl #4
        add     r2, r11, #8
        add     r8, r6, r6, lsl #8
        mov     r6, lr, asr #16
        mov     lr, #0
        mov     r8, r8, asr #15
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        add     r8, r8, #0x20
        mov     r8, r8, asr #6
        mov     r8, r8, lsl #16
        mov     r8, r8, asr #16
        cmp     r8, #0
        movgt   lr, r8
        mov     r8, #0x59
        cmp     lr, #0x59
        movlt   r8, lr
        cmp     r6, #0xF
        mov     r8, r8, lsl #1
        ldrsh   r8, [r2, +r8]
        add     r8, r12, r8
        strh    r8, [r5]
        strleh  r1, [sp, #0x10]
        ble     LDOH3
        b       LDOH7
LDOH4:
        ldrsh   r10, [r6]
        cmp     r10, #0
        movge   r10, r7, asr r10
        strge   r10, [r1, #0x40]
        bge     LDOH1
        rsb     r10, r10, #0
        bic     r10, r10, #0xFF, 8
        bic     r10, r10, #0xFF, 16
        mvn     r0, #2, 2
        cmp     r7, r0, asr r10
        mov     r11, #2, 2
        bgt     LDOH5
        cmp     r7, r11, asr r10
        movge   r0, r7, lsl r10
        movlt   r0, #2, 2
LDOH5:
        str     r0, [r1, #0x40]
        b       LDOH1
LDOH6:
        add     r1, r4, #0x40
        mov     r2, #0x10
        mov     r0, #2, 20
        bl      _ippsSet_32s
        b       LDOH2
LDOH7:
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
        .long   LDOH_tableStateChangeShiftR


        .data
        .align  4


LDOH_tableIneNoise:
        .byte   0x00,0x20,0x00,0x01
LDOH_tableStateChangeShiftR:
        .byte   0xFB,0xFF,0x05,0x00
LDOH_tableFbits:
        .byte   0x09,0x00,0x04,0x00
LDOH_TableVoiceMetric:
        .byte   0x02,0x00,0x02,0x00,0x02,0x00,0x02,0x00,0x02,0x00,0x02,0x00,0x02,0x00,0x02,0x00
        .byte   0x02,0x00,0x02,0x00,0x02,0x00,0x03,0x00,0x03,0x00,0x03,0x00,0x03,0x00,0x03,0x00
        .byte   0x04,0x00,0x04,0x00,0x04,0x00,0x05,0x00,0x05,0x00,0x05,0x00,0x06,0x00,0x06,0x00
        .byte   0x07,0x00,0x07,0x00,0x07,0x00,0x08,0x00,0x08,0x00,0x09,0x00,0x09,0x00,0x0A,0x00
        .byte   0x0A,0x00,0x0B,0x00,0x0C,0x00,0x0C,0x00,0x0D,0x00,0x0D,0x00,0x0E,0x00,0x0F,0x00
        .byte   0x0F,0x00,0x10,0x00,0x11,0x00,0x11,0x00,0x12,0x00,0x13,0x00,0x14,0x00,0x14,0x00
        .byte   0x15,0x00,0x16,0x00,0x17,0x00,0x18,0x00,0x18,0x00,0x19,0x00,0x1A,0x00,0x1B,0x00
        .byte   0x1C,0x00,0x1C,0x00,0x1D,0x00,0x1E,0x00,0x1F,0x00,0x20,0x00,0x21,0x00,0x22,0x00
        .byte   0x23,0x00,0x24,0x00,0x25,0x00,0x25,0x00,0x26,0x00,0x27,0x00,0x28,0x00,0x29,0x00
        .byte   0x2A,0x00,0x2B,0x00,0x2C,0x00,0x2D,0x00,0x2E,0x00,0x2F,0x00,0x30,0x00,0x31,0x00
        .byte   0x32,0x00,0x32,0x00,0x32,0x00,0x32,0x00,0x32,0x00,0x32,0x00,0x32,0x00,0x32,0x00
        .byte   0x32,0x00,0x32,0x00


