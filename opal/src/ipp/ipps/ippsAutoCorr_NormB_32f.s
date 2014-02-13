        .text
        .align  4
        .globl  _ippsAutoCorr_NormB_32f


_ippsAutoCorr_NormB_32f:
        stmdb   sp!, {r1, r4 - r11, lr}
        mov     r8, r1
        mov     r5, r2
        mov     r4, r3
        bl      _ippsAutoCorr_32f
        mov     r7, r0
        cmp     r7, #0
        blt     LCYT4
        cmp     r8, r4
        movlt   r4, r8
        mov     r0, r4
        bl      _ippsMalloc_32f
        mov     r6, r0
        cmp     r6, #0
        beq     LCYT5
        cmp     r4, #0
        ble     LCYT3
        cmp     r4, #6
        mov     r11, #0
        blt     LCYT1
        sub     r10, r4, #6
        add     r9, r6, #4
        str     r5, [sp]
LCYT0:
        sub     r5, r8, r11
        mov     r0, r5
        bl      __floatsisf
        str     r0, [r9, #-4]
        sub     r0, r5, #1
        bl      __floatsisf
        str     r0, [r9]
        sub     r0, r5, #2
        bl      __floatsisf
        str     r0, [r9, #4]
        sub     r0, r5, #3
        bl      __floatsisf
        str     r0, [r9, #8]
        sub     r0, r5, #4
        bl      __floatsisf
        add     r11, r11, #5
        str     r0, [r9, #0xC]
        cmp     r11, r10
        add     r9, r9, #0x14
        ble     LCYT0
        ldr     r5, [sp]
LCYT1:
        add     r9, r6, r11, lsl #2
LCYT2:
        sub     r0, r8, r11
        bl      __floatsisf
        add     r11, r11, #1
        str     r0, [r9], #4
        cmp     r11, r4
        blt     LCYT2
LCYT3:
        mov     r2, r4
        mov     r1, r5
        mov     r0, r6
        bl      _ippsDiv_32f_I
        mov     r0, r6
        bl      _ippsFree
LCYT4:
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}
LCYT5:
        mvn     r7, #8
        mov     r0, r7
        ldmia   sp!, {r1, r4 - r11, pc}


