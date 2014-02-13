        .text
        .align  4
        .globl  _ippsAutoCorr_16s_Sfs


_ippsAutoCorr_16s_Sfs:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r9, [sp, #0x20]
        mov     r7, r0
        cmp     r7, #0
        mov     r8, r1
        mov     r5, r2
        mov     r10, r3
        beq     LCZE2
        cmp     r5, #0
        beq     LCZE2
        cmp     r8, #0
        ble     LCZE1
        cmp     r10, #0
        ble     LCZE1
        cmp     r8, r10
        mov     r4, r10
        movlt   r4, r8
        mov     r0, r4
        bl      _ippsMalloc_64s
        mov     r6, r0
        cmp     r6, #0
        mvneq   r0, #8
        ldmeqia sp!, {r4 - r10, pc}
        mov     r0, r6
        mov     r1, r4
        bl      _ippsZero_64s
        mov     r0, r7
        mov     r1, r8
        mov     r3, r4
        mov     r2, r6
        bl      ownsAutoCorr_16s64s
        mov     r3, r9
        mov     r0, r6
        mov     r2, r4
        mov     r1, r5
        bl      ownsConvert_64s16s_Sfs
        mov     r0, r6
        bl      _ippsFree
        cmp     r4, r10
        bge     LCZE0
        sub     r1, r10, r4
        add     r0, r5, r4, lsl #1
        bl      _ippsZero_16s
LCZE0:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LCZE1:
        mvn     r0, #5
        ldmia   sp!, {r4 - r10, pc}
LCZE2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r10, pc}


