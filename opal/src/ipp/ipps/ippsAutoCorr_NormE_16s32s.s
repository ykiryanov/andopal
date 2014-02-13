        .text
        .align  4
        .globl  _ippsAutoCorr_NormE_16s32s


_ippsAutoCorr_NormE_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xC
        ldr     r8, [sp, #0x30]
        mov     r4, r0
        cmp     r4, #0
        mov     r5, r1
        mov     r7, r2
        mov     r6, r3
        beq     LDWA6
        cmp     r7, #0
        beq     LDWA6
        cmp     r8, #0
        beq     LDWA6
        cmp     r5, #0
        ble     LDWA7
        cmp     r6, #0
        ble     LDWA7
        add     r3, sp, #8
        mov     r9, #0
        str     r9, [sp]
        mov     r2, r5
        mov     r1, r4
        mov     r0, r4
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #8]
        cmn     r12, #7, 2
        ble     LDWA0
        mov     r0, #0xC
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDWA0:
        mov     r12, r12, lsl #1
        adds    r12, r12, #1
        mov     r10, r12
        streq   r12, [r7]
        beq     LDWA3
        cmn     r12, #1
        beq     LDWA5
        cmp     r12, #0
        mvnlt   r10, r12
        cmp     r10, #0
        beq     LDWA2
        ldr     lr, [pc, #0xB8]
        ldr     r9, [pc, #0xB8]
        movs    r11, r10, lsr #16
        bne     LDWA1
        bic     r10, r10, #0xFF, 8
        bic     r10, r10, #0xFF, 16
        movs    r11, r10, asr #8
        movne   r10, r11, lsl #1
        movne   r9, lr
        moveq   r10, r10, lsl #1
        ldrsh   r10, [r9, +r10]
        add     lr, r10, #0x10
        mov     lr, lr, lsl #16
        mov     r9, lr, asr #16
        b       LDWA2
LDWA1:
        movs    r10, r10, lsr #24
        movne   r10, r10, lsl #1
        ldrnesh r9, [lr, +r10]
        moveq   r11, r11, lsl #1
        ldreqsh r9, [r9, +r11]
LDWA2:
        mov     lr, r12, lsl r9
        str     lr, [r7]
LDWA3:
        cmp     r6, #1
        str     r9, [r8]
        ble     LDWA4
        str     r12, [sp, #8]
        sub     r3, r6, #1
        add     r2, r7, #4
        mov     r12, #1
        add     r9, r9, #1
        str     r12, [sp, #4]
        str     r9, [sp]
        mov     r1, r5
        mov     r0, r4
        bl      _ippsAutoCorr_G729_16s32s_Sfs
LDWA4:
        mov     r0, #0
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDWA5:
        mov     lr, #2, 2
        str     lr, [r7]
        mov     r9, #0x1F
        b       LDWA3
LDWA6:
        mvn     r0, #7
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
LDWA7:
        mvn     r0, #5
        add     sp, sp, #0xC
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable
        .long   NormTable2


