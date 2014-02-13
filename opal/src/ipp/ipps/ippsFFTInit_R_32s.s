        .text
        .align  4
        .globl  _ippsFFTInit_R_32s


LCAU_deleteFftCtx:
        ldr     r2, [r0, #0x10]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr
_ippsFFTInit_R_32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r11, [sp, #0x2C]
        ldr     r8, [sp, #0x30]
        mov     r7, r0
        cmp     r7, #0
        mov     r4, r1
        mov     r6, r2
        mov     r9, r3
        beq     LCAU3
        cmp     r4, #0
        blt     LCAU0
        cmp     r4, #0x18
        bgt     LCAU0
        cmp     r11, #0
        beq     LCAU3
        and     r12, r11, #0x1F
        rsb     r12, r12, #0
        and     r10, r12, #0x1F
        add     r5, r11, r10
        mov     r1, #0x2C
        mov     r0, r5
        bl      _ippsZero_8u
        ldr     r12, [pc, #0x178]
        str     r9, [r5, #8]
        cmp     r6, #8
        str     r12, [r10, +r11]
        mov     r12, #0
        str     r4, [r5, #4]
        str     r12, [r5, #0x10]
        add     r9, r5, #0x2C
        beq     LCAU8
        cmp     r6, #4
        beq     LCAU7
        cmp     r6, #1
        beq     LCAU6
        cmp     r6, #2
        beq     LCAU1
        mov     r0, r5
        bl      LCAU_deleteFftCtx
        mvn     r0, #0xF
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCAU0:
        mvn     r0, #0xE
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCAU1:
        str     r12, [r5, #0x14]
        str     r4, [r5, #0x18]
        str     r12, [r5, #0x1C]
LCAU2:
        cmp     r4, #0
        beq     LCAU5
        cmp     r8, #0
        bne     LCAU4
LCAU3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCAU4:
        and     r12, r8, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r8, r8, r12
        mov     r0, r4
        mov     r1, r8
        bl      _ipps_initTabTwdBase_32s
        sub     r1, r4, #1
        str     r9, [sp]
        mov     r3, r4
        mov     r0, r5
        mov     r2, r8
        bl      LCAU_initTablesCFFT
        mov     r3, r0
        str     r3, [r5, #0x28]
        mov     r0, r4
        mov     r2, r4
        mov     r1, r8
        bl      _ipps_initTabTwd_R4_32s
        mov     r12, #1
        mov     r4, r12, lsl r4
        add     r1, r4, #2
        mov     r0, #0
        mov     r1, r1, lsl #3
        str     r1, [r5, #0xC]
        str     r5, [r7]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCAU5:
        str     r12, [r5, #0xC]
        mov     r0, #0
        str     r5, [r7]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCAU6:
        str     r4, [r5, #0x14]
        str     r12, [r5, #0x18]
        str     r12, [r5, #0x1C]
        b       LCAU2
LCAU7:
        mov     r6, r4, asr #1
        and     lr, r4, #1
        str     lr, [r5, #0x1C]
        str     r6, [r5, #0x14]
        str     r6, [r5, #0x18]
        b       LCAU2
LCAU8:
        str     r12, [r5, #0x14]
        str     r12, [r5, #0x18]
        str     r12, [r5, #0x1C]
        b       LCAU2
LCAU_initTablesCFFT:
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
        .long   0x434d414e


