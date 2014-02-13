        .text
        .align  4
        .globl  _ippsFixedCodebookSearch_G729E_16s


_ippsFixedCodebookSearch_G729E_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x47, 30
        add     lr, sp, #0xBC
        ldr     r8, [sp, #0x140]
        and     lr, lr, #0xF
        ldr     r11, [sp, #0x144]
        ldr     r10, [sp, #0x148]
        rsb     lr, lr, #0
        add     r12, sp, #0xBC
        and     lr, lr, #0xF
        cmp     r1, #0
        add     r5, r12, lr
        mov     r9, r0
        mov     r6, r2
        mov     r4, r3
        beq     LDFB6
        cmp     r6, #0
        beq     LDFB6
        cmp     r4, #0
        beq     LDFB6
        cmp     r8, #0
        beq     LDFB6
        cmp     r11, #0
        beq     LDFB6
        cmp     r10, #0
        beq     LDFB6
        add     lr, sp, #0xC
        and     lr, lr, #0xF
        rsb     lr, lr, #0
        add     r12, sp, #0xC
        and     lr, lr, #0xF
        add     r7, r12, lr
        mov     r12, #0
        str     r12, [sp, #8]
        str     r12, [sp]
        mov     r3, r7
        mov     r2, #0x28
        mov     r0, r4
        bl      _ippsCrossCorr_16s32s_Sfs
        ldr     r0, [sp, #8]
        mov     r12, #5
LDFB0:
        cmp     r0, #0x28
        movge   lr, #0
        bge     LDFB2
        mov     r1, r0
        mov     lr, #0
LDFB1:
        ldr     r2, [r7, +r1, lsl #2]
        cmp     r2, #0
        rsblt   r2, r2, #0
        cmp     r2, lr
        movgt   lr, r2
        add     r1, r1, #5
        mov     r1, r1, lsl #16
        mov     r1, r1, asr #16
        cmp     r1, #0x28
        blt     LDFB1
LDFB2:
        add     r0, r0, #1
        cmp     r0, #5
        add     r12, r12, lr
        blt     LDFB0
        cmp     r12, #0
        moveq   r12, #0
        beq     LDFB4
        ldr     lr, [pc, #0xC8]
        movs    r0, r12, lsr #16
        bne     LDFB3
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    r0, r12, asr #8
        ldrne   lr, [pc, #0xB4]
        movne   r12, r0, lsl #1
        moveq   r12, r12, lsl #1
        ldrsh   r12, [lr, +r12]
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     r12, r12, asr #16
        b       LDFB4
LDFB3:
        movs    r12, r12, lsr #24
        moveq   r0, r0, lsl #1
        ldreqsh r12, [lr, +r0]
        beq     LDFB4
        ldr     lr, [pc, #0x84]
        mov     r12, r12, lsl #1
        ldrsh   r12, [lr, +r12]
LDFB4:
        rsb     r12, r12, #2
        mov     r0, r7
        mov     r12, r12, lsl #16
        mov     r2, #0x28
        mov     r12, r12, asr #16
        add     r3, r12, #0xF
        mov     r1, r5
        bl      _ippsConvert_NR_32s16s_Sfs
        cmp     r9, #0
        str     r10, [sp, #4]
        str     r11, [sp]
        bne     LDFB5
        mov     r3, r8
        mov     r2, r4
        mov     r1, r6
        mov     r0, r5
        bl      ownACELP_10i40_35bits_16s
        mov     r0, #0
        add     sp, sp, #0x47, 30
        ldmia   sp!, {r4 - r11, pc}
LDFB5:
        mov     r3, r8
        mov     r2, r4
        mov     r1, r6
        mov     r0, r5
        bl      ownACELP_12i40_44bits_16s
        mov     r0, #0
        add     sp, sp, #0x47, 30
        ldmia   sp!, {r4 - r11, pc}
LDFB6:
        mvn     r0, #7
        add     sp, sp, #0x47, 30
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable2
        .long   NormTable


