        .text
        .align  4
        .globl  _ippsFFTInit_C_32sc


LCAW_deleteFftCtx:
        ldr     r2, [r0, #0x10]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr
_ippsFFTInit_C_32sc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r11, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r6, r2
        mov     r9, r3
        beq     LCAW3
        cmp     r4, #0
        blt     LCAW0
        cmp     r4, #0x18
        bgt     LCAW0
        cmp     r11, #0
        beq     LCAW3
        and     r12, r11, #0x1F
        rsb     r12, r12, #0
        and     r10, r12, #0x1F
        add     r5, r11, r10
        mov     r1, #0x2C
        mov     r0, r5
        bl      _ippsZero_8u
        ldr     r12, [pc, #0x15C]
        str     r9, [r5, #8]
        cmp     r6, #8
        str     r12, [r10, +r11]
        mov     r12, #0
        str     r4, [r5, #4]
        str     r12, [r5, #0x10]
        add     r9, r5, #0x2C
        beq     LCAW8
        cmp     r6, #4
        beq     LCAW7
        cmp     r6, #1
        beq     LCAW6
        cmp     r6, #2
        beq     LCAW1
        mov     r0, r5
        bl      LCAW_deleteFftCtx
        mvn     r0, #0xF
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCAW0:
        mvn     r0, #0xE
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCAW1:
        str     r12, [r5, #0x14]
        str     r4, [r5, #0x18]
        str     r12, [r5, #0x1C]
LCAW2:
        cmp     r4, #0
        beq     LCAW5
        cmp     r8, #0
        bne     LCAW4
LCAW3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCAW4:
        and     r2, r8, #0x1F
        rsb     r2, r2, #0
        and     r2, r2, #0x1F
        add     r8, r8, r2
        mov     r0, r4
        mov     r1, r8
        bl      _ipps_initTabTwdBase_32s
        str     r9, [sp]
        mov     r3, r4
        mov     r1, r4
        mov     r2, r8
        mov     r0, r5
        bl      LCAW_initTablesCFFT
        mov     r2, #1
        mov     r4, r2, lsl r4
        mov     r0, #0
        mov     r1, r4, lsl #4
        str     r1, [r5, #0xC]
        str     r5, [r7]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCAW5:
        str     r12, [r5, #0xC]
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCAW6:
        str     r4, [r5, #0x14]
        str     r12, [r5, #0x18]
        str     r12, [r5, #0x1C]
        b       LCAW2
LCAW7:
        mov     lr, r4, asr #1
        and     r2, r4, #1
        str     r2, [r5, #0x1C]
        str     lr, [r5, #0x14]
        str     lr, [r5, #0x18]
        b       LCAW2
LCAW8:
        str     r12, [r5, #0x14]
        str     r12, [r5, #0x18]
        str     r12, [r5, #0x1C]
        b       LCAW2
LCAW_initTablesCFFT:
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


