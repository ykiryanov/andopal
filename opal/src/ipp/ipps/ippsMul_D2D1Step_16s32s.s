        .text
        .align  4
        .globl  _ippsMul_D2D1Step_16s32s


_ippsMul_D2D1Step_16s32s:
        stmdb   sp!, {r4 - r10, lr}
        ldr     r6, [sp, #0x20]
        ldr     r10, [sp, #0x24]
        mov     r7, r1
        cmp     r7, #0
        mov     r8, r0
        mov     r5, r2
        mov     r4, r3
        ble     LDSB1
        mov     r9, #0
LDSB0:
        add     r0, r8, r9, lsl #1
        mov     r2, r6
        mov     r1, r5
        mov     r3, r4
        bl      _ippsDotProd_16s32s
        subs    r7, r7, #1
        add     r9, r9, r10
        add     r4, r4, #4
        bne     LDSB0
LDSB1:
        ldmia   sp!, {r4 - r10, pc}


