        .text
        .align  4
        .globl  _ippsFIRInit32s_16s


LBUL_ownsSRSetTaps32s_16s:
        stmdb   sp!, {r4, r5, lr}
        mov     r4, r2
        mov     r5, r1
        ldr     r2, [r4, #8]
        ldr     r1, [r4]
        bl      ownsCvt32sTo16s
        add     r5, r0, r5
        str     r5, [r4, #0x28]
        ldmia   sp!, {r4, r5, pc}
LBUL_ownsSRSetDlyLine32s_16s:
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
_ippsFIRInit32s_16s:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r7, [sp, #0x24]
        ldr     r12, [sp, #0x28]
        mov     r8, r0
        cmp     r8, #0
        mov     r4, r1
        mov     r6, r2
        mov     r5, r3
        beq     LBUL2
        cmp     r4, #0
        beq     LBUL2
        cmp     r12, #0
        beq     LBUL2
        cmp     r6, #0
        mvnle   r0, #0x19
        ldmleia sp!, {r4 - r11, pc}
        mov     lr, r6, lsl #1
        add     r12, r12, #0xF
        add     lr, lr, #0xF
        bic     r1, lr, #0xF
        add     lr, r6, r6, lsl #1
        add     r9, lr, #4
        bic     r12, r12, #0xF
        str     r12, [r8]
        add     lr, r12, #0x70
        str     lr, [r12]
        ldr     lr, [r8]
        mov     r9, r9, lsl #1
        add     r9, r9, #0xF
        bic     r10, r9, #0xF
        add     r11, r12, r1
        add     r12, r11, #0x70
        str     r12, [lr, #4]
        ldr     r12, [r8]
        add     lr, r11, r10
        add     lr, lr, #0x70
        str     lr, [r12, #0x34]
        ldr     lr, [r8]
        add     r12, r1, r11
        add     r12, r12, r10
        ldr     r2, [lr, #0x34]
        mov     r9, r1, asr #3
        add     r0, r6, #3
        add     r12, r12, #0x70
        add     r2, r2, r9, lsl #1
        str     r2, [lr, #0x38]
        bic     r0, r0, #3
        add     lr, r0, #1
        ldr     r0, [r8]
        mov     r2, r6, lsl #2
        add     r3, r2, #0xF
        ldr     r2, [r0, #0x38]
        bic     r3, r3, #0xF
        add     r3, r1, r3
        add     r3, r11, r3
        add     r2, r2, r9, lsl #1
        str     r2, [r0, #0x3C]
        ldr     r11, [r8]
        add     r10, r3, r10
        add     r10, r10, #0x70
        ldr     r0, [r11, #0x3C]
        add     r9, r0, r9, lsl #1
        str     r9, [r11, #0x40]
        ldr     r9, [r8]
        str     r12, [r9, #0x54]
        ldr     r12, [pc, #0xB8]
        ldr     r9, [r8]
        str     r12, [r9, #0x58]
        ldr     r12, [r8]
        str     r6, [r12, #8]
        ldr     r12, [r8]
        str     r6, [r12, #0x48]
        ldr     r9, [r8]
        mov     r12, #0
        str     r12, [r9, #0x2C]
        ldr     r9, [r8]
        str     r12, [r9, #0x50]
        ldr     r12, [r8]
        str     r5, [r12, #0x60]
        ldr     r12, [r8]
        str     lr, [r12, #0x1C]
        ldr     r12, [r8]
        str     r10, [r12, #0x4C]
        ldr     r12, [r8]
        ldr     r0, [r12, #0x34]
        bl      _ippsZero_8u
        ldr     r1, [r8]
        mov     r0, r7
        bl      LBUL_ownsSRSetDlyLine32s_16s
        ldr     r2, [r8]
        mov     r0, r4
        mov     r1, r5
        bl      LBUL_ownsSRSetTaps32s_16s
        ldr     r3, [r8]
        mov     r1, r6
        ldr     r0, [r3]
        bl      ownsTestTaps
        ldr     r1, [r8]
        cmp     r0, #0
        beq     LBUL0
        ldr     r3, [pc, #0x30]
        ldr     r2, [pc, #0x30]
        str     r3, [r1, #0x64]
        b       LBUL1
LBUL0:
        ldr     r3, [pc, #0x28]
        ldr     r2, [pc, #0x28]
        str     r3, [r1, #0x64]
LBUL1:
        ldr     r8, [r8]
        mov     r0, #0
        str     r2, [r8, #0x68]
        ldmia   sp!, {r4 - r11, pc}
LBUL2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   0x46493039
        .long   ownsFIROne64s_16s_Sfs
        .long   ownsFIRSR64s_16s_Sfs
        .long   ownsFIROne_16s_Sfs
        .long   ownsFIRSR_16s_Sfs


