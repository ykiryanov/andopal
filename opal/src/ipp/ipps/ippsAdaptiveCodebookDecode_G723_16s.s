        .text
        .align  4
        .globl  _ippsAdaptiveCodebookDecode_G723_16s


_ippsAdaptiveCodebookDecode_G723_16s:
        stmdb   sp!, {r4 - r9, lr}
        mov     r3, #0xFF
        mov     r12, #2, 2
        orr     r3, r3, #0x7F, 24
        sub     r12, r12, #2, 18
        mvn     r7, #2, 2
        mov     r6, #0x3C
LDVO0:
        ldrsh   r8, [r0]
        ldrsh   lr, [r1]
        ldrsh   r5, [r0, #2]
        ldrsh   r4, [r1, #2]
        ldrsh   r9, [r1, #4]
        mul     r8, lr, r8
        ldrsh   lr, [r0, #4]
        mla     r8, r4, r5, r8
        ldrsh   r4, [r0, #6]
        ldrsh   r5, [r0, #8]
        mla     r8, r9, lr, r8
        ldrsh   r9, [r1, #6]
        ldrsh   lr, [r1, #8]
        mla     r8, r9, r4, r8
        mla     r8, lr, r5, r8
        cmn     r8, #0x1E, 4
        movgt   lr, r7
        bgt     LDVO1
        cmp     r8, #0xE, 4
        movge   lr, r8, lsl #2
        movlt   lr, #2, 2
LDVO1:
        cmp     r12, lr
        movle   lr, r3
        ble     LDVO2
        add     lr, lr, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDVO2:
        strh    lr, [r2], #2
        subs    r6, r6, #1
        add     r1, r1, #2
        bne     LDVO0
        ldmia   sp!, {r4 - r9, pc}


