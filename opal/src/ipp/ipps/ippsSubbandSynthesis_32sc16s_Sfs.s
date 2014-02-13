        .text
        .align  4
        .globl  _ippsSubbandSynthesis_32sc16s_Sfs


_ippsSubbandSynthesis_32sc16s_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        ldr     r12, [sp, #0x34]
        mov     r6, r1
        cmp     r6, #0
        beq     LDKA12
        cmp     r0, #0
        beq     LDKA12
        cmp     r2, #0
        beq     LDKA12
        cmp     r12, #0
        beq     LDKA12
        and     lr, r2, #0xF
        rsb     lr, lr, #0
        and     r4, lr, #0xF
        ldr     r8, [r4, +r2]
        add     lr, r2, r4
        ldr     r9, [lr, #4]
        and     r2, r12, #0xF
        rsb     r2, r2, #0
        ldr     r5, [lr, #0xC]
        ldr     r10, [lr, #0x10]
        ldr     r4, [lr, #8]
        and     r2, r2, #0xF
        add     r7, r12, r2
        add     r12, r7, r9, lsl #1
        str     r12, [sp]
        ldr     r2, [lr, #0x14]
        mov     r1, r7
        bl      _ippsFFTInv_CCSToR_32s16s_Sfs
        cmp     r0, #0
        beq     LDKA0
        mvn     r0, #1
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDKA0:
        add     r0, r5, r4, lsl #1
        sub     r2, r8, r4
        mov     r1, r5
        bl      _ippsMove_16s
        add     r3, r5, r8, lsl #1
        rsb     r12, r4, #0
        mov     r1, r4
        add     r0, r3, r12, lsl #1
        bl      _ippsZero_16s
        mvn     r3, #0xFF
        bic     lr, r3, #0x7F, 24
        cmp     r9, #0
        mov     r3, #0
        ble     LDKA11
        sub     r12, r8, #1
        mvn     r1, lr
        add     r12, r10, r12, lsl #1
        mov     r0, r7
        mov     r11, r5
        str     r7, [sp, #0xC]
        str     r6, [sp, #8]
LDKA1:
        ldrsh   r6, [r0], #2
        rsb     r2, r3, #0
        ldrsh   r7, [r11]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r12, +r2]
        mul     r2, r6, r2
        add     r6, r2, #1, 20
        add     r6, r7, r6, asr #13
        cmp     r1, r6
        blt     LDKA2
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        movlt   r6, #0
        sublt   r6, r6, #2, 18
        b       LDKA3
LDKA2:
        mvn     r6, #0xFF
        bic     r6, r6, #0x7F, 24
        mvn     r6, r6
LDKA3:
        add     r3, r3, #1
        strh    r6, [r11], #2
        cmp     r3, r9
        blt     LDKA1
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #8]
        cmp     r3, r8
        bge     LDKA9
LDKA4:
        mvn     lr, lr
LDKA5:
        cmp     r9, #0
        ble     LDKA10
        sub     r12, r8, #1
        add     r11, r5, r3, lsl #1
        add     r12, r10, r12, lsl #1
        mov     r0, r7
        mov     r1, r9
        str     r7, [sp, #0xC]
        str     r6, [sp, #8]
LDKA6:
        ldrsh   r6, [r0], #2
        rsb     r2, r3, #0
        ldrsh   r7, [r11]
        mov     r2, r2, lsl #1
        ldrsh   r2, [r12, +r2]
        mul     r2, r6, r2
        add     r6, r2, #1, 20
        add     r6, r7, r6, asr #13
        cmp     lr, r6
        blt     LDKA7
        cmn     r6, #2, 18
        movge   r6, r6, lsl #16
        movge   r6, r6, asr #16
        mvnlt   r6, #0xFF
        biclt   r6, r6, #0x7F, 24
        b       LDKA8
LDKA7:
        mov     r6, #0
        sub     r6, r6, #2, 18
        mvn     r6, r6
LDKA8:
        strh    r6, [r11], #2
        subs    r1, r1, #1
        add     r3, r3, #1
        bne     LDKA6
        ldr     r7, [sp, #0xC]
        ldr     r6, [sp, #8]
        cmp     r3, r8
        blt     LDKA5
LDKA9:
        mov     r0, r5
        mov     r2, r4
        mov     r1, r6
        bl      _ippsCopy_16s
        mov     r0, #0
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LDKA10:
        cmp     r3, r8
        blt     LDKA5
        b       LDKA9
LDKA11:
        cmp     r8, #0
        bgt     LDKA4
        b       LDKA9
LDKA12:
        mvn     r0, #7
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


