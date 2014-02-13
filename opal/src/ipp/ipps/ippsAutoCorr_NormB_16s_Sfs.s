        .text
        .align  4
        .globl  _ippsAutoCorr_NormB_16s_Sfs


_ippsAutoCorr_NormB_16s_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #8
        ldr     r10, [sp, #0x28]
        mov     r8, r0
        cmp     r8, #0
        mov     r7, r1
        mov     r5, r2
        mov     r9, r3
        beq     LCYU2
        cmp     r5, #0
        beq     LCYU2
        cmp     r7, #0
        ble     LCYU1
        cmp     r9, #0
        ble     LCYU1
        cmp     r7, r9
        mov     r4, r9
        movlt   r4, r7
        mov     r0, r4
        bl      _ippsMalloc_64s
        mov     r6, r0
        cmp     r6, #0
        beq     LCYU3
        mov     r0, r6
        mov     r1, r4
        bl      _ippsZero_64s
        mov     r0, r8
        mov     r3, r4
        mov     r2, r6
        mov     r1, r7
        bl      ownsAutoCorr_16s64s
        str     r10, [sp]
        mov     r3, r7
        mov     r0, r6
        mov     r2, r4
        mov     r1, r5
        bl      ownsDivV_64s16s_Sfs
        mov     r0, r6
        bl      _ippsFree
        cmp     r4, r9
        bge     LCYU0
        sub     r1, r9, r4
        add     r0, r5, r4, lsl #1
        bl      _ippsZero_16s
LCYU0:
        mov     r0, #0
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LCYU1:
        mvn     r0, #5
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LCYU2:
        mvn     r0, #7
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}
LCYU3:
        mvn     r0, #8
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}


