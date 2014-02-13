        .text
        .align  4
        .globl  _ippsSumSquare_D2_16s32s


_ippsSumSquare_D2_16s32s:
        stmdb   sp!, {r4 - r8, lr}
        mov     r6, r1
        cmp     r6, #0
        mov     r7, r0
        mov     r5, r2
        mov     r4, r3
        ble     LDRY1
        mov     r8, #0
LDRY0:
        add     r0, r7, r8, lsl #1
        mov     r3, r4
        mov     r2, #0
        mov     r1, r5
        bl      _ippsSumSquare_NS_16s32s_Sfs
        subs    r6, r6, #1
        add     r4, r4, #4
        add     r8, r8, r5
        bne     LDRY0
LDRY1:
        ldmia   sp!, {r4 - r8, pc}


