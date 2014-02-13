        .text
        .align  4
        .globl  _ipps_initDctInv_Fft_64f


_ipps_initDctInv_Fft_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x28
        mov     r6, r0
        ldr     r5, [r6, #4]
        mov     r8, r1
        cmp     r5, #1
        str     r2, [sp, #0x1C]
        mov     r4, #1
        movle   r9, #0
        strle   r4, [sp, #0x10]
        ble     LCTK1
        str     r4, [sp, #0x10]
        ldr     r2, [sp, #0x10]
        mov     r9, #0
LCTK0:
        mov     r2, r2, lsl #1
        cmp     r2, r5
        add     r9, r9, #1
        blt     LCTK0
        str     r2, [sp, #0x10]
LCTK1:
        str     r8, [r6, #0x48]
        mov     r0, r5, lsl #1
        bl      __floatsidf
        mov     r2, r0
        ldr     r0, [pc, #0x170]
        mov     r3, r1
        ldr     r1, [pc, #0x16C]
        bl      __divdf3
        str     r1, [sp, #0x20]
        mov     r7, r0
        mov     r0, r5
        bl      __floatsidf
        bl      sqrt
        mov     r11, r1
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r10, r0
        mov     r0, #0
        mov     r2, r10
        mov     r3, r11
        bl      __divdf3
        str     r0, [r8]
        str     r1, [r8, #4]
        ldr     r12, [r6, #0x48]
        ldr     r0, [pc, #0x128]
        ldr     r1, [pc, #0x128]
        mov     lr, #0
        str     lr, [r12, #8]
        str     lr, [r12, #0xC]
        mov     r2, r10
        mov     r3, r11
        bl      __divdf3
        cmp     r5, #1
        add     r8, r8, r5, lsl #4
        ble     LCTK3
        str     r7, [sp, #0xC]
        str     r5, [sp, #8]
        mov     r7, r4
        mov     r10, #0x10
        mov     r11, #0x18
        str     r9, [sp, #0x14]
        str     r8, [sp, #0x18]
        mov     r5, r0
        mov     r4, r1
LCTK2:
        mov     r0, r7
        bl      __floatsidf
        ldr     r2, [sp, #0xC]
        ldr     r3, [sp, #0x20]
        bl      __muldf3
        mov     r8, r0
        mov     r9, r1
        bl      cos
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r6, #0x48]
        str     r0, [r12, +r7, lsl #4]
        add     r12, r12, r10
        str     r1, [r12, #4]
        mov     r1, r9
        mov     r0, r8
        bl      sin
        mov     r2, r5
        mov     r3, r4
        bl      __muldf3
        ldr     r12, [r6, #0x48]
        add     r10, r10, #0x10
        str     r0, [r12, +r11]
        add     r12, r12, r11
        str     r1, [r12, #4]
        ldr     r12, [sp, #8]
        add     r7, r7, #1
        add     r11, r11, #0x10
        cmp     r7, r12
        blt     LCTK2
        ldr     r9, [sp, #0x14]
        ldr     r8, [sp, #0x18]
LCTK3:
        ldr     r1, [sp, #0x1C]
        str     r8, [sp]
        add     r0, r6, #0x58
        str     r1, [sp, #4]
        add     r1, r9, #1
        mov     r3, #0
        mov     r2, #8
        bl      _ippsFFTInit_R_64f
        cmp     r0, #0
        addne   sp, sp, #0x28
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r6, #0x58]
        add     r1, sp, #0x24
        bl      _ippsFFTGetBufSize_R_64f
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x24]
        mov     r0, #0
        add     r2, r1, r2, lsl #4
        str     r2, [r6, #0xC]
        add     sp, sp, #0x28
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x400921fb
        .long   0x667f3bcc
        .long   0x3fe6a09e


