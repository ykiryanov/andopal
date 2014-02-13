        .text
        .align  4
        .globl  _ipps_rDftInv_Conv_32f


_ipps_rDftInv_Conv_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        ldr     r12, [pc, #0x2F8]
        mov     r6, r0
        ldr     r7, [r6, #4]
        ldr     lr, [r1]
        ldr     r8, [r6, #0x2C]
        ldr     r12, [r12]
        mov     r4, r3
        str     lr, [r4]
        tst     r7, #1
        mov     r5, r2
        str     r12, [r4, #4]
        mov     lr, #1
        beq     LCLW1
        add     r12, r7, #1
        mov     r9, r12, asr #1
        cmp     r9, #1
        ble     LCLW4
        sub     r12, r1, #4
        add     r12, r12, #8
        add     r1, r1, #8
        add     r11, r4, r7, lsl #3
        add     r10, r4, #4
LCLW0:
        ldr     r0, [r12]
        rsb     r2, lr, #0
        add     lr, lr, #1
        str     r0, [r10, #4]
        ldr     r0, [r1]
        cmp     lr, r9
        eor     r0, r0, #2, 2
        str     r0, [r10, #8]!
        ldr     r0, [r12], #8
        str     r0, [r11, +r2, lsl #3]
        ldr     r0, [r1], #8
        add     r2, r11, r2, lsl #3
        str     r0, [r2, #4]
        blt     LCLW0
        b       LCLW4
LCLW1:
        mov     r2, r7, asr #1
        cmp     r2, #1
        ble     LCLW3
        add     r0, r4, r7, lsl #3
        add     r11, r4, #4
        add     r10, r1, #8
        add     r9, r1, #0xC
        str     r1, [sp, #4]
        str     r6, [sp]
LCLW2:
        ldr     r1, [r10]
        rsb     r6, lr, #0
        add     lr, lr, #1
        str     r1, [r11, #4]
        ldr     r3, [r9]
        add     r1, r0, r6, lsl #3
        cmp     lr, r2
        eor     r3, r3, #2, 2
        str     r3, [r11, #8]!
        ldr     r3, [r10], #8
        str     r3, [r0, +r6, lsl #3]
        ldr     r6, [r9], #8
        str     r6, [r1, #4]
        blt     LCLW2
        ldr     r1, [sp, #4]
        ldr     r6, [sp]
LCLW3:
        ldr     r1, [r1, #4]
        bic     r9, r7, #1
        add     lr, r4, r9, lsl #2
        str     r1, [r4, +r9, lsl #2]
        str     r12, [lr, #4]
LCLW4:
        ldr     r0, [r6, #0x3C]
        mov     r3, r7
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_32fc
        cmp     r7, r8
        bge     LCLW5
        sub     r1, r8, r7
        add     r0, r4, r7, lsl #3
        bl      _ipps_cbZero_32fc
LCLW5:
        ldr     r2, [r6, #0x48]
        add     r9, r4, r8, lsl #3
        mov     r0, r4
        mov     r3, r9
        mov     r1, r4
        bl      _ippsFFTFwd_CToC_32fc
        cmp     r0, #0
        addne   sp, sp, #0x14
        ldmneia sp!, {r4 - r11, pc}
        ldr     r0, [r6, #0x40]
        mov     r3, r8
        mov     r2, r4
        mov     r1, r4
        bl      _ipps_cbMpy3_32fc
        ldr     r2, [r6, #0x48]
        mov     r3, r9
        mov     r0, r4
        mov     r1, r4
        bl      _ippsFFTInv_CToC_32fc
        cmp     r0, #0
        addne   sp, sp, #0x14
        ldmneia sp!, {r4 - r11, pc}
        cmp     r7, #0
        ble     LCLW9
        cmp     r7, #4
        mov     r9, #0
        movlt   r10, r9
        blt     LCLW7
        mov     r10, r9
        sub     lr, r7, #4
        mov     r12, r5
        sub     r8, r4, #0x14
        str     r12, [sp, #0xC]
        str     lr, [sp, #4]
        str     r7, [sp, #8]
LCLW6:
        ldr     r12, [r6, #0x3C]
        ldr     r0, [r8, #0x14]
        add     r11, r10, #1
        ldr     r1, [r12, +r10, lsl #3]
        add     r7, r9, r12
        add     r9, r9, #0x18
        bl      __mulsf3
        ldr     r1, [r7, #4]
        mov     r7, r0
        ldr     r0, [r8, #0x18]!
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r7
        bl      __subsf3
        ldr     lr, [sp, #0xC]
        str     r0, [lr], #0xC
        ldr     r12, [r6, #0x3C]
        str     lr, [sp, #0xC]
        ldr     r1, [r12, +r11, lsl #3]
        ldr     r0, [r4, +r11, lsl #3]
        add     r7, r12, r11, lsl #3
        bl      __mulsf3
        ldr     r1, [r7, #4]
        str     r0, [sp, #0x10]
        add     r12, r4, r11, lsl #3
        ldr     r0, [r12, #4]
        add     r7, r10, #2
        bl      __mulsf3
        mov     r1, r0
        ldr     r0, [sp, #0x10]
        add     r10, r10, #3
        bl      __subsf3
        str     r0, [r5, +r11, lsl #2]
        ldr     r12, [r6, #0x3C]
        ldr     r0, [r4, +r7, lsl #3]
        add     lr, r4, r7, lsl #3
        str     lr, [sp, #0x10]
        ldr     r1, [r12, +r7, lsl #3]
        add     r11, r12, r7, lsl #3
        bl      __mulsf3
        ldr     r12, [sp, #0x10]
        ldr     r2, [r11, #4]
        mov     r11, r0
        ldr     r1, [r12, #4]
        mov     r0, r1
        mov     r1, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r11
        bl      __subsf3
        ldr     r12, [sp, #4]
        str     r0, [r5, +r7, lsl #2]
        cmp     r10, r12
        ble     LCLW6
        ldr     r7, [sp, #8]
LCLW7:
        mov     r8, r10, lsl #3
        sub     r12, r8, #4
        add     r4, r12, r4
        add     r5, r5, r10, lsl #2
LCLW8:
        ldr     r2, [r6, #0x3C]
        ldr     r0, [r4, #4]
        ldr     r1, [r2, +r10, lsl #3]
        add     r11, r8, r2
        add     r8, r8, #8
        bl      __mulsf3
        ldr     r1, [r11, #4]
        ldr     r2, [r4, #8]!
        mov     r9, r0
        mov     r0, r2
        bl      __mulsf3
        mov     r1, r0
        mov     r0, r9
        bl      __subsf3
        add     r10, r10, #1
        str     r0, [r5], #4
        cmp     r10, r7
        blt     LCLW8
LCLW9:
        mov     r0, #0
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   LCLW__2il0floatpacket.1


        .data
        .align  4


LCLW__2il0floatpacket.1:
        .byte   0x00,0x00,0x00,0x00


