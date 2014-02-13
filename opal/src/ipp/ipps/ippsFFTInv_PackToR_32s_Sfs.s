        .text
        .align  4
        .globl  _ippsFFTInv_PackToR_32s_Sfs


_ippsFFTInv_PackToR_32s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        ldr     r11, [sp, #0x4C]
        mov     r9, r2
        cmp     r9, #0
        mov     r10, r0
        mov     r5, r1
        mov     r8, r3
        beq     LCAL12
        ldr     r12, [r9]
        ldr     lr, [pc, #0x2C4]
        cmp     lr, r12
        beq     LCAL0
        mvn     r0, #0x10
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LCAL0:
        cmp     r10, #0
        beq     LCAL12
        cmp     r5, #0
        beq     LCAL12
        ldr     r12, [r9, #4]
        mov     lr, #1
        cmp     r12, #0
        str     r12, [sp, #0xC]
        mov     r7, lr, lsl r12
        beq     LCAL8
        cmp     r11, #0
        beq     LCAL11
        and     r12, r11, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r11, r12
LCAL1:
        ldr     lr, [r10]
        sub     r12, r10, #4
        sub     r2, r7, #3
        str     lr, [r5]
        ldr     lr, [r12, +r7, lsl #2]
        ldr     r12, [sp, #0xC]
        cmp     r2, #1
        mov     r0, #1
        sub     r6, r12, #1
        rsb     r12, r12, #0x20
        mov     r6, r0, lsl r6
        str     r12, [sp, #0xC]
        blt     LCAL5
        sub     r12, r2, #1
        cmp     r12, #0xA
        blt     LCAL10
        mov     r12, r2, lsl #2
        add     r3, r10, #4
        sub     r12, r12, #8
        str     r3, [sp, #0x10]
        add     r3, r12, r3
        str     r3, [sp, #0x14]
        add     r0, r5, #8
        add     r3, r12, r0
        str     r3, [sp, #0x18]
        add     r3, r12, r10
        add     r1, r5, #4
        str     r3, [sp, #0x1C]
        str     r9, [sp, #8]
        str     r5, [sp, #4]
        str     r10, [sp]
        ldr     r9, [sp, #0x1C]
        ldr     r5, [sp, #0x18]
        ldr     r10, [sp, #0x14]
        add     r12, r12, r1
LCAL2:
        ldr     r3, [r10, #8]
        sub     r2, r2, #8
        cmp     r2, #0xB
        str     r3, [r5, #8]
        ldr     r3, [r9, #8]
        str     r3, [r12, #8]
        ldr     r3, [r10]
        str     r3, [r5]
        ldr     r3, [r9]
        str     r3, [r12]
        ldr     r3, [r10, #-8]
        str     r3, [r5, #-8]
        ldr     r3, [r9, #-8]
        str     r3, [r12, #-8]
        ldr     r3, [r10, #-0x10]
        sub     r10, r10, #0x20
        str     r3, [r5, #-0x10]
        ldr     r3, [r9, #-0x10]
        sub     r5, r5, #0x20
        sub     r9, r9, #0x20
        str     r3, [r12, #-0x10]
        sub     r12, r12, #0x20
        bge     LCAL2
        ldr     r9, [sp, #8]
        ldr     r5, [sp, #4]
        ldr     r10, [sp]
LCAL3:
        ldr     r12, [sp, #0x10]
        add     r10, r10, r2, lsl #2
LCAL4:
        ldr     r3, [r12, +r2, lsl #2]
        str     r3, [r0, +r2, lsl #2]
        ldr     r3, [r10], #-8
        str     r3, [r1, +r2, lsl #2]
        sub     r2, r2, #2
        cmp     r2, #1
        bge     LCAL4
LCAL5:
        str     lr, [r5, #4]
        ldr     r3, [sp, #0xC]
        mov     r2, r7
        mov     r1, r4
        mov     r0, r5
        bl      _ipps_cnvrt_32s64s
        ldr     r0, [r4]
        ldr     r1, [r4, #8]
        ldr     r10, [r4, #0xC]
        ldr     lr, [r4, #4]
        adds    r12, r1, r0
        str     r12, [r4]
        adc     r12, r10, lr
        subs    r0, r0, r1
        sbc     lr, lr, r10
        cmp     r6, #1
        str     r12, [r4, #4]
        str     r0, [r4, #8]
        str     lr, [r4, #0xC]
        ble     LCAL6
        ldr     r3, [r9, #0x28]
        mvn     r2, #0
        mov     r1, r6
        mov     r0, r4
        bl      _ipps_jCcsRecombine_32s
        ldr     r3, [r9, #0x24]
        mov     r2, #1
        mov     r1, r6
        mov     r0, r4
        bl      _ipps_jFft_Core_32s
LCAL6:
        ldr     r12, [r9, #0x1C]
        cmp     r12, #0
        beq     LCAL7
        mov     r1, r7
        mov     r0, r4
        bl      _ipps_ibMpyBySqrt2_64s
LCAL7:
        ldr     r12, [r9, #0x18]
        ldr     r3, [sp, #0xC]
        mov     r2, r7
        add     r8, r12, r8
        mov     r1, r5
        add     r3, r8, r3
        mov     r0, r4
        bl      _ipps_cnvrt_64s32s
        ldr     r2, [r9, #0x20]
        mov     r1, r6
        mov     r0, r5
        bl      _ipps_BitRev1_8
        cmp     r11, #0
        beq     LCAL9
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LCAL8:
        ldr     r10, [r10]
        add     r2, sp, #0x20
        add     r0, sp, #0x20
        mov     r12, r10, asr #31
        str     r12, [r2, #4]
        str     r10, [r2]
        mov     r3, r8
        mov     r1, r5
        mov     r2, #1
        bl      _ipps_cnvrt_64s32s
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LCAL9:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LCAL10:
        add     r12, r10, #4
        add     r1, r5, #4
        add     r0, r5, #8
        str     r12, [sp, #0x10]
        b       LCAL3
LCAL11:
        ldr     r0, [r9, #0xC]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCAL1
        mvn     r0, #8
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
LCAL12:
        mvn     r0, #7
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
        .long   0x434d414e


