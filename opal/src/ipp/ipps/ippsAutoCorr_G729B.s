        .text
        .align  4
        .globl  _ippsAutoCorr_G729B


_ippsAutoCorr_G729B:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #0x83, 30
        add     r3, sp, #8
        and     r3, r3, #0x1F
        rsb     r3, r3, #0
        and     r3, r3, #0x1F
        add     r12, sp, #8
        cmp     r0, #0
        mov     r6, r1
        mov     r5, r2
        add     r4, r12, r3
        beq     LDPR2
        cmp     r6, #0
        beq     LDPR2
        cmp     r5, #0
        beq     LDPR2
        ldr     r1, [pc, #0x94]
        mov     r3, #0xF
        str     r3, [sp]
        mov     r3, #0xF0
        mov     r2, r4
        bl      _ippsMul_NR_16s_Sfs
        add     r12, sp, #0x82, 30
        str     r12, [sp]
        mov     r0, r4
        mov     r3, #0xD
        mov     r2, r5
        mov     r1, #0xF0
        bl      _ippsAutoCorr_NormE_16s32s
        cmp     r0, #0
        mov     r7, #1
        beq     LDPR1
LDPR0:
        mov     r1, r4
        mov     r0, #2
        mov     r2, #0xF0
        bl      _ippsRShiftC_16s_I
        add     r12, sp, #0x82, 30
        str     r12, [sp]
        mov     r0, r4
        mov     r3, #0xD
        mov     r2, r5
        mov     r1, #0xF0
        bl      _ippsAutoCorr_NormE_16s32s
        cmp     r0, #0
        add     r7, r7, #4
        bne     LDPR0
LDPR1:
        ldr     r2, [sp, #0x208]
        mov     r0, #0
        sub     r7, r7, r2
        strh    r7, [r6]
        add     sp, sp, #0x83, 30
        ldmia   sp!, {r4 - r7, pc}
LDPR2:
        mvn     r0, #7
        add     sp, sp, #0x83, 30
        ldmia   sp!, {r4 - r7, pc}
        .long   hamwindow


