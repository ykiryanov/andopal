        .text
        .align  4
        .globl  _ipps_getSizeDct_Fft_64f


_ipps_getSizeDct_Fft_64f:
        stmdb   sp!, {r4 - r7, lr}
        sub     sp, sp, #8
        mov     r6, r0
        cmp     r6, #1
        mov     r4, r1
        mov     r5, r3
        mov     r7, #1
        mov     r12, #0
        ble     LCTM1
LCTM0:
        mov     r7, r7, lsl #1
        cmp     r7, r6
        add     r12, r12, #1
        blt     LCTM0
LCTM1:
        str     r2, [sp]
        add     r0, r12, #1
        str     r5, [sp, #4]
        mov     r3, r4
        mov     r2, #0
        mov     r1, #8
        bl      _ippsFFTGetSize_R_64f
        cmp     r0, #0
        addne   sp, sp, #8
        ldmneia sp!, {r4 - r7, pc}
        ldr     r2, [r4]
        mov     r0, #0
        add     r6, r2, r6, lsl #4
        str     r6, [r4]
        ldr     r1, [r5]
        add     r7, r1, r7, lsl #4
        str     r7, [r5]
        add     sp, sp, #8
        ldmia   sp!, {r4 - r7, pc}


