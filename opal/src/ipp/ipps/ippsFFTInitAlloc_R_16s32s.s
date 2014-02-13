        .text
        .align  4
        .globl  _ippsFFTInitAlloc_R_16s32s


LCAZ_deleteFftCtx:
        ldr     r2, [r0, #0x10]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr
LCAZ_getSizeRmFFT:
        stmdb   sp!, {r4, r5, lr}
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        cmp     r0, #0
        bne     LCAZ0
        mov     r12, #0
        mov     r0, r12
        str     r0, [r3]
        b       LCAZ1
LCAZ0:
        sub     r12, r0, #1
        mov     lr, #1
        mov     r12, lr, lsl r12
        mov     r0, lr, lsl r0
        mov     r4, r12, asr #1
        mov     lr, r12, lsl #4
        add     r4, r12, r4, lsr #30
        bic     r4, r4, #3
        mov     r5, r0, lsl #4
        add     r12, lr, #0x1F
        add     r4, r4, #0x23
        mov     lr, r0, asr #1
        add     r5, r5, #0x1F
        bic     r4, r4, #0x1F
        bic     r12, r12, #0x1F
        add     lr, r0, lr, lsr #30
        bic     r5, r5, #0x1F
        add     r4, r12, r4
        add     r5, r4, r5
        bic     lr, lr, #3
        str     r5, [r3]
        add     r3, r0, #2
        add     lr, lr, #0x23
        bic     r0, lr, #0x1F
        mov     r12, r3, lsl #3
LCAZ1:
        str     r0, [r2]
        mov     r0, #0
        str     r12, [r1]
        ldmia   sp!, {r4, r5, pc}
_ippsFFTInitAlloc_R_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r6, r2
        mov     r8, r3
        beq     LCAZ13
        cmp     r4, #0
        blt     LCAZ2
        cmp     r4, #0x18
        ble     LCAZ3
LCAZ2:
        mvn     r0, #0xE
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCAZ3:
        add     r12, sp, #8
        add     lr, sp, #0xC
        add     r3, sp, #0x10
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r0, r4
        mov     r2, r8
        mov     r1, r6
        bl      LCAZ_getSizeRmFFT
        ldr     lr, [sp, #0x10]
        add     r0, lr, #0x40
        str     r0, [sp, #0x10]
        bl      _ippsMalloc_8u
        mov     r5, r0
        cmp     r5, #0
        beq     LCAZ14
        mov     r0, r5
        mov     r1, #0x2C
        bl      _ippsZero_8u
        ldr     r12, [pc, #0x1A8]
        mov     r10, #1
        str     r8, [r5, #8]
        str     r4, [r5, #4]
        str     r12, [r5]
        str     r10, [r5, #0x10]
        ldr     r0, [sp, #0xC]
        mov     r11, #0
        cmp     r0, #0
        movle   r8, #0
        ble     LCAZ4
        bl      _ippsMalloc_8u
        mov     r8, r0
        cmp     r8, #0
        mvneq   r4, #8
        beq     LCAZ5
LCAZ4:
        cmp     r6, #8
        add     r9, r5, #0x2C
        beq     LCAZ12
        cmp     r6, #4
        beq     LCAZ11
        cmp     r6, #1
        beq     LCAZ10
        cmp     r6, #2
        beq     LCAZ6
        cmp     r8, #0
        mvn     r4, #0xF
        beq     LCAZ5
        mov     r0, r8
        bl      _ippsFree
LCAZ5:
        mov     r0, r5
        bl      LCAZ_deleteFftCtx
        mov     r0, r4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCAZ6:
        str     r11, [r5, #0x14]
        str     r4, [r5, #0x18]
        str     r11, [r5, #0x1C]
LCAZ7:
        cmp     r4, #0
        bne     LCAZ8
        str     r11, [r5, #0xC]
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCAZ8:
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_initTabTwdBase_32s
        sub     r1, r4, #1
        str     r9, [sp]
        mov     r0, r5
        mov     r3, r4
        mov     r2, r8
        bl      LCAZ_initTablesCFFT
        mov     r3, r0
        str     r3, [r5, #0x28]
        mov     r2, r4
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_initTabTwd_R4_32s
        mov     r4, r10, lsl r4
        add     r3, r4, #2
        cmp     r8, #0
        mov     r3, r3, lsl #3
        str     r3, [r5, #0xC]
        beq     LCAZ9
        mov     r0, r8
        bl      _ippsFree
LCAZ9:
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCAZ10:
        str     r4, [r5, #0x14]
        str     r11, [r5, #0x18]
        str     r11, [r5, #0x1C]
        b       LCAZ7
LCAZ11:
        mov     lr, r4, asr #1
        and     r12, r4, #1
        str     r12, [r5, #0x1C]
        str     lr, [r5, #0x14]
        str     lr, [r5, #0x18]
        b       LCAZ7
LCAZ12:
        str     r11, [r5, #0x14]
        str     r11, [r5, #0x18]
        str     r11, [r5, #0x1C]
        b       LCAZ7
LCAZ13:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCAZ14:
        mvn     r0, #8
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCAZ_initTablesCFFT:
        stmdb   sp!, {r4 - r7, lr}
        mov     r4, r1
        ldr     r1, [sp, #0x14]
        mov     r7, r0
        mov     r6, r2
        str     r1, [r7, #0x20]
        mov     r0, r4
        mov     r5, r3
        bl      _ipps_initTabBitRev
        mov     r3, r0
        str     r3, [r7, #0x24]
        mov     r0, r4
        mov     r2, r5
        mov     r1, r6
        ldmia   sp!, {r4 - r7, lr}
        b       _ipps_initTabTwd_R4_32s
        .long   0x434d414f


