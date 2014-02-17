        .text
        .align  4
        .globl  ippiQuantInvLuma8x8_H264_32s_C1I


ippiQuantInvLuma8x8_H264_32s_C1I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LLCH4
        cmp     r2, #0
        beq     LLCH4
        cmp     r1, #0
        blt     LLCH3
        cmp     r1, #0xE
        bgt     LLCH3
        cmp     r1, #6
        movge   r3, #0
        bge     LLCH0
        mov     r3, #1
        rsb     r12, r1, #5
        mov     r3, r3, lsl r12
LLCH0:
        cmp     r1, #6
        rsblt   lr, r1, #6
        subge   lr, r1, #6
        mov     r12, #8
LLCH1:
        mov     r6, r0
        mov     r5, r2
        mov     r4, #8
LLCH2:
        ldr     r8, [r6]
        ldrsh   r7, [r5], #2
        cmp     r1, #6
        mul     r8, r7, r8
        addlt   r7, r3, r8
        movlt   r8, r7, asr lr
        movge   r8, r8, lsl lr
        str     r8, [r6], #4
        subs    r4, r4, #1
        bne     LLCH2
        subs    r12, r12, #1
        add     r2, r2, #0x10
        add     r0, r0, #0x20
        bne     LLCH1
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LLCH3:
        mvn     r0, #0xBF
        ldmia   sp!, {r4 - r8, pc}
LLCH4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


