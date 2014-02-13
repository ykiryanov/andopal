        .text
        .align  4
        .globl  _ippsLPCInverseFilter_G728_16s


_ippsLPCInverseFilter_G728_16s:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LDEF2
        cmp     r1, #0
        beq     LDEF2
        cmp     r2, #0
        beq     LDEF2
        cmp     r3, #0
        beq     LDEF2
        ldr     r4, [pc, #0x114]
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
        mov     lr, #5
LDEF0:
        ldrsh   r8, [r0]
        ldrsh   r6, [r3, #0xA2]
        ldrsh   r5, [r1, #0x12]
        ldrsh   r7, [r3, #0xA0]
        mov     r8, r8, lsl #13
        mla     r8, r6, r5, r8
        ldrsh   r5, [r3, #0x9E]
        strh    r7, [r3, #0xA2]
        ldrsh   r6, [r1, #0x10]
        ldrsh   r7, [r3, #0xA0]
        strh    r5, [r3, #0xA0]
        ldrsh   r5, [r3, #0x9C]
        mla     r6, r7, r6, r8
        ldrsh   r8, [r1, #0xE]
        ldrsh   r7, [r3, #0x9E]
        strh    r5, [r3, #0x9E]
        ldrsh   r5, [r3, #0x9A]
        mla     r6, r7, r8, r6
        ldrsh   r8, [r1, #0xC]
        ldrsh   r7, [r3, #0x9C]
        strh    r5, [r3, #0x9C]
        ldrsh   r5, [r3, #0x98]
        mla     r6, r7, r8, r6
        ldrsh   r8, [r1, #0xA]
        ldrsh   r7, [r3, #0x9A]
        strh    r5, [r3, #0x9A]
        ldrsh   r5, [r3, #0x96]
        mla     r6, r7, r8, r6
        ldrsh   r8, [r1, #8]
        ldrsh   r7, [r3, #0x98]
        strh    r5, [r3, #0x98]
        ldrsh   r5, [r3, #0x94]
        mla     r6, r7, r8, r6
        ldrsh   r8, [r1, #6]
        ldrsh   r7, [r3, #0x96]
        strh    r5, [r3, #0x96]
        ldrsh   r5, [r3, #0x92]
        mla     r6, r7, r8, r6
        ldrsh   r8, [r1, #4]
        ldrsh   r7, [r3, #0x94]
        strh    r5, [r3, #0x94]
        ldrsh   r5, [r3, #0x90]
        mla     r6, r7, r8, r6
        ldrsh   r7, [r3, #0x92]
        ldrsh   r8, [r1, #2]
        strh    r5, [r3, #0x92]
        ldrsh   r5, [r1]
        mla     r6, r7, r8, r6
        ldrsh   r7, [r3, #0x90]
        mla     r6, r5, r7, r6
        ldrsh   r5, [r0], #2
        mov     r6, r6, lsl #2
        cmp     r4, r6
        strh    r5, [r3, #0x90]
        movle   r5, r12
        ble     LDEF1
        add     r6, r6, #2, 18
        mov     r5, r6, asr #16
        mov     r5, r5, lsl #16
        mov     r5, r5, asr #16
LDEF1:
        strh    r5, [r2], #2
        subs    lr, lr, #1
        bne     LDEF0
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LDEF2:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}
        .long   0x7fff8000


