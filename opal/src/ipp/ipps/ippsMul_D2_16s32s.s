        .text
        .align  4
        .globl  _ippsMul_D2_16s32s


_ippsMul_D2_16s32s:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #8
        mov     r6, r1
        mov     r7, r2
        mov     r5, r3
        mov     r4, r0
        mov     r3, r7
        mov     r2, r5
        bl      _ippsSumSquare_D2_16s32s
        cmp     r6, #1
        add     r7, r7, r6, lsl #2
        ble     LDRZ1
        mov     r10, r5
        mov     r8, #1
        mov     r9, #4
LDRZ0:
        add     r2, r4, r10, lsl #1
        str     r5, [sp]
        mov     r0, r4
        mov     r3, r7
        mov     r1, r8
        bl      _ippsMul_D2D1_16s32s
        add     r8, r8, #1
        add     r7, r7, r9
        cmp     r8, r6
        add     r9, r9, #4
        add     r10, r10, r5
        blt     LDRZ0
LDRZ1:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}


