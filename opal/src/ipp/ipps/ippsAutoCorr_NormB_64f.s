        .text
        .align  4
        .globl  _ippsAutoCorr_NormB_64f


_ippsAutoCorr_NormB_64f:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r8, r1
        mov     r5, r2
        mov     r4, r3
        bl      _ippsAutoCorr_64f
        mov     r7, r0
        cmp     r7, #0
        blt     LCYR4
        cmp     r8, r4
        movlt   r4, r8
        mov     r0, r4
        bl      _ippsMalloc_64f
        mov     r6, r0
        cmp     r6, #0
        beq     LCYR5
        cmp     r4, #0
        ble     LCYR3
        cmp     r4, #6
        mov     r11, #0
        blt     LCYR1
        sub     r10, r4, #6
        sub     r9, r6, #4
        str     r5, [sp]
LCYR0:
        sub     r5, r8, r11
        mov     r0, r5
        bl      __floatsidf
        str     r0, [r9, #4]
        sub     r0, r5, #1
        str     r1, [r9, #8]
        bl      __floatsidf
        str     r0, [r9, #0xC]
        sub     r0, r5, #2
        str     r1, [r9, #0x10]
        bl      __floatsidf
        str     r0, [r9, #0x14]
        sub     r0, r5, #3
        str     r1, [r9, #0x18]
        bl      __floatsidf
        str     r0, [r9, #0x1C]
        sub     r0, r5, #4
        str     r1, [r9, #0x20]
        bl      __floatsidf
        add     r11, r11, #5
        str     r0, [r9, #0x24]
        str     r1, [r9, #0x28]!
        cmp     r11, r10
        ble     LCYR0
        ldr     r5, [sp]
LCYR1:
        mov     r12, r11, lsl #3
        sub     r12, r12, #4
        add     r9, r12, r6
LCYR2:
        sub     r0, r8, r11
        bl      __floatsidf
        add     r11, r11, #1
        str     r0, [r9, #4]
        str     r1, [r9, #8]!
        cmp     r11, r4
        blt     LCYR2
LCYR3:
        mov     r2, r4
        mov     r1, r5
        mov     r0, r6
        bl      _ippsDiv_64f_I
        mov     r0, r6
        bl      _ippsFree
LCYR4:
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LCYR5:
        mvn     r7, #8
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}


