        .text
        .align  4
        .globl  _ippsGainControl_G729A_16s_I


_ippsGainControl_G729A_16s_I:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0xC
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r6, r2
        beq     LDVS1
        cmp     r4, #0
        beq     LDVS1
        cmp     r6, #0
        beq     LDVS1
        add     r3, sp, #8
        mov     r2, #2
        mov     r1, #0x28
        mov     r0, r4
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r3, [sp, #8]
        mvn     r7, #2, 2
        cmn     r3, #7, 2
        movle   r12, r3, lsl #1
        movgt   r12, r7
        cmp     r12, #0
        bne     LDVS0
        mov     r0, #0
        strh    r0, [r6]
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r7, pc}
LDVS0:
        mov     r3, sp
        str     r12, [sp, #8]
        mov     r0, r5
        mov     r2, #2
        mov     r1, #0x28
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r3, [sp]
        cmn     r3, #7, 2
        movle   r7, r3, lsl #1
        ldr     r0, [sp, #8]
        add     r2, sp, #4
        str     r7, [sp]
        mov     r1, r7
        bl      ownCalcG0_G729A_16s
        ldrsh   r1, [sp, #4]
        mov     r0, r4
        mov     r2, r6
        bl      ownCalcGain_G729A_16s
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r7, pc}
LDVS1:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r7, pc}


