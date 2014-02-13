        .text
        .align  4
        .globl  _ippsFFTInv_PermToR_16s_Sfs


_ippsFFTInv_PermToR_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        ldr     r9, [sp, #0x2C]
        mov     r8, r2
        cmp     r8, #0
        mov     r10, r0
        mov     r6, r1
        mov     r7, r3
        beq     LCCJ7
        ldr     r12, [r8]
        cmp     r12, #3
        beq     LCCJ0
        mvn     r0, #0x10
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCJ0:
        cmp     r10, #0
        beq     LCCJ7
        cmp     r6, #0
        beq     LCCJ7
        ldr     r11, [r8, #4]
        mov     r12, #1
        cmp     r11, #0
        mov     r5, r12, lsl r11
        beq     LCCJ4
        cmp     r9, #0
        beq     LCCJ6
        and     r12, r9, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r9, r12
LCCJ1:
        mov     r12, #0xF
        cmp     r11, #0xF
        movlt   r12, r11
        rsb     r12, r12, #0xF
        add     r3, r12, #1
        str     r3, [sp]
        mov     r0, r10
        mov     r12, #1
        sub     r11, r11, #1
        mov     r2, r5
        mov     r1, r4
        mov     r10, r12, lsl r11
        bl      _ipps_cnvrt_16s32s
        ldr     r11, [r4]
        ldr     lr, [r4, #4]
        cmp     r10, #1
        add     r12, lr, r11
        str     r12, [r4]
        sub     r11, r11, lr
        str     r11, [r4, #4]
        ble     LCCJ2
        ldr     r3, [r8, #0x28]
        mvn     r2, #0
        mov     r1, r10
        mov     r0, r4
        bl      _ipps_jCcsRecombine_16s
        ldr     r3, [r8, #0x24]
        mov     r2, #1
        mov     r1, r10
        mov     r0, r4
        bl      _ipps_jFft_Core_16s
LCCJ2:
        ldr     r12, [r8, #0x10]
        cmp     r12, #0
        beq     LCCJ3
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_ibMpyBySqrt2_32s
LCCJ3:
        ldr     r2, [r8, #0x20]
        ldr     r8, [r8, #0xC]
        mov     r1, r10
        mov     r0, r4
        bl      _ipps_BitRev1_8
        ldr     r3, [sp]
        add     r7, r8, r7
        add     r3, r7, r3
        mov     r2, r5
        mov     r1, r6
        mov     r0, r4
        bl      _ipps_cnvrt_32s16s
        cmp     r9, #0
        beq     LCCJ5
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCJ4:
        ldrsh   r10, [r10]
        add     r2, sp, #4
        add     r0, sp, #4
        str     r10, [r2]
        mov     r3, r7
        mov     r1, r6
        mov     r2, #1
        bl      _ipps_cnvrt_32s16s
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCJ5:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCJ6:
        ldr     r0, [r8, #0x18]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCCJ1
        mvn     r0, #8
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}
LCCJ7:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


