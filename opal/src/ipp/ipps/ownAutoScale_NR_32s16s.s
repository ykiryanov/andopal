        .text
        .align  4
        .globl  ownAutoScale_NR_32s16s


ownAutoScale_NR_32s16s:
        stmdb   sp!, {r4 - r7, lr}
        cmp     r2, #0
        mvn     r4, #2, 2
        mov     r3, #0
        movle   r5, r3
        ble     LDNI3
        mov     r5, r3
        mov     r6, r0
        mov     lr, r2
LDNI0:
        ldr     r12, [r6], #4
        cmp     r12, #2, 2
        beq     LDNI2
        cmp     r12, #0
        bge     LDNI1
        cmp     r12, #2, 2
        moveq   r12, r4
        rsbne   r12, r12, #0
LDNI1:
        cmp     r12, r5
        movgt   r5, r12
        subs    lr, lr, #1
        bne     LDNI0
        b       LDNI3
LDNI2:
        mov     r5, r4
LDNI3:
        cmp     r5, #0
        moveq   lr, r3
        beq     LDNI5
        ldr     lr, [pc, #0x1B0]
        ldr     r12, [pc, #0x1B0]
        movs    r6, r5, lsr #16
        bne     LDNI4
        bic     r5, r5, #0xFF, 8
        bic     r5, r5, #0xFF, 16
        movs    r6, r5, asr #8
        movne   r5, r6, lsl #1
        movne   r12, lr
        moveq   r5, r5, lsl #1
        ldrsh   r5, [r12, +r5]
        add     r12, r5, #0x10
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        b       LDNI5
LDNI4:
        movs    r5, r5, lsr #24
        movne   r5, r5, lsl #1
        ldrnesh lr, [lr, +r5]
        moveq   r6, r6, lsl #1
        ldreqsh lr, [r12, +r6]
LDNI5:
        cmp     lr, #0x10
        ble     LDNI9
        cmp     r2, #0
        ble     LDNI14
        cmp     r2, #6
        sublt   r12, lr, #0x10
        blt     LDNI7
        sub     r12, lr, #0x10
        sub     r5, r2, #6
        mov     r4, r1
        mov     lr, r0
LDNI6:
        ldr     r6, [lr], #0x14
        mov     r6, r6, lsl r12
        strh    r6, [r4], #0xA
        add     r6, r3, #1
        ldr     r7, [r0, +r6, lsl #2]
        mov     r6, r6, lsl #1
        mov     r7, r7, lsl r12
        strh    r7, [r1, +r6]
        add     r6, r3, #2
        ldr     r7, [r0, +r6, lsl #2]
        mov     r6, r6, lsl #1
        mov     r7, r7, lsl r12
        strh    r7, [r1, +r6]
        add     r6, r3, #3
        ldr     r7, [r0, +r6, lsl #2]
        mov     r6, r6, lsl #1
        mov     r7, r7, lsl r12
        strh    r7, [r1, +r6]
        add     r7, r3, #4
        ldr     r6, [r0, +r7, lsl #2]
        add     r3, r3, #5
        mov     r7, r7, lsl #1
        mov     r6, r6, lsl r12
        cmp     r3, r5
        strh    r6, [r1, +r7]
        ble     LDNI6
LDNI7:
        add     r1, r1, r3, lsl #1
        add     r0, r0, r3, lsl #2
LDNI8:
        ldr     lr, [r0], #4
        add     r3, r3, #1
        mov     lr, lr, lsl r12
        strh    lr, [r1], #2
        cmp     r3, r2
        blt     LDNI8
        ldmia   sp!, {r4 - r7, pc}
LDNI9:
        cmp     lr, #0
        bne     LDNI12
        cmp     r2, #0
        ble     LDNI14
        sub     r12, r4, #2, 18
LDNI10:
        ldr     lr, [r0], #4
        subs    r5, lr, r12
        mov     r6, lr, asr #31
        sbcs    r6, r6, #0
        movlt   r5, #0
        movlt   r6, #0
        orrs    r6, r5, r6
        movne   lr, r4
        bne     LDNI11
        adds    lr, lr, #2, 18
LDNI11:
        mov     lr, lr, asr #16
        add     r3, r3, #1
        strh    lr, [r1], #2
        cmp     r3, r2
        blt     LDNI10
        ldmia   sp!, {r4 - r7, pc}
LDNI12:
        rsb     r12, lr, #0xF
        mov     r4, #1
        mov     r12, r4, lsl r12
        cmp     r2, #0
        mov     r12, r12, lsl #16
        rsb     lr, lr, #0x10
        ble     LDNI14
        mvn     r4, #0xFF
        sub     r5, r3, #2, 18
        bic     r4, r4, #0x7F, 24
        mvn     r5, r5
LDNI13:
        ldr     r6, [r0], #4
        add     r3, r3, #1
        adds    r6, r6, r12, asr #16
        mov     r6, r6, asr lr
        cmp     r5, r6
        movlt   r6, r5
        cmn     r6, #2, 18
        movlt   r6, r4
        strh    r6, [r1], #2
        cmp     r3, r2
        blt     LDNI13
LDNI14:
        ldmia   sp!, {r4 - r7, pc}
        .long   NormTable
        .long   NormTable2


