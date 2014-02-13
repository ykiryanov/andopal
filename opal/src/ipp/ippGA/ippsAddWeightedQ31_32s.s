        .text
        .align  4
        .globl  _ippsAddWeightedQ31_32s
        .globl  _ippsAddWeightedQ31_32s_I


LAAL_ADDWGT:
_ippsAddWeightedQ31_32s:
        stmdb   sp!, {r4 - r9, lr}
        ldr     r4, [sp, #0x1C]
        cmp     r4, #0
        bne     LAAL_ippsAddWeightedQ31_32s_Switch
        ldr     r5, [r0], #4
LAAL_ippsAddWeightedQ31_32s_loop_1:
        str     r5, [r2], #4
        subs    r3, r3, #1
        ldrgt   r5, [r0], #4
        bgt     LAAL_ippsAddWeightedQ31_32s_loop_1
        b       LAAL_ippsAddWeightedQ31_32s_End
LAAL_ippsAddWeightedQ31_32s_Switch:
        mvn     r5, #2, 2
        sub     r5, r5, r4
        add     r5, r5, #1
        ldr     r8, [r0], #4
        ldr     r9, [r1], #4
LAAL_ippsAddWeightedQ31_32s_loop_2:
        mov     r6, #1, 2
        mov     r7, #0
        smlal   r6, r7, r8, r5
        smlal   r6, r7, r9, r4
        subs    r3, r3, #1
        mov     r6, r6, lsr #31
        mov     r7, r7, lsl #1
        orr     r7, r7, r6
        str     r7, [r2], #4
        ldrgt   r8, [r0], #4
        ldrgt   r9, [r1], #4
        bgt     LAAL_ippsAddWeightedQ31_32s_loop_2
LAAL_ippsAddWeightedQ31_32s_End:
        mov     r0, #0
LAAL_ippsAddWeightedQ31_32s_Quit:
        ldmia   sp!, {r4 - r9, pc}
_ippsAddWeightedQ31_32s_I:
        stmdb   sp!, {r4 - r9, lr}
        cmp     r3, #0
        beq     LAAL_ippsAddWeightedQ31_32s_I_End
        mvn     r5, #2, 2
        sub     r5, r5, r3
        add     r5, r5, #1
        ldr     r8, [r0], #4
        ldr     r9, [r1]
LAAL_ippsAddWeightedQ31_32s_I_loop:
        mov     r6, #1, 2
        mov     r7, #0
        smlal   r6, r7, r8, r3
        smlal   r6, r7, r9, r5
        subs    r2, r2, #1
        mov     r6, r6, lsr #31
        mov     r7, r7, lsl #1
        orr     r7, r7, r6
        str     r7, [r1], #4
        ldrgt   r8, [r0], #4
        ldrgt   r9, [r1]
        bgt     LAAL_ippsAddWeightedQ31_32s_I_loop
LAAL_ippsAddWeightedQ31_32s_I_End:
        mov     r0, #0
LAAL_ippsAddWeightedQ31_32s_I_Quit:
        ldmia   sp!, {r4 - r9, pc}


