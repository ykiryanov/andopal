        .text
        .align  4
        .globl  _ippsDFTInv_CToC_16s_Sfs


_ippsDFTInv_CToC_16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r9, [sp, #0x3C]
        ldr     r12, [sp, #0x40]
        ldr     r10, [sp, #0x44]
        cmp     r9, #0
        mov     r11, r0
        str     r12, [sp, #8]
        mov     r6, r1
        mov     r7, r2
        mov     r8, r3
        beq     LCMQ6
        ldr     r12, [r9]
        cmp     r12, #0xB
        beq     LCMQ0
        mvn     r0, #0x10
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCMQ0:
        cmp     r11, #0
        beq     LCMQ6
        cmp     r6, #0
        beq     LCMQ6
        cmp     r7, #0
        beq     LCMQ6
        cmp     r8, #0
        beq     LCMQ6
        ldr     r5, [r9, #4]
        cmp     r5, #1
        beq     LCMQ5
        cmp     r10, #0
        beq     LCMQ4
        and     r12, r10, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r10, r12
LCMQ1:
        mov     r0, r11
        mov     r2, r5
        mov     r1, r4
        bl      _ippsConvert_16s32f
        add     r11, r4, r5, lsl #2
        mov     r0, r6
        mov     r2, r5
        mov     r1, r11
        bl      _ippsConvert_16s32f
        add     r12, r4, r5, lsl #3
        str     r12, [sp, #4]
        ldr     r9, [r9, #0x10]
        mov     r0, r4
        mov     r3, r11
        str     r9, [sp]
        mov     r2, r4
        mov     r1, r11
        bl      _ippsDFTInv_CToC_32f
        mov     r6, r0
        cmp     r6, #0
        bne     LCMQ2
        ldr     r6, [sp, #8]
        mov     r1, r7
        mov     r3, #1
        str     r6, [sp]
        mov     r2, r5
        mov     r0, r4
        bl      _ippsConvert_32f16s_Sfs
        str     r6, [sp]
        mov     r2, r5
        mov     r1, r8
        mov     r0, r11
        mov     r3, #1
        bl      _ippsConvert_32f16s_Sfs
        mov     r6, #0
LCMQ2:
        cmp     r10, #0
        beq     LCMQ3
        mov     r0, r6
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCMQ3:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, r6
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCMQ4:
        ldr     r0, [r9, #0xC]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCMQ1
        mvn     r0, #8
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCMQ5:
        ldrsh   r11, [r11]
        ldrsh   r6, [r6]
        add     lr, sp, #0xC
        str     r11, [lr]
        ldr     r3, [sp, #8]
        add     r0, sp, #0xC
        add     r1, sp, #0x14
        add     r12, sp, #0xC
        str     r6, [r12, #4]
        mov     r2, #2
        bl      _ipps_cnvrt_32s16s
        add     r0, sp, #0x14
        ldrsh   lr, [r0]
        add     r12, sp, #0x14
        ldrsh   r12, [r12, #2]
        strh    lr, [r7]
        mov     r0, #0
        strh    r12, [r8]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCMQ6:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


