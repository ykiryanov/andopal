        .text
        .align  4
        .globl  ownEncodeCoeffs_ModQ_H263_16s1u


ownEncodeCoeffs_ModQ_H263_16s1u:
        mov     r12, sp
        stmdb   sp!, {r11, r12, lr}
        mov     r11, r12
        sub     sp, sp, #0x3C
        str     r0, [r11, #-0x1C]
        str     r1, [r11, #-0x18]
        str     r2, [r11, #-0x14]
        str     r3, [r11, #-0x10]
        mov     r0, #0
        str     r0, [r11, #-0x48]
        str     r0, [r11, #-0x44]
        str     r0, [r11, #-0x40]
        str     r0, [r11, #-0x3C]
        str     r0, [r11, #-0x38]
        ldr     r0, [r11]
        ldr     r0, [r0]
        str     r0, [r11, #-0x34]
        ldr     r0, [r11, #8]
        cmp     r0, #0
        ldreq   r0, [pc, #0x4B8]
        streq   r0, [r11, #-0x3C]
        ldr     r0, [r11, #8]
        cmp     r0, #2
        ldreq   r0, [pc, #0x4AC]
        streq   r0, [r11, #-0x3C]
        beq     LFEN0
        ldr     r0, [r11, #8]
        cmp     r0, #1
        ldreq   r0, [pc, #0x49C]
        streq   r0, [r11, #-0x3C]
LFEN0:
        ldr     r0, [r11, #-0x10]
        sub     r0, r0, #1
        str     r0, [r11, #-0x30]
        ldr     r0, [r11, #4]
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0x40
        bge     LFEN11
LFEN1:
        ldr     r0, [r11, #-0x3C]
        cmp     r0, #0
        beq     LFEN2
        ldr     r0, [r11, #-0x1C]
        ldr     r2, [r11, #-0x3C]
        ldr     r1, [r11, #-0x2C]
        ldrb    r2, [r1, +r2]
        mov     r1, r2, lsl #1
        ldrsh   r1, [r0, +r1]
        str     r1, [r11, #-0x44]
        b       LFEN3
LFEN2:
        ldr     r0, [r11, #-0x1C]
        ldr     r1, [r11, #-0x2C]
        mov     r1, r1, lsl #1
        ldrsh   r1, [r0, +r1]
        str     r1, [r11, #-0x44]
LFEN3:
        ldr     r0, [r11, #-0x44]
        cmp     r0, #0
        beq     LFEN9
        ldr     r0, [r11, #-0x44]
        cmp     r0, #0
        ldrge   r0, [r11, #-0x44]
        bge     LFEN4
        ldr     r0, [r11, #-0x44]
        mov     r1, #0
        sub     r0, r1, r0
LFEN4:
        str     r0, [r11, #-0x40]
        ldr     r0, [r11, #-0x38]
        ldr     r1, [r11, #-0x30]
        cmp     r0, r1
        beq     LFEN11
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11, #-0x34]
        cmp     r0, r1
        movgt   r0, #1
        strgt   r0, [r11, #-0x28]
        bgt     LFEN6
        ldr     r0, [r11]
        ldr     r0, [r0, #8]
        ldr     r1, [r11, #-0x48]
        ldr     r0, [r0, +r1, lsl #2]
        ldr     r1, [r11, #-0x40]
        add     r1, r0, r1
        sub     r0, r1, #1
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11]
        ldr     r1, [r1, #8]
        ldr     r2, [r11, #-0x48]
        mov     r2, r2, lsl #2
        add     r2, r2, #4
        ldr     r2, [r1, +r2]
        cmp     r0, r2
        movge   r0, #1
        strge   r0, [r11, #-0x28]
        bge     LFEN6
        ldr     r0, [r11]
        ldr     r0, [r0, #0x10]
        ldr     r1, [r11, #-0x24]
        ldr     r0, [r0, +r1, lsl #3]
        str     r0, [r11, #-0x20]
        ldr     r0, [r11, #-0x44]
        cmp     r0, #0
        bge     LFEN5
        ldr     r0, [r11, #-0x20]
        orr     r0, r0, #1
        str     r0, [r11, #-0x20]
LFEN5:
        ldr     r0, [r11]
        ldr     r0, [r0, #0x10]
        ldr     r1, [r11, #-0x24]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        ldr     r3, [r1, #4]
        ldr     r2, [r11, #-0x20]
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x18]
        bl      LFEN_H263_PutBits
        mov     r0, #0
        str     r0, [r11, #-0x28]
LFEN6:
        ldr     r0, [r11, #-0x28]
        cmp     r0, #0
        beq     LFEN8
        ldr     r0, [r11, #-0x40]
        cmp     r0, #0x7F
        ble     LFEN7
        ldr     r0, [r11, #-0x48]
        mov     r0, r0, lsl #8
        orr     r0, r0, #0x80
        orr     r0, r0, #6, 18
        str     r0, [r11, #-0x20]
        ldr     r2, [r11, #-0x20]
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x18]
        mov     r3, #0x16
        bl      LFEN_H263_PutBits
        ldr     r0, [r11, #-0x44]
        mov     r1, #0xFF
        orr     r1, r1, #7, 24
        and     r1, r0, r1
        mov     r0, r1, asr #5
        ldr     r1, [r11, #-0x44]
        and     r1, r1, #0x1F
        mov     r1, r1, lsl #6
        orr     r1, r0, r1
        str     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x20]
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x18]
        mov     r3, #0xB
        bl      LFEN_H263_PutBits
        b       LFEN8
LFEN7:
        ldr     r0, [r11, #-0x48]
        mov     r0, r0, lsl #8
        orr     r0, r0, #6, 18
        ldr     r1, [r11, #-0x44]
        and     r1, r1, #0xFF
        orr     r1, r0, r1
        str     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x20]
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x18]
        mov     r3, #0x16
        bl      LFEN_H263_PutBits
LFEN8:
        ldr     r0, [r11, #-0x38]
        add     r0, r0, #1
        str     r0, [r11, #-0x38]
        mov     r0, #0
        str     r0, [r11, #-0x48]
        b       LFEN10
LFEN9:
        ldr     r0, [r11, #-0x48]
        add     r0, r0, #1
        str     r0, [r11, #-0x48]
LFEN10:
        ldr     r0, [r11, #-0x2C]
        add     r0, r0, #1
        str     r0, [r11, #-0x2C]
        ldr     r0, [r11, #-0x2C]
        cmp     r0, #0x40
        blt     LFEN1
LFEN11:
        ldr     r0, [r11, #-0x48]
        ldr     r1, [r11]
        ldr     r1, [r1, #4]
        cmp     r0, r1
        movgt   r0, #1
        strgt   r0, [r11, #-0x28]
        bgt     LFEN13
        ldr     r0, [r11]
        ldr     r0, [r0, #0xC]
        ldr     r1, [r11, #-0x48]
        ldr     r0, [r0, +r1, lsl #2]
        ldr     r1, [r11, #-0x40]
        add     r1, r0, r1
        sub     r0, r1, #1
        str     r0, [r11, #-0x24]
        ldr     r0, [r11, #-0x24]
        ldr     r1, [r11]
        ldr     r1, [r1, #0xC]
        ldr     r2, [r11, #-0x48]
        mov     r2, r2, lsl #2
        add     r2, r2, #4
        ldr     r2, [r1, +r2]
        cmp     r0, r2
        movge   r0, #1
        strge   r0, [r11, #-0x28]
        bge     LFEN13
        ldr     r0, [r11]
        ldr     r0, [r0, #0x10]
        ldr     r1, [r11, #-0x24]
        ldr     r0, [r0, +r1, lsl #3]
        str     r0, [r11, #-0x20]
        ldr     r0, [r11, #-0x44]
        cmp     r0, #0
        bge     LFEN12
        ldr     r0, [r11, #-0x20]
        orr     r0, r0, #1
        str     r0, [r11, #-0x20]
LFEN12:
        ldr     r0, [r11]
        ldr     r0, [r0, #0x10]
        ldr     r1, [r11, #-0x24]
        mov     r1, r1, lsl #3
        add     r1, r0, r1
        ldr     r3, [r1, #4]
        ldr     r2, [r11, #-0x20]
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x18]
        bl      LFEN_H263_PutBits
        mov     r0, #0
        str     r0, [r11, #-0x28]
LFEN13:
        ldr     r0, [r11, #-0x28]
        cmp     r0, #0
        beq     LFEN15
        ldr     r0, [r11, #-0x40]
        cmp     r0, #0x7F
        ble     LFEN14
        ldr     r0, [r11, #-0x48]
        mov     r0, r0, lsl #8
        orr     r0, r0, #0x80
        orr     r0, r0, #7, 18
        str     r0, [r11, #-0x20]
        ldr     r2, [r11, #-0x20]
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x18]
        mov     r3, #0x16
        bl      LFEN_H263_PutBits
        ldr     r0, [r11, #-0x44]
        mov     r1, #0xFF
        orr     r1, r1, #7, 24
        and     r1, r0, r1
        mov     r0, r1, asr #5
        ldr     r1, [r11, #-0x44]
        and     r1, r1, #0x1F
        mov     r1, r1, lsl #6
        orr     r1, r0, r1
        str     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x20]
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x18]
        mov     r3, #0xB
        bl      LFEN_H263_PutBits
        b       LFEN15
LFEN14:
        ldr     r0, [r11, #-0x48]
        mov     r0, r0, lsl #8
        orr     r0, r0, #7, 18
        ldr     r1, [r11, #-0x44]
        and     r1, r1, #0xFF
        orr     r1, r0, r1
        str     r1, [r11, #-0x20]
        ldr     r2, [r11, #-0x20]
        ldr     r1, [r11, #-0x14]
        ldr     r0, [r11, #-0x18]
        mov     r3, #0x16
        bl      LFEN_H263_PutBits
LFEN15:
        mov     r0, #0
        ldmdb   r11, {r11, sp, pc}
LFEN_H263_PutBits:
        stmdb   sp!, {r4 - r6, lr}
        ldr     r12, [r1]
        ldr     lr, [r0]
        rsb     r4, r3, #0x20
        cmp     r12, #0
        mov     r2, r2, lsl r4
        bne     LFEN16
        mov     r4, r2, lsr #24
        cmp     r3, #8
        strb    r4, [lr]
        ble     LFEN17
        mov     r4, r2, lsr #16
        cmp     r3, #0x10
        strb    r4, [lr, #1]
        ble     LFEN17
        mov     r4, r2, lsr #8
        cmp     r3, #0x18
        strb    r4, [lr, #2]
        strgtb  r2, [lr, #3]
        b       LFEN17
LFEN16:
        ldrb    r5, [lr]
        mov     r6, #0xFF
        rsb     r4, r12, #8
        and     r5, r5, r6, lsl r4
        add     r6, r12, #0x18
        orr     r6, r5, r2, lsr r6
        cmp     r3, r4
        strb    r6, [lr]
        ble     LFEN17
        mov     r2, r2, lsl r4
        rsb     r4, r12, #0x10
        cmp     r3, r4
        mov     r4, r2, lsr #24
        strb    r4, [lr, #1]
        ble     LFEN17
        rsb     r4, r12, #0x18
        cmp     r3, r4
        mov     r4, r2, lsr #16
        strb    r4, [lr, #2]
        ble     LFEN17
        rsb     r4, r12, #0x20
        cmp     r3, r4
        mov     r4, r2, lsr #8
        strb    r4, [lr, #3]
        strgtb  r2, [lr, #4]
LFEN17:
        ldr     r2, [r0]
        add     r3, r12, r3
        add     r2, r2, r3, asr #3
        str     r2, [r0]
        and     r3, r3, #7
        str     r3, [r1]
        ldmia   sp!, {r4 - r6, pc}
        .long   ownvc_Zigzag
        .long   ownvc_AltScanH
        .long   ownvc_AltScanV


