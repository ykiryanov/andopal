        .text
        .align  4
        .globl  _ipps_cDft_Conv_64fc


_ipps_cDft_Conv_64fc:
        stmdb   sp!, {r4 - r10, lr}
        mov     r9, r0
        ldr     r0, [r9, #0x40]
        ldr     r5, [sp, #0x24]
        ldr     r10, [sp, #0x20]
        ldr     r8, [r9, #0x30]
        mov     r6, r3
        mov     r4, r2
        mov     r2, r5
        bl      _ipps_cbMpy3_64fc
        cmp     r6, r8
        bge     LCQK0
        sub     r1, r8, r6
        add     r0, r5, r6, lsl #4
        bl      _ipps_cbZero_64fc
LCQK0:
        ldr     r2, [r9, #0x4C]
        add     r7, r5, r8, lsl #4
        mov     r0, r5
        mov     r3, r7
        mov     r1, r5
        bl      _ippsFFTFwd_CToC_64fc
        cmp     r0, #0
        ldmneia sp!, {r4 - r10, pc}
        ldr     r0, [r9, #0x44]
        mov     r3, r8
        mov     r2, r5
        mov     r1, r5
        bl      _ipps_cbMpy3_64fc
        ldr     r2, [r9, #0x4C]
        mov     r3, r7
        mov     r0, r5
        mov     r1, r5
        bl      _ippsFFTInv_CToC_64fc
        cmp     r0, #0
        ldmneia sp!, {r4 - r10, pc}
        ldr     r0, [r9, #0x40]
        mov     r1, r5
        mov     r3, r6
        mov     r2, r4
        bl      _ipps_cbMpy3_64fc
        cmp     r10, #0
        blt     LCQK2
LCQK1:
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}
LCQK2:
        sub     r6, r6, #1
        cmp     r6, #1
        ble     LCQK1
        mov     r0, r6, lsl #4
        add     r0, r0, #0x1C
        add     r0, r0, r4
        add     r4, r4, #0xC
        mov     r1, #1
LCQK3:
        ldr     r12, [r0, #-0x1C]
        ldr     lr, [r0, #-0x18]
        ldr     r2, [r4, #4]
        ldr     r3, [r4, #8]
        str     r12, [r4, #4]
        str     lr, [r4, #8]
        ldr     r12, [r0, #-0x14]
        ldr     lr, [r0, #-0x10]
        ldr     r5, [r4, #0xC]
        ldr     r7, [r4, #0x10]
        str     r12, [r4, #0xC]
        str     lr, [r4, #0x10]!
        add     r1, r1, #1
        sub     r6, r6, #1
        str     r2, [r0, #-0x1C]
        str     r3, [r0, #-0x18]
        str     r5, [r0, #-0x14]
        str     r7, [r0, #-0x10]!
        cmp     r1, r6
        blt     LCQK3
        mov     r0, #0
        ldmia   sp!, {r4 - r10, pc}


