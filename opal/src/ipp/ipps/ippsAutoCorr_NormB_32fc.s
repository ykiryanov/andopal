        .text
        .align  4
        .globl  _ippsAutoCorr_NormB_32fc


_ippsAutoCorr_NormB_32fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r9, r1
        mov     r11, r2
        mov     r10, r3
        bl      _ippsAutoCorr_32fc
        mov     r5, r0
        cmp     r5, #0
        blt     LCYS4
        cmp     r9, r10
        movlt   r10, r9
        mov     r6, r10, lsl #1
        mov     r0, r6
        bl      _ippsMalloc_32f
        mov     r4, r0
        cmp     r4, #0
        beq     LCYS5
        cmp     r10, #0
        ble     LCYS3
        cmp     r10, #5
        mov     r0, #0
        addlt   r8, r4, #4
        blt     LCYS1
        add     r8, r4, #4
        sub     r2, r10, #5
        mov     r1, r4
        str     r5, [sp, #0xC]
        str     r6, [sp, #8]
        str     r11, [sp]
        mov     r7, r8
        str     r10, [sp, #4]
        mov     r11, r0
        mov     r5, r1
        mov     r6, r2
LCYS0:
        sub     r10, r9, r11
        mov     r0, r10
        bl      __floatsisf
        str     r0, [r5], #0x20
        str     r0, [r7], #0x20
        sub     r0, r10, #1
        bl      __floatsisf
        add     r3, r11, #1
        str     r0, [r4, +r3, lsl #3]
        str     r0, [r8, +r3, lsl #3]
        sub     r0, r10, #2
        bl      __floatsisf
        mov     r1, r0
        add     r3, r11, #2
        str     r1, [r4, +r3, lsl #3]
        str     r1, [r8, +r3, lsl #3]
        sub     r0, r10, #3
        bl      __floatsisf
        add     r3, r11, #3
        str     r0, [r4, +r3, lsl #3]
        add     r11, r11, #4
        cmp     r11, r6
        str     r0, [r8, +r3, lsl #3]
        ble     LCYS0
        mov     r0, r11
        ldr     r5, [sp, #0xC]
        ldr     r6, [sp, #8]
        ldr     r10, [sp, #4]
        ldr     r11, [sp]
LCYS1:
        str     r11, [sp]
        add     r7, r4, r0, lsl #3
        mov     r11, r0
LCYS2:
        sub     r0, r9, r11
        bl      __floatsisf
        str     r0, [r7], #8
        str     r0, [r8, +r11, lsl #3]
        add     r11, r11, #1
        cmp     r11, r10
        blt     LCYS2
        ldr     r11, [sp]
LCYS3:
        mov     r2, r6
        mov     r1, r11
        mov     r0, r4
        bl      _ippsDiv_32f_I
        mov     r0, r4
        bl      _ippsFree
LCYS4:
        mov     r0, r5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCYS5:
        mvn     r5, #8
        mov     r0, r5
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


