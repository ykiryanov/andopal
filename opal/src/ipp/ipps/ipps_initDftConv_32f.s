        .text
        .align  4
        .globl  _ipps_initDftConv_32f


_ipps_initDftConv_32f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x14
        mov     r4, r1
        mov     r5, r0
        mov     r9, r4, lsl #1
        sub     r12, r9, #1
        cmp     r12, #1
        mov     r8, r2
        mov     r10, r3
        mov     r11, #0
        mov     r6, #1
        movle   r7, r11
        ble     LCLY1
        mov     r7, r11
LCLY0:
        mov     r6, r6, lsl #1
        cmp     r6, r12
        add     r7, r7, #1
        blt     LCLY0
LCLY1:
        mov     r0, r4, lsl #3
        str     r6, [r5, #0x2C]
        bl      _ippsMalloc_8u
        cmp     r0, #0
        str     r0, [r5, #0x3C]
        beq     LCLY10
        mov     r0, r6, lsl #3
        str     r0, [sp, #4]
        bl      _ippsMalloc_8u
        cmp     r0, #0
        str     r0, [r5, #0x40]
        beq     LCLY10
        cmp     r4, r10
        bne     LCLY2
        mov     r0, r9
        bl      _ipps_createTabDftBase_32f
        mov     r8, r0
        cmp     r8, #0
        beq     LCLY10
LCLY2:
        cmp     r4, #0
        ble     LCLY4
        mov     r12, r11
        mov     r2, r12
        mov     r1, r2
LCLY3:
        ldr     r0, [r8, +r12, lsl #3]
        ldr     r3, [r5, #0x3C]
        add     lr, r8, r12, lsl #3
        add     r12, r12, r11
        add     r12, r12, #1
        str     r0, [r3, +r2, lsl #3]
        ldr     lr, [lr, #4]
        add     r3, r3, r1
        cmp     r12, r9
        str     lr, [r3, #4]
        subge   r12, r12, r9
        add     r2, r2, #1
        cmp     r2, r4
        add     r1, r1, #8
        add     r11, r11, #2
        blt     LCLY3
LCLY4:
        cmp     r4, r10
        bne     LCLY5
        mov     r0, r8
        bl      _ippsFree
LCLY5:
        ldr     r1, [r5, #0x40]
        ldr     r0, [r5, #0x3C]
        mov     r2, r4
        bl      _ipps_cbConj2_32fc
        cmp     r4, r6
        bge     LCLY9
        ldr     r3, [r5, #0x40]
        sub     r1, r6, r4
        add     r0, r3, r4, lsl #3
        bl      _ipps_cbZero_32fc
        cmp     r4, #1
        ble     LCLY9
        sub     r3, r4, #1
        cmp     r3, #5
        mov     r9, #1
        blt     LCLY7
        sub     r10, r4, #5
        mov     r8, #8
        mov     lr, #0x10
        mov     r12, #0x18
        mov     r3, #0x20
        str     r7, [sp, #8]
        str     r10, [sp, #0xC]
        str     r4, [sp]
LCLY6:
        ldr     r2, [r5, #0x40]
        sub     r10, r6, r9
        ldr     r1, [r2, +r9, lsl #3]
        add     r11, r2, r8
        add     r4, r2, r10, lsl #3
        mov     r7, r10, lsl #3
        str     r1, [r2, +r10, lsl #3]
        ldr     r11, [r11, #4]
        sub     r1, r7, #8
        sub     r2, r7, #0x10
        str     r11, [r4, #4]
        ldr     r4, [r5, #0x40]
        sub     r7, r7, #0x18
        add     r8, r8, #0x20
        ldr     r11, [r4, +lr]
        add     r0, r4, lr
        add     r10, r4, r1
        add     lr, lr, #0x20
        str     r11, [r4, +r1]
        ldr     r0, [r0, #4]
        add     r9, r9, #4
        str     r0, [r10, #4]
        ldr     r4, [sp, #0xC]
        ldr     r1, [r5, #0x40]
        cmp     r9, r4
        ldr     r4, [r1, +r12]
        str     r4, [r1, +r2]
        add     r2, r1, r2
        add     r1, r1, r12
        ldr     r1, [r1, #4]
        add     r12, r12, #0x20
        str     r1, [r2, #4]
        ldr     r1, [r5, #0x40]
        ldr     r2, [r1, +r3]
        str     r2, [r1, +r7]
        add     r2, r1, r3
        ldr     r2, [r2, #4]
        add     r7, r1, r7
        add     r3, r3, #0x20
        str     r2, [r7, #4]
        ble     LCLY6
        ldr     r7, [sp, #8]
        ldr     r4, [sp]
LCLY7:
        mov     r3, r9, lsl #3
LCLY8:
        ldr     lr, [r5, #0x40]
        sub     r12, r6, r9
        ldr     r8, [lr, +r9, lsl #3]
        add     r9, r9, #1
        cmp     r9, r4
        str     r8, [lr, +r12, lsl #3]
        add     r8, lr, r3
        ldr     r8, [r8, #4]
        add     r12, lr, r12, lsl #3
        add     r3, r3, #8
        str     r8, [r12, #4]
        blt     LCLY8
LCLY9:
        add     r0, r5, #0x48
        mov     r1, r7
        mov     r3, #0
        mov     r2, #8
        bl      _ippsFFTInitAlloc_C_32fc
        cmp     r0, #0
        addne   sp, sp, #0x14
        ldmneia sp!, {r4 - r11, pc}
        ldr     r1, [r5, #0x40]
        ldr     r2, [r5, #0x48]
        mov     r3, #0
        mov     r0, r1
        bl      _ippsFFTFwd_CToC_32fc
        cmp     r0, #0
        addne   sp, sp, #0x14
        ldmneia sp!, {r4 - r11, pc}
        ldr     r2, [pc, #0x5C]
        ldr     r4, [r5, #0x40]
        mov     r0, r6
        ldr     r7, [r2]
        bl      __floatsisf
        mov     r1, r0
        mov     r0, r7
        bl      __divsf3
        mov     r2, r6, lsl #1
        mov     r1, r4
        bl      _ipps_rbMpy1_32f
        ldr     r0, [r5, #0x48]
        add     r1, sp, #0x10
        bl      _ippsFFTGetBufSize_C_32fc
        ldr     r1, [sp, #4]
        ldr     r2, [sp, #0x10]
        mov     r0, #0
        add     r1, r2, r1
        add     r1, r1, #0x20
        str     r1, [r5, #0x18]
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
LCLY10:
        mvn     r0, #8
        add     sp, sp, #0x14
        ldmia   sp!, {r4 - r11, pc}
        .long   LCLY__2il0floatpacket.1


        .data
        .align  4


LCLY__2il0floatpacket.1:
        .byte   0x00,0x00,0x80,0x3F


