        .text
        .align  4
        .globl  _ippsMul_D2D1_16s32s


_ippsMul_D2D1_16s32s:
        stmdb   sp!, {r4 - r10, lr}
        sub     sp, sp, #8
        ldr     r6, [sp, #0x28]
        mov     r7, r1
        cmp     r7, #0
        mov     r8, r0
        mov     r5, r2
        mov     r4, r3
        ble     LDSA1
        mov     r10, #0
        mov     r9, r10
LDSA0:
        add     r0, r8, r10, lsl #1
        str     r9, [sp]
        mov     r1, r5
        mov     r3, r4
        mov     r2, r6
        bl      _ippsDotProd_16s32s_Sfs
        subs    r7, r7, #1
        add     r4, r4, #4
        add     r10, r10, r6
        bne     LDSA0
LDSA1:
        add     sp, sp, #8
        ldmia   sp!, {r4 - r10, pc}


