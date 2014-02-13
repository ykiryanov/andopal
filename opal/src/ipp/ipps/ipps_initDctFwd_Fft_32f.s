        .text
        .align  4
        .globl  _ipps_initDctFwd_Fft_32f


_ipps_initDctFwd_Fft_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x24
        mov     r7, r0
        ldr     r6, [r7, #4]
        str     r2, [sp, #0x18]
        mov     r2, #0
        cmp     r6, #1
        mov     r9, r1
        mov     r4, #1
        str     r2, [sp, #0x1C]
        strle   r4, [sp, #0x10]
        ble     LCSA1
        str     r4, [sp, #0x10]
        ldr     r2, [sp, #0x10]
        ldr     r3, [sp, #0x1C]
LCSA0:
        mov     r2, r2, lsl #1
        cmp     r2, r6
        add     r3, r3, #1
        blt     LCSA0
        str     r2, [sp, #0x10]
        str     r3, [sp, #0x1C]
LCSA1:
        mov     r0, r6, lsl #1
        str     r9, [r7, #0x3C]
        bl      __floatsidf
        ldr     r5, [pc, #0x16C]
        mov     r2, r0
        mov     r3, r1
        ldr     r1, [pc, #0x164]
        mov     r0, r5
        bl      __divdf3
        mov     r5, r0
        mov     r0, r6
        mov     r8, r1
        bl      __floatsidf
        bl      sqrt
        mov     r11, r1
        mov     r12, #0xFF, 12
        orr     r1, r12, #3, 4
        mov     r10, r0
        mov     r2, r10
        mov     r0, #0
        mov     r3, r11
        bl      __divdf3
        bl      __truncdfsf2
        ldr     lr, [pc, #0x124]
        str     r0, [r9]
        ldr     r12, [r7, #0x3C]
        ldr     lr, [lr]
        ldr     r0, [pc, #0x118]
        ldr     r1, [pc, #0x118]
        mov     r2, r10
        str     lr, [r12, #4]
        mov     r3, r11
        bl      __divdf3
        cmp     r6, #1
        add     r9, r9, r6, lsl #3
        mov     r10, r1
        ble     LCSA3
        str     r9, [sp, #0x14]
        mov     r9, r5
        mov     r5, r4
        mov     r11, #0xC
        str     r8, [sp, #0xC]
        str     r6, [sp, #8]
        mov     r4, r0
LCSA2:
        mov     r0, r5
        bl      __floatsidf
        ldr     r3, [sp, #0xC]
        mov     r2, r9
        bl      __muldf3
        mov     r8, r0
        mov     r6, r1
        bl      cos
        mov     r2, r4
        mov     r3, r10
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r7, #0x3C]
        mov     r2, r0
        mov     r1, r6
        str     r2, [r12, +r5, lsl #3]
        mov     r0, r8
        bl      sin
        mov     r2, r4
        mov     r3, r10
        bl      __muldf3
        bl      __truncdfsf2
        ldr     r12, [r7, #0x3C]
        add     r5, r5, #1
        str     r0, [r12, +r11]
        ldr     r12, [sp, #8]
        add     r11, r11, #8
        cmp     r5, r12
        blt     LCSA2
        ldr     r9, [sp, #0x14]
LCSA3:
        ldr     r1, [sp, #0x18]
        str     r9, [sp]
        add     r0, r7, #0x4C
        str     r1, [sp, #4]
        ldr     r1, [sp, #0x1C]
        mov     r3, #0
        add     r1, r1, #1
        mov     r2, #8
        bl      _ippsFFTInit_R_32f
        cmp     r0, #0
        addne   sp, sp, #0x24
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r7, #0x4C]
        add     r1, sp, #0x20
        bl      _ippsFFTGetBufSize_R_32f
        ldr     r2, [sp, #0x10]
        ldr     r1, [sp, #0x20]
        mov     r0, #0
        add     r2, r1, r2, lsl #3
        str     r2, [r7, #0xC]
        add     sp, sp, #0x24
        ldmia   sp!, {r4 - r11, pc}
        .long   0x54442d18
        .long   0x400921fb
        .long   LCSA__2il0floatpacket.1
        .long   0x667f3bcc
        .long   0x3ff6a09e


        .data
        .align  4


LCSA__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


