        .text
        .align  4
        .globl  _ippsFFTInit_C_16s


LCCV_deleteFftCtx:
        ldr     r2, [r0, #0x1C]
        mov     r1, #0
        str     r1, [r0]
        cmp     r2, #1
        beq     _ippsFree
        bxne    lr
_ippsFFTInit_C_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r10, [sp, #0x2C]
        ldr     r11, [sp, #0x30]
        mov     r8, r0
        cmp     r8, #0
        mov     r4, r1
        mov     r7, r2
        mov     r6, r3
        beq     LCCV3
        cmp     r4, #0
        blt     LCCV0
        cmp     r4, #0xE
        bgt     LCCV0
        cmp     r10, #0
        beq     LCCV3
        and     r12, r10, #0x1F
        rsb     r12, r12, #0
        and     r9, r12, #0x1F
        add     r5, r10, r9
        mov     r1, #0x30
        mov     r0, r5
        bl      _ippsZero_8u
        mov     r12, #0
        mov     lr, #2
        cmp     r7, #8
        str     r6, [r5, #0x14]
        str     lr, [r9, +r10]
        str     r4, [r5, #4]
        str     r12, [r5, #0x1C]
        beq     LCCV8
        cmp     r7, #4
        beq     LCCV7
        cmp     r7, #1
        beq     LCCV6
        cmp     r7, #2
        beq     LCCV1
        mov     r0, r5
        bl      LCCV_deleteFftCtx
        mvn     r0, #0xF
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCV0:
        mvn     r0, #0xE
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCV1:
        str     r12, [r5, #8]
        str     r4, [r5, #0xC]
        str     r12, [r5, #0x10]
LCCV2:
        cmp     r4, #0
        beq     LCCV5
        cmp     r11, #0
        bne     LCCV4
LCCV3:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCV4:
        and     r2, r11, #0x1F
        rsb     r2, r2, #0
        and     r2, r2, #0x1F
        add     r11, r11, r2
        mov     r0, r4
        mov     r1, r11
        bl      _ipps_initTabTwdBase_16s
        add     r12, r5, #0x30
        str     r12, [sp]
        mov     r3, r4
        mov     r1, r4
        mov     r2, r11
        mov     r0, r5
        bl      LCCV_initTablesCFFT
        mov     r2, #1
        mov     r4, r2, lsl r4
        mov     r0, #0
        rsb     r4, r4, r4, lsl #2
        mov     r1, r4, lsl #2
        str     r1, [r5, #0x18]
        str     r5, [r8]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCV5:
        str     r12, [r5, #0x18]
        mov     r0, #0
        str     r5, [r8]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCV6:
        str     r4, [r5, #8]
        str     r12, [r5, #0xC]
        str     r12, [r5, #0x10]
        b       LCCV2
LCCV7:
        mov     lr, r4, asr #1
        and     r2, r4, #1
        str     r2, [r5, #0x10]
        str     lr, [r5, #8]
        str     lr, [r5, #0xC]
        b       LCCV2
LCCV8:
        str     r12, [r5, #8]
        str     r12, [r5, #0xC]
        str     r12, [r5, #0x10]
        b       LCCV2
LCCV_initTablesCFFT:
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


