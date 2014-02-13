        .text
        .align  4
        .globl  _ippsFFTInitAlloc_C_16s


LCCY_getSizeCFFT:
        stmdb   sp!, {r4, lr}
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0xC]
        cmp     r0, #0
        bne     LCCY0
        mov     r0, #0
        mov     r12, r0
        str     r12, [r3]
        b       LCCY1
LCCY0:
        mov     r12, #1
        mov     r0, r12, lsl r0
        mov     r12, r0, asr #1
        add     r12, r0, r12, lsr #30
        mov     r0, r0, lsl #3
        mov     r12, r12, asr #2
        add     r12, r12, #1
        add     lr, r0, #0x1F
        mov     r4, r12, lsl #2
        add     r4, r4, #0x1F
        mov     r12, r12, lsl #1
        bic     r4, r4, #0x1F
        bic     lr, lr, #0x1F
        add     r12, r12, #0x1F
        add     r4, lr, r4
        str     r4, [r3]
        bic     r12, r12, #0x1F
LCCY1:
        str     r12, [r2]
        str     r0, [r1]
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LCCY_deleteFftCtx:
        ldr     r2, [r0, #0x1C]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr
_ippsFFTInitAlloc_C_16s:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0x14
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r6, r2
        mov     r8, r3
        beq     LCCY13
        cmp     r4, #0
        blt     LCCY2
        cmp     r4, #0xE
        ble     LCCY3
LCCY2:
        mvn     r0, #0xE
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCY3:
        add     r12, sp, #8
        add     lr, sp, #0xC
        add     r3, sp, #0x10
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r0, r4
        mov     r2, r8
        mov     r1, r6
        bl      LCCY_getSizeCFFT
        ldr     lr, [sp, #0x10]
        add     r0, lr, #0x40
        str     r0, [sp, #0x10]
        bl      _ippsMalloc_8u
        mov     r5, r0
        cmp     r5, #0
        beq     LCCY14
        mov     r0, r5
        mov     r1, #0x30
        bl      _ippsZero_8u
        str     r8, [r5, #0x14]
        mov     r12, #2
        mov     r9, #1
        cmp     r6, #8
        str     r12, [r5]
        str     r4, [r5, #4]
        str     r9, [r5, #0x1C]
        mov     r8, #0
        beq     LCCY12
        cmp     r6, #4
        beq     LCCY11
        cmp     r6, #1
        beq     LCCY10
        cmp     r6, #2
        mvnne   r4, #0xF
        beq     LCCY5
LCCY4:
        mov     r0, r5
        bl      LCCY_deleteFftCtx
        mov     r0, r4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCY5:
        str     r8, [r5, #8]
        str     r4, [r5, #0xC]
        str     r8, [r5, #0x10]
LCCY6:
        cmp     r4, #0
        beq     LCCY9
        ldr     r0, [sp, #0xC]
        cmp     r0, #0
        ble     LCCY7
        bl      _ippsMalloc_8u
        mov     r8, r0
        cmp     r8, #0
        mvneq   r4, #8
        beq     LCCY4
LCCY7:
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_initTabTwdBase_16s
        add     r12, r5, #0x30
        str     r12, [sp]
        mov     r3, r4
        mov     r2, r8
        mov     r1, r4
        mov     r0, r5
        bl      LCCY_initTablesCFFT
        mov     r4, r9, lsl r4
        cmp     r8, #0
        rsb     r4, r4, r4, lsl #2
        mov     r3, r4, lsl #2
        str     r3, [r5, #0x18]
        beq     LCCY8
        mov     r0, r8
        bl      _ippsFree
LCCY8:
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCY9:
        str     r8, [r5, #0x18]
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCY10:
        str     r4, [r5, #8]
        str     r8, [r5, #0xC]
        str     r8, [r5, #0x10]
        b       LCCY6
LCCY11:
        mov     lr, r4, asr #1
        and     r12, r4, #1
        str     r12, [r5, #0x10]
        str     lr, [r5, #8]
        str     lr, [r5, #0xC]
        b       LCCY6
LCCY12:
        str     r8, [r5, #8]
        str     r8, [r5, #0xC]
        str     r8, [r5, #0x10]
        b       LCCY6
LCCY13:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCY14:
        mvn     r0, #8
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCY_initTablesCFFT:
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
        b       _ipps_initTabTwd_R4_16s


