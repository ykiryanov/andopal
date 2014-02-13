        .text
        .align  4
        .globl  _ippsComputeAdaptiveCodebookGain_16s


_ippsComputeAdaptiveCodebookGain_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x70
        ldr     r12, [sp, #0x94]
        add     lr, sp, #0xC
        and     lr, lr, #0xF
        str     r12, [sp, #8]
        add     r6, sp, #0x6C
        rsb     lr, lr, #0
        mov     r4, r1
        mov     r7, r3
        add     r12, sp, #0xC
        mov     r3, r6
        mov     r9, #0
        str     r9, [sp]
        and     lr, lr, #0xF
        mov     r8, r0
        mov     r5, r2
        mov     r2, #0x28
        add     r6, r12, lr
        mov     r0, r4
        bl      _ippsDotProd_16s32s_Sfs
        ldr     r12, [sp, #0x6C]
        cmn     r12, #7, 2
        movlt   lr, r9
        bge     LDNJ15
LDNJ0:
        mov     r12, r12, lsl #1
        adds    r12, r12, #1
        streq   r12, [sp, #0x6C]
        beq     LDNJ3
        ldr     r9, [pc, #0x278]
        movs    r10, r12, asr #16
        bne     LDNJ1
        bic     r10, r12, #0xFF, 8
        bic     r10, r10, #0xFF, 16
        movs    r11, r10, asr #8
        ldrne   r9, [pc, #0x264]
        movne   r10, r11, lsl #1
        moveq   r10, r10, lsl #1
        ldrsh   r10, [r9, +r10]
        add     r9, r10, #0x10
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        b       LDNJ2
LDNJ1:
        bic     r10, r10, #0xFF, 8
        bic     r10, r10, #0xFF, 16
        movs    r11, r10, asr #8
        moveq   r10, r10, lsl #1
        ldreqsh r9, [r9, +r10]
        beq     LDNJ2
        ldr     r9, [pc, #0x22C]
        mov     r11, r11, lsl #1
        ldrsh   r9, [r9, +r11]
LDNJ2:
        mov     r12, r12, lsl r9
        str     r12, [sp, #0x6C]
LDNJ3:
        add     r9, lr, r9
        mvn     lr, #0xFF
        bic     r11, lr, #0x7F, 24
        mov     lr, r9, lsl #16
        sub     r9, r11, #2, 2
        cmp     r9, r12
        mov     r10, lr, asr #16
        mvnle   r9, r11
        ble     LDNJ4
        add     r12, r12, #2, 18
        mov     r12, r12, asr #16
        mov     r12, r12, lsl #16
        mov     r9, r12, asr #16
LDNJ4:
        add     r3, sp, #0x6C
        mov     r2, #0x28
        mov     r1, r5
        mov     r0, r4
        bl      _ippsDotProd_16s32s
        ldr     r12, [sp, #0x6C]
        cmn     r12, #7, 2
        bge     LDNJ5
        cmp     r12, #3, 2
        movgt   r2, #0
        bgt     LDNJ6
LDNJ5:
        mov     r0, r4
        mov     r2, r6
        mov     r3, #0x28
        mov     r1, #2
        bl      _ippsRShiftC_16s
        add     r3, sp, #0x6C
        mov     r1, r6
        mov     r0, r5
        mov     r2, #0x28
        bl      _ippsDotProd_16s32s
        ldr     r12, [sp, #0x6C]
        mvn     r2, #1
LDNJ6:
        adds    r8, r8, r12, lsl #1
        mov     lr, #0
        mov     r12, r8
        beq     LDNJ9
        cmn     r8, #1
        moveq   r8, #2, 2
        moveq   lr, #0x1F
        beq     LDNJ9
        cmp     r8, #0
        mvnlt   r12, r8
        cmp     r12, #0
        beq     LDNJ8
        ldr     r0, [pc, #0x154]
        movs    lr, r12, lsr #16
        bne     LDNJ7
        bic     r12, r12, #0xFF, 8
        bic     r12, r12, #0xFF, 16
        movs    lr, r12, asr #8
        ldrne   r0, [pc, #0x140]
        movne   r12, lr, lsl #1
        moveq   r12, r12, lsl #1
        ldrsh   r12, [r0, +r12]
        add     r0, r12, #0x10
        mov     r0, r0, lsl #16
        mov     lr, r0, asr #16
        b       LDNJ8
LDNJ7:
        movs    r12, r12, lsr #24
        moveq   lr, lr, lsl #1
        ldreqsh lr, [r0, +lr]
        beq     LDNJ8
        ldr     r0, [pc, #0x110]
        mov     r12, r12, lsl #1
        ldrsh   lr, [r0, +r12]
LDNJ8:
        mov     r8, r8, lsl lr
LDNJ9:
        add     lr, r2, lr
        sub     r0, r11, #2, 2
        mov     lr, lr, lsl #16
        cmp     r0, r8
        mov     r4, lr, asr #16
        mvnle   r0, r11
        ble     LDNJ10
        add     r8, r8, #2, 18
        mov     r8, r8, asr #16
        mov     r8, r8, lsl #16
        mov     r0, r8, asr #16
LDNJ10:
        rsb     r2, r10, #0xF
        strh    r2, [r7, #2]
        rsb     r2, r4, #0xF
        cmp     r0, #4
        strh    r2, [r7, #6]
        strh    r9, [r7]
        strh    r0, [r7, #4]
        mov     r5, #0
        blt     LDNJ13
        cmp     r9, #0
        mov     r0, r0, asr #1
        suble   r0, r5, #2, 18
        mvnle   r0, r0
        ble     LDNJ11
        mov     r0, r0, lsl #15
        mov     r1, r9
        bl      __intel_idiv
LDNJ11:
        mov     r0, r0, lsl #16
        subs    r4, r4, r10
        mov     r0, r0, asr #16
        bmi     LDNJ14
        mov     r4, r0, asr r4
        mov     r0, r4, lsl #16
        mov     r11, r0, asr #16
LDNJ12:
        mov     r0, #0xCD
        orr     r5, r0, #0x13, 22
        cmp     r11, r5
        movlt   r5, r11
LDNJ13:
        ldr     r0, [sp, #8]
        strh    r5, [r0]
        add     sp, sp, #0x70
        ldmia   sp!, {r4 - r11, pc}
LDNJ14:
        rsb     r4, r4, #0
        bic     r4, r4, #0xFF, 8
        bic     r1, r4, #0xFF, 16
        mvn     r2, r11
        cmp     r0, r2, asr r1
        sub     r5, r5, #2, 18
        mvngt   r11, r11
        bgt     LDNJ12
        cmp     r0, r5, asr r1
        blt     LDNJ12
        mov     r1, r0, lsl r1
        mov     r0, r1, lsl #16
        mov     r11, r0, asr #16
        b       LDNJ12
LDNJ15:
        add     r3, sp, #0x6C
        mov     r2, #2
        mov     r1, #0x28
        mov     r0, r4
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r12, [sp, #0x6C]
        mvn     lr, #3
        b       LDNJ0
        .long   NormTable2
        .long   NormTable


