        .text
        .align  4
        .globl  _ipps_getSizeDct_Conv_32f


_ipps_getSizeDct_Conv_32f:
        stmdb   sp!, {r4 - r9, lr}
        sub     sp, sp, #8
        mov     r5, r0
        mov     r4, r1
        mov     r12, r5, lsl #1
        sub     r12, r12, #1
        cmp     r12, #1
        mov     r7, r2
        mov     r6, r3
        mov     r8, #1
        mov     r0, #0
        ble     LCSJ1
LCSJ0:
        mov     r8, r8, lsl #1
        cmp     r8, r12
        add     r0, r0, #1
        blt     LCSJ0
LCSJ1:
        str     r6, [sp, #4]
        str     r7, [sp]
        mov     r3, r4
        mov     r2, #0
        mov     r1, #8
        bl      _ippsFFTGetSize_C_32fc
        cmp     r0, #0
        addne   sp, sp, #8
        ldmneia sp!, {r4 - r9, pc}
        ldr     lr, [r7]
        ldr     r9, [r6]
        add     r5, r5, r5, lsl #1
        add     r12, r5, r8
        mov     r0, #0
        cmp     r9, lr
        movgt   lr, r9
        str     lr, [r7]
        ldr     r2, [r4]
        add     r12, r2, r12, lsl #3
        str     r12, [r4]
        ldr     r1, [r6]
        add     r8, r1, r8, lsl #3
        str     r8, [r6]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r9, pc}


