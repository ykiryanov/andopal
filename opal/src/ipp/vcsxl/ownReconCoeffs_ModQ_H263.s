        .text
        .align  4
        .globl  ownReconCoeffs_ModQ_H263


ownReconCoeffs_ModQ_H263:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r12, [sp, #0x30]
        ldr     r5, [sp, #0x34]
        ldr     r4, [r1]
        ldr     lr, [r0]
        tst     r12, #1
        sub     r5, r5, #1
        mov     r7, r12, lsl #1
        subeq   r12, r12, #1
        tst     r2, #3
        mov     r6, #0
        bne     LFEH0
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
        b       LFEH1
LFEH0:
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
LFEH1:
        ldrb    r9, [lr, #1]
        ldrb    r8, [lr]
        ldrb    r6, [lr, #2]
        mov     r9, r9, lsl #16
        ldr     r10, [pc, #0x250]
        orr     r8, r9, r8, lsl #24
        orr     r6, r8, r6, lsl #8
        ldrb    r8, [lr, #3]
        ldr     r9, [pc, #0x244]
        ldr     r11, [pc, #0x244]
        str     r3, [sp, #8]
        orr     r8, r6, r8
        ldr     r6, [pc, #0x23C]
        str     r1, [sp, #4]
        str     r0, [sp]
LFEH2:
        cmp     r4, #0x13
        ble     LFEH3
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
LFEH3:
        mov     r1, #0xFF
        rsb     r0, r4, #0x13
        orr     r1, r1, #0x1F, 24
        and     r3, r1, r8, lsr r0
        mov     r0, r3, lsr #6
        cmp     r0, #3
        beq     LFEH7
        cmp     r3, #1, 22
        bcc     LFEH4
        ldr     r1, [pc, #0x1D4]
        mov     r0, r0, lsl #2
        sub     r0, r0, #0x40
        add     r10, r1, r0
        ldrb    r1, [r1, +r0]
        ldrb    r0, [r10, #1]
        ldrb    r9, [r10, #2]
        ldrb    r10, [r10, #3]
        b       LFEH6
LFEH4:
        cmp     r3, #1, 24
        bcc     LFEH5
        ldr     r1, [pc, #0x1A4]
        mov     r0, r3, lsr #3
        mov     r0, r0, lsl #2
        sub     r0, r0, #0x80
        add     r10, r1, r0
        ldrb    r1, [r1, +r0]
        ldrb    r0, [r10, #1]
        ldrb    r9, [r10, #2]
        ldrb    r10, [r10, #3]
        b       LFEH6
LFEH5:
        cmp     r3, #0x10
        bcc     LFEH11
        ldr     r1, [pc, #0x17C]
        mov     r0, r3, lsr #1
        mov     r0, r0, lsl #2
        sub     r0, r0, #0x20
        add     r10, r1, r0
        ldrb    r1, [r1, +r0]
        ldrb    r0, [r10, #1]
        ldrb    r9, [r10, #2]
        ldrb    r10, [r10, #3]
LFEH6:
        mla     r9, r7, r9, r12
        rsb     r11, r10, #0xD
        mov     r11, r3, lsr r11
        tst     r11, #1
        rsbne   r9, r9, #0
        add     r4, r4, r10
        b       LFEH10
LFEH7:
        cmp     r4, #0xA
        ble     LFEH8
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
LFEH8:
        rsb     r0, r4, #0x12
        mov     r1, r8, lsr r0
        add     r0, r4, #0xE
        mov     r8, r8, lsl r0
        and     r0, r1, #0x3F
        movs    r3, r8, asr #24
        add     r0, r0, #1
        and     r1, r1, #0x40
        beq     LFEH12
        add     r8, r4, #0x16
        and     r4, r8, #7
        add     lr, lr, r8, asr #3
        ldrb    r11, [lr, #1]
        ldrb    r8, [lr]
        ldrb    r9, [lr, #2]
        ldrb    r10, [lr, #3]
        mov     r11, r11, lsl #16
        orr     r8, r11, r8, lsl #24
        orr     r9, r8, r9, lsl #8
        cmn     r3, #0x80
        orr     r8, r9, r10
        bne     LFEH9
        add     r3, r4, #5
        mov     r9, r8, lsl r3
        rsb     r3, r4, #0x1B
        mov     r9, r9, asr #21
        bic     r9, r9, #0x1F
        orr     r3, r9, r8, lsr r3
        add     r4, r4, #0xB
LFEH9:
        mla     r9, r7, r3, r12
        cmp     r3, #0
        sublt   r9, r9, r12, lsl #1
LFEH10:
        add     r5, r5, r0
        cmp     r5, #0x3F
        bgt     LFEH13
        ldrb    r0, [r5, +r6]
        cmp     r1, #0
        mov     r0, r0, lsl #1
        strh    r9, [r2, +r0]
        beq     LFEH2
        ldr     r3, [sp, #8]
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        str     r5, [r3]
        add     lr, lr, r4, asr #3
        str     lr, [r0]
        and     r4, r4, #7
        mov     r0, #0
        str     r4, [r1]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LFEH11:
        ldr     r3, [sp, #8]
        mvn     r0, #0xBE
        str     r5, [r3]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LFEH12:
        ldr     r3, [sp, #8]
        mvn     r0, #0xBE
        str     r5, [r3]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LFEH13:
        ldr     r3, [sp, #8]
        sub     r5, r5, r0
        mvn     r0, #0xBE
        str     r5, [r3]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   h263_coefTab1
        .long   h263_coefTab0
        .long   h263_coefTab2
        .long   ownvc_Zigzag


