        .text
        .align  4
        .globl  _ippsAutoCorr_NormE_NR_16s


_ippsAutoCorr_NormE_NR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r8, [sp, #0x30]
        mov     r5, r0
        cmp     r5, #0
        mov     r4, r1
        mov     r7, r2
        mov     r6, r3
        beq     LDVZ5
        cmp     r7, #0
        beq     LDVZ5
        cmp     r8, #0
        beq     LDVZ5
        cmp     r4, #0
        ble     LDVZ6
        cmp     r6, #0
        ble     LDVZ6
        add     r3, sp, #8
        mov     r2, #0
        mov     r1, r4
        mov     r0, r5
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #8]
        cmn     r12, #7, 2
        movle   r12, r12, lsl #1
        mvngt   r12, #2, 2
        cmp     r12, #0
        mov     lr, #2, 2
        mov     r9, #0
        mov     r11, r12
        beq     LDVZ2
        cmn     r12, #1
        moveq   r12, #2, 2
        moveq   r9, #0x1F
        beq     LDVZ2
        cmp     r12, #0
        mvnlt   r11, r12
        cmp     r11, #0
        beq     LDVZ1
        ldr     r10, [pc, #0xD0]
        ldr     r9, [pc, #0xD0]
        movs    r0, r11, lsr #16
        bne     LDVZ0
        bic     r11, r11, #0xFF, 8
        bic     r11, r11, #0xFF, 16
        movs    r0, r11, asr #8
        movne   r11, r0, lsl #1
        movne   r9, r10
        moveq   r11, r11, lsl #1
        ldrsh   r11, [r9, +r11]
        add     r9, r11, #0x10
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        b       LDVZ1
LDVZ0:
        movs    r11, r11, lsr #24
        movne   r11, r11, lsl #1
        ldrnesh r9, [r10, +r11]
        moveq   r0, r0, lsl #1
        ldreqsh r9, [r9, +r0]
LDVZ1:
        mov     r12, r12, lsl r9
LDVZ2:
        sub     lr, lr, #2, 18
        cmp     lr, r12
        str     r9, [r8]
        movle   lr, #0xFF
        orrle   lr, lr, #0x7F, 24
        ble     LDVZ3
        add     lr, r12, #2, 18
        mov     lr, lr, asr #16
        mov     lr, lr, lsl #16
        mov     lr, lr, asr #16
LDVZ3:
        cmp     r6, #1
        strh    lr, [r7]
        bgt     LDVZ4
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDVZ4:
        str     r12, [sp, #8]
        add     r9, r9, #1
        str     r9, [sp]
        mov     r0, r5
        mov     r3, r6
        mov     r2, r7
        mov     r1, r4
        bl      ownAutoCorr_NormE_NR_16s
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDVZ5:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDVZ6:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable
        .long   NormTable2


