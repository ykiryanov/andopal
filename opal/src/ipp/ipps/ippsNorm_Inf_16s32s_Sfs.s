        .text
        .align  4
        .globl  _ippsNorm_Inf_16s32s_Sfs


_ippsNorm_Inf_16s32s_Sfs:
        stmdb   sp!, {r4 - r6, lr}
        cmp     r0, #0
        mov     r5, r1
        mov     r4, r2
        beq     LBCI5
        cmp     r4, #0
        beq     LBCI5
        cmp     r5, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r6, pc}
        cmp     r5, #0
        mov     r12, #0
        movle   r1, #0
        ble     LBCI1
        mov     r1, #0
LBCI0:
        ldrsh   lr, [r0], #2
        eor     r6, lr, lr, asr #31
        sub     r6, r6, lr, asr #31
        cmp     r6, r1
        movgt   r1, r6
        subs    r5, r5, #1
        bne     LBCI0
LBCI1:
        cmp     r3, #0
        bne     LBCI2
        str     r1, [r4]
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBCI2:
        cmp     r3, #0
        ble     LBCI4
        cmp     r3, #0x1F
        ble     LBCI3
        str     r12, [r4]
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBCI3:
        mov     r3, r1, lsr r3
        str     r3, [r4]
        mov     r0, #0
        ldmia   sp!, {r4 - r6, pc}
LBCI4:
        cmn     r3, #0x1F
        mvn     r12, #0x1E
        movlt   r3, r12
        rsb     r2, r3, #0
        mov     r3, r1, asr #31
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
        ldmia   sp!, {r4 - r6, pc}
LBCI5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r6, pc}


