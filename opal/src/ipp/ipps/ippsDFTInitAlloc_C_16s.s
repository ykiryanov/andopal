        .text
        .align  4
        .globl  _ippsDFTInitAlloc_C_16s


LCMU_deleteDftCtx:
        cmp     r0, #0
        bxeq    lr
        mov     r1, #0
        str     r1, [r0]
        b       _ippsFree
_ippsDFTInitAlloc_C_16s:
        stmdb   sp!, {r1, r4 - r8, lr}
        mov     r6, r0
        cmp     r6, #0
        mov     r5, r1
        mov     r7, r2
        mov     r8, r3
        beq     LCMU4
        cmp     r5, #0
        ble     LCMU2
        mov     r0, #0x14
        bl      _ippsMalloc_8u
        mov     r4, r0
        cmp     r4, #0
        beq     LCMU5
        mov     r0, r4
        mov     r1, #0x14
        bl      _ippsZero_8u
        mov     r3, #0xB
        str     r3, [r4]
        cmp     r5, #1
        str     r8, [r4, #8]
        str     r5, [r4, #4]
        mov     r3, #0
        bne     LCMU0
        str     r3, [r4, #0xC]
        mov     r0, #0
        str     r4, [r6]
        ldmia   sp!, {r1, r4 - r8, pc}
LCMU0:
        add     r0, r4, #0x10
        mov     r2, r7
        mov     r3, #1
        mov     r1, r5
        bl      _ippsDFTInitAlloc_C_32f
        ldr     r1, [r4, #0x10]
        mov     r7, r0
        cmp     r7, #0
        beq     LCMU3
        cmp     r1, #0
        beq     LCMU1
        mov     r0, r1
        bl      _ippsDFTFree_C_32f
LCMU1:
        mov     r0, r4
        bl      LCMU_deleteDftCtx
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r8, pc}
LCMU2:
        mvn     r0, #5
        ldmia   sp!, {r1, r4 - r8, pc}
LCMU3:
        mov     r2, sp
        mov     r0, r1
        mov     r1, r2
        bl      _ippsDFTGetBufSize_C_32f
        ldr     r2, [sp]
        mov     r0, #0
        add     r5, r2, r5, lsl #3
        add     r1, r5, #0x20
        str     r1, [r4, #0xC]
        str     r4, [r6]
        ldmia   sp!, {r1, r4 - r8, pc}
LCMU4:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r8, pc}
LCMU5:
        mvn     r0, #8
        ldmia   sp!, {r1, r4 - r8, pc}


