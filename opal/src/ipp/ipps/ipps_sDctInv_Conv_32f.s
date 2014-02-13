        .text
        .align  4
        .globl  _ipps_sDctInv_Conv_32f


_ipps_sDctInv_Conv_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x38
        mov     r7, r0
        ldr     r5, [r7, #4]
        ldr     r6, [r7, #0x30]
        ldr     r12, [r7, #0x3C]
        cmp     r5, #0
        mov     r10, r1
        str     r2, [sp, #0x20]
        mov     r4, r3
        addle   r8, r4, #4
        ble     LCSF3
        cmp     r5, #4
        mov     r0, #0
        addlt   r8, r4, #4
        addlt   r9, r12, #4
        blt     LCSF1
        add     r9, r12, #4
        add     r8, r4, #4
        str     r9, [sp, #0x10]
        mov     r11, r8
        str     r8, [sp, #0x24]
        ldr     r8, [sp, #0x10]
        sub     r3, r5, #4
        mov     lr, r4
        mov     r2, r10
        mov     r1, r12
        str     r6, [sp, #0x14]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x18]
        str     r9, [sp]
        str     lr, [sp, #4]
        str     r3, [sp, #8]
        str     r12, [sp, #0x28]
        str     r7, [sp, #0x1C]
        mov     r4, r0
        mov     r5, r1
        mov     r6, r2
LCSF0:
        ldr     r0, [r6]
        ldr     r1, [r5], #0x18
        add     r7, r4, #1
        bl      __mulsf3
        ldr     r3, [sp, #4]
        add     r9, r4, #2
        add     r4, r4, #3
        str     r0, [r3], #0x18
        ldr     r0, [r6], #0xC
        ldr     r1, [r8], #0x18
        str     r3, [sp, #4]
        bl      __mulsf3
        str     r0, [r11], #0x18
        ldr     r0, [r10, +r7, lsl #2]
        ldr     r3, [sp, #0x28]
        ldr     r1, [r3, +r7, lsl #3]
        bl      __mulsf3
        ldr     r3, [sp, #0x18]
        str     r0, [r3, +r7, lsl #3]
        ldr     r3, [sp]
        ldr     r0, [r10, +r7, lsl #2]
        ldr     r1, [r3, +r7, lsl #3]
        bl      __mulsf3
        ldr     r3, [sp, #0x24]
        str     r0, [r3, +r7, lsl #3]
        ldr     r3, [sp, #0x28]
        ldr     r0, [r10, +r9, lsl #2]
        ldr     r1, [r3, +r9, lsl #3]
        bl      __mulsf3
        ldr     r3, [sp, #0x18]
        str     r0, [r3, +r9, lsl #3]
        ldr     r3, [sp]
        ldr     r0, [r10, +r9, lsl #2]
        ldr     r1, [r3, +r9, lsl #3]
        bl      __mulsf3
        ldr     r3, [sp, #8]
        cmp     r4, r3
        ldr     r3, [sp, #0x24]
        str     r0, [r3, +r9, lsl #3]
        ble     LCSF0
        mov     r0, r4
        ldr     r8, [sp, #0x24]
        ldr     r9, [sp]
        ldr     r12, [sp, #0x28]
        ldr     r6, [sp, #0x14]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x18]
        ldr     r7, [sp, #0x1C]
LCSF1:
        add     r1, r10, r0, lsl #2
        add     r11, r4, r0, lsl #3
        str     r4, [sp, #0x18]
        str     r7, [sp, #0x1C]
        add     r10, r12, r0, lsl #3
        mov     r4, r0
        mov     r7, r1
LCSF2:
        ldr     r0, [r7]
        ldr     r1, [r10], #8
        bl      __mulsf3
        str     r0, [r11], #8
        ldr     r1, [r9, +r4, lsl #3]
        ldr     r0, [r7], #4
        bl      __mulsf3
        str     r0, [r8, +r4, lsl #3]
        add     r4, r4, #1
        cmp     r4, r5
        blt     LCSF2
        ldr     r4, [sp, #0x18]
        ldr     r7, [sp, #0x1C]
LCSF3:
        ldr     r12, [r7, #0x40]
        ldr     r10, [r4, #4]
        ldr     r9, [r4]
        str     r12, [sp, #8]
        mov     r11, r5, lsl #1
        mov     r0, r10
        mov     r1, r9
        bl      __addsf3
        str     r0, [sp, #0x28]
        mov     r0, r9
        mov     r1, r10
        bl      __subsf3
        ldr     r12, [sp, #0x28]
        str     r0, [r4, #4]
        cmp     r5, #2
        str     r12, [r4]
        sub     r0, r11, #2
        ble     LCSF5
        ldr     r1, [sp, #8]
        mov     lr, #2
        add     r10, r4, r0, lsl #2
        add     r12, r1, #8
        add     r1, r1, #0xC
        str     r11, [sp, #0x10]
        add     r9, r4, #8
        str     r1, [sp, #8]
        str     r12, [sp, #4]
        str     lr, [sp]
        str     r6, [sp, #0x14]
        str     r5, [sp, #0xC]
        str     r4, [sp, #0x18]
        str     r7, [sp, #0x1C]
        mov     r11, r0
LCSF4:
        ldr     r1, [r10]
        str     r1, [sp, #0x28]
        ldr     r5, [r9]
        mov     r0, r5
        bl      __subsf3
        ldr     r1, [sp]
        ldr     r7, [r8, +r11, lsl #2]
        ldr     r6, [r8, +r1, lsl #2]
        str     r0, [sp, #0x2C]
        mov     r1, r7
        mov     r0, r6
        bl      __addsf3
        ldr     r1, [sp, #0x28]
        mov     r4, r0
        mov     r0, r5
        bl      __addsf3
        mov     r5, r0
        mov     r0, r6
        mov     r1, r7
        bl      __subsf3
        ldr     r1, [sp, #8]
        ldr     r2, [sp, #4]
        ldr     r7, [r1]
        ldr     r2, [r2]
        str     r0, [sp, #0x30]
        ldr     r0, [sp, #0x2C]
        mov     r1, r7
        str     r2, [sp, #0x28]
        bl      __mulsf3
        ldr     r1, [sp, #0x28]
        str     r0, [sp, #0x34]
        mov     r0, r4
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x34]
        bl      __subsf3
        ldr     r1, [sp, #0x28]
        mov     r6, r0
        ldr     r0, [sp, #0x2C]
        bl      __mulsf3
        str     r0, [sp, #0x34]
        mov     r1, r7
        mov     r0, r4
        bl      __mulsf3
        ldr     r1, [sp, #0x34]
        bl      __addsf3
        mov     r4, r0
        mov     r1, r6
        mov     r0, r5
        bl      __addsf3
        str     r0, [sp, #0x34]
        mov     r1, r6
        mov     r0, r5
        bl      __subsf3
        mov     r6, r0
        ldr     r0, [sp, #0x30]
        mov     r1, r4
        bl      __addsf3
        ldr     r1, [sp, #0x30]
        mov     r5, r0
        mov     r0, r4
        bl      __subsf3
        ldr     r1, [sp, #0x34]
        str     r1, [r10], #-8
        str     r5, [r8, +r11, lsl #2]
        str     r6, [r9], #8
        ldr     r1, [sp]
        str     r0, [r8, +r1, lsl #2]
        add     r1, r1, #2
        str     r1, [sp]
        ldr     r1, [sp, #4]
        ldr     r2, [sp]
        sub     r11, r11, #2
        add     r1, r1, #8
        str     r1, [sp, #4]
        ldr     r1, [sp, #8]
        add     r1, r1, #8
        str     r1, [sp, #8]
        ldr     r1, [sp, #0xC]
        cmp     r2, r1
        blt     LCSF4
        ldr     r11, [sp, #0x10]
        ldr     r6, [sp, #0x14]
        ldr     r5, [sp, #0xC]
        ldr     r4, [sp, #0x18]
        ldr     r7, [sp, #0x1C]
LCSF5:
        tst     r5, #1
        bne     LCSF6
        ldr     r12, [pc, #0xC8]
        ldr     r0, [r4, +r5, lsl #2]
        ldr     r1, [r12]
        bl      __mulsf3
        ldr     r12, [pc, #0xBC]
        str     r0, [r4, +r5, lsl #2]
        ldr     r1, [r12]
        ldr     r0, [r8, +r5, lsl #2]
        bl      __mulsf3
        str     r0, [r8, +r5, lsl #2]
LCSF6:
        ldr     r0, [r7, #0x44]
        mov     r3, r5
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_32fc
        rsb     r1, r11, r6, lsl #1
        add     r0, r4, r5, lsl #3
        bl      _ippsZero_32f
        ldr     r2, [r7, #0x50]
        add     r8, r4, r6, lsl #3
        mov     r0, r4
        mov     r3, r8
        mov     r1, r4
        bl      _ippsFFTFwd_CToC_32fc
        cmp     r0, #0
        addne   sp, sp, #0x38
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r7, #0x48]
        mov     r3, r6
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_32fc
        ldr     r2, [r7, #0x50]
        mov     r3, r8
        mov     r0, r4
        mov     r1, r4
        bl      _ippsFFTInv_CToC_32fc
        cmp     r0, #0
        addne   sp, sp, #0x38
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r7, #0x44]
        mov     r3, r5
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_32fc
        ldr     r1, [sp, #0x20]
        mov     r0, r4
        mov     r2, r5
        bl      _ippsCopy_32f
        mov     r0, #0
        add     sp, sp, #0x38
        ldmia   sp!, {r4 - r11, pc}
        .long   LCSF__2il0floatpacket.1
        .long   LCSF__2il0floatpacket.2


        .data
        .align  4


LCSF__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x40
LCSF__2il0floatpacket.2:
        .byte   0x00,0x00,0x00,0xC0


