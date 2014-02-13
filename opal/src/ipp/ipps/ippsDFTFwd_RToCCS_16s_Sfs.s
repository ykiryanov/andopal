        .text
        .align  4
        .globl  _ippsDFTFwd_RToCCS_16s_Sfs


_ippsDFTFwd_RToCCS_16s_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0xC
        ldr     r9, [sp, #0x2C]
        mov     r7, r2
        cmp     r7, #0
        mov     r5, r0
        mov     r4, r1
        mov     r6, r3
        beq     LCNA6
        ldr     r12, [r7]
        cmp     r12, #0xC
        beq     LCNA0
        mvn     r0, #0x10
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCNA0:
        cmp     r5, #0
        beq     LCNA6
        cmp     r4, #0
        beq     LCNA6
        ldr     r8, [r7, #4]
        mov     r10, #0
        cmp     r8, #1
        beq     LCNA5
        cmp     r9, #0
        beq     LCNA4
        and     r12, r9, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r10, r9, r12
LCNA1:
        mov     r0, r5
        mov     r2, r8
        mov     r1, r10
        bl      _ippsConvert_16s32f
        ldr     r2, [r7, #0x10]
        mov     r12, r8, lsl #2
        add     r12, r12, #8
        add     r3, r12, r10
        mov     r0, r10
        mov     r1, r10
        bl      _ippsDFTFwd_RToCCS_32f
        mov     r5, r0
        cmp     r5, #0
        bne     LCNA2
        and     r3, r8, #1
        sub     r8, r8, r3
        add     r2, r8, #2
        str     r6, [sp]
        mov     r1, r4
        mov     r3, #1
        mov     r0, r10
        bl      _ippsConvert_32f16s_Sfs
        mov     r5, #0
LCNA2:
        cmp     r9, #0
        beq     LCNA3
        mov     r0, r5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCNA3:
        mov     r0, r10
        bl      _ippsFree
        mov     r0, r5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCNA4:
        ldr     r0, [r7, #0xC]
        bl      _ippsMalloc_8u
        mov     r10, r0
        cmp     r10, #0
        bne     LCNA1
        mvn     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCNA5:
        ldrsh   r5, [r5]
        add     r2, sp, #8
        add     r0, sp, #8
        str     r5, [r2]
        mov     r3, r6
        mov     r2, #1
        mov     r1, r4
        bl      _ipps_cnvrt_32s16s
        mov     r0, #0
        strh    r10, [r4, #2]
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCNA6:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}


