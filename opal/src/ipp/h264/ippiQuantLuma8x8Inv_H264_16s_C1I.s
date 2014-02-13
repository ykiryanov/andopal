        .text
        .align  4
        .globl  _ippiQuantLuma8x8Inv_H264_16s_C1I


_ippiQuantLuma8x8Inv_H264_16s_C1I:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LLCT4
        cmp     r2, #0
        beq     LLCT4
        cmp     r1, #0
        blt     LLCT3
        cmp     r1, #8
        bgt     LLCT3
        cmp     r1, #6
        movge   r3, #0
        bge     LLCT0
        mov     r3, #1
        rsb     r12, r1, #5
        mov     r3, r3, lsl r12
LLCT0:
        cmp     r1, #6
        rsblt   lr, r1, #6
        subge   lr, r1, #6
        mov     r12, #8
LLCT1:
        mov     r6, r0
        mov     r5, r2
        mov     r4, #8
LLCT2:
        ldrsh   r8, [r6]
        ldrsh   r7, [r5], #2
        cmp     r1, #6
        mul     r8, r7, r8
        addlt   r7, r3, r8
        movlt   r8, r7, asr lr
        movge   r8, r8, lsl lr
        strh    r8, [r6], #2
        subs    r4, r4, #1
        bne     LLCT2
        subs    r12, r12, #1
        add     r0, r0, #0x10
        add     r2, r2, #0x10
        bne     LLCT1
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LLCT3:
        mvn     r0, #0xBF
        ldmia   sp!, {r4 - r8, pc}
LLCT4:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}


