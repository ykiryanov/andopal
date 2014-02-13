        .text
        .align  4
        .globl  _ipps_cDft_Conv_32f


_ipps_cDft_Conv_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r4, r0
        ldr     r6, [r4, #4]
        ldr     r8, [sp, #0x38]
        ldr     r7, [sp, #0x3C]
        ldr     r10, [sp, #0x40]
        ldr     r11, [r4, #0x2C]
        cmp     r6, #0
        mov     r5, r3
        ble     LCMA1
        mov     r3, #0
        mov     r0, r3
        sub     r9, r10, #4
        str     r10, [sp, #0xC]
        str     r7, [sp]
        str     r8, [sp, #4]
        str     r5, [sp, #8]
        str     r11, [sp, #0x10]
        mov     r8, r0
        mov     r7, r1
        mov     r5, r2
        mov     r10, r3
LCMA0:
        ldr     r12, [r4, #0x3C]
        ldr     r0, [r7]
        ldr     r1, [r12, +r8, lsl #3]
        add     r11, r10, r12
        bl      __mulsf3
        ldr     r1, [r11, #4]
        ldr     r2, [r5]
        mov     r11, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        str     r0, [r9, #4]
        ldr     r11, [r4, #0x3C]
        ldr     r0, [r7], #4
        add     r12, r10, r11
        ldr     r1, [r12, #4]
        add     r10, r10, #8
        bl      __mulsf3
        ldr     r1, [r11, +r8, lsl #3]
        mov     r11, r0
        ldr     r0, [r5], #4
        add     r8, r8, #1
        bl      __mulsf3
        mov     r1, r11
        bl      __addsf3
        str     r0, [r9, #8]!
        cmp     r8, r6
        blt     LCMA0
        ldr     r11, [sp, #0x10]
        ldr     r10, [sp, #0xC]
        ldr     r7, [sp]
        ldr     r8, [sp, #4]
        ldr     r5, [sp, #8]
LCMA1:
        cmp     r6, r11
        bge     LCMA2
        sub     r1, r11, r6
        add     r0, r10, r6, lsl #3
        bl      _ipps_cbZero_32fc
LCMA2:
        ldr     r2, [r4, #0x48]
        add     r9, r10, r11, lsl #3
        mov     r0, r10
        mov     r3, r9
        mov     r1, r10
        bl      _ippsFFTFwd_CToC_32fc
        cmp     r0, #0
        addne   sp, sp, #0x14
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r4, #0x40]
        mov     r3, r11
        mov     r2, r10
        mov     r1, r10
        bl      _ipps_cbMpy3_32fc
        ldr     r2, [r4, #0x48]
        mov     r3, r9
        mov     r0, r10
        mov     r1, r10
        bl      _ippsFFTInv_CToC_32fc
        cmp     r0, #0
        addne   sp, sp, #0x14
        ldmneia sp!, {r4 - r11, pc}
        cmp     r6, #0
        ble     LCMA4
        mov     r0, #0
        sub     r9, r10, #4
        mov     r1, r0
        mov     r10, r5
        str     r7, [sp]
        str     r5, [sp, #8]
        mov     r11, r8
        str     r8, [sp, #4]
        mov     r7, r0
        mov     r5, r1
LCMA3:
        ldr     r2, [r4, #0x3C]
        ldr     r0, [r9, #4]
        ldr     r1, [r2, +r5, lsl #3]
        add     r8, r7, r2
        bl      __mulsf3
        ldr     r1, [r8, #4]
        mov     r8, r0
        ldr     r0, [r9, #8]
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r8
        bl      __subsf3
        str     r0, [r10], #4
        ldr     r8, [r4, #0x3C]
        ldr     r0, [r9, #4]
        add     r2, r7, r8
        ldr     r1, [r2, #4]
        add     r7, r7, #8
        bl      __mulsf3
        ldr     r1, [r8, +r5, lsl #3]
        ldr     r2, [r9, #8]!
        mov     r8, r0
        add     r5, r5, #1
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r8
        bl      __addsf3
        str     r0, [r11], #4
        cmp     r5, r6
        blt     LCMA3
        ldr     r7, [sp]
        ldr     r8, [sp, #4]
        ldr     r5, [sp, #8]
LCMA4:
        cmp     r7, #0
        blt     LCMA6
LCMA5:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCMA6:
        sub     r6, r6, #1
        cmp     r6, #1
        ble     LCMA5
        add     r0, r5, r6, lsl #2
        add     r2, r8, r6, lsl #2
        mov     r1, #1
        add     r5, r5, #4
        add     r8, r8, #4
LCMA7:
        ldr     r3, [r0]
        ldr     r12, [r5]
        add     r1, r1, #1
        str     r3, [r5], #4
        str     r12, [r0], #-4
        ldr     r3, [r2]
        ldr     r12, [r8]
        str     r3, [r8], #4
        sub     r6, r6, #1
        str     r12, [r2], #-4
        cmp     r1, r6
        blt     LCMA7
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}


