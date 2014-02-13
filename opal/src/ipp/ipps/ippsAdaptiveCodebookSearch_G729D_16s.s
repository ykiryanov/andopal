        .text
        .align  4
        .globl  _ippsAdaptiveCodebookSearch_G729D_16s


_ippsAdaptiveCodebookSearch_G729D_16s:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #0x60
        ldr     r8, [sp, #0x80]
        ldr     r7, [sp, #0x84]
        cmp     r1, #0
        beq     LDPT18
        cmp     r2, #0
        beq     LDPT18
        cmp     r3, #0
        beq     LDPT18
        cmp     r7, #0
        beq     LDPT18
        cmp     r0, #0x12
        blt     LDPT0
        cmp     r0, #0x91
        bgt     LDPT0
        cmp     r8, #0
        blt     LDPT0
        cmp     r8, #1
        ble     LDPT1
LDPT0:
        mvn     r0, #6
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r10, pc}
LDPT1:
        cmp     r8, #0
        mov     r12, #0x14
        bne     LDPT2
        sub     r0, r0, #3
        mov     r0, r0, lsl #16
        mov     r5, r0, asr #16
        cmp     r5, #0x14
        movlt   r5, r12
        mov     r6, r5
        add     r0, r6, #6
        mov     r0, r0, lsl #16
        mov     r4, r0, asr #16
        cmp     r4, #0x8F
        ble     LDPT3
        mov     r6, #0x89
        mov     r5, r6
        mov     r4, #0x8F
        b       LDPT3
LDPT2:
        sub     r0, r0, #5
        mov     r0, r0, lsl #16
        mov     r5, r0, asr #16
        cmp     r5, #0x14
        movlt   r5, r12
        mov     r6, r5
        add     r0, r6, #9
        mov     r0, r0, lsl #16
        mov     r4, r0, asr #16
        cmp     r4, #0x8F
        ble     LDPT3
        mov     r6, #0x86
        mov     r5, r6
        mov     r4, #0x8F
LDPT3:
        add     r12, sp, #0x10
        sub     r9, r6, #4
        sub     r12, r12, r9, lsl #1
        str     r12, [sp, #4]
        mov     r12, #0x28
        str     r12, [sp, #8]
        add     r0, r3, #0x4D, 30
        add     r12, r4, #4
        str     r12, [sp]
        mov     r3, r9
        bl      _ippsMeanSquareWeightedError_16s
        add     r1, sp, #0x10
        ldrsh   r1, [r1, #8]
        add     r0, r6, #1
        cmp     r0, r4
        bgt     LDPT5
        rsb     r3, r6, #0
        add     r2, sp, #0x10
        add     r3, r2, r3, lsl #1
        add     r2, r3, r0, lsl #1
LDPT4:
        ldrsh   r3, [r2, #8]
        cmp     r3, r1
        movge   r1, r3
        movge   r5, r0
        add     r0, r0, #1
        cmp     r0, r4
        add     r2, r2, #2
        ble     LDPT4
LDPT5:
        cmp     r8, #0
        mov     r0, #0
        bne     LDPT6
        cmp     r5, #0x54
        ble     LDPT6
        strh    r0, [r7, #2]
        mov     r0, #0
        strh    r5, [r7]
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r10, pc}
LDPT6:
        cmp     r8, #0
        mvn     r9, #0
        mvn     r8, #1
        beq     LDPT9
        sub     r4, r4, #4
        mov     r0, r4, lsl #16
        sub     r1, r5, r0, asr #16
        mov     r1, r1, lsl #16
        cmn     r1, #1, 16
        beq     LDPT7
        cmp     r5, r0, asr #16
        beq     LDPT7
        cmn     r1, #2, 16
        beq     LDPT15
        cmp     r1, #1, 16
        movne   r8, #0
        beq     LDPT13
        b       LDPT11
LDPT7:
        rsb     r6, r6, #0
        add     r0, sp, #0x10
        add     r6, r0, r6, lsl #1
        add     r4, r6, r5, lsl #1
        mov     r0, r4
        mvn     r1, #1
        bl      ownInterpol_3
        mov     r6, r9
        mov     r2, r0, lsl #16
        mov     r10, r2, asr #16
LDPT8:
        mov     r0, r4
        mov     r1, r6
        bl      ownInterpol_3
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        cmp     r2, r10
        movgt   r10, r2
        movgt   r8, r6
        add     r6, r6, #1
        cmp     r6, #2
        ble     LDPT8
        b       LDPT11
LDPT9:
        rsb     r6, r6, #0
        add     r0, sp, #0x10
        add     r6, r0, r6, lsl #1
        add     r4, r6, r5, lsl #1
        mov     r0, r4
        mvn     r1, #1
        bl      ownInterpol_3
        mov     r6, r9
        mov     r2, r0, lsl #16
        mov     r10, r2, asr #16
LDPT10:
        mov     r0, r4
        mov     r1, r6
        bl      ownInterpol_3
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, r10
        movgt   r10, r0
        movgt   r8, r6
        add     r6, r6, #1
        cmp     r6, #2
        ble     LDPT10
LDPT11:
        mov     r0, r8, lsl #16
        mov     r0, r0, asr #16
        cmn     r0, #2
        beq     LDPT17
LDPT12:
        cmp     r0, #2
        addeq   r5, r5, #1
        moveq   r8, r9
        mov     r0, #0
        strh    r8, [r7, #2]
        strh    r5, [r7]
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r10, pc}
LDPT13:
        rsb     r6, r6, #0
        add     r0, sp, #0x10
        add     r6, r0, r6, lsl #1
        add     r4, r6, r5, lsl #1
        mov     r0, r4
        mvn     r1, #1
        bl      ownInterpol_3
        mov     r6, r9
        mov     r2, r0, lsl #16
        mov     r10, r2, asr #16
LDPT14:
        mov     r0, r4
        mov     r1, r6
        bl      ownInterpol_3
        mov     r0, r0, lsl #16
        mov     r0, r0, asr #16
        cmp     r0, r10
        movgt   r10, r0
        movgt   r8, r6
        add     r6, r6, #1
        cmp     r6, #0
        ble     LDPT14
        b       LDPT11
LDPT15:
        rsb     r6, r6, #0
        add     r0, sp, #0x10
        add     r6, r0, r6, lsl #1
        add     r4, r6, r5, lsl #1
        mov     r0, r4
        mov     r1, #0
        bl      ownInterpol_3
        mov     r8, #0
        mov     r2, r0, lsl #16
        mov     r6, #1
        mov     r10, r2, asr #16
LDPT16:
        mov     r0, r4
        mov     r1, r6
        bl      ownInterpol_3
        mov     r0, r0, lsl #16
        mov     r2, r0, asr #16
        cmp     r2, r10
        movgt   r10, r2
        movgt   r8, r6
        add     r6, r6, #1
        cmp     r6, #2
        ble     LDPT16
        b       LDPT11
LDPT17:
        mov     r8, #1
        sub     r5, r5, #1
        mov     r0, r8
        b       LDPT12
LDPT18:
        mvn     r0, #7
        add     sp, sp, #0x60
        ldmia   sp!, {r4 - r10, pc}


