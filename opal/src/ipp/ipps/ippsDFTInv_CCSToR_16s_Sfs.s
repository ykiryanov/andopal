        .text
        .align  4
        .globl  _ippsDFTInv_CCSToR_16s_Sfs


_ippsDFTInv_CCSToR_16s_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0xC
        ldr     r10, [sp, #0x2C]
        mov     r8, r2
        cmp     r8, #0
        mov     r6, r0
        mov     r5, r1
        mov     r7, r3
        beq     LCMR6
        ldr     r12, [r8]
        cmp     r12, #0xC
        beq     LCMR0
        mvn     r0, #0x10
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCMR0:
        cmp     r6, #0
        beq     LCMR6
        cmp     r5, #0
        beq     LCMR6
        ldr     r9, [r8, #4]
        cmp     r9, #1
        beq     LCMR5
        cmp     r10, #0
        beq     LCMR4
        and     r12, r10, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r10, r12
LCMR1:
        and     r12, r9, #1
        sub     r12, r9, r12
        add     r2, r12, #2
        mov     r0, r6
        mov     r1, r4
        bl      _ippsConvert_16s32f
        ldr     r2, [r8, #0x10]
        mov     r12, r9, lsl #2
        add     r12, r12, #8
        add     r3, r12, r4
        mov     r0, r4
        mov     r1, r4
        bl      _ippsDFTInv_CCSToR_32f
        mov     r6, r0
        cmp     r6, #0
        bne     LCMR2
        str     r7, [sp]
        mov     r2, r9
        mov     r1, r5
        mov     r3, #1
        mov     r0, r4
        bl      _ippsConvert_32f16s_Sfs
        mov     r6, #0
LCMR2:
        cmp     r10, #0
        beq     LCMR3
        mov     r0, r6
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCMR3:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, r6
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCMR4:
        ldr     r0, [r8, #0xC]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCMR1
        mvn     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCMR5:
        ldrsh   r6, [r6]
        add     r2, sp, #8
        add     r0, sp, #8
        str     r6, [r2]
        mov     r3, r7
        mov     r1, r5
        mov     r2, #1
        bl      _ipps_cnvrt_32s16s
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCMR6:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}


