        .text
        .align  4
        .globl  _ippsInterpolateC_G729_16s_Sfs


_ippsInterpolateC_G729_16s_Sfs:
        stmdb   sp!, {r4 - r7, lr}
        ldr     r4, [sp, #0x14]
        ldr     lr, [sp, #0x18]
        ldr     r12, [sp, #0x1C]
        cmp     r0, #0
        beq     LDRS3
        cmp     r2, #0
        beq     LDRS3
        cmp     r4, #0
        beq     LDRS3
        cmp     r12, #0
        mvnlt   r0, #0xC
        ldmltia sp!, {r4 - r7, pc}
        cmp     lr, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r7, pc}
        cmp     lr, #0
        ble     LDRS2
        mov     r5, #0xFF
        orr     r5, r5, #0x7F, 24
LDRS0:
        ldrsh   r6, [r2], #2
        ldrsh   r7, [r0], #2
        mul     r6, r3, r6
        mul     r7, r1, r7
        mov     r6, r6, asr r12
        add     r7, r6, r7, asr r12
        cmp     r5, r7
        movlt   r6, r5
        blt     LDRS1
        cmn     r7, #2, 18
        movge   r6, r7, lsl #16
        movge   r6, r6, asr #16
        mvnlt   r6, r5
LDRS1:
        strh    r6, [r4], #2
        subs    lr, lr, #1
        bne     LDRS0
LDRS2:
        mov     r0, #0
        ldmia   sp!, {r4 - r7, pc}
LDRS3:
        mvn     r0, #7
        ldmia   sp!, {r4 - r7, pc}


