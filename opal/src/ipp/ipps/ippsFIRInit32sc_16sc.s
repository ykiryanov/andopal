        .text
        .align  4
        .globl  _ippsFIRInit32sc_16sc


LBUJ_ownsSRSetTaps32sc_16sc:
        stmdb   sp!, {r4, r5, lr}
        mov     r4, r2
        mov     r5, r1
        ldr     r2, [r4, #8]
        ldr     r1, [r4]
        bl      ownsCvt32scTo16sc
        add     r5, r0, r5
        str     r5, [r4, #0x28]
        ldmia   sp!, {r4, r5, pc}
LBUJ_ownsSRSetDlyLine32sc_16sc:
        stmdb   sp!, {r4 - r10, lr}
        mov     r3, r1
        ldr     r2, [r3, #4]
        ldr     r1, [r3, #0x48]
        mov     r7, #0
        cmp     r0, #0
        str     r7, [r3, #0x2C]
        beq     LBUJ4
        cmp     r1, #0
        ble     LBUJ3
        cmp     r1, #5
        sub     r3, r1, #1
        addlt   r3, r0, r3, lsl #2
        blt     LBUJ1
        add     r3, r0, r3, lsl #2
        mvn     r6, #0
        mvn     r5, #1
        mvn     r4, #2
        sub     lr, r1, #5
        sub     r12, r2, #2
LBUJ0:
        rsb     r9, r7, #0
        rsb     r8, r7, r6
        mov     r10, r9, lsl #2
        ldrsh   r9, [r3, +r10]
        add     r10, r3, r10
        mov     r8, r8, lsl #2
        strh    r9, [r12, #2]
        ldrsh   r10, [r10, #2]
        strh    r10, [r12, #4]
        ldrsh   r9, [r3, +r8]
        add     r8, r3, r8
        strh    r9, [r12, #6]
        ldrsh   r8, [r8, #2]
        rsb     r9, r7, r5
        mov     r10, r9, lsl #2
        strh    r8, [r12, #8]
        ldrsh   r9, [r3, +r10]
        add     r10, r3, r10
        rsb     r8, r7, r4
        strh    r9, [r12, #0xA]
        ldrsh   r10, [r10, #2]
        mov     r8, r8, lsl #2
        add     r7, r7, #4
        strh    r10, [r12, #0xC]
        ldrsh   r9, [r3, +r8]
        add     r8, r3, r8
        cmp     r7, lr
        strh    r9, [r12, #0xE]
        ldrsh   r8, [r8, #2]
        strh    r8, [r12, #0x10]!
        ble     LBUJ0
LBUJ1:
        mov     r12, r7, lsl #2
        sub     r12, r12, #2
        add     r2, r12, r2
LBUJ2:
        rsb     r0, r7, #0
        add     r7, r7, #1
        mov     r12, r0, lsl #2
        ldrsh   r0, [r3, +r12]
        add     r12, r3, r12
        cmp     r7, r1
        strh    r0, [r2, #2]
        ldrsh   r12, [r12, #2]
        strh    r12, [r2, #4]!
        blt     LBUJ2
LBUJ3:
        ldmia   sp!, {r4 - r10, pc}
LBUJ4:
        mov     r0, r2
        ldmia   sp!, {r4 - r10, lr}
        b       _ippsZero_16sc
_ippsFIRInit32sc_16sc:
        stmdb   sp!, {r4 - r11, lr}
        ldr     r7, [sp, #0x24]
        ldr     r12, [sp, #0x28]
        mov     r8, r0
        cmp     r8, #0
        mov     r4, r1
        mov     r6, r2
        mov     r5, r3
        beq     LBUJ7
        cmp     r4, #0
        beq     LBUJ7
        cmp     r12, #0
        beq     LBUJ7
        cmp     r6, #0
        mvnle   r0, #0x19
        ldmleia sp!, {r4 - r11, pc}
        mov     lr, r6, lsl #2
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
        mov     r9, r9, lsl #2
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
        mov     r9, r1, asr #4
        add     r0, r6, #3
        add     r12, r12, #0x70
        add     r2, r2, r9, lsl #2
        str     r2, [lr, #0x38]
        bic     r0, r0, #3
        add     lr, r0, #1
        ldr     r0, [r8]
        mov     r2, r6, lsl #3
        add     r3, r2, #0xF
        ldr     r2, [r0, #0x38]
        bic     r3, r3, #0xF
        add     r3, r1, r3
        add     r3, r11, r3
        add     r2, r2, r9, lsl #2
        str     r2, [r0, #0x3C]
        ldr     r11, [r8]
        add     r10, r3, r10
        add     r10, r10, #0x70
        ldr     r0, [r11, #0x3C]
        add     r9, r0, r9, lsl #2
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
        bl      LBUJ_ownsSRSetDlyLine32sc_16sc
        ldr     r2, [r8]
        mov     r0, r4
        mov     r1, r5
        bl      LBUJ_ownsSRSetTaps32sc_16sc
        ldr     r3, [r8]
        mov     r1, r6
        ldr     r0, [r3]
        bl      ownsTestTapsCplx
        ldr     r1, [r8]
        cmp     r0, #0
        beq     LBUJ5
        ldr     r3, [pc, #0x30]
        ldr     r2, [pc, #0x30]
        str     r3, [r1, #0x64]
        b       LBUJ6
LBUJ5:
        ldr     r3, [pc, #0x28]
        ldr     r2, [pc, #0x28]
        str     r3, [r1, #0x64]
LBUJ6:
        ldr     r8, [r8]
        mov     r0, #0
        str     r2, [r8, #0x68]
        ldmia   sp!, {r4 - r11, pc}
LBUJ7:
        mvn     r0, #7
        ldmia   sp!, {r4 - r11, pc}
        .long   0x46493130
        .long   ownsFIROne64sc_16sc_Sfs
        .long   ownsFIRSR64sc_16sc_Sfs
        .long   ownsFIROne_16sc_Sfs
        .long   ownsFIRSR_16sc_Sfs


