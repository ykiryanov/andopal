        .text
        .align  4
        .globl  _ippsNormDiff_Inf_16s32s_Sfs


_ippsNormDiff_Inf_16s32s_Sfs:
        stmdb   sp!, {r4 - r7, lr}
        ldr     r12, [sp, #0x14]
        cmp     r0, #0
        mov     r5, r1
        mov     r4, r3
        beq     LBCW5
        cmp     r5, #0
        beq     LBCW5
        cmp     r4, #0
        beq     LBCW5
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     r2, #0
        mov     lr, #0
        movle   r1, #0
        ble     LBCW1
        mov     r1, #0
LBCW0:
        ldrsh   r6, [r5], #2
        ldrsh   r7, [r0], #2
        sub     r6, r7, r6
        eor     r7, r6, r6, asr #31
        sub     r7, r7, r6, asr #31
        cmp     r7, r1
        movgt   r1, r7
        subs    r2, r2, #1
        bne     LBCW0
LBCW1:
        cmp     r12, #0
        bne     LBCW2
        str     r1, [r4]
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBCW2:
        cmp     r12, #0
        ble     LBCW4
        cmp     r12, #0x1F
        ble     LBCW3
        str     lr, [r4]
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBCW3:
        mov     r12, r1, lsr r12
        str     r12, [r4]
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBCW4:
        cmn     r12, #0x1F
        mvn     r2, #0x1E
        movlt   r12, r2
        mov     r3, r1, asr #31
        rsb     r2, r12, #0
        mov     r0, r1
        mov     r1, r3
        mov     r3, r2, asr #31
        bl      __ashldi3
        cmp     r1, #0
        mvn     r1, #2, 2
        cmpeq   r0, r1
        movhi   r0, r1
        str     r0, [r4]
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LBCW5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


