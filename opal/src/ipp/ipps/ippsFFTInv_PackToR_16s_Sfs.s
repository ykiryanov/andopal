        .text
        .align  4
        .globl  _ippsFFTInv_PackToR_16s_Sfs


_ippsFFTInv_PackToR_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x20
        ldr     r11, [sp, #0x44]
        mov     r10, r2
        cmp     r10, #0
        mov     r9, r0
        mov     r5, r1
        mov     r8, r3
        beq     LCCL12
        ldr     r12, [r10]
        cmp     r12, #3
        beq     LCCL0
        mvn     r0, #0x10
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCCL0:
        cmp     r9, #0
        beq     LCCL12
        cmp     r5, #0
        beq     LCCL12
        ldr     r7, [r10, #4]
        mov     r12, #1
        cmp     r7, #0
        mov     r6, r12, lsl r7
        beq     LCCL8
        cmp     r11, #0
        beq     LCCL11
        and     r12, r11, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r11, r12
LCCL1:
        ldrsh   lr, [r9]
        mov     r12, #0xF
        cmp     r7, #0xF
        movlt   r12, r7
        rsb     r12, r12, #0xF
        strh    lr, [r5]
        add     r12, r12, #1
        str     r12, [sp, #0xC]
        sub     r7, r7, #1
        mov     r12, #1
        mov     r7, r12, lsl r7
        mov     r12, r6, lsl #1
        sub     lr, r9, #2
        ldrsh   r12, [lr, +r12]
        sub     r1, r6, #3
        cmp     r1, #1
        blt     LCCL5
        sub     lr, r1, #1
        cmp     lr, #0xA
        blt     LCCL10
        add     lr, r5, #4
        add     r3, lr, r1, lsl #1
        str     r3, [sp, #0x14]
        add     r3, r9, r1, lsl #1
        add     r2, r9, #2
        str     r3, [sp, #0x18]
        add     r0, r5, #2
        str     r5, [sp, #4]
        str     r9, [sp]
        ldr     r9, [sp, #0x18]
        ldr     r5, [sp, #0x14]
        str     r2, [sp, #0x10]
        add     r2, r2, r1, lsl #1
        add     r3, r0, r1, lsl #1
        str     r10, [sp, #8]
LCCL2:
        ldrsh   r10, [r2]
        sub     r1, r1, #8
        cmp     r1, #0xB
        strh    r10, [r5]
        ldrsh   r10, [r9]
        strh    r10, [r3]
        ldrsh   r10, [r2, #-4]
        strh    r10, [r5, #-4]
        ldrsh   r10, [r9, #-4]
        strh    r10, [r3, #-4]
        ldrsh   r10, [r2, #-8]
        strh    r10, [r5, #-8]
        ldrsh   r10, [r9, #-8]
        strh    r10, [r3, #-8]
        ldrsh   r10, [r2, #-0xC]
        sub     r2, r2, #0x10
        strh    r10, [r5, #-0xC]
        ldrsh   r10, [r9, #-0xC]
        sub     r5, r5, #0x10
        sub     r9, r9, #0x10
        strh    r10, [r3, #-0xC]
        sub     r3, r3, #0x10
        bge     LCCL2
        ldr     r10, [sp, #8]
        ldr     r5, [sp, #4]
        ldr     r9, [sp]
LCCL3:
        str     r5, [sp, #4]
        ldr     r5, [sp, #0x10]
        mov     r2, r1, lsl #1
        add     r9, r9, r1, lsl #1
LCCL4:
        ldrsh   r3, [r5, +r2]
        sub     r1, r1, #2
        cmp     r1, #1
        strh    r3, [lr, +r2]
        ldrsh   r3, [r9], #-4
        strh    r3, [r0, +r2]
        sub     r2, r2, #4
        bge     LCCL4
        ldr     r5, [sp, #4]
LCCL5:
        strh    r12, [r5, #2]
        ldr     r3, [sp, #0xC]
        mov     r2, r6
        mov     r1, r4
        mov     r0, r5
        bl      _ipps_cnvrt_16s32s
        ldr     r12, [r4]
        ldr     lr, [r4, #4]
        cmp     r7, #1
        add     r9, lr, r12
        str     r9, [r4]
        sub     r12, r12, lr
        str     r12, [r4, #4]
        ble     LCCL6
        ldr     r3, [r10, #0x28]
        mvn     r2, #0
        mov     r1, r7
        mov     r0, r4
        bl      _ipps_jCcsRecombine_16s
        ldr     r3, [r10, #0x24]
        mov     r2, #1
        mov     r1, r7
        mov     r0, r4
        bl      _ipps_jFft_Core_16s
LCCL6:
        ldr     r12, [r10, #0x10]
        cmp     r12, #0
        beq     LCCL7
        mov     r1, r6
        mov     r0, r4
        bl      _ipps_ibMpyBySqrt2_32s
LCCL7:
        ldr     r2, [r10, #0x20]
        ldr     r10, [r10, #0xC]
        mov     r1, r7
        mov     r0, r4
        bl      _ipps_BitRev1_8
        ldr     r3, [sp, #0xC]
        add     r8, r10, r8
        add     r3, r8, r3
        mov     r2, r6
        mov     r1, r5
        mov     r0, r4
        bl      _ipps_cnvrt_32s16s
        cmp     r11, #0
        beq     LCCL9
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCCL8:
        ldrsh   r9, [r9]
        add     r2, sp, #0x1C
        add     r0, sp, #0x1C
        str     r9, [r2]
        mov     r3, r8
        mov     r1, r5
        mov     r2, #1
        bl      _ipps_cnvrt_32s16s
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCCL9:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, #0
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCCL10:
        add     r2, r9, #2
        add     r0, r5, #2
        add     lr, r5, #4
        str     r2, [sp, #0x10]
        b       LCCL3
LCCL11:
        ldr     r0, [r10, #0x18]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCCL1
        mvn     r0, #8
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}
LCCL12:
        mvn     r0, #7
        add     sp, sp, #0x20
        ldmia   sp!, {r4 - r11, pc}


