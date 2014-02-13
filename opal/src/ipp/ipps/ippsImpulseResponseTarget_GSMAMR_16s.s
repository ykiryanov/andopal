        .text
        .align  4
        .globl  _ippsImpulseResponseTarget_GSMAMR_16s


_ippsImpulseResponseTarget_GSMAMR_16s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x41, 30
        ldr     r9, [sp, #0x12C]
        add     r8, sp, #0x90
        add     r12, sp, #0x18
        and     r8, r8, #0xF
        ldr     r11, [sp, #0x128]
        rsb     r4, r8, #0
        and     r7, r12, #0xF
        ldr     r8, [sp, #0x130]
        ldr     r10, [sp, #0x138]
        and     r4, r4, #0xF
        add     r12, sp, #0x90
        str     r9, [sp, #0xC]
        ldr     r9, [sp, #0x134]
        rsb     r7, r7, #0
        add     r4, r12, r4
        and     r7, r7, #0xF
        add     lr, sp, #0x18
        str     r4, [sp, #8]
        cmp     r0, #0
        add     r7, lr, r7
        mov     r5, r1
        mov     r6, r2
        mov     r4, r3
        beq     LDRG0
        cmp     r5, #0
        beq     LDRG0
        cmp     r6, #0
        beq     LDRG0
        cmp     r4, #0
        beq     LDRG0
        cmp     r11, #0
        beq     LDRG0
        ldr     r12, [sp, #0xC]
        cmp     r12, #0
        beq     LDRG0
        cmp     r8, #0
        beq     LDRG0
        cmp     r9, #0
        beq     LDRG0
        cmp     r10, #0
        beq     LDRG0
        add     r0, r0, #0x14
        str     r0, [sp, #0x10]
        add     r0, r7, #0x16
        str     r0, [sp, #0x14]
        mov     r1, #0x28
        bl      _ippsZero_16s
        ldr     r1, [sp, #8]
        mov     r2, #0xA
        mov     r0, r11
        bl      _ippsCopy_16s
        ldr     r12, [sp, #8]
        mov     r1, r7
        mov     r0, r5
        add     r12, r12, #0x14
        str     r12, [sp, #8]
        mov     r2, #0xB
        bl      _ippsCopy_16s
        ldr     r12, [sp, #0x14]
        mov     r1, r7
        mov     r7, #0xC
        str     r12, [sp, #4]
        str     r7, [sp]
        mov     r0, r4
        mov     r2, r8
        mov     r3, #0x28
        bl      _ippsSynthesisFilter_NR_16s_Sfs
        ldr     r12, [sp, #0x14]
        mov     r1, r8
        mov     r0, r6
        str     r12, [sp]
        mov     r2, #0x28
        mov     r3, #0xC
        bl      _ippsSynthesisFilterLow_NR_16s_ISfs
        ldr     r0, [sp, #0x10]
        mov     r2, r9
        mov     r1, r4
        bl      _ippsResidualFilter_G729_16s
        str     r7, [sp]
        str     r11, [sp, #4]
        ldr     r2, [sp, #8]
        mov     r0, r4
        mov     r1, r9
        mov     r3, #0x28
        bl      _ippsSynthesisFilter_NR_16s_Sfs
        ldr     r0, [sp, #8]
        mov     r1, r5
        mov     r2, r10
        bl      _ippsResidualFilter_G729_16s
        ldr     r3, [sp, #0xC]
        mov     r0, r6
        mov     r1, r10
        str     r3, [sp]
        mov     r3, #0xC
        mov     r2, #0x28
        bl      _ippsSynthesisFilterLow_NR_16s_ISfs
        mov     r0, #0
        add     sp, sp, #0x41, 30
        ldmia   sp!, {r4 - r11, pc}
LDRG0:
        mvn     r0, #7
        add     sp, sp, #0x41, 30
        ldmia   sp!, {r4 - r11, pc}


