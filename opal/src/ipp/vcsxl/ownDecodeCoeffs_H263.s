        .text
        .align  4
        .globl  ownDecodeCoeffs_H263


ownDecodeCoeffs_H263:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r4, [sp, #0x3C]
        ldr     lr, [sp, #0x38]
        str     r1, [sp, #4]
        ldr     r7, [sp, #0x34]
        ldr     r1, [r1]
        ldr     r12, [r0]
        cmp     r4, #0
        sub     lr, lr, #1
        mov     r9, #0
        ldreq   r6, [pc, #0x3B0]
        beq     LFET0
        cmp     r4, #2
        ldreq   r6, [pc, #0x3A8]
        beq     LFET0
        cmp     r4, #1
        ldreq   r6, [pc, #0x3A0]
        movne   r6, #0
LFET0:
        ldr     r5, [r7]
        ldr     r4, [r7, #4]
        ldr     r8, [r7, #8]
        tst     r2, #3
        bne     LFET1
        str     r9, [r2]
        str     r9, [r2, #4]
        str     r9, [r2, #8]
        str     r9, [r2, #0xC]
        str     r9, [r2, #0x10]
        str     r9, [r2, #0x14]
        str     r9, [r2, #0x18]
        str     r9, [r2, #0x1C]
        str     r9, [r2, #0x20]
        str     r9, [r2, #0x24]
        str     r9, [r2, #0x28]
        str     r9, [r2, #0x2C]
        str     r9, [r2, #0x30]
        str     r9, [r2, #0x34]
        str     r9, [r2, #0x38]
        str     r9, [r2, #0x3C]
        str     r9, [r2, #0x40]
        str     r9, [r2, #0x44]
        str     r9, [r2, #0x48]
        str     r9, [r2, #0x4C]
        str     r9, [r2, #0x50]
        str     r9, [r2, #0x54]
        str     r9, [r2, #0x58]
        str     r9, [r2, #0x5C]
        str     r9, [r2, #0x60]
        str     r9, [r2, #0x64]
        str     r9, [r2, #0x68]
        str     r9, [r2, #0x6C]
        str     r9, [r2, #0x70]
        str     r9, [r2, #0x74]
        str     r9, [r2, #0x78]
        str     r9, [r2, #0x7C]
        b       LFET2
LFET1:
        strh    r9, [r2]
        strh    r9, [r2, #2]
        strh    r9, [r2, #4]
        strh    r9, [r2, #6]
        strh    r9, [r2, #8]
        strh    r9, [r2, #0xA]
        strh    r9, [r2, #0xC]
        strh    r9, [r2, #0xE]
        strh    r9, [r2, #0x10]
        strh    r9, [r2, #0x12]
        strh    r9, [r2, #0x14]
        strh    r9, [r2, #0x16]
        strh    r9, [r2, #0x18]
        strh    r9, [r2, #0x1A]
        strh    r9, [r2, #0x1C]
        strh    r9, [r2, #0x1E]
        strh    r9, [r2, #0x20]
        strh    r9, [r2, #0x22]
        strh    r9, [r2, #0x24]
        strh    r9, [r2, #0x26]
        strh    r9, [r2, #0x28]
        strh    r9, [r2, #0x2A]
        strh    r9, [r2, #0x2C]
        strh    r9, [r2, #0x2E]
        strh    r9, [r2, #0x30]
        strh    r9, [r2, #0x32]
        strh    r9, [r2, #0x34]
        strh    r9, [r2, #0x36]
        strh    r9, [r2, #0x38]
        strh    r9, [r2, #0x3A]
        strh    r9, [r2, #0x3C]
        strh    r9, [r2, #0x3E]
        strh    r9, [r2, #0x40]
        strh    r9, [r2, #0x42]
        strh    r9, [r2, #0x44]
        strh    r9, [r2, #0x46]
        strh    r9, [r2, #0x48]
        strh    r9, [r2, #0x4A]
        strh    r9, [r2, #0x4C]
        strh    r9, [r2, #0x4E]
        strh    r9, [r2, #0x50]
        strh    r9, [r2, #0x52]
        strh    r9, [r2, #0x54]
        strh    r9, [r2, #0x56]
        strh    r9, [r2, #0x58]
        strh    r9, [r2, #0x5A]
        strh    r9, [r2, #0x5C]
        strh    r9, [r2, #0x5E]
        strh    r9, [r2, #0x60]
        strh    r9, [r2, #0x62]
        strh    r9, [r2, #0x64]
        strh    r9, [r2, #0x66]
        strh    r9, [r2, #0x68]
        strh    r9, [r2, #0x6A]
        strh    r9, [r2, #0x6C]
        strh    r9, [r2, #0x6E]
        strh    r9, [r2, #0x70]
        strh    r9, [r2, #0x72]
        strh    r9, [r2, #0x74]
        strh    r9, [r2, #0x76]
        strh    r9, [r2, #0x78]
        strh    r9, [r2, #0x7A]
        strh    r9, [r2, #0x7C]
        strh    r9, [r2, #0x7E]
LFET2:
        ldrb    r11, [r12, #1]
        ldrb    r7, [r12]
        ldrb    r9, [r12, #2]
        ldrb    r10, [r12, #3]
        mov     r11, r11, lsl #16
        orr     r7, r11, r7, lsl #24
        orr     r9, r7, r9, lsl #8
        orr     r7, r9, r10
        str     r8, [sp, #0xC]
        str     r3, [sp, #8]
        str     r0, [sp]
LFET3:
        mov     r0, #0xFF
        orr     r0, r0, #0x1F, 24
        rsb     r3, r1, #0x13
        and     r9, r0, r7, lsr r3
        mov     r0, r9, lsr #6
        cmp     r0, #3
        beq     LFET7
        cmp     r9, #1, 22
        bcc     LFET4
        mov     r0, r0, lsl #2
        sub     r0, r0, #0x40
        ldrb    r8, [r5, +r0]
        add     r10, r5, r0
        ldrb    r0, [r10, #1]
        ldrb    r3, [r10, #2]
        ldrb    r10, [r10, #3]
        b       LFET6
LFET4:
        cmp     r9, #1, 24
        bcc     LFET5
        mov     r0, r9, lsr #3
        mov     r0, r0, lsl #2
        sub     r0, r0, #0x80
        ldrb    r8, [r4, +r0]
        add     r10, r4, r0
        ldrb    r0, [r10, #1]
        ldrb    r3, [r10, #2]
        ldrb    r10, [r10, #3]
        b       LFET6
LFET5:
        cmp     r9, #0x10
        bcc     LFET9
        ldr     r3, [sp, #0xC]
        mov     r0, r9, lsr #1
        mov     r0, r0, lsl #2
        sub     r0, r0, #0x20
        ldrb    r8, [r3, +r0]
        add     r10, r3, r0
        ldrb    r0, [r10, #1]
        ldrb    r3, [r10, #2]
        ldrb    r10, [r10, #3]
LFET6:
        rsb     r11, r10, #0xD
        mov     r11, r9, lsr r11
        tst     r11, #1
        rsbne   r3, r3, #0
        add     r1, r1, r10
        cmp     r1, #0xA
        ble     LFET8
        add     r12, r12, r1, asr #3
        ldrb    r11, [r12, #1]
        ldrb    r7, [r12]
        ldrb    r9, [r12, #2]
        ldrb    r10, [r12, #3]
        mov     r11, r11, lsl #16
        orr     r7, r11, r7, lsl #24
        orr     r9, r7, r9, lsl #8
        and     r1, r1, #7
        orr     r7, r9, r10
        b       LFET8
LFET7:
        add     r0, r1, #0xE
        mov     r0, r7, lsl r0
        rsb     r3, r1, #0x12
        mov     r7, r7, lsr r3
        mov     r3, r0, asr #24
        and     r0, r7, #0x3F
        tst     r3, #0x7F
        add     r0, r0, #1
        and     r8, r7, #0x40
        beq     LFET11
        add     r7, r1, #0x16
        and     r1, r7, #7
        add     r12, r12, r7, asr #3
        ldrb    r11, [r12, #1]
        ldrb    r7, [r12]
        ldrb    r9, [r12, #2]
        ldrb    r10, [r12, #3]
        mov     r11, r11, lsl #16
        orr     r7, r11, r7, lsl #24
        orr     r9, r7, r9, lsl #8
        orr     r7, r9, r10
LFET8:
        add     lr, lr, r0
        cmp     lr, #0x3F
        bgt     LFET10
        mov     r3, r3, lsl #16
        cmp     r6, #0
        mov     r0, r3, asr #16
        moveq   r3, lr, lsl #1
        ldrneb  r3, [r6, +lr]
        movne   r3, r3, lsl #1
        cmp     r8, #0
        strh    r0, [r2, +r3]
        beq     LFET3
        ldr     r3, [sp, #8]
        ldr     r0, [sp]
        add     r12, r12, r1, asr #3
        str     lr, [r3]
        and     r1, r1, #7
        str     r12, [r0]
        ldr     r0, [sp, #4]
        str     r1, [r0]
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LFET9:
        ldr     r3, [sp, #8]
        mvn     r0, #0xBE
        str     lr, [r3]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LFET10:
        ldr     r3, [sp, #8]
        sub     lr, lr, r0
        mvn     r0, #0xBE
        str     lr, [r3]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LFET11:
        ldr     r3, [sp, #8]
        mvn     r0, #0xBE
        str     lr, [r3]
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
        .long   ownvc_Zigzag
        .long   ownvc_AltScanH
        .long   ownvc_AltScanV


