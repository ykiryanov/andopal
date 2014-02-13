        .text
        .align  4
        .globl  _ippsWeightingFilter_GSMFR_16s


_ippsWeightingFilter_GSMFR_16s:
        stmdb   sp!, {r4 - r8, lr}
        cmp     r0, #0
        beq     LDTB5
        cmp     r1, #0
        beq     LDTB5
        cmp     r2, #0
        mvnle   r0, #5
        ldmleia sp!, {r4 - r8, pc}
        cmp     r2, #0
        sub     r0, r0, #0xA
        ble     LDTB3
        ldr     lr, [pc, #0xE0]
        mvn     r12, #0
        add     r3, r12, #2, 18
LDTB0:
        ldrsh   r4, [r0]
        ldrsh   r5, [lr]
        ldrsh   r7, [lr, #2]
        ldrsh   r6, [r0, #2]
        mul     r8, r4, r5
        ldrsh   r5, [lr, #4]
        ldrsh   r4, [r0, #4]
        add     r8, r8, #1, 20
        mla     r8, r6, r7, r8
        ldrsh   r7, [lr, #6]
        ldrsh   r6, [r0, #6]
        mla     r8, r4, r5, r8
        ldrsh   r5, [lr, #8]
        ldrsh   r4, [r0, #8]
        mla     r8, r6, r7, r8
        ldrsh   r7, [lr, #0xA]
        ldrsh   r6, [r0, #0xA]
        mla     r8, r4, r5, r8
        ldrsh   r5, [lr, #0xC]
        ldrsh   r4, [r0, #0xC]
        mla     r8, r6, r7, r8
        ldrsh   r7, [lr, #0xE]
        ldrsh   r6, [r0, #0xE]
        mla     r4, r4, r5, r8
        ldrsh   r8, [lr, #0x10]
        ldrsh   r5, [r0, #0x10]
        mla     r7, r6, r7, r4
        ldrsh   r6, [lr, #0x12]
        ldrsh   r4, [lr, #0x14]
        mla     r7, r5, r8, r7
        ldrsh   r8, [r0, #0x12]
        ldrsh   r5, [r0, #0x14]
        mla     r7, r8, r6, r7
        mlas    r7, r5, r4, r7
        movpl   r4, r7, asr #13
        bmi     LDTB4
LDTB1:
        cmn     r4, #2, 18
        movlt   r4, r12, lsl #15
        blt     LDTB2
        cmp     r3, r4
        movge   r4, r4, lsl #16
        movge   r4, r4, asr #16
        addlt   r4, r12, #2, 18
LDTB2:
        strh    r4, [r1], #2
        subs    r2, r2, #1
        add     r0, r0, #2
        bne     LDTB0
LDTB3:
        mov     r0, #0
        ldmia   sp!, {r4 - r8, pc}
LDTB4:
        rsb     r4, r7, r12
        mov     r4, r4, asr #13
        mvn     r4, r4
        b       LDTB1
LDTB5:
        mvn     r0, #7
        ldmia   sp!, {r4 - r8, pc}
        .long   LDTB_H


        .data
        .align  4


LDTB_H:
        .byte   0x7A,0xFF,0x8A,0xFE,0x00,0x00,0x06,0x08,0x6D,0x16,0x00,0x20,0x6D,0x16,0x06,0x08
        .byte   0x00,0x00,0x8A,0xFE,0x7A,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00


