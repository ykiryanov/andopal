        .text
        .align  4
        .globl  _ippsFFTInitAlloc_C_32sc


LCBA_getSizeCFFT:
        stmdb   sp!, {lr}
        ldr     r2, [sp, #4]
        ldr     r1, [sp, #8]
        cmp     r0, #0
        bne     LCBA0
        mov     r0, #0
        mov     r12, r0
        str     r12, [r3]
        b       LCBA1
LCBA0:
        mov     r12, #1
        mov     r0, r12, lsl r0
        mov     r12, r0, asr #1
        add     r12, r0, r12, lsr #30
        bic     r12, r12, #3
        mov     r0, r0, lsl #4
        add     lr, r0, #0x1F
        add     r12, r12, #0x23
        bic     lr, lr, #0x1F
        bic     r12, r12, #0x1F
        add     lr, lr, r12
        str     lr, [r3]
LCBA1:
        str     r12, [r2]
        str     r0, [r1]
        mov     r0, #0
        ldr     pc, [sp], #4
LCBA_deleteFftCtx:
        ldr     r2, [r0, #0x10]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr
_ippsFFTInitAlloc_C_32sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r6, r2
        mov     r8, r3
        beq     LCBA13
        cmp     r4, #0
        blt     LCBA2
        cmp     r4, #0x18
        ble     LCBA3
LCBA2:
        mvn     r0, #0xE
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCBA3:
        add     r12, sp, #8
        add     lr, sp, #0xC
        add     r3, sp, #0x10
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r0, r4
        mov     r2, r8
        mov     r1, r6
        bl      LCBA_getSizeCFFT
        ldr     lr, [sp, #0x10]
        add     r0, lr, #0x40
        str     r0, [sp, #0x10]
        bl      _ippsMalloc_8u
        mov     r5, r0
        cmp     r5, #0
        beq     LCBA14
        mov     r0, r5
        mov     r1, #0x2C
        bl      _ippsZero_8u
        ldr     r12, [pc, #0x18C]
        mov     r10, #1
        str     r8, [r5, #8]
        str     r4, [r5, #4]
        str     r12, [r5]
        str     r10, [r5, #0x10]
        ldr     r0, [sp, #0xC]
        mov     r11, #0
        cmp     r0, #0
        movle   r8, #0
        ble     LCBA4
        bl      _ippsMalloc_8u
        mov     r8, r0
        cmp     r8, #0
        mvneq   r4, #8
        beq     LCBA5
LCBA4:
        cmp     r6, #8
        add     r9, r5, #0x2C
        beq     LCBA12
        cmp     r6, #4
        beq     LCBA11
        cmp     r6, #1
        beq     LCBA10
        cmp     r6, #2
        beq     LCBA6
        cmp     r8, #0
        mvn     r4, #0xF
        beq     LCBA5
        mov     r0, r8
        bl      _ippsFree
LCBA5:
        mov     r0, r5
        bl      LCBA_deleteFftCtx
        mov     r0, r4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCBA6:
        str     r11, [r5, #0x14]
        str     r4, [r5, #0x18]
        str     r11, [r5, #0x1C]
LCBA7:
        cmp     r4, #0
        bne     LCBA8
        str     r11, [r5, #0xC]
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCBA8:
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_initTabTwdBase_32s
        str     r9, [sp]
        mov     r3, r4
        mov     r2, r8
        mov     r1, r4
        mov     r0, r5
        bl      LCBA_initTablesCFFT
        mov     r4, r10, lsl r4
        cmp     r8, #0
        mov     r3, r4, lsl #4
        str     r3, [r5, #0xC]
        beq     LCBA9
        mov     r0, r8
        bl      _ippsFree
LCBA9:
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCBA10:
        str     r4, [r5, #0x14]
        str     r11, [r5, #0x18]
        str     r11, [r5, #0x1C]
        b       LCBA7
LCBA11:
        mov     lr, r4, asr #1
        and     r12, r4, #1
        str     r12, [r5, #0x1C]
        str     lr, [r5, #0x14]
        str     lr, [r5, #0x18]
        b       LCBA7
LCBA12:
        str     r11, [r5, #0x14]
        str     r11, [r5, #0x18]
        str     r11, [r5, #0x1C]
        b       LCBA7
LCBA13:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCBA14:
        mvn     r0, #8
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCBA_initTablesCFFT:
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
        .long   0x434d414c


