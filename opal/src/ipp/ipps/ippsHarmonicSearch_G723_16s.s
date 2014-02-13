        .text
        .align  4
        .globl  _ippsHarmonicSearch_G723_16s


_ippsHarmonicSearch_G723_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x4C
        mov     r7, r1
        cmp     r7, #0
        mov     r6, r0
        mov     r5, r2
        mov     r4, r3
        beq     LDVK15
        cmp     r5, #0
        beq     LDVK15
        cmp     r4, #0
        beq     LDVK15
        cmp     r6, #0x12
        blt     LDVK14
        cmp     r6, #0x91
        bgt     LDVK14
        add     r3, sp, #0x48
        mov     r0, r7
        mov     r2, #0
        mov     r1, #0x3C
        bl      _ippsSumSquare_NS_16s32s_Sfs
        add     r12, r6, #3
        sub     r0, r7, r12, lsl #1
        add     r2, sp, #0x10
        mov     r3, #7
        mov     r1, #0x3C
        bl      ownEnergy_16s32s
        sub     r12, r6, #3
        sub     r1, r7, r12, lsl #1
        add     r3, sp, #0x2C
        mov     r12, #7
        str     r12, [sp]
        mov     r0, r7
        mov     r2, #0x3C
        bl      _ippsCrossCorr_Inv_16s32s
        mov     r12, #0
        mov     r1, r12
        mvn     r7, #2, 2
        mov     lr, r1
