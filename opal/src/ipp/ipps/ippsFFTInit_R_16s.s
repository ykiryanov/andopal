        .text
        .align  4
        .globl  _ippsFFTInit_R_16s


LCCT_deleteFftCtx:
        ldr     r2, [r0, #0x1C]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr
_ippsFFTInit_R_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x30]
        mov     r8, r0
        cmp     r8, #0
        mov     r4, r1
        mov     r7, r2
        mov     r6, r3
        beq     LCCT3
        cmp     r4, #0
        blt     LCCT0
        cmp     r4, #0xE
        bgt     LCCT0
        cmp     r10, #0
        beq     LCCT3
        and     r12, r10, #0x1F
        rsb     r12, r12, #0
        and     r9, r12, #0x1F
        add     r5, r10, r9
        mov     r1, #0x30
        mov     r0, r5
        bl      _ippsZero_8u
        mov     r12, #0
        mov     lr, #3
        cmp     r7, #8
        str     r6, [r5, #0x14]
        str     lr, [r9, +r10]
        str     r4, [r5, #4]
        str     r12, [r5, #0x1C]
        beq     LCCT8
        cmp     r7, #4
        beq     LCCT7
        cmp     r7, #1
        beq     LCCT6
        cmp     r7, #2
        beq     LCCT1
        mov     r0, r5
        bl      LCCT_deleteFftCtx
        mvn     r0, #0xF
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCT0:
        mvn     r0, #0xE
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCT1:
        str     r12, [r5, #8]
        str     r4, [r5, #0xC]
        str     r12, [r5, #0x10]
LCCT2:
        cmp     r4, #0
        beq     LCCT5
        cmp     r11, #0
        bne     LCCT4
LCCT3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCT4:
        and     r12, r11, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r11, r11, r12
        mov     r0, r4
        mov     r1, r11
        bl      _ipps_initTabTwdBase_16s
        add     r12, r5, #0x30
        str     r12, [sp]
        sub     r1, r4, #1
        mov     r3, r4
        mov     r0, r5
        mov     r2, r11
        bl      LCCT_initTablesCFFT
        mov     r3, r0
        str     r3, [r5, #0x28]
        mov     r0, r4
        mov     r2, r4
        mov     r1, r11
        bl      _ipps_initTabTwd_R4_16s
        mov     r12, #1
        mov     r4, r12, lsl r4
        add     r1, r4, #2
        mov     r0, #0
        mov     r1, r1, lsl #2
        str     r1, [r5, #0x18]
        str     r5, [r8]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCT5:
        str     r12, [r5, #0x18]
        mov     r0, #0
        str     r5, [r8]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCT6:
        str     r4, [r5, #8]
        str     r12, [r5, #0xC]
        str     r12, [r5, #0x10]
        b       LCCT2
LCCT7:
        mov     r6, r4, asr #1
        and     lr, r4, #1
        str     lr, [r5, #0x10]
        str     r6, [r5, #8]
        str     r6, [r5, #0xC]
        b       LCCT2
LCCT8:
        str     r12, [r5, #8]
        str     r12, [r5, #0xC]
        str     r12, [r5, #0x10]
        b       LCCT2
LCCT_initTablesCFFT:
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


