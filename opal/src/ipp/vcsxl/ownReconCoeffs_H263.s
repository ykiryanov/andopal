        .text
        .align  4
        .globl  ownReconCoeffs_H263


ownReconCoeffs_H263:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r12, [sp, #0x38]
        ldr     r5, [sp, #0x3C]
        ldr     r4, [r1]
        ldr     lr, [r0]
        tst     r12, #1
        sub     r6, r5, #1
        mov     r7, r12, lsl #1
        subeq   r12, r12, #1
        tst     r2, #3
        mov     r5, #0
        bne     LFEI0
        str     r5, [r2]
        str     r5, [r2, #4]
        str     r5, [r2, #8]
        str     r5, [r2, #0xC]
        str     r5, [r2, #0x10]
        str     r5, [r2, #0x14]
        str     r5, [r2, #0x18]
        str     r5, [r2, #0x1C]
        str     r5, [r2, #0x20]
        str     r5, [r2, #0x24]
        str     r5, [r2, #0x28]
        str     r5, [r2, #0x2C]
        str     r5, [r2, #0x30]
        str     r5, [r2, #0x34]
        str     r5, [r2, #0x38]
        str     r5, [r2, #0x3C]
        str     r5, [r2, #0x40]
        str     r5, [r2, #0x44]
        str     r5, [r2, #0x48]
        str     r5, [r2, #0x4C]
        str     r5, [r2, #0x50]
        str     r5, [r2, #0x54]
        str     r5, [r2, #0x58]
        str     r5, [r2, #0x5C]
        str     r5, [r2, #0x60]
        str     r5, [r2, #0x64]
        str     r5, [r2, #0x68]
        str     r5, [r2, #0x6C]
        str     r5, [r2, #0x70]
        str     r5, [r2, #0x74]
        str     r5, [r2, #0x78]
        str     r5, [r2, #0x7C]
        b       LFEI1
LFEI0:
        strh    r5, [r2]
        strh    r5, [r2, #2]
        strh    r5, [r2, #4]
        strh    r5, [r2, #6]
        strh    r5, [r2, #8]
        strh    r5, [r2, #0xA]
        strh    r5, [r2, #0xC]
        strh    r5, [r2, #0xE]
        strh    r5, [r2, #0x10]
        strh    r5, [r2, #0x12]
        strh    r5, [r2, #0x14]
        strh    r5, [r2, #0x16]
        strh    r5, [r2, #0x18]
        strh    r5, [r2, #0x1A]
        strh    r5, [r2, #0x1C]
        strh    r5, [r2, #0x1E]
        strh    r5, [r2, #0x20]
        strh    r5, [r2, #0x22]
        strh    r5, [r2, #0x24]
        strh    r5, [r2, #0x26]
        strh    r5, [r2, #0x28]
        strh    r5, [r2, #0x2A]
        strh    r5, [r2, #0x2C]
        strh    r5, [r2, #0x2E]
        strh    r5, [r2, #0x30]
        strh    r5, [r2, #0x32]
        strh    r5, [r2, #0x34]
        strh    r5, [r2, #0x36]
        strh    r5, [r2, #0x38]
        strh    r5, [r2, #0x3A]
        strh    r5, [r2, #0x3C]
        strh    r5, [r2, #0x3E]
        strh    r5, [r2, #0x40]
        strh    r5, [r2, #0x42]
        strh    r5, [r2, #0x44]
        strh    r5, [r2, #0x46]
        strh    r5, [r2, #0x48]
        strh    r5, [r2, #0x4A]
        strh    r5, [r2, #0x4C]
        strh    r5, [r2, #0x4E]
        strh    r5, [r2, #0x50]
        strh    r5, [r2, #0x52]
        strh    r5, [r2, #0x54]
        strh    r5, [r2, #0x56]
        strh    r5, [r2, #0x58]
        strh    r5, [r2, #0x5A]
        strh    r5, [r2, #0x5C]
        strh    r5, [r2, #0x5E]
        strh    r5, [r2, #0x60]
        strh    r5, [r2, #0x62]
        strh    r5, [r2, #0x64]
        strh    r5, [r2, #0x66]
        strh    r5, [r2, #0x68]
        strh    r5, [r2, #0x6A]
        strh    r5, [r2, #0x6C]
        strh    r5, [r2, #0x6E]
        strh    r5, [r2, #0x70]
        strh    r5, [r2, #0x72]
        strh    r5, [r2, #0x74]
        strh    r5, [r2, #0x76]
        strh    r5, [r2, #0x78]
        strh    r5, [r2, #0x7A]
        strh    r5, [r2, #0x7C]
        strh    r5, [r2, #0x7E]
LFEI1:
        ldrb    r9, [lr, #1]
        ldrb    r8, [lr]
        ldrb    r5, [lr, #2]
        mov     r9, r9, lsl #16
        ldr     r11, [pc, #0x264]
        orr     r8, r9, r8, lsl #24
        orr     r5, r8, r5, lsl #8
        ldrb    r8, [lr, #3]
        ldr     r10, [pc, #0x258]
        mvn     r9, #0xFF
        bic     r9, r9, #7, 24
        orr     r8, r5, r8
        mov     r5, #0xFF
        orr     r5, r5, #7, 24
        str     r9, [sp, #0xC]
        str     r3, [sp, #8]
        str     r1, [sp, #4]
        str     r0, [sp]
LFEI2:
        cmp     r4, #0x13
        ble     LFEI3
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
LFEI3:
        mov     r0, #0
        sub     r0, r0, #2, 22
        mvn     r1, r0
        add     r1, r1, #6, 22
        rsb     r0, r4, #0x13
        and     r1, r1, r8, lsr r0
        mov     r0, r1, lsr #6
        cmp     r0, #3
        beq     LFEI7
        cmp     r1, #1, 22
        bcc     LFEI4
        ldr     r3, [pc, #0x1D0]
        mov     r0, r0, lsl #2
        sub     r0, r0, #0x40
        add     r10, r3, r0
        ldrb    r3, [r3, +r0]
        ldrb    r0, [r10, #1]
        ldrb    r9, [r10, #2]
        ldrb    r10, [r10, #3]
        b       LFEI6
LFEI4:
        cmp     r1, #1, 24
        bcc     LFEI5
        ldr     r3, [pc, #0x1A8]
        mov     r0, r1, lsr #3
        mov     r0, r0, lsl #2
        sub     r0, r0, #0x80
        add     r10, r3, r0
        ldrb    r3, [r3, +r0]
        ldrb    r0, [r10, #1]
        ldrb    r9, [r10, #2]
        ldrb    r10, [r10, #3]
        b       LFEI6
LFEI5:
        cmp     r1, #0x10
        bcc     LFEI10
        ldr     r3, [pc, #0x17C]
        mov     r0, r1, lsr #1
        mov     r0, r0, lsl #2
        sub     r0, r0, #0x20
        add     r10, r3, r0
        ldrb    r3, [r3, +r0]
        ldrb    r0, [r10, #1]
        ldrb    r9, [r10, #2]
        ldrb    r10, [r10, #3]
LFEI6:
        mla     r9, r9, r7, r12
        rsb     r11, r10, #0xD
        mov     r11, r1, lsr r11
        tst     r11, #1
        rsbne   r9, r9, #0
        add     r4, r4, r10
        b       LFEI9
LFEI7:
        cmp     r4, #0xA
        ble     LFEI8
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
LFEI8:
        add     r0, r4, #0xE
        mov     r0, r8, lsl r0
        rsb     r1, r4, #0x12
        mov     r8, r8, lsr r1
        mov     r1, r0, asr #24
        and     r0, r8, #0x3F
        tst     r1, #0x7F
        add     r0, r0, #1
        and     r3, r8, #0x40
        beq     LFEI11
        mla     r9, r1, r7, r12
        cmp     r1, #0
        sublt   r9, r9, r12, lsl #1
        add     r1, r4, #0x16
        and     r4, r1, #7
        add     lr, lr, r1, asr #3
        ldrb    r10, [lr, #1]
        ldrb    r8, [lr, #2]
        ldrb    r1, [lr]
        mov     r10, r10, lsl #16
        str     r8, [sp, #0x10]
        ldrb    r8, [lr, #3]
        orr     r1, r10, r1, lsl #24
        ldr     r10, [sp, #0x10]
        orr     r10, r1, r10, lsl #8
        orr     r8, r10, r8
LFEI9:
        add     r6, r6, r0
        cmp     r6, #0x3F
        bgt     LFEI12
        ldr     r0, [pc, #0x9C]
        ldr     r1, [sp, #0xC]
        cmp     r5, r9
        ldrb    r0, [r6, +r0]
        movlt   r9, r5
        cmn     r9, #2, 22
        movlt   r9, r1
        mov     r0, r0, lsl #1
        cmp     r3, #0
        strh    r9, [r2, +r0]
        beq     LFEI2
        ldr     r3, [sp, #8]
        ldr     r0, [sp]
        ldr     r1, [sp, #4]
        str     r6, [r3]
        add     lr, lr, r4, asr #3
        str     lr, [r0]
        and     r4, r4, #7
        mov     r0, #0
        str     r4, [r1]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LFEI10:
        ldr     r3, [sp, #8]
        mvn     r0, #0xBE
        str     r6, [r3]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LFEI11:
        ldr     r3, [sp, #8]
        mvn     r0, #0xBE
        str     r6, [r3]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LFEI12:
        ldr     r3, [sp, #8]
        sub     r6, r6, r0
        mvn     r0, #0xBE
        str     r6, [r3]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   h263_coefTab0
        .long   h263_coefTab1
        .long   h263_coefTab2
        .long   ownvc_Zigzag


