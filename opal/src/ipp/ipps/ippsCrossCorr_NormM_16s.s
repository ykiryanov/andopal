        .text
        .align  4
        .globl  _ippsCrossCorr_NormM_16s


_ippsCrossCorr_NormM_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x1C
        cmp     r0, #0
        beq     LDUT19
        cmp     r1, #0
        beq     LDUT19
        cmp     r3, #0
        beq     LDUT19
        cmp     r2, #0
        ble     LDUT16
        cmp     r2, #0
        movle   r12, #0
        ble     LDUT5
        mov     r12, #0
        mov     r8, r12
        str     r3, [sp, #0x10]
LDUT0:
        sub     r9, r2, r8
        cmp     r9, #0
        movle   r3, #0
        ble     LDUT4
        cmp     r9, #6
        blt     LDUT18
        mov     r3, #0
        add     lr, r1, r8, lsl #1
        mov     r4, r3
        sub     r7, r9, #6
        mov     r6, lr
        mov     r5, r0
        str     r9, [sp, #8]
        str     r8, [sp, #0xC]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0x18]
        str     r0, [sp]
LDUT1:
        ldrsh   r8, [r6]
        ldrsh   r9, [r5]
        ldrsh   r1, [r6, #2]
        ldrsh   r2, [r5, #2]
        ldrsh   r0, [r6, #4]
        mla     r11, r9, r8, r3
        ldrsh   r3, [r5, #4]
        ldrsh   r8, [r6, #6]
        ldrsh   r9, [r5, #6]
        ldrsh   r10, [r6, #8]
        mla     r11, r2, r1, r11
        ldrsh   r1, [r5, #8]
        add     r4, r4, #5
        cmp     r4, r7
        add     r6, r6, #0xA
        mla     r11, r3, r0, r11
        add     r5, r5, #0xA
        mla     r11, r9, r8, r11
        mla     r3, r1, r10, r11
        ble     LDUT1
        ldr     r9, [sp, #8]
        ldr     r8, [sp, #0xC]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        ldr     r0, [sp]
LDUT2:
        mov     r6, r4, lsl #1
        add     r5, r0, r4, lsl #1
LDUT3:
        ldrsh   r10, [lr, +r6]
        ldrsh   r7, [r5], #2
        add     r4, r4, #1
        add     r6, r6, #2
        mla     r3, r7, r10, r3
        cmp     r4, r9
        blt     LDUT3
LDUT4:
        mov     r3, r3, lsl #1
        add     r8, r8, #1
        eor     lr, r3, r3, asr #31
        sub     lr, lr, r3, asr #31
        cmp     lr, r12
        movgt   r12, lr
        cmp     r8, r2
        blt     LDUT0
        ldr     r3, [sp, #0x10]
LDUT5:
        ldr     r4, [pc, #0x258]
        ldr     r5, [pc, #0x258]
        cmp     r12, #0
        mov     lr, #0x1F
        mov     r7, r12
        moveq   r6, #0
        beq     LDUT7
        cmn     r12, #1
        moveq   r6, lr
        beq     LDUT7
        cmp     r12, #0
        mvnlt   r7, r12
        cmp     r7, #0
        moveq   r6, #0
        beq     LDUT7
        movs    r6, r7, lsr #16
        bne     LDUT6
        bic     r7, r7, #0xFF, 8
        bic     r6, r7, #0xFF, 16
        movs    r7, r6, asr #8
        movne   r6, r7, lsl #1
        movne   r7, r5
        moveq   r6, r6, lsl #1
        moveq   r7, r4
        ldrsh   r6, [r7, +r6]
        add     r6, r6, #0x10
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
        b       LDUT7
LDUT6:
        movs    r7, r7, lsr #24
        movne   r7, r7, lsl #1
        ldrnesh r6, [r5, +r7]
        moveq   r6, r6, lsl #1
        ldreqsh r6, [r4, +r6]
LDUT7:
        cmp     r6, #0x10
        movgt   lr, #0x10
        bgt     LDUT9
        cmp     r12, #0
        moveq   lr, #0
        beq     LDUT9
        cmn     r12, #1
        beq     LDUT9
        cmp     r12, #0
        mvnlt   r12, r12
        cmp     r12, #0
        moveq   lr, #0
        beq     LDUT9
        movs    lr, r12, lsr #16
        bne     LDUT8
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        movne   r12, lr, lsl #1
        movne   r4, r5
        moveq   r12, r12, lsl #1
        ldrsh   r12, [r4, +r12]
        add     r12, r12, #0x10
        mov     r12, r12, lsl #16
        mov     lr, r12, asr #16
        b       LDUT9
LDUT8:
        movs    r12, r12, lsr #24
        movne   r12, r12, lsl #1
        ldrnesh lr, [r5, +r12]
        moveq   lr, lr, lsl #1
        ldreqsh lr, [r4, +lr]
LDUT9:
        cmp     r2, #0
        rsb     r9, lr, #0x12
        ble     LDUT15
        mov     r10, #0
LDUT10:
        sub     r11, r2, r10
        cmp     r11, #0
        movle   r12, #0
        movle   lr, r10, lsl #1
        ble     LDUT14
        cmp     r11, #6
        blt     LDUT17
        mov     lr, r10, lsl #1
        mov     r12, #0
        add     r4, r1, lr
        mov     r5, r12
        sub     r8, r11, #6
        mov     r7, r4
        mov     r6, r0
        str     r11, [sp, #4]
        str     r10, [sp, #8]
        str     r9, [sp, #0xC]
        str     r3, [sp, #0x10]
        str     r2, [sp, #0x14]
        str     r1, [sp, #0x18]
        str     r0, [sp]
LDUT11:
        ldrsh   r3, [r6]
        ldrsh   r9, [r7]
        ldrsh   r1, [r7, #2]
        ldrsh   r2, [r6, #2]
        ldrsh   r0, [r7, #4]
        mla     r11, r3, r9, r12
        ldrsh   r3, [r6, #4]
        ldrsh   r12, [r7, #6]
        ldrsh   r9, [r6, #6]
        ldrsh   r10, [r7, #8]
        mla     r11, r2, r1, r11
        ldrsh   r1, [r6, #8]
        add     r7, r7, #0xA
        add     r6, r6, #0xA
        add     r5, r5, #5
        mla     r11, r3, r0, r11
        cmp     r5, r8
        mla     r11, r9, r12, r11
        mla     r12, r1, r10, r11
        ble     LDUT11
        ldr     r11, [sp, #4]
        ldr     r10, [sp, #8]
        ldr     r9, [sp, #0xC]
        ldr     r3, [sp, #0x10]
        ldr     r2, [sp, #0x14]
        ldr     r1, [sp, #0x18]
        ldr     r0, [sp]
LDUT12:
        mov     r7, r5, lsl #1
        add     r6, r0, r5, lsl #1
        str     r0, [sp]
LDUT13:
        ldrsh   r0, [r4, +r7]
        ldrsh   r8, [r6], #2
        add     r5, r5, #1
        add     r7, r7, #2
        mla     r12, r8, r0, r12
        cmp     r5, r11
        blt     LDUT13
        ldr     r0, [sp]
LDUT14:
        mov     r12, r12, lsl #1
        add     r10, r10, #1
        mov     r12, r12, asr r9
        cmp     r10, r2
        strh    r12, [r3, +lr]
        blt     LDUT10
LDUT15:
        mov     r0, #0
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDUT16:
        mvn     r0, #5
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
LDUT17:
        mov     r12, #0
        mov     lr, r10, lsl #1
        mov     r5, r12
        add     r4, r1, lr
        b       LDUT12
LDUT18:
        mov     r3, #0
        mov     r4, r3
        add     lr, r1, r8, lsl #1
        b       LDUT2
LDUT19:
        mvn     r0, #7
        add     sp, sp, #0x1C
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable2
        .long   NormTable


