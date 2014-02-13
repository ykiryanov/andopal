        .text
        .align  4
        .globl  _ippsFFTInit_C_16sc


LCCU_deleteFftCtx:
        ldr     r2, [r0, #0x1C]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr
_ippsFFTInit_C_16sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r9, [sp, #0x2C]
        ldr     r10, [sp, #0x30]
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r6, r2
        mov     r11, r3
        beq     LCCU3
        cmp     r4, #0
        blt     LCCU0
        cmp     r4, #0xE
        bgt     LCCU0
        cmp     r9, #0
        beq     LCCU3
        and     r12, r9, #0x1F
        rsb     r12, r12, #0
        and     r8, r12, #0x1F
        add     r5, r9, r8
        mov     r1, #0x30
        mov     r0, r5
        bl      _ippsZero_8u
        str     r11, [r5, #0x14]
        mov     r12, #0
        mov     r11, #1
        cmp     r6, #8
        str     r11, [r8, +r9]
        str     r4, [r5, #4]
        str     r12, [r5, #0x1C]
        beq     LCCU8
        cmp     r6, #4
        beq     LCCU7
        cmp     r6, #1
        beq     LCCU6
        cmp     r6, #2
        beq     LCCU1
        mov     r0, r5
        bl      LCCU_deleteFftCtx
        mvn     r0, #0xF
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCU0:
        mvn     r0, #0xE
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCU1:
        str     r12, [r5, #8]
        str     r4, [r5, #0xC]
        str     r12, [r5, #0x10]
LCCU2:
        cmp     r4, #0
        beq     LCCU5
        cmp     r10, #0
        bne     LCCU4
LCCU3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCU4:
        and     r2, r10, #0x1F
        rsb     r2, r2, #0
        and     r2, r2, #0x1F
        add     r10, r10, r2
        mov     r0, r4
        mov     r1, r10
        bl      _ipps_initTabTwdBase_16s
        add     r12, r5, #0x30
        str     r12, [sp]
        mov     r3, r4
        mov     r1, r4
        mov     r2, r10
        mov     r0, r5
        bl      LCCU_initTablesCFFT
        mov     r4, r11, lsl r4
        mov     r0, #0
        mov     r1, r4, lsl #3
        str     r1, [r5, #0x18]
        str     r5, [r7]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCU5:
        str     r12, [r5, #0x18]
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCU6:
        str     r4, [r5, #8]
        str     r12, [r5, #0xC]
        str     r12, [r5, #0x10]
        b       LCCU2
LCCU7:
        mov     lr, r4, asr #1
        and     r2, r4, #1
        str     r2, [r5, #0x10]
        str     lr, [r5, #8]
        str     lr, [r5, #0xC]
        b       LCCU2
LCCU8:
        str     r12, [r5, #8]
        str     r12, [r5, #0xC]
        str     r12, [r5, #0x10]
        b       LCCU2
LCCU_initTablesCFFT:
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


