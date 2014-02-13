        .text
        .align  4
        .globl  _ipps_cDft_Conv_32fc


_ipps_cDft_Conv_32fc:
        stmdb   sp!, {r4 - r10, lr}
        mov     r9, r0
        ldr     r0, [r9, #0x3C]
        ldr     r4, [sp, #0x24]
        ldr     r10, [sp, #0x20]
        ldr     r8, [r9, #0x2C]
        mov     r5, r3
        mov     r7, r2
        mov     r2, r4
        bl      _ipps_cbMpy3_32fc
        cmp     r5, r8
        bge     LCLZ0
        sub     r1, r8, r5
        add     r0, r4, r5, lsl #3
        bl      _ipps_cbZero_32fc
LCLZ0:
        ldr     r2, [r9, #0x48]
        add     r6, r4, r8, lsl #3
        mov     r0, r4
        mov     r3, r6
        mov     r1, r4
        bl      _ippsFFTFwd_CToC_32fc
        cmp     r0, #0
        ldmneia sp!, {r4 - r10, pc}
        ldr     r0, [r9, #0x40]
        mov     r3, r8
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_32fc
        ldr     r2, [r9, #0x48]
        mov     r3, r6
        mov     r0, r4
        mov     r1, r4
        bl      _ippsFFTInv_CToC_32fc
        cmp     r0, #0
        ldmneia sp!, {r4 - r10, pc}
        ldr     r0, [r9, #0x3C]
        mov     r1, r4
        mov     r3, r5
        mov     r2, r7
        bl      _ipps_cbMpy3_32fc
        cmp     r10, #0
        blt     LCLZ2
LCLZ1:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LCLZ2:
        sub     r5, r5, #1
        cmp     r5, #1
        ble     LCLZ1
        mov     r0, r5, lsl #3
        add     r0, r0, #0xC
        add     r0, r0, r7
        add     r7, r7, #4
        mov     r1, #1
LCLZ3:
        ldr     r12, [r0, #-0xC]
        ldr     r2, [r7, #4]
        ldr     r3, [r7, #8]
        str     r12, [r7, #4]
        ldr     r12, [r0, #-8]
        add     r1, r1, #1
        sub     r5, r5, #1
        cmp     r1, r5
        str     r12, [r7, #8]!
        str     r2, [r0, #-0xC]
        str     r3, [r0, #-8]!
        blt     LCLZ3
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}


