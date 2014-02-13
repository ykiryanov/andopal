        .text
        .align  4
        .globl  _ipps_initDftConv_64f


_ipps_initDftConv_64f:
        stmdb   sp!, {r4 - r11, lr}
        sub     sp, sp, #0x18
        mov     r4, r1
        mov     r5, r0
        mov     r9, r4, lsl #1
        sub     r12, r9, #1
        cmp     r12, #1
        mov     r8, r2
        mov     r10, r3
        mov     r11, #0
        mov     r7, #1
        movle   r6, r11
        ble     LCQJ1
        mov     r6, r11
LCQJ0:
        mov     r7, r7, lsl #1
        cmp     r7, r12
        add     r6, r6, #1
        blt     LCQJ0
LCQJ1:
        mov     r0, r4, lsl #4
        str     r7, [r5, #0x30]
        bl      _ippsMalloc_8u
        cmp     r0, #0
        str     r0, [r5, #0x40]
        beq     LCQJ10
        mov     r0, r7, lsl #4
        str     r0, [sp, #0xC]
        bl      _ippsMalloc_8u
        cmp     r0, #0
        str     r0, [r5, #0x44]
        beq     LCQJ10
        cmp     r4, r10
        bne     LCQJ2
        mov     r0, r9
        bl      _ipps_createTabDftBase_64f
        mov     r8, r0
        cmp     r8, #0
        beq     LCQJ10
LCQJ2:
        cmp     r4, #0
        ble     LCQJ4
        mov     r12, r11
        mov     r0, r12
        mov     lr, r0
        str     r10, [sp, #4]
        str     r7, [sp]
LCQJ3:
        ldr     r1, [r5, #0x40]
        ldr     r2, [r8, +r12, lsl #4]
        add     r7, r8, r12, lsl #4
        ldr     r3, [r7, #4]
        add     r10, r1, lr
        str     r2, [r1, +r0, lsl #4]
        add     r12, r12, r11
        str     r3, [r10, #4]
        ldr     r3, [r7, #8]
        ldr     r7, [r7, #0xC]
        add     r12, r12, #1
        cmp     r12, r9
        str     r3, [r10, #8]
        str     r7, [r10, #0xC]
        subge   r12, r12, r9
        add     r0, r0, #1
        cmp     r0, r4
        add     lr, lr, #0x10
        add     r11, r11, #2
        blt     LCQJ3
        ldr     r10, [sp, #4]
        ldr     r7, [sp]
LCQJ4:
        cmp     r4, r10
        bne     LCQJ5
        mov     r0, r8
        bl      _ippsFree
LCQJ5:
        ldr     r1, [r5, #0x44]
        ldr     r0, [r5, #0x40]
        mov     r2, r4
        bl      _ipps_cbConj2_64fc
        cmp     r4, r7
        bge     LCQJ9
        ldr     r3, [r5, #0x44]
        sub     r1, r7, r4
        add     r0, r3, r4, lsl #4
        bl      _ipps_cbZero_64fc
        cmp     r4, #1
        ble     LCQJ9
        sub     r3, r4, #1
        cmp     r3, #5
        mov     r9, #1
        blt     LCQJ7
        sub     r10, r4, #5
        mov     r8, #0x10
        mov     lr, #0x20
        mov     r12, #0x30
        mov     r3, #0x40
        str     r6, [sp, #0x10]
        str     r10, [sp, #4]
        str     r4, [sp, #8]
        str     r7, [sp]
LCQJ6:
        ldr     r1, [r5, #0x44]
        ldr     r2, [sp]
        ldr     r10, [r1, +r9, lsl #4]
        sub     r7, r2, r9
        add     r2, r1, r8
        ldr     r11, [r2, #4]
        str     r10, [r1, +r7, lsl #4]
        add     r6, r1, r7, lsl #4
        mov     r4, r7, lsl #4
        str     r11, [r6, #4]
        ldr     r1, [r2, #8]
        ldr     r7, [r2, #0xC]
        sub     r2, r4, #0x10
        str     r1, [r6, #8]
        sub     r1, r4, #0x20
        str     r7, [r6, #0xC]
        ldr     r6, [r5, #0x44]
        sub     r4, r4, #0x30
        add     r8, r8, #0x40
        ldr     r11, [r6, +lr]
        add     r7, r6, lr
        ldr     r0, [r7, #4]
        add     r10, r6, r2
        str     r11, [r6, +r2]
        add     lr, lr, #0x40
        str     r0, [r10, #4]
        ldr     r2, [sp, #4]
        add     r9, r9, #4
        cmp     r9, r2
        ldr     r2, [r7, #8]
        ldr     r7, [r7, #0xC]
        str     r7, [r10, #0xC]
        str     r2, [r10, #8]
        ldr     r10, [r5, #0x44]
        add     r6, r10, r12
        ldr     r11, [r6, #4]
        ldr     r7, [r10, +r12]
        add     r2, r10, r1
        add     r12, r12, #0x40
        str     r7, [r10, +r1]
        str     r11, [r2, #4]
        ldr     r1, [r6, #8]
        ldr     r6, [r6, #0xC]
        str     r1, [r2, #8]
        str     r6, [r2, #0xC]
        ldr     r7, [r5, #0x44]
        add     r1, r7, r3
        ldr     r2, [r1, #4]
        ldr     r6, [r7, +r3]
        add     r3, r3, #0x40
        str     r6, [r7, +r4]
        add     r4, r7, r4
        str     r2, [r4, #4]
        ldr     r2, [r1, #8]
        ldr     r1, [r1, #0xC]
        str     r2, [r4, #8]
        str     r1, [r4, #0xC]
        ble     LCQJ6
        ldr     r6, [sp, #0x10]
        ldr     r4, [sp, #8]
        ldr     r7, [sp]
LCQJ7:
        mov     r3, r9, lsl #4
LCQJ8:
        ldr     r10, [r5, #0x44]
        sub     r8, r7, r9
        add     r12, r10, r3
        ldr     r11, [r10, +r9, lsl #4]
        ldr     lr, [r12, #4]
        add     r3, r3, #0x10
        add     r9, r9, #1
        str     r11, [r10, +r8, lsl #4]
        add     r8, r10, r8, lsl #4
        str     lr, [r8, #4]
        ldr     lr, [r12, #8]
        ldr     r12, [r12, #0xC]
        cmp     r9, r4
        str     lr, [r8, #8]
        str     r12, [r8, #0xC]
        blt     LCQJ8
LCQJ9:
        add     r0, r5, #0x4C
        mov     r1, r6
        mov     r3, #0
        mov     r2, #8
        bl      _ippsFFTInitAlloc_C_64fc
        cmp     r0, #0
        addne   sp, sp, #0x18
        ldmneia sp!, {r4 - r11, pc}
        ldr     r1, [r5, #0x44]
        ldr     r2, [r5, #0x4C]
        mov     r3, #0
        mov     r0, r1
        bl      _ippsFFTFwd_CToC_64fc
        cmp     r0, #0
        addne   sp, sp, #0x18
        ldmneia sp!, {r4 - r11, pc}
        ldr     r4, [r5, #0x44]
        mov     r0, r7
        bl      __floatsidf
        mov     r3, r1
        mov     r12, #0xFF, 12
        mov     r2, r0
        orr     r1, r12, #3, 4
        mov     r0, #0
        bl      __divdf3
        mov     r3, r7, lsl #1
        mov     r2, r4
        bl      _ipps_rbMpy1_64f
        ldr     r0, [r5, #0x4C]
        add     r1, sp, #0x14
        bl      _ippsFFTGetBufSize_C_64fc
        ldr     r1, [sp, #0xC]
        ldr     r2, [sp, #0x14]
        mov     r0, #0
        add     r1, r2, r1
        add     r1, r1, #0x20
        str     r1, [r5, #0x1C]
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}
LCQJ10:
        mvn     r0, #8
        add     sp, sp, #0x18
        ldmia   sp!, {r4 - r11, pc}


