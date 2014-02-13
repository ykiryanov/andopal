        .text
        .align  4
        .globl  _ippsDecodeGain_AMRWB_16s


_ippsDecodeGain_AMRWB_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     lr, [sp, #0x48]
        ldr     r12, [sp, #0x44]
        ldr     r11, [sp, #0x4C]
        ldr     r10, [sp, #0x50]
        ldr     r9, [sp, #0x54]
        ldr     r8, [sp, #0x58]
        mov     r5, r2
        cmp     r5, #0
        str     lr, [sp]
        mov     r7, r0
        mov     r6, r1
        mov     r4, r3
        beq     LDIX11
        cmp     r4, #0
        beq     LDIX11
        cmp     r11, #0
        beq     LDIX11
        cmp     r10, #0
        beq     LDIX11
        cmp     r9, #0
        beq     LDIX11
        cmp     r8, #5
        beq     LDIX0
        cmp     r8, #9
        beq     LDIX0
        cmp     r8, #0xD
        beq     LDIX0
        cmp     r8, #0xF
        beq     LDIX0
        cmp     r8, #0x10
        beq     LDIX0
        cmp     r8, #0x12
        beq     LDIX0
        cmp     r8, #0x13
        beq     LDIX0
        cmp     r8, #0x14
        beq     LDIX0
        cmp     r8, #0x15
        beq     LDIX0
        cmp     r8, #0x19
        beq     LDIX0
        mvn     r0, #6
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDIX0:
        cmp     r12, #0
        ldrsh   r2, [r11]
        ldrsh   r12, [r11, #2]
        ldrsh   lr, [r11, #4]
        ldrsh   r1, [r11, #6]
        beq     LDIX1
        add     r0, r12, r2
        add     r0, lr, r0
        add     r0, r1, r0
        strh    lr, [r11, #6]
        mov     r0, r0, asr #2
        sub     r0, r0, #3, 22
        strh    r2, [r11, #2]
        mov     r0, r0, lsl #16
        strh    r12, [r11, #4]
        mov     r0, r0, asr #16
        cmn     r0, #0xE, 22
        mvn     r2, #0xFF
        bic     r2, r2, #0x37, 24
        movlt   r0, r2
        strh    r0, [r11]
        ldrsh   r9, [r9]
        mov     r0, #0
        mul     r9, r6, r9
        mov     r1, r9, lsl #1
        str     r1, [r4]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDIX1:
        ldr     r3, [pc, #0x25C]
        ldrsh   r0, [r3]
        ldrsh   r3, [r3, #2]
        str     r3, [sp, #4]
        ldr     r3, [pc, #0x24C]
        mul     r2, r0, r2
        mov     r0, #0x43
        ldrsh   r3, [r3, #4]
        orr     r0, r0, #0x15, 24
        str     r3, [sp, #8]
        ldr     r3, [pc, #0x234]
        add     r2, r2, #0xF, 8
        ldrsh   r3, [r3, #6]
        str     r0, [sp, #0x10]
        mvn     r0, #0
        add     r0, r0, #2, 18
        str     r3, [sp, #0xC]
        ldr     r3, [sp, #4]
        str     r0, [sp, #0x14]
        mov     r0, #0xE
        mla     r2, r3, r12, r2
        ldr     r12, [sp, #8]
        mla     r2, r12, lr, r2
        ldr     r12, [sp, #0xC]
        ldr     lr, [sp, #0x10]
        mla     r2, r12, r1, r2
        mov     r12, r2, asr #15
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        mul     r12, r12, lr
        ldr     lr, [sp, #0x14]
        and     r1, lr, r12, asr #8
        str     r12, [sp, #0x10]
        strh    r1, [sp, #0x1C]
        bl      ownPow2
        ldr     r12, [sp, #0x10]
        cmp     r8, #5
        mov     r12, r12, asr #23
        sub     r12, r12, #0xA
        mov     r0, r0, lsl #16
        mov     r12, r12, lsl #16
        mov     lr, r0, asr #16
        mov     r12, r12, asr #16
        beq     LDIX10
        cmp     r8, #9
        beq     LDIX10
        cmp     r8, #0x19
        ldrne   r8, [pc, #0x1A4]
        beq     LDIX10
LDIX2:
        mov     r7, r7, lsl #2
        ldrsh   r0, [r8, +r7]
        add     r7, r8, r7
        cmp     r12, #0
        strh    r0, [r5]
        ldrsh   r0, [r7, #2]
        mul     lr, lr, r0
        blt     LDIX3
        add     r12, r12, #1
        bic     r12, r12, #0xFF, 8
        bic     r2, r12, #0xFF, 16
        mvn     r5, #2, 2
        cmp     lr, r5, asr r2
        mov     r12, #2, 2
        movgt   r12, r5
        bgt     LDIX4
        cmp     lr, r12, asr r2
        movge   r12, lr, lsl r2
        b       LDIX4
LDIX3:
        mvn     r2, #0
        rsb     r2, r12, r2
        mov     r12, lr, asr r2
LDIX4:
        ldr     r2, [sp]
        str     r12, [r4]
        cmp     r2, #1
        beq     LDIX9
LDIX5:
        cmn     r12, #0x1F, 4
        mvn     r2, #2, 2
        mov     r5, #2, 2
        movgt   lr, r2
        bgt     LDIX6
        cmp     r12, #0xF, 4
        movge   lr, r12, lsl #3
        movlt   lr, #2, 2
LDIX6:
        sub     r5, r5, #2, 18
        cmp     r5, lr
        mvn     r12, #0
        addle   lr, r12, #2, 18
        ble     LDIX7
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDIX7:
        strh    lr, [r9]
        strh    lr, [r10]
        ldr     lr, [r4]
        add     r5, r12, #2, 18
        mov     r6, r6, lsl #16
        and     r5, r5, lr, asr #1
        mov     lr, lr, asr #16
        mov     r12, r6, asr #16
        mul     r6, r12, r5
        mov     lr, lr, lsl #16
        strh    r5, [sp, #0x1C]
        mov     lr, lr, asr #16
        strh    lr, [sp, #0x18]
        mov     r6, r6, asr #15
        mla     r6, r12, lr, r6
        mov     r1, r6, lsl #1
        cmn     r1, #0x1F, 4
        bgt     LDIX8
        cmp     r1, #0xF, 4
        movge   r2, r6, lsl #4
        movlt   r2, #2, 2
LDIX8:
        str     r2, [r4]
        add     r2, sp, #0x1C
        add     r1, sp, #0x18
        bl      ownLog2
        ldrsh   r2, [sp, #0x18]
        ldrsh   r1, [sp, #0x1C]
        ldrsh   r0, [r11, #4]
        sub     r3, r2, #0xB
        mov     r2, #0x54
        ldrsh   r12, [r11, #2]
        mov     r3, r3, lsl #16
        orr     r2, r2, #6, 20
        mul     r1, r1, r2
        mov     r3, r3, asr #16
        mul     r3, r3, r2
        ldrsh   r2, [r11]
        strh    r0, [r11, #6]
        mov     r0, #0
        add     r1, r3, r1, asr #15
        strh    r12, [r11, #4]
        strh    r2, [r11, #2]
        mov     r1, r1, lsl #1
        mov     r1, r1, asr #3
        strh    r1, [r11]
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LDIX9:
        ldrsh   r2, [r10]
        add     r2, r2, r2, lsl #2
        mov     r2, r2, lsl #11
        cmp     r12, r2
        ble     LDIX5
        cmp     r12, #0x19, 14
        strgt   r2, [r4]
        movgt   r12, r2
        b       LDIX5
LDIX10:
        ldr     r8, [pc, #0x14]
        b       LDIX2
LDIX11:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
        .long   predTbl
        .long   gain_sq7Tbl
        .long   gain_sq6Tbl


