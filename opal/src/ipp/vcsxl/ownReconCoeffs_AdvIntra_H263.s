        .text
        .align  4
        .globl  ownReconCoeffs_AdvIntra_H263


ownReconCoeffs_AdvIntra_H263:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r5, [sp, #0x34]
        ldr     r6, [sp, #0x30]
        ldr     r4, [r1]
        ldr     lr, [r0]
        ldr     r12, [pc, #0x3E0]
        cmp     r5, #2
        ldreq   r12, [pc, #0x3DC]
        beq     LFEK0
        cmp     r5, #1
        ldreq   r12, [pc, #0x3D4]
LFEK0:
        mov     r5, r6, lsl #1
        tst     r2, #3
        mov     r6, #0
        bne     LFEK1
        str     r6, [r2]
        str     r6, [r2, #4]
        str     r6, [r2, #8]
        str     r6, [r2, #0xC]
        str     r6, [r2, #0x10]
        str     r6, [r2, #0x14]
        str     r6, [r2, #0x18]
        str     r6, [r2, #0x1C]
        str     r6, [r2, #0x20]
        str     r6, [r2, #0x24]
        str     r6, [r2, #0x28]
        str     r6, [r2, #0x2C]
        str     r6, [r2, #0x30]
        str     r6, [r2, #0x34]
        str     r6, [r2, #0x38]
        str     r6, [r2, #0x3C]
        str     r6, [r2, #0x40]
        str     r6, [r2, #0x44]
        str     r6, [r2, #0x48]
        str     r6, [r2, #0x4C]
        str     r6, [r2, #0x50]
        str     r6, [r2, #0x54]
        str     r6, [r2, #0x58]
        str     r6, [r2, #0x5C]
        str     r6, [r2, #0x60]
        str     r6, [r2, #0x64]
        str     r6, [r2, #0x68]
        str     r6, [r2, #0x6C]
        str     r6, [r2, #0x70]
        str     r6, [r2, #0x74]
        str     r6, [r2, #0x78]
        str     r6, [r2, #0x7C]
        b       LFEK2
LFEK1:
        strh    r6, [r2]
        strh    r6, [r2, #2]
        strh    r6, [r2, #4]
        strh    r6, [r2, #6]
        strh    r6, [r2, #8]
        strh    r6, [r2, #0xA]
        strh    r6, [r2, #0xC]
        strh    r6, [r2, #0xE]
        strh    r6, [r2, #0x10]
        strh    r6, [r2, #0x12]
        strh    r6, [r2, #0x14]
        strh    r6, [r2, #0x16]
        strh    r6, [r2, #0x18]
        strh    r6, [r2, #0x1A]
        strh    r6, [r2, #0x1C]
        strh    r6, [r2, #0x1E]
        strh    r6, [r2, #0x20]
        strh    r6, [r2, #0x22]
        strh    r6, [r2, #0x24]
        strh    r6, [r2, #0x26]
        strh    r6, [r2, #0x28]
        strh    r6, [r2, #0x2A]
        strh    r6, [r2, #0x2C]
        strh    r6, [r2, #0x2E]
        strh    r6, [r2, #0x30]
        strh    r6, [r2, #0x32]
        strh    r6, [r2, #0x34]
        strh    r6, [r2, #0x36]
        strh    r6, [r2, #0x38]
        strh    r6, [r2, #0x3A]
        strh    r6, [r2, #0x3C]
        strh    r6, [r2, #0x3E]
        strh    r6, [r2, #0x40]
        strh    r6, [r2, #0x42]
        strh    r6, [r2, #0x44]
        strh    r6, [r2, #0x46]
        strh    r6, [r2, #0x48]
        strh    r6, [r2, #0x4A]
        strh    r6, [r2, #0x4C]
        strh    r6, [r2, #0x4E]
        strh    r6, [r2, #0x50]
        strh    r6, [r2, #0x52]
        strh    r6, [r2, #0x54]
        strh    r6, [r2, #0x56]
        strh    r6, [r2, #0x58]
        strh    r6, [r2, #0x5A]
        strh    r6, [r2, #0x5C]
        strh    r6, [r2, #0x5E]
        strh    r6, [r2, #0x60]
        strh    r6, [r2, #0x62]
        strh    r6, [r2, #0x64]
        strh    r6, [r2, #0x66]
        strh    r6, [r2, #0x68]
        strh    r6, [r2, #0x6A]
        strh    r6, [r2, #0x6C]
        strh    r6, [r2, #0x6E]
        strh    r6, [r2, #0x70]
        strh    r6, [r2, #0x72]
        strh    r6, [r2, #0x74]
        strh    r6, [r2, #0x76]
        strh    r6, [r2, #0x78]
        strh    r6, [r2, #0x7A]
        strh    r6, [r2, #0x7C]
        strh    r6, [r2, #0x7E]
LFEK2:
        ldrb    r6, [lr, #1]
        ldrb    r8, [lr]
        ldrb    r7, [lr, #2]
        mov     r9, r6, lsl #16
        ldrb    r6, [lr, #3]
        orr     r8, r9, r8, lsl #24
        orr     r7, r8, r7, lsl #8
        ldr     r9, [pc, #0x224]
        ldr     r10, [pc, #0x224]
        ldr     r11, [pc, #0x224]
        orr     r8, r7, r6
        mvn     r6, #0
        mov     r7, r6
        str     r3, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LFEK3:
        cmp     r4, #0x13
        ble     LFEK4
        add     lr, lr, r4, asr #3
        ldrb    r8, [lr, #1]
        ldrb    r3, [lr]
        ldrb    r1, [lr, #2]
        ldrb    r0, [lr, #3]
        mov     r8, r8, lsl #16
        orr     r3, r8, r3, lsl #24
        orr     r1, r3, r1, lsl #8
        and     r4, r4, #7
        orr     r8, r1, r0
LFEK4:
        add     r0, r6, #2, 20
        rsb     r1, r4, #0x13
        and     r3, r0, r8, lsr r1
        mov     r0, r3, lsr #6
        cmp     r0, #3
        beq     LFEK8
        cmp     r3, #1, 22
        bcc     LFEK5
        ldr     r1, [pc, #0x1B0]
        mov     r0, r0, lsl #2
        sub     r0, r0, #0x40
        ldrb    r9, [r1, +r0]
        add     r10, r1, r0
        ldrb    r1, [r10, #1]
        ldrb    r0, [r10, #2]
        ldrb    r10, [r10, #3]
        b       LFEK7
LFEK5:
        cmp     r3, #1, 24
        bcc     LFEK6
        ldr     r1, [pc, #0x188]
        mov     r0, r3, lsr #3
        mov     r0, r0, lsl #2
        sub     r0, r0, #0x80
        ldrb    r9, [r1, +r0]
        add     r10, r1, r0
        ldrb    r1, [r10, #1]
        ldrb    r0, [r10, #2]
        ldrb    r10, [r10, #3]
        b       LFEK7
LFEK6:
        cmp     r3, #0x10
        bcc     LFEK11
        ldr     r1, [pc, #0x15C]
        mov     r0, r3, lsr #1
        mov     r0, r0, lsl #2
        sub     r0, r0, #0x20
        ldrb    r9, [r1, +r0]
        add     r10, r1, r0
        ldrb    r1, [r10, #1]
        ldrb    r0, [r10, #2]
        ldrb    r10, [r10, #3]
LFEK7:
        rsb     r11, r10, #0xD
        mov     r11, r3, lsr r11
        tst     r11, #1
        rsbne   r0, r0, #0
        add     r4, r4, r10
        b       LFEK10
LFEK8:
        cmp     r4, #0xA
        ble     LFEK9
        add     lr, lr, r4, asr #3
        ldrb    r8, [lr, #1]
        ldrb    r3, [lr]
        ldrb    r1, [lr, #2]
        ldrb    r0, [lr, #3]
        mov     r8, r8, lsl #16
        orr     r3, r8, r3, lsl #24
        orr     r1, r3, r1, lsl #8
        and     r4, r4, #7
        orr     r8, r1, r0
LFEK9:
        add     r0, r4, #0xE
        mov     r0, r8, lsl r0
        rsb     r1, r4, #0x12
        mov     r8, r8, lsr r1
        mov     r0, r0, asr #24
        and     r1, r8, #0x3F
        tst     r0, #0x7F
        add     r1, r1, #1
        and     r9, r8, #0x40
        beq     LFEK13
        add     r3, r4, #0x16
        and     r4, r3, #7
        add     lr, lr, r3, asr #3
        ldrb    r11, [lr, #1]
        ldrb    r3, [lr]
        ldrb    r8, [lr, #2]
        ldrb    r10, [lr, #3]
        mov     r11, r11, lsl #16
        orr     r3, r11, r3, lsl #24
        orr     r8, r3, r8, lsl #8
        orr     r8, r8, r10
LFEK10:
        add     r7, r7, r1
        cmp     r7, #0x3F
        bgt     LFEK12
        mul     r0, r5, r0
        ldrb    r1, [r12, +r7]
        cmp     r9, #0
        mov     r1, r1, lsl #1
        strh    r0, [r2, +r1]
        beq     LFEK3
        ldr     r3, [sp, #8]
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        str     r7, [r3]
        add     lr, lr, r4, asr #3
        str     lr, [r0]
        and     r4, r4, #7
        mov     r0, #0
        str     r4, [r1]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LFEK11:
        ldr     r3, [sp, #8]
        mvn     r0, #0xBE
        str     r7, [r3]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LFEK12:
        ldr     r3, [sp, #8]
        sub     r7, r7, r1
        mvn     r0, #0xBE
        str     r7, [r3]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LFEK13:
        ldr     r3, [sp, #8]
        mvn     r0, #0xBE
        str     r7, [r3]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   ownvc_Zigzag
        .long   ownvc_AltScanH
        .long   ownvc_AltScanV
        .long   h263_advCoefTab0
        .long   h263_advCoefTab1
        .long   h263_advCoefTab2

