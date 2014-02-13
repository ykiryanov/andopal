        .text
        .align  4
        .globl  _ippsFFTInitAlloc_C_16sc


LCCX_getSizeCFFT:
        stmdb   sp!, {r4, lr}
        ldr     r2, [sp, #8]
        ldr     r1, [sp, #0xC]
        cmp     r0, #0
        bne     LCCX0
        mov     r0, #0
        mov     r12, r0
        str     r12, [r3]
        b       LCCX1
LCCX0:
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
LCCX1:
        str     r12, [r2]
        str     r0, [r1]
        mov     r0, #0
        ldmia   sp!, {r4, pc}
LCCX_deleteFftCtx:
        ldr     r2, [r0, #0x1C]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr
_ippsFFTInitAlloc_C_16sc:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0x14
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r6, r2
        mov     r9, r3
        beq     LCCX13
        cmp     r4, #0
        blt     LCCX2
        cmp     r4, #0xE
        ble     LCCX3
LCCX2:
        mvn     r0, #0xE
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCX3:
        add     r12, sp, #8
        add     lr, sp, #0xC
        add     r3, sp, #0x10
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r0, r4
        mov     r2, r9
        mov     r1, r6
        bl      LCCX_getSizeCFFT
        ldr     lr, [sp, #0x10]
        add     r0, lr, #0x40
        str     r0, [sp, #0x10]
        bl      _ippsMalloc_8u
        mov     r5, r0
        cmp     r5, #0
        beq     LCCX14
        mov     r0, r5
        mov     r1, #0x30
        bl      _ippsZero_8u
        mov     r8, #1
        str     r9, [r5, #0x14]
        cmp     r6, #8
        str     r8, [r5]
        str     r4, [r5, #4]
        str     r8, [r5, #0x1C]
        mov     r9, #0
        beq     LCCX12
        cmp     r6, #4
        beq     LCCX11
        cmp     r6, #1
        beq     LCCX10
        cmp     r6, #2
        mvnne   r4, #0xF
        beq     LCCX5
LCCX4:
        mov     r0, r5
        bl      LCCX_deleteFftCtx
        mov     r0, r4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCX5:
        str     r9, [r5, #8]
        str     r4, [r5, #0xC]
        str     r9, [r5, #0x10]
LCCX6:
        cmp     r4, #0
        beq     LCCX9
        ldr     r0, [sp, #0xC]
        cmp     r0, #0
        ble     LCCX7
        bl      _ippsMalloc_8u
        mov     r9, r0
        cmp     r9, #0
        mvneq   r4, #8
        beq     LCCX4
LCCX7:
        mov     r1, r9
        mov     r0, r4
        bl      _ipps_initTabTwdBase_16s
        add     r12, r5, #0x30
        str     r12, [sp]
        mov     r3, r4
        mov     r2, r9
        mov     r1, r4
        mov     r0, r5
        bl      LCCX_initTablesCFFT
        mov     r4, r8, lsl r4
        cmp     r9, #0
        mov     r3, r4, lsl #3
        str     r3, [r5, #0x18]
        beq     LCCX8
        mov     r0, r9
        bl      _ippsFree
LCCX8:
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCX9:
        str     r9, [r5, #0x18]
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCX10:
        str     r4, [r5, #8]
        str     r9, [r5, #0xC]
        str     r9, [r5, #0x10]
        b       LCCX6
LCCX11:
        mov     lr, r4, asr #1
        and     r12, r4, #1
        str     r12, [r5, #0x10]
        str     lr, [r5, #8]
        str     lr, [r5, #0xC]
        b       LCCX6
LCCX12:
        str     r9, [r5, #8]
        str     r9, [r5, #0xC]
        str     r9, [r5, #0x10]
        b       LCCX6
LCCX13:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCX14:
        mvn     r0, #8
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCX_initTablesCFFT:
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


