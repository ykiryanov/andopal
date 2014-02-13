        .text
        .align  4
        .globl  _ippsAutoCorr_NormB_64fc


_ippsAutoCorr_NormB_64fc:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x10
        mov     r4, r1
        mov     r7, r2
        mov     r6, r3
        bl      _ippsAutoCorr_64fc
        mov     r9, r0
        cmp     r9, #0
        blt     LCYQ4
        cmp     r4, r6
        movlt   r6, r4
        mov     r8, r6, lsl #1
        mov     r0, r8
        bl      _ippsMalloc_64f
        mov     r5, r0
        cmp     r5, #0
        beq     LCYQ5
        cmp     r6, #0
        ble     LCYQ3
        cmp     r6, #5
        mov     r1, #0
        addlt   r0, r5, #8
        blt     LCYQ1
        sub     r2, r6, #5
        add     r0, r5, #8
        str     r8, [sp]
        str     r6, [sp, #8]
        str     r7, [sp, #4]
        sub     r11, r5, #0x3C
        sub     r10, r5, #0x34
        str     r9, [sp, #0xC]
        mov     r6, r0
        mov     r7, r1
        mov     r8, r2
LCYQ0:
        sub     r9, r4, r7
        mov     r0, r9
        bl      __floatsidf
        str     r0, [r11, #0x3C]
        str     r1, [r11, #0x40]!
        str     r0, [r10, #0x3C]
        sub     r2, r9, #1
        str     r1, [r10, #0x40]!
        mov     r0, r2
        bl      __floatsidf
        add     r3, r7, #1
        str     r0, [r5, +r3, lsl #4]
        add     r2, r5, r3, lsl #4
        str     r1, [r2, #4]
        str     r0, [r6, +r3, lsl #4]
        add     r3, r6, r3, lsl #4
        str     r1, [r3, #4]
        sub     r0, r9, #2
        bl      __floatsidf
        add     r12, r7, #2
        mov     r2, r0
        str     r2, [r5, +r12, lsl #4]
        add     r3, r5, r12, lsl #4
        str     r1, [r3, #4]
        str     r2, [r6, +r12, lsl #4]
        add     r12, r6, r12, lsl #4
        str     r1, [r12, #4]
        sub     r9, r9, #3
        mov     r0, r9
        bl      __floatsidf
        add     r12, r7, #3
        str     r0, [r5, +r12, lsl #4]
        add     r3, r5, r12, lsl #4
        str     r1, [r3, #4]
        str     r0, [r6, +r12, lsl #4]
        add     r7, r7, #4
        add     r12, r6, r12, lsl #4
        cmp     r7, r8
        str     r1, [r12, #4]
        ble     LCYQ0
        mov     r0, r6
        mov     r1, r7
        ldr     r9, [sp, #0xC]
        ldr     r8, [sp]
        ldr     r6, [sp, #8]
        ldr     r7, [sp, #4]
LCYQ1:
        mov     r12, r1, lsl #4
        sub     r12, r12, #0xC
        str     r8, [sp]
        str     r7, [sp, #4]
        add     r11, r12, r5
        add     r10, r12, r0
        mov     r7, r0
        mov     r8, r1
LCYQ2:
        sub     r0, r4, r8
        bl      __floatsidf
        str     r0, [r11, #0xC]
        str     r1, [r11, #0x10]!
        str     r0, [r7, +r8, lsl #4]
        add     r8, r8, #1
        str     r1, [r10, #0x10]!
        cmp     r8, r6
        blt     LCYQ2
        ldr     r8, [sp]
        ldr     r7, [sp, #4]
LCYQ3:
        mov     r2, r8
        mov     r1, r7
        mov     r0, r5
        bl      _ippsDiv_64f_I
        mov     r0, r5
        bl      _ippsFree
LCYQ4:
        mov     r0, r9
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}
LCYQ5:
        mvn     r9, #8
        mov     r0, r9
        add     sp, sp, #0x10
        ldmia   sp!, {r4 - r11, pc}


