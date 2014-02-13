        .text
        .align  4
        .globl  ownSearchOptimalPulsePos_M59_GSMAMR_16s


ownSearchOptimalPulsePos_M59_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x44
        ldr     r5, [pc, #0x1E4]
        mvn     r12, #0xFF
        bic     lr, r12, #0x7F, 24
        mov     r12, #1
        mov     r6, #0
        strh    r6, [r3]
        strh    r12, [r3, #2]
        mvn     lr, lr
        mvn     r4, #0
        str     lr, [sp, #0x24]
        str     r4, [sp, #0x38]
        str     r12, [sp, #0x3C]
        str     r3, [sp, #0x2C]
LDMP0:
        mov     r3, r6, lsl #1
        ldrsh   r12, [r5, +r3]
        add     r3, r5, r6, lsl #1
        ldrsh   r3, [r3, #2]
        mov     r7, #8
        add     lr, r0, r12, lsl #1
        add     r8, r1, r3, lsl #5
        add     r9, r0, r3, lsl #1
        add     r4, r1, r12, lsl #5
        mov     r10, r2
        str     r7, [sp, #0x40]
        str     r9, [sp, #0x30]
        str     r8, [sp, #0x34]
        str     r3, [sp, #0x28]
        str     r6, [sp, #0x20]
        str     r2, [sp, #0x1C]
        str     r1, [sp, #0x18]
        str     r0, [sp, #0x14]
LDMP1:
        ldr     r9, [r4], #4
        ldrsh   r8, [lr], #0xA
        mvn     r11, #0
        ldr     r1, [sp, #0x30]
        ldr     r0, [sp, #0x34]
        mov     r3, r11
        mov     r5, r10
        str     r11, [sp]
        str     r10, [sp, #0xC]
        ldr     r10, [sp, #0x28]
        ldr     r11, [sp, #0x24]
        mov     r2, #1
        mov     r7, #0
        mov     r6, #8
        str     lr, [sp, #4]
        str     r4, [sp, #8]
        str     r12, [sp, #0x10]
LDMP2:
        ldrsh   r12, [r1], #0xA
        add     r12, r8, r12
        cmp     r11, r12
        blt     LDMP3
        cmn     r12, #2, 18
        movge   r12, r12, lsl #16
        movge   r12, r12, asr #16
        mvnlt   r12, #0xFF
        biclt   r12, r12, #0x7F, 24
        b       LDMP4
LDMP3:
        mov     r12, #0
        sub     r12, r12, #2, 18
        mvn     r12, r12
LDMP4:
        ldr     lr, [r0], #4
        ldr     r4, [r5], #4
        mul     r12, r12, r12
        add     lr, r9, lr
        add     r4, lr, r4, lsl #1
        add     lr, r4, #2
        mov     r12, r12, asr #15
        mov     lr, lr, asr #2
        rsb     r4, r3, #0
        mov     r12, r12, lsl #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
        mul     r4, r4, lr
        mov     r12, r12, asr #16
        mla     r4, r2, r12, r4
        cmp     r4, #0
        ble     LDMP5
        mov     r3, r12
        mov     r2, lr
        add     r12, r10, r7
        str     r12, [sp]
LDMP5:
        subs    r6, r6, #1
        add     r7, r7, #5
        bne     LDMP2
        ldr     r11, [sp]
        ldr     lr, [sp, #4]
        ldr     r4, [sp, #8]
        ldr     r10, [sp, #0xC]
        ldr     r12, [sp, #0x10]
        cmp     r11, #0
        blt     LDMP6
        ldr     r0, [sp, #0x38]
        ldr     r1, [sp, #0x3C]
        rsb     r0, r0, #0
        mul     r0, r0, r2
        mla     r0, r1, r3, r0
        cmp     r0, #0
        ble     LDMP6
        ldr     r0, [sp, #0x2C]
        str     r3, [sp, #0x38]
        str     r2, [sp, #0x3C]
        strh    r12, [r0]
        strh    r11, [r0, #2]
LDMP6:
        ldr     r0, [sp, #0x40]
        add     r12, r12, #5
        add     r10, r10, #0x20
        subs    r0, r0, #1
        str     r0, [sp, #0x40]
        bne     LDMP1
        ldr     r6, [sp, #0x20]
        ldr     r2, [sp, #0x1C]
        ldr     r5, [pc, #0x24]
        ldr     r1, [sp, #0x18]
        ldr     r0, [sp, #0x14]
        add     r6, r6, #2
        add     r2, r2, #1, 24
        mov     r3, r6, lsl #16
        mov     r6, r3, asr #16
        cmp     r6, #0x10
        blt     LDMP0
        add     sp, sp, #0x44
        ldmia   sp!, {r4 - r11, pc}
        .long   LDMP_startPos_r59


        .data
        .align  4


LDMP_startPos_r59:
        .byte   0x01,0x00,0x00,0x00,0x01,0x00,0x01,0x00,0x01,0x00,0x02,0x00,0x01,0x00,0x04,0x00
        .byte   0x03,0x00,0x00,0x00,0x03,0x00,0x01,0x00,0x03,0x00,0x02,0x00,0x03,0x00,0x04,0x00


