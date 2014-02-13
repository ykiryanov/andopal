        .text
        .align  4
        .globl  _ippsDFTFwd_RToPack_16s_Sfs


_ippsDFTFwd_RToPack_16s_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0xC
        ldr     r10, [sp, #0x2C]
        mov     r9, r2
        cmp     r9, #0
        mov     r6, r0
        mov     r5, r1
        mov     r8, r3
        beq     LCMZ6
        ldr     r12, [r9]
        cmp     r12, #0xC
        beq     LCMZ0
        mvn     r0, #0x10
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCMZ0:
        cmp     r6, #0
        beq     LCMZ6
        cmp     r5, #0
        beq     LCMZ6
        ldr     r7, [r9, #4]
        cmp     r7, #1
        beq     LCMZ5
        cmp     r10, #0
        beq     LCMZ4
        and     r12, r10, #0x1F
        rsb     r12, r12, #0
        and     r12, r12, #0x1F
        add     r4, r10, r12
LCMZ1:
        mov     r0, r6
        mov     r2, r7
        mov     r1, r4
        bl      _ippsConvert_16s32f
        ldr     r2, [r9, #0x10]
        add     r3, r4, r7, lsl #2
        mov     r0, r4
        mov     r1, r4
        bl      _ippsDFTFwd_RToPack_32f
        mov     r6, r0
        cmp     r6, #0
        bne     LCMZ2
        str     r8, [sp]
        mov     r2, r7
        mov     r1, r5
        mov     r3, #1
        mov     r0, r4
        bl      _ippsConvert_32f16s_Sfs
        mov     r6, #0
LCMZ2:
        cmp     r10, #0
        beq     LCMZ3
        mov     r0, r6
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCMZ3:
        mov     r0, r4
        bl      _ippsFree
        mov     r0, r6
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCMZ4:
        ldr     r0, [r9, #0xC]
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        bne     LCMZ1
        mvn     r0, #8
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCMZ5:
        ldrsh   r6, [r6]
        add     r2, sp, #8
        add     r0, sp, #8
        str     r6, [r2]
        mov     r3, r8
        mov     r1, r5
        mov     r2, #1
        bl      _ipps_cnvrt_32s16s
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}
LCMZ6:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r10, pc}


