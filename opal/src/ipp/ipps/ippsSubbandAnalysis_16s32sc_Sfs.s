        .text
        .align  4
        .globl  _ippsSubbandAnalysis_16s32sc_Sfs


_ippsSubbandAnalysis_16s32sc_Sfs:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        ldr     r11, [sp, #0x3C]
        cmp     r0, #0
        str     r0, [sp, #0x14]
        mov     r6, r1
        str     r3, [sp, #0xC]
        beq     LDKI6
        cmp     r6, #0
        beq     LDKI6
        cmp     r2, #0
        beq     LDKI6
        cmp     r11, #0
        beq     LDKI6
        and     r0, r2, #0xF
        rsb     r0, r0, #0
        and     r0, r0, #0xF
        add     r10, r2, r0
        ldr     r9, [r0, +r2]
        ldr     r4, [r10, #8]
        ldr     r5, [r10, #0xC]
        ldr     r8, [r10, #0x10]
        ldr     r7, [r10, #4]
        sub     r2, r9, r4
        add     r0, r5, r4, lsl #1
        mov     r1, r5
        bl      _ippsMove_16s
        ldr     r0, [sp, #0x14]
        rsb     lr, r4, #0
        add     r12, r5, r9, lsl #1
        add     r1, r12, lr, lsl #1
        mov     r2, r4
        bl      _ippsCopy_16s
        and     r2, r11, #0xF
        rsb     r2, r2, #0
        and     r2, r2, #0xF
        mov     r12, #0xD
        add     r4, r11, r2
        str     r12, [sp]
        mov     r3, r7
        mov     r2, r4
        mov     r1, r8
        mov     r0, r5
        bl      _ippsMul_NR_16s_Sfs
        cmp     r7, r9
        add     r3, r4, r7, lsl #1
        mov     r2, r7
        bge     LDKI3
        mov     r12, #0xFF
        orr     r12, r12, #0x7F, 24
LDKI0:
        cmp     r7, #0
        ble     LDKI5
        add     lr, r5, r2, lsl #1
        add     r11, r8, r2, lsl #1
        mov     r0, r4
        mov     r1, r7
        str     r4, [sp, #0x14]
        str     r10, [sp, #0x10]
        str     r6, [sp, #8]
LDKI1:
        ldrsh   r10, [r11], #2
        ldrsh   r6, [lr], #2
        ldrsh   r4, [r0]
        mul     r10, r6, r10
        add     r6, r10, #1, 20
        add     r6, r4, r6, asr #13
        cmp     r12, r6
        movlt   r4, #0xFF
        orrlt   r4, r4, #0x7F, 24
        blt     LDKI2
        cmn     r6, #2, 18
        movge   r4, r6, lsl #16
        movge   r4, r4, asr #16
        bge     LDKI2
        mov     r4, #0xFF
        orr     r4, r4, #0x7F, 24
        mvn     r4, r4
LDKI2:
        strh    r4, [r0], #2
        subs    r1, r1, #1
        add     r2, r2, #1
        bne     LDKI1
        ldr     r4, [sp, #0x14]
        ldr     r10, [sp, #0x10]
        ldr     r6, [sp, #8]
        cmp     r2, r9
        blt     LDKI0
LDKI3:
        str     r3, [sp]
        ldr     r3, [sp, #0xC]
        ldr     r2, [r10, #0x14]
        mov     r0, r4
        mov     r1, r6
        bl      _ippsFFTFwd_RToCCS_16s32s_Sfs
        cmp     r0, #0
        beq     LDKI4
        mvn     r0, #1
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LDKI4:
        mov     r0, #0
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LDKI5:
        cmp     r2, r9
        blt     LDKI0
        b       LDKI3
LDKI6:
        mvn     r0, #7
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


