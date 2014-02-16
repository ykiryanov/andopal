        .text
        .align  4
        .globl  ippiUniDirWeightBlock_H264_8u_C1R


ippiUniDirWeightBlock_H264_8u_C1R:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r4, [sp, #0x1C]
        ldr     lr, [sp, #0x20]
        ldr     r12, [sp, #0x24]
        cmp     r0, #0
        mvneq   r0, #7
        ldmeqia sp!, {r4 - r9, pc}
        cmp     r1, lr
        mvncc   r0, #0xD
        ldmccia sp!, {r4 - r9, pc}
        cmp     r12, #2
        beq     LLAT1
        cmp     r12, #4
        beq     LLAT1
        cmp     r12, #8
        beq     LLAT1
        cmp     r12, #0x10
        beq     LLAT1
LLAT0:
        mvn     r0, #5
        ldmia   sp!, {r4 - r9, pc}
LLAT1:
        cmp     lr, #2
        beq     LLAT2
        cmp     lr, #4
        beq     LLAT2
        cmp     lr, #8
        beq     LLAT2
        cmp     lr, #0x10
        bne     LLAT0
LLAT2:
        cmp     r2, #0
        mov     r5, #0
        movls   r6, #0
        bls     LLAT3
        mov     r6, #1
        sub     r7, r2, #1
        mov     r6, r6, lsl r7
LLAT3:
        cmp     r12, #0
        bls     LLAT7
        mov     r7, #0xFF
LLAT4:
        cmp     lr, #0
        bls     LLAT6
        mov     r8, #0
LLAT5:
        ldrb    r9, [r8, +r0]
        mla     r9, r3, r9, r6
        add     r9, r4, r9, asr r2
        cmp     r9, #0xFF
        movgt   r9, r7
        cmp     r9, #0
        movlt   r9, r5
        strb    r9, [r8, +r0]
        add     r8, r8, #1
        cmp     r8, lr
        bcc     LLAT5
LLAT6:
        subs    r12, r12, #1
        add     r0, r1, r0
        bne     LLAT4
LLAT7:
        mov     r0, #0
        ldmia   sp!, {r4 - r9, pc}


