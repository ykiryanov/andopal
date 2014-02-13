        .text
        .align  4
        .globl  _ippsShortTermPostFilter_G729_16s


_ippsShortTermPostFilter_G729_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0xE4
        add     r5, sp, #0xB8
        and     r8, r5, #0xF
        add     lr, sp, #8
        and     r9, lr, #0xF
        mov     r6, r0
        rsb     r0, r8, #0
        add     r12, sp, #0x80
        rsb     r8, r9, #0
        and     r11, r12, #0xF
        rsb     r9, r11, #0
        add     r5, sp, #0xB8
        and     r8, r8, #0xF
        and     r9, r9, #0xF
        add     lr, sp, #8
        add     r12, sp, #0x80
        and     r0, r0, #0xF
        cmp     r6, #0
        add     r5, r5, r0
        add     r8, lr, r8
        add     r9, r12, r9
        mov     r10, r1
        mov     r4, r2
        mov     r7, r3
        beq     LDPI1
        cmp     r10, #0
        beq     LDPI1
        cmp     r4, #0
        beq     LDPI1
        cmp     r7, #0
        beq     LDPI1
        ldr     r0, [pc, #0xF4]
        mov     r11, #0xF
        str     r11, [sp]
        mov     r1, r6
        mov     r2, r5
        mov     r3, #0xB
        bl      _ippsMul_NR_16s_Sfs
        ldr     r0, [pc, #0xDC]
        str     r11, [sp]
        mov     r1, r6
        mov     r2, r8
        mov     r3, #0xB
        bl      _ippsMul_NR_16s_Sfs
        add     r0, r8, #0x16
        mov     r1, #0x28
        bl      _ippsZero_16s
        mov     r12, #0
        str     r12, [sp, #4]
        mov     r6, #0xC
        str     r6, [sp]
        mov     r1, r8
        mov     r2, r7
        mov     r0, r5
        mov     r3, #0x14
        bl      _ippsSynthesisFilter_NR_16s_Sfs
        mov     r0, r7
        mov     r2, #0x14
        mov     r1, r9
        bl      _ippsAbs_16s
        add     r2, sp, #0xE0
        mov     r0, r9
        mov     r3, #0
        mov     r1, #0x14
        bl      _ippsSum_16s32s_Sfs
        ldr     r3, [sp, #0xE0]
        mov     r3, r3, asr #2
        mov     r3, r3, lsl #16
        mov     r1, r3, asr #16
        cmp     r1, #1, 22
        ble     LDPI0
        str     r11, [sp]
        mov     r0, #2, 8
        bl      __intel_idiv
        mov     r1, r0
        mov     r0, r10
        mov     r1, r1, lsl #16
        mov     r3, #0x28
        mov     r1, r1, asr #16
        mov     r2, r4
        bl      _ippsMulC_NR_16s_Sfs
LDPI0:
        sub     r3, r4, #0x14
        str     r3, [sp, #4]
        str     r6, [sp]
        mov     r0, r5
        mov     r3, #0x28
        mov     r2, r4
        mov     r1, r4
        bl      _ippsSynthesisFilter_NR_16s_Sfs
        add     sp, sp, #0xE4
        ldmia   sp!, {r4 - r11, pc}
LDPI1:
        mvn     r0, #7
        add     sp, sp, #0xE4
        ldmia   sp!, {r4 - r11, pc}
        .long   facGamma1_pst
        .long   facGamma2_pst


