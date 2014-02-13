        .text
        .align  4
        .globl  ownEnergy_16s32s


ownEnergy_16s32s:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #8
        mov     r7, r0
        mov     r4, r1
        add     r8, sp, #4
        mov     r5, r3
        mov     r6, r2
        mov     r3, r8
        mov     r2, #0
        bl      _ippsSumSquare_NS_16s32s_Sfs
        ldr     r10, [sp, #4]
        cmp     r5, #1
        str     r10, [r6]
        ble     LDNG3
        sub     r12, r5, #1
        cmp     r12, #4
        mov     r9, #1
        sublt   r0, r7, #2
        blt     LDNG1
        sub     r0, r7, #2
        sub     r8, r5, #4
        add     r7, r4, #1
        add     lr, r0, #2
        add     r12, r6, #4
        str     r4, [sp]
LDNG0:
        mov     r1, r7, lsl #1
        ldrsh   r4, [r0, +r1]
        ldrsh   r11, [lr], #6
        add     r7, r7, #3
        mla     r3, r4, r4, r10
        mul     r2, r11, r11
        add     r4, r1, #2
        add     r10, r9, #1
        add     r1, r1, #4
        sub     r2, r3, r2
        str     r2, [r12], #0xC
        ldrsh   r3, [r0, +r4]
        mov     r4, r10, lsl #1
        ldrsh   r4, [r0, +r4]
        mla     r3, r3, r3, r2
        add     r11, r9, #2
        mul     r4, r4, r4
        mov     r2, r11, lsl #1
        add     r9, r9, #3
        sub     r3, r3, r4
        str     r3, [r6, +r10, lsl #2]
        ldrsh   r2, [r0, +r2]
        ldrsh   r1, [r0, +r1]
        cmp     r9, r8
        mul     r2, r2, r2
        mla     r3, r1, r1, r3
        sub     r10, r3, r2
        str     r10, [r6, +r11, lsl #2]
        ble     LDNG0
        ldr     r4, [sp]
LDNG1:
        add     r4, r9, r4
        add     r6, r6, r9, lsl #2
        mov     r1, r9, lsl #1
LDNG2:
        mov     r2, r4, lsl #1
        ldrsh   r12, [r0, +r2]
        ldrsh   r2, [r0, +r1]
        add     r4, r4, #1
        mla     r10, r12, r12, r10
        add     r1, r1, #2
        mul     r2, r2, r2
        add     r9, r9, #1
        cmp     r9, r5
        sub     r10, r10, r2
        str     r10, [r6], #4
        blt     LDNG2
LDNG3:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r11, pc}


