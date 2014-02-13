        .text
        .align  4
        .globl  _ippsFIRInit32f_16s


LBXQ_ownsSRSetDlyLine32f_16s:
        ldr     r2, [r1, #0x48]
        ldr     r3, [r1, #4]
        mov     r12, #0
        cmp     r0, #0
        str     r12, [r1, #0x2C]
        movne   r1, r3
        bne     _ippsFlip_16u
        mov     r1, r2
        mov     r0, r3
        b       _ippsZero_16s
_ippsFIRInit32f_16s:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r12, [sp, #0x24]
        mov     r7, r0
        cmp     r7, #0
        mov     r5, r1
        mov     r6, r2
        mov     r4, r3
        beq     LBXQ2
        cmp     r5, #0
        beq     LBXQ2
        cmp     r12, #0
        beq     LBXQ2
        cmp     r6, #0
        mvnle   r0, #0x19
        ldmleia sp!, {r4 - r11, pc}
        mov     lr, r6, lsl #1
        add     lr, lr, #0xF
        add     r12, r12, #0xF
        bic     r1, lr, #0xF
        bic     r12, r12, #0xF
        str     r12, [r7]
        add     lr, r12, #0x70
        str     lr, [r12]
        ldr     lr, [r7]
        add     r8, r6, r6, lsl #1
        add     r10, r12, r1
        add     r12, r10, #0x70
        str     r12, [lr, #4]
        add     r8, r8, #4
        ldr     r12, [r7]
        mov     r8, r8, lsl #1
        add     lr, r8, #0xF
        bic     r11, lr, #0xF
        add     lr, r10, r11
        add     lr, lr, #0x70
        str     lr, [r12, #0x34]
        ldr     r12, [r7]
        add     lr, r6, #3
        mov     r8, #0
        ldr     r0, [r12, #0x34]
        bic     lr, lr, #3
        add     lr, lr, #1
        mov     r9, r1, asr #3
        add     r0, r0, r9, lsl #1
        str     r0, [r12, #0x38]
        ldr     r2, [r7]
        mov     r0, r6, lsl #2
        add     r0, r0, #0xF
        ldr     r3, [r2, #0x38]
        bic     r0, r0, #0xF
        add     r0, r1, r0
        add     r0, r10, r0
        add     r3, r3, r9, lsl #1
        add     r12, r1, r10
        str     r3, [r2, #0x3C]
        add     r0, r0, r11
        add     r12, r12, r11
        ldr     r11, [r7]
        add     r10, r0, #0x70
        add     r12, r12, #0x70
        ldr     r0, [r11, #0x3C]
        add     r9, r0, r9, lsl #1
        str     r9, [r11, #0x40]
        ldr     r9, [r7]
        str     r12, [r9, #0x54]
        ldr     r9, [r7]
        ldr     r12, [pc, #0xA4]
        str     r12, [r9, #0x58]
        ldr     r12, [r7]
        str     r6, [r12, #8]
        ldr     r12, [r7]
        str     r6, [r12, #0x48]
        ldr     r12, [r7]
        str     r8, [r12, #0x2C]
        ldr     r12, [r7]
        str     r8, [r12, #0x50]
        ldr     r12, [r7]
        str     lr, [r12, #0x1C]
        ldr     r12, [r7]
        str     r10, [r12, #0x4C]
        ldr     r12, [r7]
        ldr     r0, [r12, #0x34]
        bl      _ippsZero_8u
        ldr     r1, [r7]
        mov     r0, r4
        bl      LBXQ_ownsSRSetDlyLine32f_16s
        ldr     r1, [r7]
        mov     r0, r5
        bl      ownsSRSetTaps32f_16s
        ldr     r3, [r7]
        mov     r1, r6
        ldr     r0, [r3]
        bl      ownsTestTaps
        ldr     r1, [r7]
        cmp     r0, #0
        beq     LBXQ0
        ldr     r3, [pc, #0x30]
        ldr     r2, [pc, #0x30]
        str     r3, [r1, #0x64]
        b       LBXQ1
LBXQ0:
        ldr     r3, [pc, #0x28]
        ldr     r2, [pc, #0x28]
        str     r3, [r1, #0x64]
LBXQ1:
        ldr     r7, [r7]
        mov     r0, #0
        str     r2, [r7, #0x68]
        ldmia   sp!, {r4 - r11, pc}
LBXQ2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   0x46493035
        .long   ownsFIROne64s_16s_Sfs
        .long   ownsFIRSR64s_16s_Sfs
        .long   ownsFIROne_16s_Sfs
        .long   ownsFIRSR_16s_Sfs


