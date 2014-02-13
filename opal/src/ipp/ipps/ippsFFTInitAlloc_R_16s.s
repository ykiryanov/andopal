        .text
        .align  4
        .globl  _ippsFFTInitAlloc_R_16s


LCCW_getSizeRFFT:
        stmdb   sp!, {r4, r5, lr}
        ldr     r2, [sp, #0xC]
        ldr     r1, [sp, #0x10]
        cmp     r0, #0
        bne     LCCW0
        mov     r12, #0
        mov     r0, r12
        str     r0, [r3]
        b       LCCW1
LCCW0:
        sub     r12, r0, #1
        mov     lr, #1
        mov     r12, lr, lsl r12
        mov     r0, lr, lsl r0
        mov     r4, r12, asr #1
        mov     lr, r0, asr #1
        add     r4, r12, r4, lsr #30
        add     r5, r0, lr, lsr #30
        mov     r12, r12, lsl #3
        add     lr, r12, #0x1F
        mov     r12, r5, asr #2
        bic     r4, r4, #3
        mov     r5, r0, lsl #3
        add     r4, r4, #0x23
        add     r5, r5, #0x1F
        bic     lr, lr, #0x1F
        bic     r4, r4, #0x1F
        add     r12, r12, #1
        bic     r5, r5, #0x1F
        add     r4, lr, r4
        mov     r12, r12, lsl #1
        add     r5, r4, r5
        str     r5, [r3]
        add     r12, r12, #0x1F
        add     r3, r0, #2
        bic     r0, r12, #0x1F
        mov     r12, r3, lsl #2
LCCW1:
        str     r0, [r2]
        mov     r0, #0
        str     r12, [r1]
        ldmia   sp!, {r4, r5, pc}
LCCW_deleteFftCtx:
        ldr     r2, [r0, #0x1C]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr
_ippsFFTInitAlloc_R_16s:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #0x14
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r6, r2
        mov     r8, r3
        beq     LCCW13
        cmp     r4, #0
        blt     LCCW2
        cmp     r4, #0xE
        ble     LCCW3
LCCW2:
        mvn     r0, #0xE
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCW3:
        add     r12, sp, #8
        add     lr, sp, #0xC
        add     r3, sp, #0x10
        str     r12, [sp, #4]
        str     lr, [sp]
        mov     r0, r4
        mov     r2, r8
        mov     r1, r6
        bl      LCCW_getSizeRFFT
        ldr     lr, [sp, #0x10]
        add     r0, lr, #0x40
        str     r0, [sp, #0x10]
        bl      _ippsMalloc_8u
        mov     r5, r0
        cmp     r5, #0
        beq     LCCW14
        mov     r0, r5
        mov     r1, #0x30
        bl      _ippsZero_8u
        str     r8, [r5, #0x14]
        mov     r12, #3
        mov     r9, #1
        cmp     r6, #8
        str     r12, [r5]
        str     r4, [r5, #4]
        str     r9, [r5, #0x1C]
        mov     r8, #0
        beq     LCCW12
        cmp     r6, #4
        beq     LCCW11
        cmp     r6, #1
        beq     LCCW10
        cmp     r6, #2
        mvnne   r4, #0xF
        beq     LCCW5
LCCW4:
        mov     r0, r5
        bl      LCCW_deleteFftCtx
        mov     r0, r4
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCW5:
        str     r8, [r5, #8]
        str     r4, [r5, #0xC]
        str     r8, [r5, #0x10]
LCCW6:
        cmp     r4, #0
        beq     LCCW9
        ldr     r0, [sp, #0xC]
        cmp     r0, #0
        ble     LCCW7
        bl      _ippsMalloc_8u
        mov     r8, r0
        cmp     r8, #0
        mvneq   r4, #8
        beq     LCCW4
LCCW7:
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_initTabTwdBase_16s
        add     r12, r5, #0x30
        sub     r1, r4, #1
        str     r12, [sp]
        mov     r0, r5
        mov     r3, r4
        mov     r2, r8
        bl      LCCW_initTablesCFFT
        mov     r3, r0
        str     r3, [r5, #0x28]
        mov     r2, r4
        mov     r1, r8
        mov     r0, r4
        bl      _ipps_initTabTwd_R4_16s
        mov     r4, r9, lsl r4
        add     r3, r4, #2
        cmp     r8, #0
        mov     r3, r3, lsl #2
        str     r3, [r5, #0x18]
        beq     LCCW8
        mov     r0, r8
        bl      _ippsFree
LCCW8:
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCW9:
        str     r8, [r5, #0x18]
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCW10:
        str     r4, [r5, #8]
        str     r8, [r5, #0xC]
        str     r8, [r5, #0x10]
        b       LCCW6
LCCW11:
        mov     lr, r4, asr #1
        and     r12, r4, #1
        str     r12, [r5, #0x10]
        str     lr, [r5, #8]
        str     lr, [r5, #0xC]
        b       LCCW6
LCCW12:
        str     r8, [r5, #8]
        str     r8, [r5, #0xC]
        str     r8, [r5, #0x10]
        b       LCCW6
LCCW13:
        mvn     r0, #7
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCW14:
        mvn     r0, #8
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r9, pc}
LCCW_initTablesCFFT:
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