LDVK0:
        add     r8, sp, #0x2C
        ldr     r8, [r8, +lr, lsl #2]
        cmp     r8, #0
        bge     LDVK1
        cmp     r8, #2, 2
        moveq   r8, r7
        rsbne   r8, r8, #0
LDVK1:
        cmp     r8, r1
        movgt   r1, r8
        add     r9, lr, #1
        add     r8, sp, #0x2C
        mov     r9, r9, lsl #16
        mov     r9, r9, asr #16
        ldr     r9, [r8, +r9, lsl #2]
        cmp     r9, #0
        bge     LDVK2
        cmp     r9, #2, 2
        moveq   r9, r7
        rsbne   r9, r9, #0
LDVK2:
        cmp     r9, r1
        movgt   r1, r9
        add     lr, lr, #2
        cmp     lr, #4
        ble     LDVK0
        add     r8, sp, #0x2C
        ldr     lr, [r8, +lr, lsl #2]
        cmp     lr, #0
        bge     LDVK3
        cmp     lr, #2, 2
        moveq   lr, r7
        rsbne   lr, lr, #0
LDVK3:
        cmp     lr, r1
        movgt   r1, lr
        add     lr, sp, #0x10
        ldr     lr, [lr]
        mov     r1, r1, asr #1
        cmp     lr, r1
        movgt   r1, lr
        add     lr, sp, #0x10
        ldr     lr, [lr, #4]
        cmp     lr, r1
        movgt   r1, lr
        add     lr, sp, #0x10
        ldr     lr, [lr, #8]
        cmp     lr, r1
        movgt   r1, lr
        add     lr, sp, #0x10
        ldr     lr, [lr, #0xC]
        cmp     lr, r1
        movgt   r1, lr
        add     lr, sp, #0x10
        ldr     lr, [lr, #0x10]
        cmp     lr, r1
        movgt   r1, lr
        add     lr, sp, #0x10
        ldr     lr, [lr, #0x14]
        cmp     lr, r1
        movgt   r1, lr
        add     lr, sp, #0x10
        ldr     lr, [lr, #0x18]
        cmp     lr, r1
        movgt   r1, lr
        ldr     r11, [sp, #0x48]
        cmp     r11, r1
        movgt   r1, r11
        cmp     r1, #0
        moveq   r10, r12
        beq     LDVK5
        ldr     lr, [pc, #0x1F4]
        ldr     r7, [pc, #0x1F4]
        movs    r8, r1, lsr #16
        bne     LDVK4
        bic     r1, r1, #0xFF, 8
        bic     r1, r1, #0xFF, 16
        movs    r8, r1, asr #8
        movne   r1, r8, lsl #1
        movne   r7, lr
        moveq   r1, r1, lsl #1
        ldrsh   r1, [r7, +r1]
        add     r1, r1, #0x10
        mov     r1, r1, lsl #16
        mov     r10, r1, asr #16
        b       LDVK5
LDVK4:
        movs    r1, r1, lsr #24
        movne   r1, r1, lsl #1
        ldrnesh r10, [lr, +r1]
        moveq   r8, r8, lsl #1
        ldreqsh r10, [r7, +r8]
LDVK5:
        ldr     lr, [pc, #0x1AC]
        mvn     r9, #0
        mov     r8, #1
        mov     r7, #0x80
        add     r1, r9, #2, 18
        str     r5, [sp, #0xC]
        str     r6, [sp, #8]
LDVK6:
        add     r0, sp, #0x2C
        ldr     r2, [r0, +r12, lsl #2]
        cmp     r2, #0
        ble     LDVK9
        rsb     r0, r12, #0
        add     r5, sp, #0x10
        add     r0, r5, r0, lsl #2
        ldr     r0, [r0, #0x18]
        mov     r0, r0, lsl r10
        cmp     lr, r0
        mvnle   r0, #0
        addle   r0, r0, #2, 18
        ble     LDVK7
        add     r0, r0, #2, 18
        mov     r0, r0, asr #16
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
LDVK7:
        mov     r2, r2, asr #1
        mov     r2, r2, lsl r10
        cmp     lr, r2
        mvnle   r2, #0
        addle   r2, r2, #2, 18
        ble     LDVK8
        add     r2, r2, #2, 18
        mov     r2, r2, asr #16
        mov     r2, r2, lsl #16
        mov     r2, r2, asr #16
LDVK8:
        mul     r6, r2, r2
        mul     r5, r8, r0
        add     r6, r6, #1, 18
        mov     r6, r6, asr #15
        mov     r6, r6, lsl #16
        mov     r6, r6, asr #16
        mul     r3, r1, r6
        cmp     r3, r5
        ble     LDVK9
        mov     r8, r6
        mov     r7, r2
        mov     r1, r0
        mov     r9, r12
LDVK9:
        add     r12, r12, #1
        cmp     r12, #6
        ble     LDVK6
        ldr     r5, [sp, #0xC]
        ldr     r6, [sp, #8]
        mov     r9, r9, lsl #16
        mov     r12, #0
        mov     lr, r9, asr #16
        cmn     lr, #1
        strh    r12, [r4]
        streqh  r6, [r5]
        beq     LDVK13
        ldr     r12, [pc, #0xC0]
        add     r6, lr, r6
        mov     r10, r11, lsl r10
        sub     r6, r6, #3
        cmp     r12, r10
        strh    r6, [r5]
        mvn     r0, #0
        addle   r10, r0, #2, 18
        ble     LDVK10
        add     r10, r10, #2, 18
        mov     r10, r10, asr #16
        mov     r10, r10, lsl #16
        mov     r10, r10, asr #16
LDVK10:
        mul     r12, r1, r10
        mul     r2, r7, r7
        mov     lr, r12, asr #3
        add     r12, lr, r12, asr #2
        cmp     r12, r2
        bge     LDVK13
        cmp     r7, r1
        blt     LDVK11
        mov     r0, #0xA, 22
        strh    r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LDVK11:
        cmp     r1, #0
        addle   r0, r0, #2, 18
        ble     LDVK12
        mov     r0, r7, lsl #15
        bl      __intel_idiv
        add     r0, r0, r0, lsl #2
        mov     r0, r0, lsl #11
        add     r0, r0, #1, 18
        mov     r0, r0, asr #15
LDVK12:
        strh    r0, [r4]
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LDVK13:
        mov     r0, #0
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LDVK14:
        mvn     r0, #5
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
LDVK15:
        mvn     r0, #7
        add     sp, sp, #0x4C
        ldmia   sp!, {r4 - r11, pc}
        .long   NormTable
        .long   NormTable2
        .long   0x7fff8000


