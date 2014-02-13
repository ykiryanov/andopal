        .text
        .align  4
        .globl  _ippsFIROne32sc_Direct_16sc_Sfs


_ippsFIROne32sc_Direct_16sc_Sfs:
        stmdb   sp!, {r1, r4 - r10, lr}
        ldr     lr, [sp, #0x24]
        ldr     r12, [sp, #0x28]
        str     r0, [sp]
        ldr     r0, [sp, #0x2C]
        ldr     r5, [sp, #0x30]
        cmp     r1, #0
        beq     LCQY7
        cmp     r2, #0
        beq     LCQY7
        cmp     r3, #0
        ble     LCQY6
        cmp     r12, #0
        beq     LCQY7
        cmp     r0, #0
        beq     LCQY7
        ldr     r7, [r0]
        ldrsh   r4, [sp]
        add     r6, r12, r3, lsl #2
        mov     r7, r7, lsl #2
        sub     lr, lr, r5
        strh    r4, [r6, +r7]
        ldr     r7, [r0]
        ldrsh   r5, [sp, #2]
        mov     r7, r7, lsl #2
        strh    r4, [r12, +r7]
        ldr     r7, [r0]
        mov     r4, #0
        add     r7, r6, r7, lsl #2
        strh    r5, [r7, #2]
        ldr     r6, [r0]
        add     r6, r12, r6, lsl #2
        strh    r5, [r6, #2]
        ldr     r5, [r0]
        add     r5, r5, #1
        cmp     r5, r3
        strlt   r5, [r0]
        movge   r5, #0
        strge   r5, [r0]
        cmp     r3, #0
        add     r5, r12, r5, lsl #2
        movle   r12, #0
        movle   r0, r12
        ble     LCQY1
        mov     r12, #0
        mov     r0, r12
        sub     r6, r2, #8
        add     r5, r5, #2
        mov     r8, r0
LCQY0:
        sub     r2, r3, r8
        ldr     r9, [r6, +r2, lsl #3]
        add     r2, r6, r2, lsl #3
        ldr     r7, [r2, #4]
        ldrsh   r2, [r5]
        ldrsh   r10, [r5, #-2]
        add     r8, r8, #1
        mla     r0, r9, r2, r0
        mul     r2, r2, r7
        mla     r12, r9, r10, r12
        add     r5, r5, #4
        cmp     r8, r3
        mla     r0, r7, r10, r0
        sub     r12, r12, r2
        blt     LCQY0
LCQY1:
        cmp     lr, #0
        mvn     r3, #0x1E
        mov     r5, #1
        mov     r2, #0x1F
        beq     LCQY2
        cmp     lr, #0x1F
        mov     r6, lr
        movgt   r6, r2
        cmn     r6, #0x1F
        movlt   r6, r3
        cmp     r6, #0
        movgt   r12, r12, lsl r6
        bgt     LCQY2
        rsb     r6, r6, #0
        sub     r7, r6, #1
        add     r7, r12, r5, lsl r7
        mov     r12, r12, asr r6
        and     r12, r12, #1
        add     r12, r7, r12
        sub     r12, r12, #1
        mov     r12, r12, asr r6
LCQY2:
        mvn     r6, #0xFF
        bic     r6, r6, #0x7F, 24
        mvn     r7, r6
        cmp     r7, r12
        mvnlt   r12, r6
        blt     LCQY3
        cmn     r12, #2, 18
        movge   r12, r12, lsl #16
        movge   r12, r12, asr #16
        sublt   r12, r4, #2, 18
LCQY3:
        cmp     lr, #0
        strh    r12, [r1]
        beq     LCQY4
        cmp     lr, #0x1F
        movgt   lr, r2
        cmn     lr, #0x1F
        movlt   lr, r3
        cmp     lr, #0
        movgt   r0, r0, lsl lr
        bgt     LCQY4
        rsb     lr, lr, #0
        sub     r2, lr, #1
        add     r5, r0, r5, lsl r2
        mov     r0, r0, asr lr
        and     r0, r0, #1
        add     r0, r5, r0
        sub     r0, r0, #1
        mov     r0, r0, asr lr
LCQY4:
        mvn     r2, r6
        cmp     r2, r0
        sublt   r4, r4, #2, 18
        mvnlt   r6, r4
        blt     LCQY5
        cmn     r0, #2, 18
        movge   r0, r0, lsl #16
        movge   r6, r0, asr #16
LCQY5:
        mov     r0, #0
        strh    r6, [r1, #2]
        ldmia   sp!, {r1, r4 - r10, pc}
LCQY6:
        mvn     r0, #0x19
        ldmia   sp!, {r1, r4 - r10, pc}
LCQY7:
        mvn     r0, #7
        ldmia   sp!, {r1, r4 - r10, pc}


