        .text
        .align  4
        .globl  _ippsDFTFwd_CToC_16sc_Sfs


_ippsDFTFwd_CToC_16sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r11, [sp, #0x34]
        mov     r9, r2
        cmp     r9, #0
        mov     r6, r0
        mov     r5, r1
        mov     r8, r3
        beq     LCNB6
        ldr     r12, [r9]
        cmp     r12, #0xA
        beq     LCNB0
        mvn     r0, #0x10
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCNB0:
        cmp     r6, #0
        beq     LCNB6
        cmp     r5, #0
        beq     LCNB6
        ldr     r10, [r9, #4]
        cmp     r10, #1
        beq     LCNB5
        cmp     r11, #0
        beq     LCNB4
        and     r12, r11, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r11, r12
LCNB1:
        mov     r7, r10, lsl #1
        mov     r0, r6
        mov     r2, r7
        mov     r1, r4
        bl      _ippsConvert_16s32f
        ldr     r2, [r9, #0x10]
        add     r3, r4, r10, lsl #3
        mov     r0, r4
        mov     r1, r4
        bl      _ippsDFTFwd_CToC_32fc
        mov     r6, r0
        cmp     r6, #0
        bne     LCNB2
        str     r8, [sp]
        mov     r2, r7
        mov     r1, r5
        mov     r3, #1
        mov     r0, r4
        bl      _ippsConvert_32f16s_Sfs
        mov     r6, #0
LCNB2:
        cmp     r11, #0
        beq     LCNB3
        mov     r0, r6
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCNB3:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, r6
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCNB4:
        ldr     r0, [r9, #0xC]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCNB1
        mvn     r0, #8
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCNB5:
        ldrsh   r2, [r6]
        ldrsh   r6, [r6, #2]
        add     r12, sp, #8
        add     r0, sp, #8
        str     r2, [r12]
        add     lr, sp, #8
        str     r6, [lr, #4]
        mov     r3, r8
        mov     r1, r5
        mov     r2, #2
        bl      _ipps_cnvrt_32s16s
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCNB6:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


